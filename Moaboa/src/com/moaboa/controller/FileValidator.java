package com.moaboa.controller;
// 올바른 파일인지 검사

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

@Service("fileValidator")
public class FileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// 검사대상 : target
		// 이때 발생하는에러 : errors
		UploadFile file = (UploadFile) target;
		
		MultipartFile mf = file.getFile();
		
		// 파일의 사이즈 0 x
		// 너무 크면 x
		if(mf.getSize()==0){
			errors.rejectValue("file", null, "파일을 선택해주세요~~");
		}else if(mf.getSize()>=10485760){
			// 파일 사이즈가 10M 이상이면
			errors.rejectValue("file", null, "10M 이하의 파일만 전송가능합니다.");
		}		
	}

}
