Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CC19C553
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191686; cv=none; b=CSPDwdXd7z9GrkQtSB1B4TkgMqZaST+PNyr6s6QqRd/48pXxBk99wJ5Lkd6FBppDqfVf/BD1EQkGafo2kAVX0JSN406NQ88GxgB8oymbyz1zSrgGg/6Lb2a8SLEFiIbJ366OQjSIUDltk6Z3UK3tEx13MX3X6Ls/1u8fT47+onQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191686; c=relaxed/simple;
	bh=DVbcCTqrN5mviTuOwEBmQs3jx74WK5aZB49bxa5GbnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWlUWMzP4d3iLG9HkoOJvMMHIZJWSaA3ye+FXMtmqj5D2kbiL1hUf5KR9pG3hm+egiu4qqnstHt09RnXgvg0vkWhjSecKiNbd+ogmsfACEovV0uBeBEMMnZFhB2gL2Z8AGbP2qZWTauuAcCUdwQj/DBkyRBRkZRPK+bsDoqOmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdhLUsI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwtQw5en; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdhLUsI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwtQw5en"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NEk3eE1267996
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xdBWn8gOk8MLTtjna9Emtq++
	iF66iD1yKzPpY0SOEOk=; b=OdhLUsI92tF7M6NGK/E0S0wS7JDcspQ47Sn7RF54
	o7nd6eDOOky/3LH2LJ2YMq5+kx2knVT+L0yrXhCbF7uDdaNgfyu4vsUuAL7ePgga
	yAXSczJugXB+sSRimaRf5vxRX8V81LRp0UC7tChmgPL7ICDbiP/XSJfzaa93q1Kh
	3kkZClyDvBUIADNZgb7qo+dFcGWTMtMJrHSq+menctbd/GIobYSCH3J/akLvWxnc
	FB7QT2NN+n1sRoO7ucbyBN71+RSc+4WfKy5Adtm7ehuPDdSYoPARmsTAqhQzggAA
	1Jc0MOP8+js/8Aue/UcIEZ4vuhzFzeVZlUtWpLEE+Z3+6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv4v9a3uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 18:08:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so755516885a.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 10:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769191683; x=1769796483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdBWn8gOk8MLTtjna9Emtq++iF66iD1yKzPpY0SOEOk=;
        b=LwtQw5enKM6xGzcdAcQA0VBvS9t0FYDd0aj0ymVlh5BsuzRJAGiTVQcXSEhyZaDnIv
         tkneWMKrkw2I5h/DgLFnMvmukCrdGqeB27EscNWQNqWgiMsaT7/3GzIUfxzYtjHgBSIt
         qj++IvjdJ1FsOh00UOP2n2fzq2hLyKzyrMJTuELvjZjKmtQTz8vas5mQJ4EzJBzQmWCV
         l0LuWetzuXX4QGvqSBjoYjgNdFg6jh7UVbhHuIFVfd8bIaRlAOeUmosCw2ZWZsxatobm
         rKMTH4avCiP3QBnhzsYIiStTFVEorIQc9hs4ZTJw2E5c3Dvm/dle8mbmFeYBoarKhKox
         xQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191683; x=1769796483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdBWn8gOk8MLTtjna9Emtq++iF66iD1yKzPpY0SOEOk=;
        b=hVHYcuURDjiO9EDKfKQwd6bOp3d02irRrmIJC7JBEsnTfE2gcBVR+JgyilOKVQnzOx
         pHwRtJnRPBpyJL7PuWpl6P/EYga+kMwvaLG+QFau13Xxr8lgfJ48L84hyY4dNEW4ie1p
         UHigX35+J4rMXXKdU/j3sVya4RUOByHB6Lf3h3JpPK6SZu38191BLaxOyvqN1cKIc3qT
         c1F37F4o/45LgZjzr/ZReOswlawMIvajHyeWA/peCiIrHle+0cMwIv8RZeUd/MCWvK34
         WiECzLOvSeXR+tFJxOAwThf69j7bimaPanG+pff8XkVpEJqb5s/TC7K1uVJd9q8s3IUE
         NWwg==
X-Forwarded-Encrypted: i=1; AJvYcCV9YsWr0szG8Lc5/cCgyJQPfrI9s8hQmmBWild4Oy/56dviXZK46xNbLs+0Ds+TPdLW7ti5LAEN0Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFY/GZTRs6RY+75WTFWxminWV2JGXeZ95m1qAPlwyzwPriy2V
	le+RvQcDNEktUNexhEg4FBUjcnKcQ15//JcKeIod2fUylFytxaT+g2e02fzhyOBBkPB9du2qERN
	uj3mC6QGCxSceM3RO5LRL/4hY8rkaBhE41In3jqKmVvlUJVwnPAkc2PaMgo/R40A=
X-Gm-Gg: AZuq6aLDTFdaEbm1JS+SUzgRWMwDnwchgXbQhv/gvEN64hP5JYdJZWfsEQoE1RjPxx4
	YxFS6uzqWPweKuN5lXnDKLuTys63N/HF+HwoGjPGjp5wpLgNIDG93J/lYcSYXKeCee646Bz9aqk
	8R+qCG9KpNMN0p3VY/zIWf3s5zMLITmgu8u0Ocf0h6DAKvLM20zGte+gmqiFINwyXuYBKTDkvps
	s7/+uayMD5w47CMt/3TTKCN+20LRVny9ucZiusg3yLyoVcdBFpJkPkncEicjrzLf5Wk4XmOlIy5
	U+1WdMejChxeN6jjfPh/4rI9PWooY171lI1vlc9uyNr9iV3w8lIWxWW7qWTNnl1f77au211Zl7/
	8UFDT0XFjy+Q+jeQ6bngIC7vTE2gGb+HIuMVZ0BMEwsPuGiUtcP2SLPHRDNfMmAJe4sMDcpNO2Q
	5NnBsSrnkYPBCjUVdeyiipC9I=
X-Received: by 2002:a05:620a:254f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8c6e2e3802bmr457584185a.72.1769191683464;
        Fri, 23 Jan 2026 10:08:03 -0800 (PST)
X-Received: by 2002:a05:620a:254f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8c6e2e3802bmr457578685a.72.1769191682907;
        Fri, 23 Jan 2026 10:08:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed47sm7305161fa.6.2026.01.23.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:08:02 -0800 (PST)
Date: Fri, 23 Jan 2026 20:08:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add base clock controllers for Eliza SoC
Message-ID: <rursscx7jihmvuf2piqqjsw4hebykybpplunreqrczivofo7ox@jvlyofgdryuk>
References: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
 <20260123-eliza-clocks-v1-4-664f1931f8c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-eliza-clocks-v1-4-664f1931f8c7@oss.qualcomm.com>
X-Proofpoint-GUID: iBYKIfA1IREY52a4U9X6mE13RDCyIZOo
X-Proofpoint-ORIG-GUID: iBYKIfA1IREY52a4U9X6mE13RDCyIZOo
X-Authority-Analysis: v=2.4 cv=H7TWAuYi c=1 sm=1 tr=0 ts=6973b904 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=94wPuWfEfd9XG2iD1eUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNyBTYWx0ZWRfX1fEjqGRBqYZY
 pWMKSq3brWZssvEXoPwlX1bbwlCNLEHarqaCFfBzPh3fRvcgEmClD1FzpMPsa9QPbZ362x3MflC
 LpWzL7kHG0XrAOccU3TT4U48eZO5+Lu9wAQYuVau4SyddbfKZcRHCLhIekuBCivnnMZd1QMQDuR
 L47gOUKCGtbT/2Tv1YNbm6T+5Tz3pzJA176jG/22Dv6oxsPLNT3FtX31+IWsaTaf07Mv4bs67RD
 1W920H/jjcslARGagRFRs1OPe96whXuXr/AAqm6ZPjSGrTlXDfgggFbJY1tj+uUri9m4eYhrqEJ
 eqajad9U36Re+awSzyjCVVBH3QOAffTLr6eylXNodIb9vZxI0BavpAH3tvWiXIFyffX0JmGwC+r
 Bv6RaWcr31WlGyh7PM6spyfiVVULKSUSVLPlJheIG25fFbwPkZlGboJ1jK/rPo1uaCUGzOWXTSt
 yTyIj117kKKkK6dGUJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230137

On Fri, Jan 23, 2026 at 03:37:16PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for the Global, RPMh and TCSR clock controllers for the Eliza
> SoC. These are the clock controllers that are non-multimedia specific and
> are needed in order to be able to boot to shell, with rootfs on UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   17 +
>  drivers/clk/qcom/Makefile       |    2 +
>  drivers/clk/qcom/clk-rpmh.c     |   20 +
>  drivers/clk/qcom/gcc-eliza.c    | 3160 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/tcsrcc-eliza.c |  131 ++
>  5 files changed, 3330 insertions(+)

This is something new, having all three drivers in one email.


> diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
> new file mode 100644
> index 000000000000..9b53536f924d
> --- /dev/null
> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"

Are all these headers necessary?

> +
> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> +	.halt_reg = 0x0,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_pcie_0_clkref_en",
> +			.ops = &clk_branch2_ops,

What happened to parents of these clocks?

> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_ufs_clkref_en = {
> +	.halt_reg = 0x8,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_ufs_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_usb2_clkref_en = {
> +	.halt_reg = 0x4,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_usb2_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_usb3_clkref_en = {
> +	.halt_reg = 0x10,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x10,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_usb3_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
> +	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
> +	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
> +	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
> +	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
> +};
> +
> +static const struct regmap_config tcsr_cc_eliza_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x1c,
> +	.fast_io = true,
> +};
> +
> +static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
> +	.config = &tcsr_cc_eliza_regmap_config,
> +	.clks = tcsr_cc_eliza_clocks,
> +	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
> +};
> +
> +static const struct of_device_id tcsr_cc_eliza_match_table[] = {
> +	{ .compatible = "qcom,eliza-tcsr" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
> +
> +static int tcsr_cc_eliza_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
> +}
> +
> +static struct platform_driver tcsr_cc_eliza_driver = {
> +	.probe = tcsr_cc_eliza_probe,
> +	.driver = {
> +		.name = "tcsr_cc-eliza",
> +		.of_match_table = tcsr_cc_eliza_match_table,
> +	},
> +};
> +
> +static int __init tcsr_cc_eliza_init(void)
> +{
> +	return platform_driver_register(&tcsr_cc_eliza_driver);
> +}
> +subsys_initcall(tcsr_cc_eliza_init);
> +
> +static void __exit tcsr_cc_eliza_exit(void)
> +{
> +	platform_driver_unregister(&tcsr_cc_eliza_driver);
> +}
> +module_exit(tcsr_cc_eliza_exit);
> +
> +MODULE_DESCRIPTION("QTI TCSR_CC ELIZA Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
