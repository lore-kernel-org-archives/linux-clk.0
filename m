Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC19221F1F
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118172; cv=none; b=T4ajVr/xyqXD59mqmfH2db3M8bEIxz16aEO4bx0JXAYaGDbKpB6mub1PUTGltRqpYfbciPEDE0eN/NAz0gCXVfnovGAW+OSfYz6CbmtRPHdr6mDDUiHERkqwlAHhj6QP7GNA0Ug5xHQ9YDdfkPXAzEiKHmEfX51NJWkUP2uPGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118172; c=relaxed/simple;
	bh=JEoF9yoRtjhUDYAArjfrNddZjCS5jSY0EF4keJnAqko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnDbYgeRhFTPAoND0dUhj6PvBJA3Bqx2YreKVLsGbcCxbyFbuOSDRDlCRSeodcxuKdA0/FrhAQhEG/4W4NOQn5gfBa2WIc3WrXSCMPcP9CO6lJx3qO/e2/D/lTyIcouytqFFmwYNotNSrqOcuqcv9EFlWXautD1543jakVgpXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8/XcPqu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNADp7EC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8/XcPqu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNADp7EC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUBWR6H2672009
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 18:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9OBPcJEGcyXj0u48Ng5ChP14
	fU5Jw6ppMgNLNgQ0MHo=; b=Q8/XcPquRGxft8B0WSkS8rm132V4Vnuq7Mo2t1rh
	UGUQTGZFL6IuFp0o9SpHPG7Y0xsI7MKSYPU/PxQOMkE55OUwv+7SA6oN5zVvA3re
	t1qTmWPqmlCZrMt+6yCxaK1NhV2Y5mmJSsHmVraOKTQWKm6PRcgWnurQEYQU94pO
	/qN7WiTu0T79RVA+jfOaB3AKOUsG5LvsWW9v1XrLa/dEx1TUny/mRHV9WRPW/DzY
	z7vvekoV7YoqX6Q+M9oeDM2M/t3Jwk6CenOLMtL9TykrzC37NFN87yn+1bFjG1Hf
	lvxBZdLYoy4Vm1vsqP1kktWZ5Hmk5e4pYjmit8tNiwICTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fct7c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 18:09:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so382418296d6.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767118169; x=1767722969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OBPcJEGcyXj0u48Ng5ChP14fU5Jw6ppMgNLNgQ0MHo=;
        b=DNADp7ECaUcdw7P1K/wGKZAFMrJbox0ptQtDOj1F5tzHx4zxp5S7ttdGNQzR+wXzsU
         KtcWpneFAjBGmNmlwJLoKRVbWj7HYg9LlbcUSiNJ42pTwF21zA0UcMDMaN+2CSGNCXbh
         +qZnFHUxsuq/0UJ01RBj8aSwM9Vm0Jt+6pZp/i6V7xexsJsRKiYPYwiWIDzEcxiRLutm
         3p9W/3pmVM+z5rPk4CTNVfauqJuihUMy/asOpapVedTolUJAopFwqsFXukzj2UBzpTap
         mbzS1B6IW6nEN01yBMFCXe4etTfSL0AYWsBJfVSEaU9grNZ0Nid2HsKrMS8UXkAKrJRN
         85Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118169; x=1767722969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OBPcJEGcyXj0u48Ng5ChP14fU5Jw6ppMgNLNgQ0MHo=;
        b=AVAT6kTMX9hLopmzq+qYjfXSKeBzmyr44xy7UkozVgtBKJ57a4+46uNRz+1Me5If2U
         8NUh3DhKYs1TX5IpOSWpWMo/ij8LouW4COusZxQy024N8Or6RRNx1CcUkQJGKKTeqtLr
         fwJ6rYYqg4aKbqbm4w84tPXiuG22e8ky1AJy+N/ttlxIpO0xKlG9sSArgkOQQrHgD07b
         zLrFM2A9hdnx8RkZVokg1zHnCTdj4QnLWLOH9XeRZMQ8cb+Wx8iD/k1neQjuG7sIfk58
         StSLwLpucFxrkO6LnA6y4pfycI6jdFE+2Vzfr50vbntd8OQ5WrBRdBsfZSlNc96GvyWk
         bGxw==
X-Forwarded-Encrypted: i=1; AJvYcCXIi1nOCzla6oDHHQ4I/BkoDhmSyLS9CktKCPPZJ2WGKiOrg7/dw+w08qO/ApVQU6kCXz3AwDgG9fA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi339mHlIRl8vuHvCyD2JBqZpP7WqflJWIJR7MnJR6S7wM35A2
	sIDoSESf8198XfpzzgQkl0jwXsEtOWH2ke/hmz4pVqLt5Pu0REvlOLwnCP2RpZkWQUveaZ3ys8e
	Igk228VKs9bvK8Fj2m+aGYbaiVZdJTwogzP6c3F2cayYEn7mndk8vr3xTk46QFVc=
X-Gm-Gg: AY/fxX7x3nYSudPwxxK1gNTv/mbOQpWURlSRrHSkru9p1pOHjOl6gbooO35pDSXA1xS
	RfkWSdcQX762m9pOMg48Y0YQo3+zGE+XY4xCvZGjCvIMoVSLb1Tu/9TEILOPRsmbxnW8pEbGmJc
	jHWwyz7H6hdw9S/JRhBemEdSROBdA+7jm7mT4b145OLohsncf1VZXW8O36lsKe1YlA9ESKe1f5s
	UqMnLYoEYfl/2+U0Abv/lT752NrhHK8sLPVDNGoBu/b74ag/fCjLaD9LbK7ut+yYlN3Ncp6r0wL
	CozCqOxTi27e6ScCFrZDc4BARgSTsGVfIwWpfeDN7ONVEWUktisAT5rjVzSu64W6hdzIl4QRcQ2
	56FdBAUZt6LQl0LZWjO7xajuVRieL/OkgxRNfaH1jhZm4YgaezqmVIGP2/Gs3iRKBAB+xcWjDI0
	8/DDaQ6oW8sYLYw/b2nhLH/8E=
X-Received: by 2002:ad4:57b3:0:b0:884:6f86:e07d with SMTP id 6a1803df08f44-88d81c499e4mr386668216d6.15.1767118168652;
        Tue, 30 Dec 2025 10:09:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFo0Wgnmpxf6UQfzM4eLquswAjbuVIhi9lzyI9nd6FOYgyIWbZwPfkiYqKRs1Mb2mGyT8iQ0g==
X-Received: by 2002:ad4:57b3:0:b0:884:6f86:e07d with SMTP id 6a1803df08f44-88d81c499e4mr386667846d6.15.1767118168200;
        Tue, 30 Dec 2025 10:09:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122680689sm89404881fa.44.2025.12.30.10.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:09:27 -0800 (PST)
Date: Tue, 30 Dec 2025 20:09:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
Message-ID: <o3jixtcjqbk3i756vy7umb45euu5ofpg4yv2za452xcje5shfa@qgzqnqslxctj>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
X-Proofpoint-GUID: pMmiMOUAktJ62yMRVt3gQfEHz3NXWrbg
X-Proofpoint-ORIG-GUID: pMmiMOUAktJ62yMRVt3gQfEHz3NXWrbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2MyBTYWx0ZWRfX+o+nebI0jP2V
 1+QahU5/Fq02+ize+qdgjfvy9rC1p84bvHDUrJgRYxtZW312clfU2AGE9ez/mNsTEGedXLdnBMw
 NArliiKMy1QKCsjVJhQ/U71l/m3FYRKpndOsCCGm8Yjt9CpugPkTkpB+PfNUIRrtpLdVi8iV0rX
 dSzniWxY63ZSksx6eXjOGmjDsX9U9BU9IlvFKDT2B1IK3+9rX2n4fRMenNiWtz9P1o7Kh+fGhjQ
 cNj7r1RvGNzsDfvN7EcaV/BuMGd9D4RSejL57QYs/HZsOoVwwcUl2CuXKWX/PljLi6MKD0wdAi0
 fFkukUdJ9UqTe3QCcRwYekiMb8XXWujQGLcI2frJoVsLml6nCMNdDutlUcdEGRp0ktERjSAtUNB
 tP3SlR4kmIS1kgV3MwRQBYeXnYRYToJ5SvMoFx0tTBQs+DOtqJV5Itu9CI91Ub4dS20P8qqtx99
 2lOpbNxaEDJlzowFBjg==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69541559 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lVaBrOMFWp81B8hMq7MA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300163

On Tue, Dec 30, 2025 at 11:08:35PM +0530, Taniya Das wrote:
> The UFS symbol RX/TX mux clocks were not defined previously.
> Add these mux clocks so that clock rate propagation reaches
> the muxes correctly.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 102 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 99 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index e46e65e631513e315de2f663f3dab73e1eb70604..c8fc9e6b1ac97b13f84753ac7f76e23df071c2e0 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -59,6 +59,9 @@ enum {
>  	DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
>  	DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
>  	DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
> +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
> +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
> +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
>  };
>  
>  enum {
> @@ -103,6 +106,9 @@ enum {
>  	P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
>  	P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
>  	P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
> +	P_UFS_PHY_RX_SYMBOL_0_CLK,
> +	P_UFS_PHY_RX_SYMBOL_1_CLK,
> +	P_UFS_PHY_TX_SYMBOL_0_CLK,
>  };
>  
>  static struct clk_alpha_pll gcc_gpll0 = {
> @@ -482,6 +488,78 @@ static const struct clk_parent_data gcc_parent_data_33[] = {
>  	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
>  };
>  
> +static const struct parent_map gcc_parent_map_37[] = {
> +	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
> +	{ P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_37[] = {
> +	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct parent_map gcc_parent_map_38[] = {
> +	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
> +	{ P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_38[] = {
> +	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct parent_map gcc_parent_map_39[] = {
> +	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
> +	{ P_BI_TCXO, 2 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_39[] = {
> +	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
> +	{ .index = DT_BI_TCXO },
> +};

And all of these parent maps and parent data are unused.

> +
> +static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
> +	.reg = 0x77064,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_phy_mux_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
> +	.reg = 0x770e0,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_phy_mux_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
> +	.reg = 0x77054,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_phy_mux_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_regmap_phy_mux gcc_usb4_0_phy_dp0_clk_src = {
>  	.reg = 0x9f06c,
>  	.clkr = {
> @@ -5148,12 +5226,17 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
>  
>  static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
>  	.halt_reg = 0x7702c,
> -	.halt_check = BRANCH_HALT,
> +	.halt_check = BRANCH_HALT_DELAY,
>  	.clkr = {
>  		.enable_reg = 0x7702c,
>  		.enable_mask = BIT(0),
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "gcc_ufs_phy_rx_symbol_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -5161,12 +5244,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
>  
>  static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
>  	.halt_reg = 0x770cc,
> -	.halt_check = BRANCH_HALT,
> +	.halt_check = BRANCH_HALT_DELAY,
>  	.clkr = {
>  		.enable_reg = 0x770cc,
>  		.enable_mask = BIT(0),
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "gcc_ufs_phy_rx_symbol_1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -5174,12 +5262,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
>  
>  static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
>  	.halt_reg = 0x77028,
> -	.halt_check = BRANCH_HALT,
> +	.halt_check = BRANCH_HALT_DELAY,
>  	.clkr = {
>  		.enable_reg = 0x77028,
>  		.enable_mask = BIT(0),
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "gcc_ufs_phy_tx_symbol_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -7180,6 +7273,9 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
>  	[GCC_USB4_2_TMU_CLK_SRC] = &gcc_usb4_2_tmu_clk_src.clkr,
>  	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
>  	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
> +	[GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr,
> +	[GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC] = &gcc_ufs_phy_rx_symbol_1_clk_src.clkr,
> +	[GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr,
>  };
>  
>  static struct gdsc *gcc_x1e80100_gdscs[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
