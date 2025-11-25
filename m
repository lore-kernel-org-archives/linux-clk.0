Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E0228DB76
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052587; cv=none; b=NAO7d5SYbaQwAtoIdwyRIwRg4gXQSms9Yywi2n/6pawrIJRjPtRJtenTp7peD5FuksC6nHRtfyF05yrf4Cg7ZLqXw/PBVb9OV5ZLyBZUB2fLqL9YD2S33zkzBiPV9VIHctvtE1y871Q4ff+BIK0xlJJfH4M8meRVMzxFXGTV6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052587; c=relaxed/simple;
	bh=l0DNo5h+lK3JKphIbORDUNwt7UC72ukjQ2mjgfG1ViQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9kDMKVTnL31LdXW8VY2GbW7k+T1evxQUeeiMzUtlSAwJqpUvGfaQQT9skpUf0Z3GcYSh6QQmHvPxpP5v9Zjx0aGA8UbjUIF4fm1spi/BP90HaZutogUz/TKCZNDTl25lmKz2SpxWI3gjbenB9RoCt40eHAUNBtlXurgG/mL1rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RG7m6GGo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ7hICBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RG7m6GGo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ7hICBR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gemH1939545
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 06:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYK06ezZN6fhP4v3jvxZO0wYqYGr/I7SEzVHBCuQKsI=; b=RG7m6GGoXJZlKz7d
	jFgNm6cYNNZ8Y+SbfDYb1kVEnqdAq/XTFacQ3YlnMrEycDT9nSfrnkn4lOKapPjn
	UwVK8w7O+b/jyobyXrfEIoCvUMRLWW57PdZBRYAY6GVWJdebKcol5nb3Gdttz1Pj
	UgOUW7lCxjcEMyXeukc86GIZR7f0/PbfPpaWmPZX75Oc6OZ/wOpJI4i9Kp1DX2aR
	PK5e8sVJy+be/0GZ+4UiNt8Op7yp43wh4cDFHjY2M6QVNNKYQGkM/PoYRqlsE+ds
	+zpBpFYygoxIQVvBOlZZKSJaClc4L+0WfixKHtNoNvV4YqY/YLzesu9ogpd5/rkE
	mme45g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsst29uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 06:36:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34176460924so4315355a91.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 22:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764052583; x=1764657383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYK06ezZN6fhP4v3jvxZO0wYqYGr/I7SEzVHBCuQKsI=;
        b=dQ7hICBRWFWoeDSgmlaugKItJLwpSc0oHtZSxRwljLSAO56ckKpec8sscnDPXooXr+
         V0+A3At9X98hi17kryN28LtBdg1yeNWs39sJk80zwpHvvFlt0xXJXSN2f3apX6zXmg33
         /1dJ2mXzsMxveNxnwt/8yZOmzdSPGpCYPhw8LPhIHD2t2Wd8WQ7QGJes0JBzr3Uk7KIq
         hFgfDuzdQic4doMfFcBOxWvu55DsMqNLwnPrsXE9zioty65IsPVp8W8s8ODCNRLPZ3mk
         m3SqtfT/tX7YgPnFy4rOZ5d5XU82tKjJmOeM4FniHI/gSC3N2WRRlrd+wYAeF1TjU6ZN
         bVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052583; x=1764657383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYK06ezZN6fhP4v3jvxZO0wYqYGr/I7SEzVHBCuQKsI=;
        b=wLOgbWPBkB8mpRgcC7F0CLRrkPj8se8i8WPHQTd2iSXfUzGgGeDuWmE9gxqHJcy2Un
         VRrB2YfxUdFNjkWLNycGmmLLhTj4MTxlNgTJzVORMCgll/5j8xeM7/7h/+7ezqffMOYf
         5liWrZRPNwrtRvR6St/pXy2M5WzMgy4ezJTDeWuCJAB3fImfW1/Hevxdz756PUrMWL8x
         ApaPT5CA6IRtNNPlar8ZJ84oUwfTlCi9WH0rPTgKBM2/6ZVI8ZXkM8XKRQq1VAQlEdIU
         yIQN2L/1PA6bWHgpoS23ThZ+kDEG8kC2byCcqMmF4VmCXHu/V/FondTrKYQ7zH0IcPjH
         +txg==
X-Forwarded-Encrypted: i=1; AJvYcCUuA3QCR/h4X8RWDcAJA3BtY7JeQbWwtiPQ1j/Qtdjig3FecFWoXJROUZ4wbudpqVCP58uVrmJ7vFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9A+ffiWSnZUi28dyTbcwG9bM8pUZQYEUW+QYbFNoJnywN/kLI
	QWriR/Qfj/eMeAmxsKA0l0N57ArC3i6rKPtw/gFfvxQRG5AYU3GipT4/MjjeZ8NkkZF1Lv93l+X
	3kADW9ZznjnXvQHBNypuUhciuMtNg8OQhZCxU442INjxWX4rrL2NpBOjWiJfnH70=
X-Gm-Gg: ASbGnctq97jXmzOxIBLwScnWTbDZJrAu7ejIdl1+XBLTghZcNWgC7+ioWeixKF3TyWU
	4hOxjhrA2IyYqCVHUqsGqzzAyYohiSZlzA0lPCdSUIKHH5RMjt+tJprSWeoqTaYxNlgYeb1i9OC
	fzMBuO8vU54wAAa1fsKg7DjJ7AuyzVjkHKnoxm3IWDuRMTL9MKYNsdozbIEebikALcUTMDTPY1r
	PvDVBPXJ1xN79x7nhRIVwmFK3KLkDI2aO7ridC/QaV4byYFQp4V9IiNys1iqLth4FDixchTKdNm
	8Eq+jyVQl6ITaj7+/mB5OtyEKlRz/VujKs6Lm228cJJdhycUrQzRP16dLxR1oLZWoRjTa+YOvBz
	ngTe2YfFxCplfpiyye5vyj7oVRWT/BQKXCabP
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr12615634a91.36.1764052583195;
        Mon, 24 Nov 2025 22:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH53UOdhJtkf/Om1CXNcP5GU4fg3FUgzNy5VJS6t2nkMTAGe8/1CWvBJkYrC7jLYHEvjHy7w==
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr12615607a91.36.1764052582690;
        Mon, 24 Nov 2025 22:36:22 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm15595421a91.15.2025.11.24.22.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:36:22 -0800 (PST)
Message-ID: <4cd37160-ddd2-4027-b7ed-e56635369cee@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:06:16 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bM0b4f+Z c=1 sm=1 tr=0 ts=69254e68 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lWVEJI6HPn3KqSwRoiYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K8Rh-Rm5QUNLKaZaqcermxn6D-7a-J0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfXzkfOSeTGxv8b
 pLGPjhonhRlHHbFy6j03Vbog7myLU2zHon7uK5sdEjHsnqUeyyAFZJxJOCaEG3njO1jyApEi3Qc
 F3wkOvskkt7CgNqz9DOgrvDmu7hgOEt6GwVK26YtFrrxQhvfD4urjCkhRrhv91LLev74mJSpbjP
 UiPtn/39is5+VLBFE29ETga11jhF2Ea3AVwFPpSCM89VQDS77ZEjVazZz7Y+kQn3CI1yScc3d45
 5r2P4xNbrCUgihRXOVuZ3KgQ1kkPZdjClSbhziCcy4K8USJYQTMNDk2HPHrm1ORnOBzySKA3ogV
 oRbKMwm4WIwAz+LXe4INIPijaC2tlizxndi2YqV5mPrqqfE6I2wlkSItlcnRSL7UNSX6uNRgZdc
 UEl3p3ToZu9fpq8E4XueR5Dk7LG67A==
X-Proofpoint-ORIG-GUID: K8Rh-Rm5QUNLKaZaqcermxn6D-7a-J0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053



On 11/25/2025 2:50 AM, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8550.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>     mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>     mmc0: error -110 whilst initialising SD card
> 
> Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8550.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 862a9bf73bcb..36a5b7de5b55 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -1025,7 +1025,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_9,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

