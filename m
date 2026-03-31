Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71623EC2F4
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948559; cv=none; b=AvDCjlmLk2pqTuY2tSZGHDVfqHTLAwXsOr55eiBTl179G4BuERRS1zOIeynSVezOITv1z/ypJGELzQaJ1CK851MpOg/eBJDEfLBAyY/Osa80u0/quUH1UPn253Je0Rf4jps4IzGZEmN20IlyQKi1/hjOVhg3Ry24eW4L/tAv96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948559; c=relaxed/simple;
	bh=IWT2TecODc4x35H2YiJq9hOwIc6t0CcR9UDNOFGnXdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=avZsNWVO56qAN9HefJElJSpKaWhLV+WY0GWfoAZYtdYgs75+JjEvAgDCwlJaMm4GYoO6ViBA6giQIwwYReaSMHi78dEvBGYNoJigP1LmHCqLIUcTZ3LpXQligZBa4UuGHCqNiPpMv/MJcsy6yLnPKAjl4Ca9NAFnf+keIA7rwyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFS2Ljxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPNj+DgC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFS2Ljxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPNj+DgC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5RVib1841971
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDhGoxfJDrPVZ5DvoY6PLLrq2voT5ShRIN2ZQa6XElc=; b=jFS2LjxgLgqDC6rZ
	KEgMTBykcnw1Otn2OZNBfwKrkh/rk6zd8SrrIlnRm3HDwa6P3fOZfrYkOIwFL3sd
	f/BZE6G+aoRVZnirNSu+eSLPKJn64NL9KV1k0laznYLEfiTTeS8lG2Sn+2EnNbsa
	Xt6qm0lLaLn6vc+yilSYgJoPOzXiMPPENZoBUTkH00FI/PxZdaTNX7ma+rJqPrNc
	l53p8vU0qmjYHxGbEkMmetRh6zk085OTLz3lKcIIEDQdAOuH+YjXD/C+sJjGG1DU
	ICzwSeBgAUKIjeEywZVGYZQY8t4cyhq9enV8qY0LbW/fC4Sm7IUW5QMfLIDgAvkA
	ehgmHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjafb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:15:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c613194caso3936864b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948557; x=1775553357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDhGoxfJDrPVZ5DvoY6PLLrq2voT5ShRIN2ZQa6XElc=;
        b=GPNj+DgCTRr7IOgzwioLQWZk0dfVTqg+5R1V6QRX20QwksJtOE6nrvjk87Guyc8eSp
         g0VuBEHYWQwQCWr2xjj4efPXZEk9AKmFZCpgrDNB1JWt/UWY0srctTDKcT0RaZJF4nNp
         g9jOCx5MQ887atWdi0OoFRYFahlxdJGDeNgbKtB6sY6YV1BWeQOGBVP9ZkCX8SXeqNGx
         XqNdvRwV3NDYYZpPbVmRMSYoWz5QPWTqZ86NXjvwbI1qWyzEKjBx0ikjAjjy0aIVzSxA
         jn++az0QfcmHhRVee8jO9NmI0HwRVYvhRHEq7oU5omy6NbT6ikEu2V2P996DitoVuOdJ
         fSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948557; x=1775553357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDhGoxfJDrPVZ5DvoY6PLLrq2voT5ShRIN2ZQa6XElc=;
        b=gaTXnmBi0CJ+ukE9k4+9z2qU/th8MTIu+J5GQmWCtgc3QJ8xUypMGJtD/+5cPgvEoJ
         mQPrXng+5hUXyQNova66LcbRJFoU5DyJoR4tvuOVX7TBNSi/0VsahUa29hFEzevys+iv
         ZCErMC3TJn2S433uz7y6hlj2kaSorYKa1nIPAEK4VhsnyfE3r/mO+2DucEQ5wBqvVrSc
         jSzr0Yw7q4EV0FQkeFznMeQnIigF6Ny9kT346zJWGBqJ6ZnsDmv73Lnd8ycHPsz7C85y
         adwnwqiDjFj2oaX4a3T3l8TULrU9yDttvi70LdCkbj2kQaDdjLSnfXJr2rqy3rzMZshs
         +9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3Da6LBLTjjeAx4N2X3Y8Xl+oHnYorYPIySm2pO283wNhVGLoOCNSoEqAygRbeWlMG4uCf3o8Ey3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1/NSo5jJ+q295CGR7Eg2av0X7DSj1iGt+sNSFHBvYmon8BjC
	O3HpEJFqjeYR2ggGb3S2EqzhbvoMONyZ3aAdNB5cjE8NLYFwNcbBM7qm6ww0mpuESENz4klQim8
	epeBe7CHLGIdgvJlsvPq/GPMzSnyq0o3T8///R3iejIvTAf144JyH2dt7uIgcG6U=
X-Gm-Gg: ATEYQzwa7hu4dUliVlQIOw1SdVuuQYOXD2W4wIO8t9JjutR2azYay4EpAzdnjYA7i4p
	59eguRzi9UGee7fvR7fLwFj79WrjUpr4lYsgkrrotu/tXyhSBFgMtfs4y35qRwzujDvyYqD36dZ
	wn57bwqd8zV4NI9C6ipLaNqr4B5Fehw7Z/ErtY0XXLQrTHyvK/z+XUpWSZB+toWGqmGtYssHVQi
	uGL4X/YXXFDPKqlX0Q9aVAwMYThQu2fWF9TrqEJkr2Rh2uihbQZiAytm4GKGxiVf+NiOlICEhoQ
	lDFFbw1uy3FQaOEkn5LOlqpQjQ+2+5tXYcCj4dPLIfEex9jmanXybzFwc1DTOgnm9FadeYArNlI
	iC9guVdPm7mNuRitgb+LMmAf1kx2ZG54KxnYQgyJoK0gUoWu0gA==
X-Received: by 2002:a05:6a00:3e27:b0:82c:7767:5ba9 with SMTP id d2e1a72fcca58-82c95e5bc7fmr14865150b3a.26.1774948556612;
        Tue, 31 Mar 2026 02:15:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e27:b0:82c:7767:5ba9 with SMTP id d2e1a72fcca58-82c95e5bc7fmr14865121b3a.26.1774948556116;
        Tue, 31 Mar 2026 02:15:56 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d3a8esm10232286b3a.39.2026.03.31.02.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:15:55 -0700 (PDT)
Message-ID: <f346e3f0-9373-4b40-a5ca-cebec6c4da71@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:45:51 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6YsCqXmXciB2zHRmKhzesyLklgOdsell
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb90cd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=u_wVa8N0Y7CGBYMdsxYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6YsCqXmXciB2zHRmKhzesyLklgOdsell
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX06MjbIJ/dHeF
 XZK1CyiWOzcB6nKIb0a46JiWoO+g5DOH36FfdYo+TxcEHe4er2FUkoIzxnXXeustVZ6dyJ01Rb6
 +RAQwZnN8Sw6x1nX66pOeD/jguLub5o0FvH1akWyzNfs8bkfNGTGsQ7lR8Loh1oR+LHtB6OzFgT
 HL1d+XzNXurgGLjY/3x2DfwPn2+4F5m1E1dQguWMrVapIhHhQwYlKMJ92fr/IledmtUxjFx51j1
 FcFioGe+pBvdBrkVtY8ZJaJN9d/SHANHcndupSPXUVBAbtoTO/UfwCtYqUCCLuNs/9N8qB7Xh9F
 Ex5a6D+WlD1aHjLw+D4ERzDpdw5ZqaFMefuVBSYc3HmqnQnDnfHs+/xWWMfAWMmekc2FsOX75vB
 rHKf3ZnGYnL6nTcHmOzRQdohoMdPw21BxJL4VjV8+OFD/Qp57zBa4ApArSGKCmMV86+QccbjXu4
 RjmUGTB4DTiWSWF3jWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088



On 3/31/2026 2:25 PM, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Drivers for SM8750 video cc had the same issue. It would be nice if new
> code is being built on top of UPSTREAM code, not downstream.
> ---
>  drivers/clk/qcom/videocc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
> index bb3aae6b8396..ea20605dd1e5 100644
> --- a/drivers/clk/qcom/videocc-glymur.c
> +++ b/drivers/clk/qcom/videocc-glymur.c
> @@ -495,7 +495,7 @@ static struct qcom_cc_driver_data video_cc_glymur_driver_data = {
>  	.clk_regs_configure = clk_glymur_regs_configure,
>  };
>  
> -static struct qcom_cc_desc video_cc_glymur_desc = {
> +static const struct qcom_cc_desc video_cc_glymur_desc = {
>  	.config = &video_cc_glymur_regmap_config,
>  	.clks = video_cc_glymur_clocks,
>  	.num_clks = ARRAY_SIZE(video_cc_glymur_clocks),

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

