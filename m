Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A23528C006
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172504; cv=none; b=SdbJ4pGeLMC/nU/eS8CqDtO7vSl8GjJvLf5QDHv15CygxxglMQHJPXji/asJm+Gq3L9garWFB8N7MB1+Msz9rAis3wacXAc1Q1RZAqidcEsCDBbFWJHmf1kY2/7K6ovcXMnvdl+W9nXJ7p6PI6fEqk6pIO2g8QG2DRgQneLv1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172504; c=relaxed/simple;
	bh=7hywqH+/Sx8XfQeW8GJuiPTZizH1wiTSteewcJgx60Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A4CHIneXhkq0B/YM+Vm8X694Aw7BAtA0gyIJw8Vh1Uf+wEHsY0joRyrzCC57/ZRW2dKCcdCvMlXUVlcO8CFOjj+fBC/FTS5SitbhWanZzQJNj6hBpuvtw8x6zPN07IET7w0hMgTX1RBSKwPgXrkLe7oNwr5p1KOIQnUZshDgMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQ8F2Jln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhvZmQDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQ8F2Jln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhvZmQDx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B843B77110082
	for <linux-clk@vger.kernel.org>; Mon, 8 Dec 2025 05:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJSSO+Ts8d2gOowhhkTr9zJ/JpTez2Gx2lV0mQTKQF4=; b=nQ8F2Jlnr/PBt/Lz
	CEtq61q+FhIgj5Xk7H35AvpexeyZYbi1TTownV/UOi10SewnuPcuxX3pJgP028n6
	SXyu+JPW9us5xfQ4nf7SmguxMp6oa2sR1rMaVTQx8EVatwMxXgrs7sUghFnj0Nx0
	lHObAaZROgESPcwBNh47zVNydkZPLkdxCO106yyKQw+eUwNoBH1TDnMTB3l8D/4O
	4Px0jIY8+LUnwTc+W/9wtEjPTIizCUYTODbFCfMj2h2Db3e29P4jYeLp9Qfdn0+9
	hpfH4KhCRy0qMIEDtHIY6ifxs2HlgIuuKynt/B12S22Cy9Zyu15FuYvmKEW9ZYcv
	ExhIGQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awqabg688-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Dec 2025 05:41:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9208e1976so7558989b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Dec 2025 21:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172501; x=1765777301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJSSO+Ts8d2gOowhhkTr9zJ/JpTez2Gx2lV0mQTKQF4=;
        b=EhvZmQDxQ60A2a7qGVqHwsFfg5vqQo+eGG0uRD4RZQVMaJvTwEIWVaDKjoLE+gzhIm
         mkZlo0Bj7NgSyyas4/gtEjpn4ytUQr3TY7Fquf/+92LbNdRUf8N19bicZ+ClI4awY2Ph
         1akw3FDeHR0R2jHYN2wBFU2DTSZciyrKmx9xFah6Z3SK/2XdS8FHfXqpkA9XN7PFCsM4
         QbbFS0vRh2Fup8hplJPoTVMRIds8epTU2isfF5EFPtYPeMcNhdUxan1chU3GyuJaZ4nF
         M+RJ5Yj39PgYDeXty2G+uO2IhPuQP94T5Fv9tS5ToOerIGPXTPwb0bmedkVhHIoqVVZs
         r9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172501; x=1765777301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJSSO+Ts8d2gOowhhkTr9zJ/JpTez2Gx2lV0mQTKQF4=;
        b=UdEfdHHQHO0UW1gGppeQgGcEElmEM3hh1O0GXcJMn5erYxcBCikHetV6g06h7pvV2t
         rTZMRbTpC5P0xXMBLXyx8j6K/Qa4Xl7tzMkgoTgWkZma6jPgivwJ7CdT42phK27eDOjC
         JS5qe4qPv23xfHyJMfADBCJ5Llvw/JWqcNJd40oDxd6Z+hGkCWM+k6kqbo/UalkjXPt0
         RC0/UUN6oVRWu1hWANEidtD3c/TZlRzI4iVuS2dqorARLdPED1SKO94Zfa9X51GPSNhs
         mR/sOSCTvyGBJ8sOyu44t/r0ExvHnhec9hwlOPzABk/XWb+66IM56/kiuCQLGhsC6GCb
         c84A==
X-Forwarded-Encrypted: i=1; AJvYcCVsPjaDhH+TreoetWJnVoh5Sa/91XfJQ/cuW8LbdNVuh8qjHOv2zvIeL1hTla4r+njhpSYJc9uUMMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg2LSFsVdFVHf3uKJJCxTNHfuIGiNztdAbALRE9PWESyeYyw6K
	1guaNeMyAABvPnpVjdxLBvDVOpAoxMlj45aT/KufhX4DRl1aOg8f7nX6CrYpaDHs9ecD56pQKKz
	wRjyFAS5hE3EhsRNr9oBHbpTnxUdl8NNAA/AYg28ttfg5HjlSvHCCNAwOGMkllxg=
X-Gm-Gg: ASbGncvd8AZPFEC7liDllFFkFSc5qu2xH0Yrs08E6/qVRUkbirOeU8bp5ginfOuXIeQ
	tLS1ATKwlwuQqQdHnvr3PPeiQ24BeO6tMAuaGA0Jf1LDh50DlLwwoFCenj2dtb4bwjky2/9f0M8
	wYzxlGkvBGqPMhgTl9+C5AFPpfgHEMYrKA0i17D5sZu1IBzTcSiJlhnlJNU1dtm6/c2ZUlBl+ez
	lGUMzOhVfvyp9IVl/9L8vqSA/4dtWh7TIhH4lmoU/WvBEuqZVjCiuWnmcRbGmYu6FohbZZNL5Kv
	iCpJYcwKYW749CqoY6F6H9bICIo3wpnM5MoC7kG8ECOehbEwdAJ71QR8zRt3/4iVdBnp9iZKkTa
	cggaQ9bUfIG4zbm0rno2fRdAo0duTM7+rUUZSFg==
X-Received: by 2002:a05:6a00:14c3:b0:7e8:4398:b365 with SMTP id d2e1a72fcca58-7e8c561fb2cmr5860665b3a.56.1765172501100;
        Sun, 07 Dec 2025 21:41:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYY5YskHP8FdfN0nPO89xoJMhoLLwBeVdA2ZSyjf/zcK3BzEiOw5mlexg+K695fZ2oI3cdOw==
X-Received: by 2002:a05:6a00:14c3:b0:7e8:4398:b365 with SMTP id d2e1a72fcca58-7e8c561fb2cmr5860648b3a.56.1765172500605;
        Sun, 07 Dec 2025 21:41:40 -0800 (PST)
Received: from [10.92.215.253] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a07213b6sm11807400b3a.26.2025.12.07.21.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:41:40 -0800 (PST)
Message-ID: <fb4d020c-5119-44e8-9866-f86ca582ab84@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 11:11:13 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dwtE1VGJn8HE3PG79FW1rTU5TcTrB9bv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfXzLs0TSAkKbM4
 u5uEpIkL4IKWM4NbaifZXmOGAE7p77KUax8vOFR+SOqR2hXSDeBqJbBfLqpj08ngZVFWnvLbwY8
 DHRPZzejr0plzuSrKuSXuSMa5+1MYz7pVD3Ea4r340wP02tCr9/9zL4VsEek0oF0YH4pDZeDq4S
 cmdVHi+he0+IMti+xKerSzKji44R82lyfK9K6hH/Wm0OKiS80P17hT5U1DHJLyYJCAeud2jdt3I
 FRPfICJjqZjPZ67mHuX2BqJBrxUuFMsZe9E/+6r4pGrJXXqdqwKzKHHyfy0R1RPPxhzD2je0EmT
 Ff273voNyWymSNBHT81LK3t06WFB4SxOQFfAiGkdYVqpcHjRQgM6Aq+IZBJhb/NYPkzpg4K7Czd
 h12R6v+pLtCh9BgWiV3OoUvWP1PCKQ==
X-Proofpoint-GUID: dwtE1VGJn8HE3PG79FW1rTU5TcTrB9bv
X-Authority-Analysis: v=2.4 cv=f7lFxeyM c=1 sm=1 tr=0 ts=69366516 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080046



On 08-12-2025 07:36, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> My standard commit, one more time. I wonder when I will run out of the
> same commits doing the same...
> ---
>   drivers/clk/qcom/videocc-sm8750.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
