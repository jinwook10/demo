package com.example.demo.controller;

import com.example.demo.model.Board;
import com.example.demo.model.BuyList;
import com.example.demo.model.File;
import com.example.demo.model.Member;
import com.example.demo.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;


@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/board")
    public String board(Model model) {
        List<Board> list = boardService.listAll();
        model.addAttribute("board", list);
        return "board/board";
    }

    @GetMapping("/member/write")
    public String write(Model model, Authentication auth) {
        model.addAttribute("user", ((Member) auth.getPrincipal()).getName());
        return "board/writeForm";
    }

    @PostMapping("/member/write")
    public String write(String title, String content, Authentication auth, @RequestParam("file") MultipartFile files) {
        Board board = new Board();

        board.setTitle(title);
        board.setContent(content);
        board.setWriter(((Member) auth.getPrincipal()).getName());
        boardService.write(board);

        if (files.getSize() != 0) {
            File file = new File();
            String filename = files.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
//            String extension = filename.substring(filename.lastIndexOf("."), filename.length());
            String randomname = uuid.toString();
            try {
                byte[] filedata = files.getBytes();
                FileOutputStream outputStream = new FileOutputStream("src/main/resources/downfile/" + randomname);
                outputStream.write(filedata);
            } catch (IOException e) {
                e.printStackTrace();
            }
            file.setOrgin_name(filename);
            file.setRandom_name(randomname);
            file.setBoard_no(board.getId());
            boardService.fileSave(file);
        }
        return "redirect:/board";
    }

    @GetMapping("/filedown")
    public void download(HttpServletResponse response, @RequestParam("no") String no) throws Exception {

        try {
            var fileData =  boardService.down(no);
            String filename = fileData.getRandom_name(); //저장된 랜덤 이름
            String originalname = fileData.getOrgin_name(); //다운받을 원래 이름
            originalname = new String(originalname.getBytes("UTF-8"), "ISO-8859-1");  //크롬 파일이름 한글깨짐 해결

            String path = "src/main/resources/downfile/" + filename;
            java.io.File file = new java.io.File(path);
            response.setHeader("Content-Disposition", "attachment; filename=" + originalname); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더

            FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기
            OutputStream out = response.getOutputStream();

            int read = 0;
            byte[] buffer = new byte[1024];
            while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                out.write(buffer, 0, read);
            }
            out.flush();
        } catch (Exception e) {
            throw new Exception("download error");
        }
    }

    @GetMapping("/view")
    public String view(@RequestParam("no") String no, Model model, Authentication auth) {
        Board board = boardService.viewDetail(no);
        Integer fileNo = boardService.viewfile(no);
        String username = ((Member) auth.getPrincipal()).getName();
        BuyList buycheck = boardService.buycheck(username, no);

        model.addAttribute("no", no);
        model.addAttribute("board", board);
        model.addAttribute("fileno", fileNo);
        model.addAttribute("buycheck", buycheck);
        return "board/boardDetail";
    }

    @PostMapping("/member/buy")
    public String buy(String title, Authentication auth, String no) {
        String member = ((Member) auth.getPrincipal()).getName();
        boardService.buy(member,title,no);
        return "redirect:/view?no=" + no;
    }
}
