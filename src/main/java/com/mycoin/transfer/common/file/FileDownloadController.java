package com.mycoin.transfer.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value = "/account")
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\coinTransfer\\file_repo";

	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName, @RequestParam("goods_id") String goods_id,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + goods_id + "\\" + fileName;
		File image = new File(filePath);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		FileInputStream in = new FileInputStream(image);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String coinName, @RequestParam("coin_id") String coinNum,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + coinNum + "\\" + coinName;
		File image = new File(filePath);


		int lastIndex = coinName.lastIndexOf(".");
		String imageFileName = coinName.substring(0, lastIndex);
		if (image.exists()) {
			Thumbnails.of(image).size(120, 120).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}
