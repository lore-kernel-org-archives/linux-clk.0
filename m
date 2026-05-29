Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E343D8900
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054458; cv=none; b=KdGPdkiJ5jOOmpW0m0prjmRtwwRPwyGO1QW7dn+VBcNHuo895tEcNcGU2fYtnyd0ofuaPWiDXsUp7W3NnbGR06oiLnAU+VDyZP7PxHbZqJNPnBRlTj4qL7V6Ed4XCWeIcv3s/IN9lFvKq9O7/aYJ0fXzC0x7RzQL34OoBMid1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054458; c=relaxed/simple;
	bh=ZLPBMkFaWQOcS42XIaoCEvFlqGqW9sf/J88rRpBUGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsqYexzZqRVG5gWkZBOIgXXX9+ARAgUn4moyAaFEhsKkXWWZxALxR51qSbTgOyRn3vIZ7exAlm0qqIg67Fw/F1WSYDEuptf8RPG9GPqv6Cb2RaylebksgUfE7984z286lJwfPGvVIpc52RTyVPXLcWl9UNzOFNCWOvu6YGl/8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYLdsyqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTO3dYAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYLdsyqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTO3dYAh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TAbR714193315
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jV+HQUofjwb1asCfK4DqsXWe
	6MEjKMB4yFb1D6Vb1iE=; b=aYLdsyqawUvFj1pFHVi7SIis0Aav3RXebT4Zg4uU
	P0HAOokl7QEkJGFRPjTJXtGw4qaeD+z8xoVEE3kdouoe5CGtHkg+4+oX3uwaNwIs
	YNCyNNamYJixTxNGpunFRucaIjOk1DkFwzp4Ob7XP940tFuuBC751NaMQIvDJ0fN
	xSQnAJui4s92vTVE9eRYZMf4PWvGg+0h6sfc8qvA7NYs8AQJvWLDve/XkHFedgAI
	1aRBSj4AxjhGao/NNdB+g6lDKfEv9ZnsF7UXfPyRaHqQ69oixvz3arNdF2HPKUPf
	who/HHWqNpe0NiNqNYuRkBGmLgPApPWUgc6r7KtcMZ/Zbw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te1pph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:34:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c152655acfso104566137.0
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 04:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054453; x=1780659253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jV+HQUofjwb1asCfK4DqsXWe6MEjKMB4yFb1D6Vb1iE=;
        b=JTO3dYAhRrLITDXGD9EWa6iugunqW4Yov+XsAJXe/PpoDmjmMV6pvjKlStdEr/XZkG
         qvys/s0fRfrOEoPMP/x3kjNJ0BOwt8duWo5ZV48/aXBUrdMndGPKub2liPZ2Hc92LfTc
         eywY/1lamjtANfaNeNWmaJgV5QjhNv8TO2UEuvFKbfmYBa4JLCGETMdq/qgNXH+k9uJl
         5j47pccIuPxU/PXvm7fklfKKMTdEQqaun1RQ+SICVDbHcIcme3YZQbdBYQf6Hv05nr5n
         Alo6It/VJu6TCvNyCl26mYd7Rat/kKH6ZihYVaP9AwNN5KsI8W0RTxRqXWo/EU3NDPOh
         mQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054453; x=1780659253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV+HQUofjwb1asCfK4DqsXWe6MEjKMB4yFb1D6Vb1iE=;
        b=ToJMpOQhaBIDmkHKptx1yJ14kwjnYbTiXPhpaofgGxpVkzPG1Ibd57L0l4w0GmLZPE
         J2APMy3AN3A+mGioklCxhbcd3Eoq0P0Ohx+bxNaNxvhSaByRq31P8O8C5EiYaM6aPa/0
         i6XBnWrvh10s+KBt0jF8eLqK03hnsbRZljGSU6gPT6Re4CIzlMUq4pbyRin9j3NwsGbp
         jP8B3UTKnLAQNCTpwtUbjhgcftLEbE8WOaDeXjOG0sShQsrGj5/LDnfe2TYLq1+ymlH4
         4Z+GXWPtJCvejqYzZQQGhSGFqRD45VGYUwu6KmSGNZ2d3vrOSpisyi+xIhw9/Svht6kO
         lGsg==
X-Forwarded-Encrypted: i=1; AFNElJ8k/OoT6HcgoURqgpHiLylckbPkW+snnu4QP5F7v0eJ0SY81u1ZV1yNdgwbhnoFJ31YnyP7eZvzrvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKvkImxjCinC09xvws8BNKCCIoxBD10gyf8jj/SyD5Tp4JPQ0g
	74U9dn9KIncg6krgztY/o4rhltLgugatgax4OfZHUOmrx9T+07ht7UWh7FOVtzF8X3c4LCwKB22
	V8mTYZKlun/BUbGp2uv9u9KDHoQSO6iNOhzeFcfLYCPnk8jMDqKTGcHmwCi028gkxwvymvL+5Sf
	Kj
X-Gm-Gg: Acq92OF9T4ptOsFB29xzBJfJ2FEQlQMUlPQU36fOgKLGK1mhVq1HtUik/J4BrRWhbuL
	I7GvgYqRyh9wSifmtUBmFzCHrrSkNqJzZceBwAqwaFwmFvSF4scylZDJwF+Swu3MSDs+MZ2XiBd
	39wPRPbAp0oV2oeMcUhi/28NAjbPMe0sSG4b3XzukR8xQsBAe3pGfusLht5f5cNdeje9BWquDmW
	e7utYrY4csu3xZ29zMWI4J9dh5BD928FrVS5GCofdnHHQfbTceGezF1SMEug71JYj0wLuhN2Ach
	Ixr+m9BhFHukZRigEqDHnaiuDSOp4fN30GynHGTMj3mE85Ct9waeaFn1H1TDi8Xk/o75IYMreIu
	cWVMsbDBLJpOP8dYH/tUbOY/JWrzzgajdNJxQQr/4viydMekTm5UsB5Ahx7th9rsbR8WIFKl2I9
	bTEyXj7m9b8JFht2aow8H4VANiu08ZqU3uH5X+Q6tLIu/qSQ==
X-Received: by 2002:a05:6102:809d:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-6bf479340dfmr655240137.23.1780054453428;
        Fri, 29 May 2026 04:34:13 -0700 (PDT)
X-Received: by 2002:a05:6102:809d:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-6bf479340dfmr655228137.23.1780054453001;
        Fri, 29 May 2026 04:34:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659e28e71sm1766071fa.33.2026.05.29.04.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:34:12 -0700 (PDT)
Date: Fri, 29 May 2026 14:34:09 +0300
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
Message-ID: <dduromih2zmmmqocijyxevabmoioly7lujcvhwucepkz2fjqsu@pogjkd7ugctv>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
 <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
 <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xbBGqVUNn2V73zgyKyX6Xwiaa8uR5rbk
X-Proofpoint-GUID: xbBGqVUNn2V73zgyKyX6Xwiaa8uR5rbk
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a1979b6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=sVYnoZhgtxLjuife8BcA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNSBTYWx0ZWRfX1BXfnX8C4eqs
 +gPfTGYZO8N/ym9cb1aTVnWoqRKf/enw0cVjyOz7zJvaWopcHcQGejJiKRdbg7nlWCJ+NLZQcDU
 mXdsnb4WsRIIHW1CgYBbbN/m2vmVMqm9/FiplUuZ7g5EV/c4NuPQNq5PY3RNRu8zKe+Bjp6yjs4
 9BUcR4V5ARjAqlIwaI3INN2dTSVPrpcUr3mr2nIu+MP4kKA7HHxzLpAviOW2pFla3mJet7UtJ7i
 th/xgImAGmAajamceGYGrsRo498/k+GIf6l+oRUD4TGhndO5K1gkIbTFj3qY3i3lm6tbFliXY7i
 K23H6Dw71nTpjko0VARHDd/bJ/ZJPTNhJfVCZg4zAZB3rdYfjQfsUiuEp20fT3lkypUdrE9PjCd
 o6SH/ldmB7XZVxwelwclg2YYNY2KcS2H4W4UMoGZoTi7GI6bZUOOHKopHM1OXLg0jXM81ei8UWl
 jEx0tLCMlTg4MjPQAlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290115

On Fri, May 29, 2026 at 02:53:45PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 07:12 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
> > > The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> > > but has minor differences. Update the parent data of mdss ahb/mdp clocks
> > > accordingly to the hardware clock plan and correct the GDSC *_wait_val and
> > > flags which are applicable for both QCM2290 and Shikra SoC, and add the
> > > support for DSI1 PHY source.
> > > 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
> > >   1 file changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> > > index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
> > > --- a/drivers/clk/qcom/dispcc-qcm2290.c
> > > +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> > > @@ -2,6 +2,7 @@
> > >   /*
> > >    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > >    * Copyright (c) 2021, Linaro Ltd.
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >    */
> > >   #include <linux/clk-provider.h>
> > > @@ -32,6 +33,8 @@ enum {
> > >   	P_GPLL0_OUT_DIV,
> > >   	P_GPLL0_OUT_MAIN,
> > >   	P_SLEEP_CLK,
> > > +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> > > +	P_DSI1_PHY_PLL_OUT_DSICLK,
> > >   };
> > >   static const struct pll_vco spark_vco[] = {
> > > @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
> > >   static const struct parent_map disp_cc_parent_map_2[] = {
> > >   	{ P_BI_TCXO_AO, 0 },
> > > -	{ P_GPLL0_OUT_DIV, 4 },
> > > +	{ P_GPLL0_OUT_MAIN, 4 },
> > 
> > Why?
> > 
> > >   };
> > >   static const struct clk_parent_data disp_cc_parent_data_2[] = {
> > > @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
> > >   static const struct clk_parent_data disp_cc_parent_data_3[] = {
> > >   	{ .fw_name = "bi_tcxo" },
> > >   	{ .hw = &disp_cc_pll0.clkr.hw },
> > > -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
> > > +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
> > 
> > Do you realize that this is an undocumented ABI chance?
> > 
> > >   };
> > >   static const struct parent_map disp_cc_parent_map_4[] = {
> > >   	{ P_BI_TCXO, 0 },
> > >   	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> > > +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
> > >   };
> > >   static const struct clk_parent_data disp_cc_parent_data_4[] = {
> > >   	{ .fw_name = "bi_tcxo" },
> > >   	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
> > > +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
> > >   };
> > >   static const struct parent_map disp_cc_parent_map_5[] = {
> > > @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
> > >   static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
> > >   	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
> > > -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
> > > -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
> > > +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> > > +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> > 
> > Why? It's not mentioned in the commit message.
> > 
> 
> As per the HW clock plan, the ahb(parent_*_2)/mdp(parent_*_3) clock RCG
> parent must be GPLL0_OUT_MAIN (gcc_disp_gpll0_div_clk_src). Updated them
> accordingly and mentioned the same in the commit text below:
> 
> "Update the parent data of mdss ahb/mdp clocks accordingly to the hardware
> clock plan"
> 
> Will move these to indices approach, and add in a separate commit as you
> mentioned in the other patch comment.


Why are you trying to move to indices?

> > >   	{ }
> > >   };
> > > @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
> > >   static struct gdsc mdss_gdsc = {
> > >   	.gdscr = 0x3000,
> > > +	.en_rest_wait_val = 0x2,
> > > +	.en_few_wait_val = 0x2,
> > > +	.clk_dis_wait_val = 0xf,
> > >   	.pd = {
> > >   		.name = "mdss_gdsc",
> > >   	},
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > > -	.flags = HW_CTRL,
> > > +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> > 
> > And this also needs explanation.
> > 
> 
> Sure, will add these GDSC fixes in separate commit in next series.

With the proper justification, please.

> 
> Thanks,
> Imran
> 
> > >   };
> > 
> 

-- 
With best wishes
Dmitry
