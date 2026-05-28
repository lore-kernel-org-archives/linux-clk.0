Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA73F2109
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974581; cv=none; b=Klrqn5ACqs+Ddv5+g6CQIQGXUBabs/CIaJuVX/ydasEnms1ZPjXUxJYqUs2OU9xTc9BiAlu5nYuFbhWkbjbg5/mfaXLzRXbNV5QBE5nWCXM3+tq6HrbbtysQH+DnkpK7fK/E77LAcdRuxD5yHUcGERkm7Y5amsnUFcWTje/zwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974581; c=relaxed/simple;
	bh=sV87Xc8i99EVxWO2FVxuMWot0RX1WUeFmz0bMZPXYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5QZ9e9NFbgWgoqkA7teBv5BYm0U1kWG/BUppgAZsh9yQbFMVNCbEHFItL6mh5eyMGC2tJFNET/Y9+5DpK1xCdQcYFetnF+hMSOimhLVuKR/l8nCY++Pmv0YfRc4NOoQbppIfjZfJZTleNF/bFF1SZb+VqctZcR2TS2/byMhwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZfziOKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+tWysVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZfziOKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+tWysVF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vO7e3545351
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=izu/KqM7htjjNlIIypCwCyXp
	aBgseSSoEL76tVPD4KM=; b=gZfziOKY+bWlMOtAJqDUSsmnkokIbJjjNUVBOvm0
	sS2R/TKaN82Qu8wW4R4wXC8+ktS1e76hCbOUqeQ2rW7zOx+MgjLM8Joo9SnmHnLe
	FU20kNYOYegWZ7AXOfMtgFoR6n4h8OK8So5PSJwnd0BMCcI3vAtfugl9wnt1qE7f
	YllnGjlrHvd790lE6KyYUea0FC4ZeMxAZMrRRWxzHDiyhwdmIB3O4mm3F1eq0xT4
	vQNPChnKCX3G5PmL8ExtZGAG1wFlieBcQmPz5oV9g+Cjh4yjQJU1eeWmfbIATykD
	gSxXdmNa9vqrRxIF7CRz9PQ5w3jijR6b3UOOWxVbTiBMqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tujs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:22:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso84795541cf.1
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779974577; x=1780579377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=izu/KqM7htjjNlIIypCwCyXpaBgseSSoEL76tVPD4KM=;
        b=X+tWysVF02GiFnaRJLXa2S234XN+zP3zp6gJ/j2KYl+HYgLdeTylzS07sT/v5E1ZWV
         DvFZ6X775kaCiEPqGM4+dThTyTIoYZh/etcIeDSY2ZBqLLJ86ZpA30aIXk1IrjtsKGyJ
         1p4M1Mfq1tB2zoPQRj3xLzeJVPvQs5qasJq1twbJRg1lONaz+Z9s9RKwuJfFWkKuK3d+
         TopjRYX8i1pqXhC80m8M5TQXDjoZ9QpCUwrLYvJ21DuLi9kVZ5boybPggDwtFxuF1ZvJ
         RxlMAoSGY33FXtfddmi74+Lj9cKHPcQYEQz/dXAb1RR3xud9FPQG/aaFYKTnwnlq9yBo
         jWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974577; x=1780579377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izu/KqM7htjjNlIIypCwCyXpaBgseSSoEL76tVPD4KM=;
        b=P05gxQRgk8/ERqD4hP4BwKIddcJzSQVti1nUxsjbUVUvNvv/ENPhuzYoKpPGHuTxgV
         cF0rhoW1tiNjvial4CjWAsmcRkdHBRBjHYa6pPRj53obcquhSD72eXcZ/RqTFUHN3P41
         O7QdYf6YcolkNHt19eHxc5+p8yRNDlobPAKnn3kbNLb2VoiqtrCKBq1VkUI4WiK3+KNL
         nVmh4DtazHbBSA8F/apYQGbjE2vdU7XN3Nq/cl/wZwV2aFqWltd0O3v93oBtSSlHDCZl
         CK3hNfyoOM4inL1b6hYlG8GUL0xCplwyJ/bi1w8e+1zk6JfybgfZqMF6tVSi/RR/WVsK
         JieQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MDLFGx1cWR+LJdGhj8gMK71CSaRdsU2wY9qDZ3fOmrVd8Rvm2aH5KDTwJunqZf0cuyW1d2DY7r60=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSnHnX9Onl1h5ZrBr1G/sGkRrtATrAjdplakfVih5FLQ8aHyO
	eAvBDKa7dmOhI4AW4TllFpyZJF2aTpJyxUIP8FBP6Xyn6Vff+gJvkJKnjdprkg5jDmLWF1PjWLR
	b74LV6mgtjTRkNWuU4sHxK8vSnCxKNxk4uackZVhKvknP2XCmDuW/VkNJCRc64XU=
X-Gm-Gg: Acq92OEzp8iLPIYbpSS3CiUqhJRoFH8iO+i+U8zlFkpA1gX2xFYTZm1AfGfdgs+oZv2
	Wl4hJRIKZLx6wcE9vTr7d+uLLE/FZGC7qYbg/VtRfDMYlc7o9XcjKysw98w8kKDej+W5yv4UQ0s
	cNMNDreGMBytS8QOa8bih/nsed0fYDWAx59qKx2vQTM/+HwGNCHy5weg1A6fwESgX7z1mLJwArD
	BnxijQRMSQfltgRliHe0jASw1zwXG/zsj/Rh07Jz2LSDsqI2RwlEQyDs0ACyOgbqJ3bVodJVq2J
	u5DyrY9RIZFscSWl03srMlkwL2rvRxXvkollgmTDTM0Cm9gm4nqUcP++fdtt+honcf8k3ERPxS1
	ZIJe//6Bf3PShgMtlqIuciQJi0hF3EdJcGZTb3UPFcA0GbwjFHuK7rF++WXsbLGdu72QQ81JBr7
	JsXnYcsX0kXrkNkpot3hzlSSAJIUN0E8O/i+68Uwpac06EWQ==
X-Received: by 2002:a05:622a:5c17:b0:516:e6e6:63cd with SMTP id d75a77b69052e-51722f8cc28mr15106951cf.2.1779974576884;
        Thu, 28 May 2026 06:22:56 -0700 (PDT)
X-Received: by 2002:a05:622a:5c17:b0:516:e6e6:63cd with SMTP id d75a77b69052e-51722f8cc28mr15106671cf.2.1779974576431;
        Thu, 28 May 2026 06:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462e263esm1915294e87.34.2026.05.28.06.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:22:55 -0700 (PDT)
Date: Thu, 28 May 2026 16:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of
 critical clocks
Message-ID: <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GCJvMsPm42k1oateUehkJzH8P-M8PO9s
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a1841b1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7SXEGdnjidMFAlfwy8wA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GCJvMsPm42k1oateUehkJzH8P-M8PO9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNSBTYWx0ZWRfXwWt++Uqz6bNV
 bmE3JbhlCIcpGw5l2vzYscHLzGSo1wl3tDcl9dMiJj1KDybXZSlknlN2+d0k+WhREbICnQrq9is
 2S8mMrquCdEV4wyrXyYc377ZePDNRhX13+6K2rnUHYMWGEGOmEGSIpzeh4nh0ph+d4tEFpxyNSi
 CerzGY0gKrE4Rcp/w6OUhzIvsSXNSWwtSdyIdzjSjInUjz2zoS50qfWPh14XXWLOPKAcCNQSY4X
 4tx+3pAdRgJvjcFscngRNE/wUTeXN+eehsdJmrhCSejgmmwmWxbeLTDye85J4zYj/2fY2r0vzMJ
 qPr7McO+TPZwskB0fkE6reA0Knx7VsMzLLnfMlPX9QXT8HroSYf6BWx7ppArbBOugHShWNvK6y2
 cKBCrIa1GnsOrMP7U+BlmXeU4EKKlbeobzFGznSZihM0ixf+dxUHSuVruIlOA4IMyjG2y5rglLA
 BKKYFF8lhqfwdJYuxmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280135

On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
> Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
> enabled from probe as per the latest convention. This helps to drop the
> pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
> Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
>  1 file changed, 11 insertions(+), 142 deletions(-)
> 
> @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>  	},
>  };
>  
> -static struct clk_branch gcc_gpu_iref_clk = {
> -	.halt_reg = 0x36100,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x36100,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_gpu_iref_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};

This clock is not critical. Why is it being dropped?

> -
>  static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
>  	.halt_reg = 0x3600c,
>  	.halt_check = BRANCH_VOTED,
> @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_video_ahb_clk = {
> -	.halt_reg = 0x17004,
> -	.halt_check = BRANCH_HALT,
> -	.hwcg_reg = 0x17004,
> -	.hwcg_bit = 1,
> -	.clkr = {
> -		.enable_reg = 0x17004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_video_ahb_clk",
> -			.ops = &clk_branch2_ops,

This clock isn't marked as CRITICAL, why is it being dropped?

> -		},
> -	},
> -};
> -
>  static struct clk_branch gcc_video_axi0_clk = {
>  	.halt_reg = 0x1701c,
>  	.halt_check = BRANCH_HALT,
> @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_video_xo_clk = {
> -	.halt_reg = 0x17024,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x17024,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_video_xo_clk",
> -			.ops = &clk_branch2_ops,

This clock isn't marked as CRITICAL, why is it being dropped?

> -		},
> -	},
> -};
> -
>  static struct gdsc gcc_camss_top_gdsc = {
>  	.gdscr = 0x58004,
>  	.pd = {
> @@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */

If you are chancing the driver, why are you not using .clk_cbcrs?

> +
>  	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
>  	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
>  	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
