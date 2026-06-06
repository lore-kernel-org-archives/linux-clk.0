Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FA278C9C
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745392; cv=none; b=pqfcXNShBclR9KaF6SNG4s01Uldha00iu/3OAunc6r5WY40V5UqNO0ym8up1uPQKhREvqZlZVsp+gMzbVzFh9NQZ+H2R8YuG9PYz0VoEwGlLdQVGugmT3YviLll7RA0HhWDe097gN4q/0/tjALaDXtf/Z0XY+lJrolskQ0jVDy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745392; c=relaxed/simple;
	bh=HlTv9Mp2GCh03u4ekoKQKmflNDAcHFY5vhT16StrnwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwU7H/9auBsX8CDCMCKXQvcFOtYV1zlq5gmxlwQK9tlOGs/XIRz0UCtJroYgRM0Ce3Rs4BE/QpoNYOAmXwZSHUdlPxTlAZItJYRdemARMtD4D4Ufm9Sw5ykWmzt3/be5bkolIeS+6ZYJ0KW6KMgP5CThC3Jg/mpGh94Nhpl7edA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRS9YJzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiXyrysp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRS9YJzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiXyrysp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BERd11330742
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/TEk8+zNTzJwyjR74INi1qfM
	zffd/TY2bH3icd/Z7QM=; b=PRS9YJzTshvmdExIp2Cl0ljAdllk7iNRyj9UZg/m
	E7zEQUn87tB0q5f9DmrgwUnPndCKwvoaRjujCsVI+3DF2m5j+2Erdtf6ESNUAxug
	032WD8E+8FrW6yDLtbuEqIwm/ou4X2TWfeihGCIO1ewo4Ys+I2NUBI9dcBEfI3Qh
	7nsWxyoS6S4ibz6KCYsh/1INv7E0dEOuCodDwTo4tizT+Hgm42K/H9mUKEsM/P/B
	wM8HVh05aFEMu34Rd36mWV7Qfy57YRE/Z1FQaRrSohbBg8R4w5lWj38sU6yssp8F
	2RsidM7RHcb9HhzhWYV8u6+s00kywfxHuTU6Z8NHR5ln9w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs18vmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:29:50 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9639e28bccbso3081237241.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745389; x=1781350189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TEk8+zNTzJwyjR74INi1qfMzffd/TY2bH3icd/Z7QM=;
        b=PiXyrysp5RS8RMcwBheFwEFHQBRIXonfUbxmeRfgTIDV7HCB8OfkTVd+eBhyOI7/1Y
         jdE3GZYNx5znVJm6/zTUG7MFCr+inOJftg+IpkQOKHgbI9Cp4fh97q1PMKjU5a9EEUJq
         XTHyKTGNYISkn1OAusmLiCXjkSE503Vy48Z1del7PoICAtZjYglnlGp0h2u3CQCygdQ0
         DRUYbW65fbS4/YdJRa3S8P2iqwihlzlqebs985AlKDmP0w2U74YKLjecm90KSUAenEch
         3xKKHbVYMpf1JDYAQAgdDgpIFvOqFtQL38tc9aerOpDxDPeW2tK4dTJEDylbEo+0FgIk
         d3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745389; x=1781350189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TEk8+zNTzJwyjR74INi1qfMzffd/TY2bH3icd/Z7QM=;
        b=JeNLs3j6LP/+0ZGOPy9BXTvAolNhsb4ZCuf+KCWKjFqKNNigZgEwSXvP0jsJQ3bugJ
         Q28rs8K3jy+ZVjOIKMrcWDFgyrCA618aZoqBYpGtmiT+VKI1dxD4nz5t+rjxnb+ByUs4
         fk7VteJVPi9a42LUiafAXQk5rkornq7knK9tNCsV9/RHXofWzeNaYcBD7VMtXrZlQQVd
         t2qoZS00kF+sqMqjC/rRS9Pynv1xjNzHoRTR5rEikYcRWN5PlSaZGNIv4tVrEYfSONZp
         SUGt4ypEILipGyqDOQznoGp4y2iifs8E5ASDfNC/6UAXyXeWE4xtW5DS0aS8x+YKe/oP
         /RxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aCcK9uW7solwlhHZqt2CzQObsa8e7HXn9Nwh/I1N1kWKyXBPQ9L60MyBhpz629hfEMa2YXrxJi/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HxG4lkeerBCcH3SsF0fAR5qI0sO+jkpLW2N0BkcX9G65AA66
	4vjLKJQ4DpFdV9tQzzLDwX1ETCljTVTWdRfqIfyjd6bmC1L/rFCLY1bbjauLx/Tpsm5REhVHf7D
	W5TDI7GW3k80zjyqchudprZPrMJZ40GddaPtj6AMjjwxunL2Pqxryrm77G56t58YodLkxIFM=
X-Gm-Gg: Acq92OEnGul7BbT6Uog1JL2+34UJ5KeE7ndu0F03Adci5nHbQiLgMiClIdCsoI0MB3/
	qxNmSHg0ipU66+6XzyV+jCK7Mid6bjZJxJR6hKT3+EPS/RTWHiCWp6Bdd8wAjGG8JMtCtF3dTUQ
	OcQKdoz9JfcboPER2foQyi5lVGHnes2eonhLz24UfX4TGj4KklihAl3kDDZZkX3OR3rkAIx/th9
	H38Lewz0kitLQWg+qWEx1r3IuBG1fWjSFpazyjOukigVloXbuiPP+qHg14v6VgxHkqpaExccGw5
	EfKRuR6Squ6I3RgLz6VTotQNBMSbJ5O6Dz8mML+S6CAa8su01hxcO3GmyJaZX8birkBOQ0M4DJV
	VwYcCO1fnZnvBcpr9VQ9XU3UUdj2DGs3QaBwGGSrQGuxMs3UgCjGB1/2b4r+/t4Gj7Ot7rX11Oj
	M6c66VlT20lho8O3O4dCa/Gc8uqk5N1BFdTOcF23UxVFvhbw==
X-Received: by 2002:a05:6102:5cca:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-6fef05ec0famr4438784137.12.1780745389477;
        Sat, 06 Jun 2026 04:29:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5cca:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-6fef05ec0famr4438764137.12.1780745389057;
        Sat, 06 Jun 2026 04:29:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9916b8sm2438068e87.71.2026.06.06.04.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:29:48 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:29:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/13] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <4zhwpr2n6ihjevwamqzutoyoj4owg3mkutbn3ddstooh566fqy@j2k2or3narkd>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-8-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-8-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfX9Ge03MjowscG
 JiaQ+gmq2Bq9OScA78NONA/jCgFM7VuynhS/wDWDI5RhDgHryQ25fW2EZXnAm/tobW2pbU+GXxC
 1Ob8bGUy5KZzmN4vYCKguRK5pE61OnW/g9n/DVV1aiKSsZ6dvsNVQI6/x+rn688PBGyS2mdk+DQ
 +t7Aha3I6SG/yElK1vNC6KNq/vH+NykdBIhepQo9kg5d2+fwH7w6FLl4tH0SAOiVUQpcZjaJiLU
 j5ji5LCJGihMUTGixoyrqgienAA3uf7jzsTb7tvTmlFdgL8bNh+lVqvTpwXyAIIh9R0hlHkTS8P
 QLXDlygHITT0Kn8oVuCdzIPARQPGv0r320vGZyTrxidIzozpcncBix4SaJymIuvqWsIJdkeLYxK
 r88MBaM/m70ZmCFDqP9gvyjuvX2EFc/GudgsHefWfbEqx9hE0monUicCzcc6hU9t3tk+1NPkpxs
 fg/xblTEOIGpxfjdhlQ==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2404ae cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-AUlqdHlT6LtwJEXi70A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: DwMK7P-GTua25Hfm7aoqDxBReTOrvifC
X-Proofpoint-GUID: DwMK7P-GTua25Hfm7aoqDxBReTOrvifC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:14AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention. While at it, drop the
> modelling of gpu_cc_ahb_clk and gpu_cc_cxo_aon_clk clocks and keep them

Why? Also it looks like a separate commit to me.

> enabled from probe as per the hardware requirements, and drop pm_clk
> handling as the required GCC clocks are kept always-on from GCC probe.

Separate commit.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 92 +++++++++-------------------------------
>  1 file changed, 21 insertions(+), 71 deletions(-)
> 
> @@ -224,19 +210,6 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
>  	},
>  };
>  
> -static struct clk_branch gpu_cc_cxo_aon_clk = {
> -	.halt_reg = 0x1004,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x1004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpu_cc_cxo_aon_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};

This wasn't always-on beforehand. Why is being changed?

> -
>  static struct clk_branch gpu_cc_cxo_clk = {
>  	.halt_reg = 0x109c,
>  	.halt_check = BRANCH_HALT,
> @@ -318,12 +291,10 @@ static struct gdsc gpu_gx_gdsc = {
>  };
>  
>  static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
> -	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
>  	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
>  	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
>  	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
>  	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
> -	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
>  	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
>  	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
>  	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
> @@ -342,6 +313,16 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
>  	[GPU_GX_GDSC] = &gpu_gx_gdsc,
>  };
>  
> +static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
> +	&gpu_cc_pll0,
> +};
> +
> +static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
> +	0x1078, /* GPU_CC_AHB_CLK */
> +	0x1004, /* GPU_CC_CXO_AON_CLK */
> +	0x1060, /* GPU_CC_GX_CXO_CLK */
> +};
> +
>  static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
> @@ -350,6 +331,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
> +	.alpha_plls = gpu_cc_qcm2290_plls,
> +	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
> +	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
> +};
>  
>  static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
>  	.config = &gpu_cc_qcm2290_regmap_config,
> @@ -359,6 +346,7 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
>  	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
>  	.gdscs = gpu_cc_qcm2290_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
> +	.driver_data = &gpu_cc_qcm2290_driver_data,
>  };
>  
>  static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
> @@ -369,45 +357,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
>  
>  static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
>  {
> -	struct regmap *regmap;
> -	int ret;
> -
> -	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	ret = devm_pm_runtime_enable(&pdev->dev);

So, it was pm_runtime-enabled beforehand. Now you've silently dropped
it.

> -	if (ret)
> -		return ret;
> -

-- 
With best wishes
Dmitry
