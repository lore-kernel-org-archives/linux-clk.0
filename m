Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643FA39C63B
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803225; cv=none; b=aPjh1ECr/cyzyINpjBU/MFL3RE7xcu8iGKBqp3AAIMGxz4Za1TRDYrykFlVLBQ8HdtZBhiC6lCahjpzfmBCjEIYv+4wQMDs/QB2sz/j3Qc5KA4yxNgD4s9xzgfLIR6zmyEJMBNLijVT5QhQgubJvxXSh4KzFHl6kTSFmBSTQ2Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803225; c=relaxed/simple;
	bh=ocjlV2HNIOFaE2jQ+fliyYjPnubqT/6CSs4aX2Mnn8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALXYfHqQTsBCNC9DSVsGv+egDCYw7JZsGdkh+4wu/rY4uLtYhvShHmopIQSA0mbNczfwaqIvOF/QPWGmFXkfWTDAoDJUOHsAZPuyBSVrzR2kxxCwdodGfuBHpySebjkgMbLe2kI9e9hVuQUDBTaCTZx5PKewuI5i1OuR4QjgEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esLRBjqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYS45blW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esLRBjqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYS45blW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078dqZV2577900
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 16:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=; b=esLRBjqqLnzL1eWg
	btTcXwq6QWcEVWyXOuxTHoX6LNhhS5pZeIM/n3RKsSCnnmE6syAb9UNvN1EiKz5W
	5GAb29vWcPaGoMJ3xOAjFh3aVITPxIRlrEdjeix3HgIb754PGnY4+3/2KiTi5XR7
	+y+QG9EHAWI6xlPUWQ04Nyob7yE5Irt608LxWsSJFwKfdrsprL49m7sQgp6R5hQo
	/RpgVL4Ci2GEgzU7vVDC3owtCvqT+1ssM4wO+85VqWnudolMfWl0aj5MPw6LC+DS
	qQeI7K93AJSQ+5uYdqm3ns4WURb/f9OYq483Hlr5IoWNgrHFPiTB26cvh1RlnUvB
	cyAb0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm659eyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 16:26:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d59f0198so25822415ad.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767803209; x=1768408009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
        b=jYS45blWJHn+5/s2iqs/E7x5FRg/8aIPtR5/3JkDNyzuVmXzU6FVTwp3Wzo6o4ss1u
         72JbMN/zKbrhOg7gjXEZ+TPwPv8i5NzB3Pc9o39fEl8s3gkuEUb+O+mfHCzAth5iULgV
         Iss8ED0Bz+rZaCBReJb1vsnP/sb0UxaIkbIZ60wcctN9vBmfwfLku13qjDXDH01j2HOs
         wk8MPqtXCqd8NQtYPB+sqoW+YLzK9V2W3TGi++bBk1BhuAxvrrN+nFD4zdcq8sh6+6Eb
         ua8P51UmHeSf/jfO3CyW9S2Cfjct/62aNo6C6tyVRier+StQOWCHZJwDIjnktvSckVck
         u31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803209; x=1768408009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
        b=ZDVCeWT95Icm4e9uQ2sjxAHUkj98OVn14gMCmEPkYK9DbGzgKWPTWMj+YTx1WElxjh
         sHf5Gj84oTdDDUgLN4HHruPlv1HuG3wRx5IXRizxvoH28MLvNF6iP5054Atx9enBPZs/
         UJNdEpmCB2wi1zxhVwkWE/QdONJcwXA/qYzGjZ/c0/XOYBi4TGMEIg3wLwxD7t2Z1hvo
         lSM54UEu/o2WdGKKxTan46SDH5h/sN4svlopkKz9vqSr6rLqyeoA4ellfzr01+85LQKt
         vhh9tjtLYyoHWQkb2ewcL+OShloewWxxJ8O6NCLAbI/NfEcMtKwvIgU5yLtM1mcJUx+W
         Mzrg==
X-Forwarded-Encrypted: i=1; AJvYcCXfLu1vTg5oJyR+9Aw4B9aUT7Fo8NU23FLYOl19KXvK9Ty0e3SHEcIYO8cKvjo3iTnvqY9cXpJ4F7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxR33PDrQg9eJZH5/2cD0S9318aa7ioYeo2sw33cqp3OhqVBWC
	zQCMDW59/4yMoY2EXlvtjXwQlDRJRG+l9BLO9fkyepw2oHwbiUJMWrsXcCYlA8V/rFmzXWS4pen
	DuOYwpnoeWrtnn0WS9IusmkhNNcRhvTWJnXJ4/uQg3ul+PP0hmqIHIQZzBw7bgyQ=
X-Gm-Gg: AY/fxX4/3539pNsw+H3xbAhwkYW+Nyi0+DVEPgauPnI326tElW8xid0afFcvK8Mw9l4
	hzj5QWRttCFbsQ6FV2p+hg6IX61fonAeBZRDZ2VDillzR9HnrWvWsfWLHMShA4XvMvo2gfG7CCQ
	9rKnFCKgPEzzXlSaL+pLIh+oXseTjGfK8ogMHPhdJi4fXEmBotISWP9jYh9gKvFFSr/M7y+4A6u
	DzecvoTOLcBoKoaqCGU7aVcwKEeGHIFegvU3vlHLrO5HQnOWtXj8Ir0ndOtufnm60Sx3TirQcPq
	q5Ur8+PZ2YLl4EEhH/yfGAKca2skrlzVJ4cSS5JhCr6zcR0KYqvn1B/TMvQ1C3Y124n1b0f9isT
	VF98JMy7yZiWdzrw69Yun4B6YxR/zkZsYI5pjtA==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a3ee4aaebamr26013555ad.37.1767803208644;
        Wed, 07 Jan 2026 08:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhDyZ20m0wTcSTXbF6lfqRcelUkGiEtoEtFdPGDtyUaLrGrVdvkZP+XFYxhXeMEZoWEcVI0Q==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2a3ee4aaebamr26013275ad.37.1767803208116;
        Wed, 07 Jan 2026 08:26:48 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2df6sm55741685ad.61.2026.01.07.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 08:26:47 -0800 (PST)
Message-ID: <fff70f1c-3c5c-4e50-b0b5-c3eb10f67cdd@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 21:56:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: petr.hodina@protonmail.com,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e8949 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9zcPrCpDFr6Yft4RwatP3w==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=fry8jdqtyFT-MZpSCxoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: NoQKPsSt2qxd_3qTpB-lS-g1sofQEJ9C
X-Proofpoint-GUID: NoQKPsSt2qxd_3qTpB-lS-g1sofQEJ9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyOSBTYWx0ZWRfX/hLlFRLx8Y44
 yoIrPLOeHDE2QKBTm39l3EM5eTf77rqACcLK9/o2D/zaMQNCisAkCK+bNSI8A+X6S5rzXg2/riF
 p/DsyOuAYTxMcRNq6UXqCH1FDu7MVCm1tV72iS5k02cK87vf+TPk1nAJF+OLFh0M359bixRtpMW
 a4YHGC6Wza1XkN2UsELeNFEBlxlCWEd/gTTHbrogTI58tlFO1fMNeXpUAT3XjYIijzV0FJxVEsM
 zowGFvjysn6aYvvV5LRA1rGIIQ6EB9HhAdNFOhb7JGWSShIQMDx3v9kOTkL/Y01spCxTlasQIfK
 Fj1oiKgm4cDTDJng79iEUHTRdPOtpIJf5P6ZLANsGd401HJKFJR/hLEux18OYngoKJgsWgac2vt
 YZwaJ3zzvmDN8ukH8ObqbyrghWTgIWNhdEfvDF6z59pbcD0P1efVReaU5pSy8bTCslY63qHfbw9
 lWQhMOd6/dpo5X3deQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070129



On 1/7/2026 5:14 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 

Are there any changes between next-202511* and next-202512* on the
display PLL side which is causing a side effect on the pixel clock(pclk)?

> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 2f9e9665d7e9..78e43f6d7502 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -280,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> @@ -295,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>  		.name = "disp_cc_mdss_pclk1_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> ---
> base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
> change-id: 20251212-stability-discussion-d16f6ac51209
> 
> Best regards,

-- 
Thanks,
Taniya Das

