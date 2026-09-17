Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37DC4E50A1
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632638; cv=none; b=nTpBQNzLcLn05GEXUcf0S+cj9IRljHWbBwjZKcMW/OXNcxp3mYD80EU8Dkz9hDgDLZl0Pb84qZGTg9bV4OQfZzPY/g/Qk9orM0QJKMeB9m2V/rLQX1o86WzCjSWNQSkn0lCdfKvPCnO6Ns8FwhUQTjmiQ7xODSwuW5tiGvRvb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632638; c=relaxed/simple;
	bh=Mec2abVM/Lf/R9VYG6xI0d6pNY0/XHkdaMkNMG4yYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUNGa7Pry8AiweC1knnwxYme0+cpNByRasFORoBU4iAktZBqpaWtAXGlAVcOWRhLcsQ95ET+5Vj8hKU1Lm+sGxYOqOc4MrBjKB7PAk344L0JOaJCCUR0UAgPYdy7JSAUfmInlEHWzcl11bEiLBUaB6aOELDhFGjrtXrdusZWk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpbjNAnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNPgJ6vC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpbjNAnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNPgJ6vC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60FhW1924323
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=; b=fpbjNAnFGmEG0x39
	Lo4gwWAkMd43KSAr+y8X9nwpeKv+kOH0iq64hZkmmxvt/ulbv8TJ5gowKXUe2jUQ
	DPePWFlgB4irnbqicRCPCQf8zTOR+vbc4ElqfV0VKAaiyFnA/arfh74mfn5iMLKD
	CPaoAkp3lwYPCZCgkg2NBi3XA9UTOQWNa0+E0rkJSMV27eneMcqZSw6NDZ1K7IHA
	QVsEi+09g5pOv24NvKd7mwxWet6gHPgZgbtdfbq5WhM8w4bm+ynUK2LQ7tf0f/VM
	0le2GWaG3z+XjjKD86rATtEZosilZuSq9YEcQ2Ct+0Jz7cjnwhE4tvumtk81LKje
	SpXgQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8uc5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:10:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6b8a88b88so1374255ad.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 01:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632635; x=1790237435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=;
        b=eNPgJ6vC3gdEBwbi6b+vMUaNjO+QKP46rcTQ87Hxu2YCL4bQOFAVI3vKVK5jf9YEAs
         Bu8TkCvqF3HIiiT45afnmRd5ITXuPvfnxjWszqRtyYAqGpGhMMRhMKBVTPVoXzrUL3P9
         MFyKNQtNPdj+DGhp7rbfwLkUOc44Qtz15slQcp8qQiJZgdk64YRf1CCNnlGFzEVr9rii
         g4GKDyOsOwiF5RpTpOrN9lpCQ76LYc0bQ0sX1t0A/HRi7GxaaNBDww7KCtMeIGdh7KLq
         QUT77qgToaQdghq2ewYF0rABy7hcs+whnKZWz82MRFXCV1b0A4axm/jERxBatu7dOJvt
         rjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632635; x=1790237435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=;
        b=wFoO+CbS3MUAInWI+81exQqnJ3CZhhCLqG0BZxprERhVDngsFHPA+pUIzlHI4q+xvK
         ODBCpAOvwfGvo7Sd0fsGgSOzPiLXgyE+ED+pdgclSbnIuH2VlrhYpQRlak+KxWmyH6lP
         ntDOtiGJE69ABZVl1/ikAECVR79lkNE5vDH/eXnAJfVSB/+E0H7+VESXcF3O8AnVgXV3
         F9lf25ICIdvT/OsVaW0YGkyLm3kFaqlrvcGE3X43H5XGVX0jfBlz+rsyaJYJYL+mezZT
         CIP9FflAoRK0QB6fpkYnkC/H5FverWb9CiIkvAo8zUSiS9wZzq5IB33wufPah/nm3XgT
         pOog==
X-Forwarded-Encrypted: i=1; AKwUvBzBMsY8HKENlB4tpEaPa1Z6+2QMJ77rPOa/ScyDW8yhSmB0UjhQmsn0/jzcb9ibi3FV1MRVjkipfyY=@vger.kernel.org
X-Gm-Message-State: AFuF++mZJzQ4ugZtGqh+TPrvQd7009vwBwPwGujmXOYnuTsJxSbLhOB0
	GXDMlypbbBIcaHt62gFnzanfsqxbAhHUD0KbW0gKBQ1IqVVy33xfMS1KG55DEW7CirVxFxo8s3r
	X3K3lDfN1wOvoAMZXAr1Fsu8t3tMkhZUpfdXwxruSycMWHN6bkGqD7gCXjPWWNSzMP5HwZcA=
X-Gm-Gg: AYBFou0wMy3PKNbXKXyHW8ExGzoe7kEL5nhOqwx4BRv+Lbfy7byCsQfMoMgQAZZgqVo
	V82enag4ZSKAJ6hCfhg+wWgMzEvFwx1bErU3o/jX2HFcgYsffvz3Zfa7xpc0P90UZYg2lnKHAmF
	hULvDWKBivlSxDAnV74HzNIO0ivjv9sNZuKF522odIic1GhF74LXs//HSMyD3zi4zdLt5GuAxB7
	CzdEUoXqaexY0r+0/OstUer+gyjZUcJR3lUbivM4suaW03ov9bbJRqAjv5aCYefQcmPgpV2oemL
	PPsdU220blxJ52dEoFA6Pc+sPNSb7mm7n0tcQygBXWN0j+cpUpWsaOBsijJk0P1w7BMSQqcR9V5
	QbIKCZGgCQuqwRrh/xe05MA==
X-Received: by 2002:a17:902:e887:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2dd8e6353bdmr89012705ad.3.1789632635255;
        Thu, 17 Sep 2026 01:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr864906885a.6.1789632163730;
        Thu, 17 Sep 2026 01:02:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fac9sm237902066b.57.2026.09.17.01.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:02:43 -0700 (PDT)
Message-ID: <155306d1-26f0-4dd0-bbf2-4e8b497b60af@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:02:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UHr5dG_FKHX_HVRsWUcKYYwxS6qpj2GX
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aaba07c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Qj5jWNXxokvdYmWtNJ0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDExMCBTYWx0ZWRfX+WAjXXl9XZQb
 mgKP8tqZ7aT/PU9OyO2LB1hFXPgruLrqnk23FfddMP7kFqP+TODNk3pYlYOtzfxCAzFi4+mgs3c
 80JksQm2C152jQhu/3DP6sIDSNjnwNU=
X-Proofpoint-ORIG-GUID: UHr5dG_FKHX_HVRsWUcKYYwxS6qpj2GX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDExMCBTYWx0ZWRfX6Awm35ivjKVi
 yjV7uAqofKNPRVJhjZ3IHlKI6nUzqYYrllrpJTonxtRKYeErqUr/xAZWPd2DUI3Txeh29mU3sWI
 TmS3Fgha7vCSa26AyWN5kQpIcAh6nKhBNVW+HGHo+RUEPGAVNnbUAYYmWCt7wikBy3jfBkdQeF0
 EChhQ4LmvBkcPvfErz2urRE5g9z7M36tAdABHFxeMFbzYn9cW+U5fKefEvjiyp0JI+6yE6As7Hs
 AF7K9zHgbEaWca2tqhOwRLzgIzeoEGzjEMfsc/1LxPDCzS8PKpPtoy7gZ1ZsunA0wcJaTXSXuqu
 CEo4F2GCGxLxGHutqn0haFgqPo/1tR4a8+JF5hqMRBMmdT1x2y1Todr2YH28PaaPKFHiGvYeZWs
 7xn0CmRVxdfj/ndeB0GTVIaY94j/mYyw7SAtAaKbtL3TOozuT2/9b5Nsf3BR1FXruFzemd7MtaP
 bftQx3n8VxECV2ul8EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170110

On 9/16/26 2:04 PM, Abel Vesa wrote:
> PLL15 is specific to APQ8064, but the shared probe function configures
> it unconditionally, including on MSM8960. Its configuration registers
> at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
> 0x334, so regmap rejects these accesses. The PLL configuration helper
> ignores the errors and probe continues.
> 
> Only configure PLL15 when the selected descriptor is for APQ8064,
> matching the existing variant check for the GFX3D clock adjustments.
> 
> Fixes: e216ce60a9e0 ("clk: qcom: Add support for APQ8064 multimedia clocks")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/mmcc-msm8960.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
> index a23440e13b71..a67df833592a 100644
> --- a/drivers/clk/qcom/mmcc-msm8960.c
> +++ b/drivers/clk/qcom/mmcc-msm8960.c
> @@ -3170,7 +3170,8 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
> +	if (desc == &mmcc_apq8064_desc)
> +		clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
>  
>  	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
>  }
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
