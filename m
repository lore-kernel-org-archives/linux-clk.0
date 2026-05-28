Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C298A3EFFBE
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975770; cv=none; b=cUyVeBZ6KyeXqIyo8Nih5Vy8B6QjZVi2aur/nLUy3ENmLOlQ7JfYY1ElXQV/NWQJ2Dtw9EaE/FBjNdxD3kag3PxUfH9Fmn7iHHRX7oEjmC46XHp7+FPgXkYjq4O/c+VAn5LF8PY/v5apjftIWTIg3OJfRnHI4s7y8UiBMnqTayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975770; c=relaxed/simple;
	bh=X1yvQOHHcKIqW+0JMUmRIDNrnij+vlvJkT6jzIaN93U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuiKUf3FlvjGfneLIyl0BxrnsNii5DrA87hPYQ5n7s7XEHHHfMWKjvF+Z24GqxOP5djfLjHCOaDHW/RRrhN3SBnHADr44Gtt3Af0T2YAjDo2NPAdIQTXOyaMqx4Nr0y/Mao+Q1+Sy9Jm2QmR9yv7otfURx6iRCv1NCyWlJgdjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgEcujT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVd4yQ9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgEcujT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVd4yQ9U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUh73203255
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uw7ADZQk/DeDxbVXK+KsE/yp
	H8Hb1Yi8tUS3qSN/21s=; b=pgEcujT9E/TW2UD1bidW6DPcQuGBi9hU/OTQiNjV
	c2higF5Or3wquesgxePN80VUrGE1TKAaCbFCDuBWO0LGgSOuayJmPBh/Yc0QBp2i
	BYDvjBntKGVU446Ddwxk56f+6sQTxkB4dH0SodVcp3Xym5ZzLql6A3hsl4gLNd68
	ZZ9PQSfCifrFEoy9JVsssM0cjf6OM2RJfbnYX5xs+llJZAuhFAJZJ+Cn3UNO73h2
	Mz7Y3hGe/vLgjsJL/FwnNv9bLz4x9NCAnnCH5FH5jzrHzzbRqPSDvvICHIjBbHQo
	Xv0+enoCcYmG/1NH37LAUhoOxKucdTDggV2t4kFtm+px3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjxgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:42:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5165d10e036so226622701cf.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975767; x=1780580567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw7ADZQk/DeDxbVXK+KsE/ypH8Hb1Yi8tUS3qSN/21s=;
        b=QVd4yQ9U0mPIaRJq5PQsaio/tcwlTvlpVDHa5L8DMefakMeVcXPiZsuP1JYyLVTcDE
         WUdAyj0wv3YQU+n66fsccF6c0POZrsjKsRrcOrsXU5LpVoHmQtmkVcnkeuZOnDGOXO3/
         pj1Hq/V4iyNPFg8kW+CELrU66SqpiiRYQJC4Kx6VaU71wnLRFZ5ZXRsaav9qnqs0Qha5
         4mE1ooVOFidOVG8++MqE4cZkTUt01ze1OH/TFUwn9vHsE9DTTpxd0ojO4STaUmmYtNCB
         Pru0eW6aevv6hx18bDXmv1XtWB/SXoxZQPeI4pzaGWFxvPW6uMiDAHI7ehm8n2N0/De3
         XJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975767; x=1780580567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw7ADZQk/DeDxbVXK+KsE/ypH8Hb1Yi8tUS3qSN/21s=;
        b=Y2pMV7ouLZN3B03d9B542wr1c2vKI8qZ4Ul72ZhtXXOR2Btvc2gSDDc67UaFy6IVFC
         O1yigL1uf9vhmVP8He+7l3mQbLSdy8kx6wrjJhhk/HfkDl7/cLfHmuCXlwc4ZW2v/8v0
         TpkWe2BIFdvtlUdWTBu0EaT0sS81Caz50hbv8wKBH0svvkC7gMhCVw8yrZKfJBE22u+t
         HSQxWpY3zqREksVAaoDtO7EUf9eXvJlVFn/V53verGlx1fD+J63FIyoTbxmTKPJQTYzL
         SGvVkqQxeA+66FLXiD6ZCkbP8J7PNRDgiH8iEgrqrN2Eav5r4iktGrG52ZFwZJhQObn/
         7C2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+9/pKZeCAZtmwhjSPVcZl9bDPezAwtNr6hnmEPVcxNHWKsInIbcVMKhHYOgdjQ93syqxtnKxleBgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6B1HAmutb3Xfv6n9BifQLV9su225dFql3xSfSP2oNVwuNRAI
	K0tG9QejMoDLjWiKXuoRT4RIT6k1Oh97XbTY0+f/F8muEfrcYy/m+BTTu4Fk1GagqX6WjiTdDGp
	xiLezvS/vMhuCbLut+QxtSRDqCVF6dFpEw6LSpnFhFpglP+XRlanikDHQrnFmeFc=
X-Gm-Gg: Acq92OGdeO7+hUT9sN1kWYVE9jTL3dOyZUZ7uEJsOWD2qEhQeL/9xRyFqoRCKbcaMC7
	s10cBX9uGZz+b9f/0HcbQtZR/kKmnnJ62z1lMOWtdN0WLNL2nC/itsufAAEDXbvz3caS1t4I+dY
	eeNj39klMwObtDWmqx6Qwq2YWJdBLh41ffCdEUzzzSilZfXd/+Jdmye2jYIZG6ll2+ZWhoPduAt
	SIAD3hKvkOXd5k7SKYx3I9VyFrsslXB5NOL5q2NANyYPEyFm1Io3T3PUGqmtMvOxqlDoqyTsN8t
	IzRYacf/64OCqtkLudN5KQrdPgmYE4DQyYz67qJ+Yhuip/mroc2MdEammahVAdFzSG9A64gALLk
	N+7e5S2R/QQIOcw3i9WktUSJvc2Sks7zA/aFJRhhbXKlUCRgDaUpcKvotY8E8lHuvlO2cH6Iu0D
	g6m087IC6bcOC4Ya9H3WLH4PNwl0F7cMiPrGShWXBPUUx5qA==
X-Received: by 2002:ac8:594d:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-516e0622067mr306191671cf.51.1779975766891;
        Thu, 28 May 2026 06:42:46 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-516e0622067mr306191291cf.51.1779975766442;
        Thu, 28 May 2026 06:42:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d967sm1962643e87.83.2026.05.28.06.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:42:45 -0700 (PDT)
Date: Thu, 28 May 2026 16:42:43 +0300
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
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
Message-ID: <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX1exqDxTiYDWq
 Jb0lVcTXWUspTdMYHiB4WQAKI8neHGjPQmUk6kZz0Evqko1hhHr0cyNbB5gLBqEGchfcbjCSDXc
 3wN5ui5OUN78bINujljg3J39g9GK+eI82eKuON/AiHbyH737IxUEmbJBb8VsYpX1u4lVNtnKAP0
 2Axo6+f/uLyYSyPY1aQmK8aOv3cNAaBVInQrU7Mxe9TInlib+zZ8RRifYswSH7Eed28IVEMafBi
 2qaIU9gm/1geQcYvgt3dBpcXbwadl7URxE56G2cEfyIuBKSFoS8rukD+KT6HETRAafgrvKA/oHV
 Y5zWyPgZy22WCNpJk6Eqm0fJFaN6IZpMUt34pk3HvW+CqxfBESn4D7htoSc11GZkKwBX6OPMQU4
 gPvx3lAQqNjcZ30Ln4oU27z2l5hTePiXF5P0CS4QT+QjCezLYVquQvROp41d7WqA80I8vyTHDua
 YkHK3sF11qspK8Mfz+A==
X-Proofpoint-ORIG-GUID: B0FR8CsLpLGpdEoKrJaFddl9PKqhAuHc
X-Proofpoint-GUID: B0FR8CsLpLGpdEoKrJaFddl9PKqhAuHc
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a184657 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wzTQxFFrBE7TaT9E-pwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138

On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> but has minor differences. Update the parent data of mdss ahb/mdp clocks
> accordingly to the hardware clock plan and correct the GDSC *_wait_val and
> flags which are applicable for both QCM2290 and Shikra SoC, and add the
> support for DSI1 PHY source.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021, Linaro Ltd.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #include <linux/clk-provider.h>
> @@ -32,6 +33,8 @@ enum {
>  	P_GPLL0_OUT_DIV,
>  	P_GPLL0_OUT_MAIN,
>  	P_SLEEP_CLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
>  };
>  
>  static const struct pll_vco spark_vco[] = {
> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
>  
>  static const struct parent_map disp_cc_parent_map_2[] = {
>  	{ P_BI_TCXO_AO, 0 },
> -	{ P_GPLL0_OUT_DIV, 4 },
> +	{ P_GPLL0_OUT_MAIN, 4 },

Why?

>  };
>  
>  static const struct clk_parent_data disp_cc_parent_data_2[] = {
> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>  static const struct clk_parent_data disp_cc_parent_data_3[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .hw = &disp_cc_pll0.clkr.hw },
> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
> +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },

Do you realize that this is an undocumented ABI chance?

>  };
>  
>  static const struct parent_map disp_cc_parent_map_4[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>  };
>  
>  static const struct clk_parent_data disp_cc_parent_data_4[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
> +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
>  };
>  
>  static const struct parent_map disp_cc_parent_map_5[] = {
> @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>  
>  static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>  	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
> -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
> -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
> +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),

Why? It's not mentioned in the commit message.

>  	{ }
>  };
>  
> @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x3000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

And this also needs explanation. 

>  };

-- 
With best wishes
Dmitry
