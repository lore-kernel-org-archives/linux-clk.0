Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175838239A
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223634; cv=none; b=ucVEqIuc7UdPCrPHIVqSTF9QrOO+oaclJvTDR0Mrm+NKj+hrLJgsbNl9wGgGlwGgfw2fEEhi8tSN04d35hAhhyh+ALbg3rg5138AAKJw4YZfyCgY5vYwqgX4WntJf/97jzJS54KbMBpfQErNe1SShGK5zI6zHgXgjjY1ie9AFss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223634; c=relaxed/simple;
	bh=1nkgnT2B++owgxduCL1oDJqpAxkr1BU5In1f/pHzGyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAmPu/mv0NK8az24PkHMJwiVrGHL4vVV0zt07qlUneGY7WmP+Nax4f6DHSL/qDrCudnD7EfsVpnKPl6VCr1JhvnQ+53jslRzt/ufFL0ftHqyTJBvtIWChZELe9Izqymj48ZUvcs4W+uvpRBpPLLyJpP7eHS0S9ZG91kRduXrXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJgv9a56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFq4xjWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJgv9a56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFq4xjWj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZavQ3544337
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfJShcmfLryO6WYoQaq8ODwaVGBiMme33GaRaClN7sQ=; b=YJgv9a56qUE2HW6U
	qGsjpNRN3U+Awc6361nbOq5bvdQLJaPOrzc1E9bXVQgc0epfcGmHHgXGCqqfIZDN
	FiZOn/LenmxjhxS+Row5tf7DSj+tsQZeaICWqfeEsNmxJhmtVqx1gNmPQn6fXLMM
	kc23etnqBQJy91SXI4TTb3xD8+JdeUbZskxLH/zMMDCApSLAIORL/2VRGB6KBUr7
	U0H1AQqt4J2eL9BRjy2NazQFX6fy6NQnadiQQw12vlxeqdXtqRICqgzCsPMReyAt
	BjnhveNxvn4gU3Qgb0zt6Yv+kwZvoFwGFt1F3pFFQ5gJ2mAUQKkcC7vBMKgmZn9T
	R5366g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u800qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:40:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so13520711cf.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223632; x=1784828432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfJShcmfLryO6WYoQaq8ODwaVGBiMme33GaRaClN7sQ=;
        b=IFq4xjWjCYtVp3oJpasmUv/DKcTV4hbr6mIwcH4F5yxCFJu6zUiycmb90kdPbHVGwn
         LUyCe2Oj2/lZ3dtTAw3dcNjS0rRYt35FogsxxV2v0q9iYK5qte1gVxz9zxPBXQL28h3P
         cLypqbt5ofSgNDNJnG96VDo4RsGQGgXeIr7rxovLFPrGJ3eBe/+HoQ4s8vLkCIRjne5f
         MQ/lrITxJ/z1/R2TBTv/P6Hjl4KhyL3g6PtAMsMTxg0j0k4lBFen8uq4MJGo0YMvBte5
         U92K2sAsxgQr7dRYmtQAMz5rD7RCNed7CoAN2R5eFwtxXIU16Tg/1hTsQWM4vS6G2Pk0
         Jvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223632; x=1784828432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfJShcmfLryO6WYoQaq8ODwaVGBiMme33GaRaClN7sQ=;
        b=ZDjyllB723KGVVjERTh67oBS2miq6PHvMCcb6i/obErA+e+WhM9aNhagZKMG6K2dg8
         Xi4ZX/F1clZgFrxb8BrpJRnyl44FPEqRbug4sQ+zlNTHBfDmuN+M7nf7jnggXkMe00UG
         L97cGtCROP9cn+SY/mDcL15ByDBvL02FRd5QIL5XwiE4fMuZD7/7Cou7GhqraoWUaO1g
         f2rOueIsT4GPxL/bFTTDxFURAk3U9zfzM/XmmwjMwdUiG56m8DXeQTVDVfXeharOFylK
         TpBtkpCBdm9le/t0/t7ogbMDfck1XsHM8ctWdRauwgG6fJ3WGI736XbxlN4X7UF0v2Gr
         fT9A==
X-Forwarded-Encrypted: i=1; AHgh+RrKqbVb4uK+EAG0hMpOXon+YDf7qse+RMAFPZKrIwIMXX1nAqMtrL47k45YVag6vP51qvgsi7w315w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47GMr8SU/0jZeR3+zXVUyxvXx4W0/NZlP/FPRNvPsd4Lfuw7D
	Ii1w8IBwSTglAeanZ05iECzThcHvHkCdl5YafETERyfQpjNB8BTvVs6FQrIJ6r9fQkkpa8LmVvi
	9snec5RVkps96b4I46vsTvRplH/UN8zerMajJ5LzYMWOUQYp2b3+iCYC+JmAY29M=
X-Gm-Gg: AfdE7cltvq0X0b9vIaXnF6cTV92EGueouDXXDgw68dYkWfqUKd1luWu9O/6r1EDK9WN
	HiAWmzbBvv/YdakF1zSZajmwHzZNLWZBRpxwDAAXUVw3dFeqOygYdiX5zeEyvslCyqDbxcXelNo
	KqmrgYP/juHqv6xINhITT+KmZs11Tedy30mrwiutXVZlUdmLXoFtJJ0jFq7ZcUr2QjS9OuGj9Xa
	WqrdLqm5x8x4ebjepefJySvTPG5V6bbWXkjqGXYlZqosGxJtJt/Z/QuR4FGOArIgcH/s+J1Dt5N
	mkzylUfsejN9TI4FqOyKZSsTG4QQ4JLNdyBZjDFGTvT7ng5VdF9CwEttKxn1JBnDzyMfzSIeEW0
	pN8x3Qj8wN0MKZG16PiEztzOg
X-Received: by 2002:a05:622a:242:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51cbecf94eemr188381121cf.0.1784223631710;
        Thu, 16 Jul 2026 10:40:31 -0700 (PDT)
X-Received: by 2002:a05:622a:242:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51cbecf94eemr188380871cf.0.1784223631272;
        Thu, 16 Jul 2026 10:40:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871711a2sm253900366b.21.2026.07.16.10.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:40:29 -0700 (PDT)
Message-ID: <dfe9a6ee-17fa-4adc-9114-85d9a7bcef60@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:40:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfX4oCYSpqvWBEO
 ZV7Fo31H4W7xECFR88Pqeh9NTRb1eNKvRlGFofhFJlZkrekLDKJJsrUq3wSMPMZnUijIsyvDFdG
 LEMQcv4Lhbn9qctOTA9BxTMC1C7ey3CZmc8PlC7eAi8kUtH4l0aOGsJYtLz4+W+aLQco/wgzAk8
 wdVW4NlnSe5olgT+QZcwlwnleP+tZ1i4pmicOonx+NgiSgmjDjQ31qfKmcNizT2Io0jnuO/Ejsy
 x842UOFh2eaavL7wMwz91bNAounQz9QCf4ZLDvH7st+YFwwJSG8MuhfM/kLqz/fy1q7+mqxnt2y
 wSz5AVF64haF6UHMn76nFZuy00Vxi0JF3+Rnhi+i2x91kWDrY+W2Z1FIQNylLh1z8coytTERzo1
 6lwDedTb9S10YlIelVw38aclXeIFFBMeQ5FU/zyBG9qfJgx3C80DoDQLon7M8SziLPD5Afr4f/W
 X87tgkyRjYCfIG8Kdnw==
X-Proofpoint-ORIG-GUID: rywgIRwecZrdw8aQqMiCLnFK-GzhHmXj
X-Proofpoint-GUID: rywgIRwecZrdw8aQqMiCLnFK-GzhHmXj
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a591790 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-NgSUSuva62yS0YON0wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfX4d3Mqu3YUhiI
 O4EGAStJ30mJmAYHuIMRphVgNNOrdOegDtFLOcV4LW0uBr73ahI9v4tG/RClPy6cNqFpMBe5FGI
 yQXlO0b+ptT8QKndNmzlrL+7GOzEQJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160180

On 7/16/26 12:59 PM, Taniya Das wrote:
> The PCIe and USB3 pipe clocks on Nord are sourced from their
> respective PHYs. The halt bit for these branches does not toggle
> reliably when the PHY is powered down or not yet brought up, so
> polling for it with BRANCH_HALT_VOTED can spuriously time out.
> 
> Switch these pipe clock branches to BRANCH_HALT_SKIP, matching the
> convention used for PHY-sourced pipe clocks elsewhere in the Qualcomm
> clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

