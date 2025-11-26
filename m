Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4A4C9D
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764115784; cv=none; b=IS4KGUkzzDav6N4YLuDZm8FFWJBu186rgS7WaMUhHHOWCX36+nMO6tga/Efai5yIMW7GVDDFC60F1BU2Dx69+zLozorfLS7b3RPPc/QsplP6xzfgpuJjicEhpxnzhaYTfQ5ixfI+XRKcDYDoULa91fQVlaTGnambf7uBwQ/P33g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764115784; c=relaxed/simple;
	bh=eaHGJo0YeQHdELTEZkLIMlEFPjkExXCzwZmMTQ6DDNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rn+BZoJNQHgazw+xJqUrvFymvpIETfd9xaME8i2mJWU4kH7ja6pQs253IY9F76lTtQg8xLZxBQT1csIwoQ+1ygRVgDexuqq22I9EJdotm+fTGEU6iWNoZjk4MwRnnjvyO4M1aRlkmPqt5a//eJxzTt/Mdqs0xLYSg5FhVT4M1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/soigBm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBWRngX/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/soigBm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBWRngX/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD7jBg3317309
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+ATSEVV4P+08/zo6XOpCds2
	blOX1FJN+IVhYsTLJEk=; b=j/soigBmdQMNHS/DAD9D56Z/RhLjJb9B1La9FSXI
	NPNkArZrh1eIs8C+I4QWTIDTeV02bSqDZ58BQDDRBdUyRqTa8oWGGdlI8dukJM0w
	CyqVTv2dmxBV2hWgb/UFyBgwliuDQyHGZnOvVld5+PXz/Yc51zsOagn0fxV2qLbV
	ibEbOFrs8ngTnmkXb48J85KpOv1Gy+2TaNuPIuPDV0jg2oX6VTmBs/8Dx2yzf9wX
	3VL769+luAc64S9x6BmEWnJKSNdRp3YSELnyv8M16gYVFqU0w3i1eiHd7WngZAWq
	AFhj2wbIaB/XG3LOKP1gHQOmvuBFKFwvQm2JmQ4sqD6lUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qhpaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:09:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so1727595785a.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764115780; x=1764720580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=;
        b=KBWRngX/cuCQAmAgvxwsSwDiBTCtpHkdNfUXqxm0OsTA9VaSkxRJuEhUkAfxpdm7ta
         Qkqp57DyO1VhSumjVmrFLN18uzXx0H8nwmbk1n3Z6Kl02H+CcMiMwx5LLJkDYHLPwKF8
         7FH1ambf9cluSzyJW6EZi3C6w6rl32V4kh9xkNw+lzJe1dq7pKYM7WHeCISSrJl0LU3B
         8ET2Jw0rn0lBXGn7E6oRd2DMr2dv2D1KtHghJOnFkUT/biDrSswrI76TZUFRhbG0Cc3+
         Pr2Ixes/euZ61Ek4U2MtsvDTSOnsMF9b+z/bW6Nnp7lKjiIL6AQVQeiGo4GItjrHNT8J
         mX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764115780; x=1764720580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=;
        b=Sw60ZoIgjNWKBRwa7dPCvUi0xiY3/g9KUdwKKFophrtSARQv27KKeWQvpxR305gT6h
         smfL+UzJ8Ua27EhEqXqp4+RNp4b948/oIRfmytqqdpBTxSOfmAXvYv8cA4H+J6RVryem
         2FOtdO2Iq7LAtownncOTIb5uY++tDu3SdsYrNspWqhWe9YOa0LVVQSuiJCDOsU2nUo5j
         v5EnMPeTFz6baboLIHJ9QsvzMtd+VeaC/UFe+7ti9fZigxbEcKUPEZJxqTaY8M9iZ2gJ
         Fbs7f+lyQb8PaSRbhpmkBIaGclk6W996+f6cHkZuKxUJNz32zirS+giu+FarMXRpwgRD
         LX9w==
X-Forwarded-Encrypted: i=1; AJvYcCVCiJ6onmtQxX2R0NcRJAX/5MuTCoWMNVllUKRQJxB/s2qdcjZX6bujq+V/XSe1VWVVfS3NiAMqwMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4OJDTs7k+gVvOGPc7krD7wioGTeH6/PGJ4FfkGKjbbny4w8T
	ViPvOvbtVC+q+kk3CK4/T8ReCvRyXI1ZEtrkaHxnNy+4KtjJzyt60dgRIe4xfIU50IoTOBabVBq
	h6863ZdYAOz3UeH1Z+k3LQ5bydK3joXfQQkvltAY30cGlKElD4GDgOy27S4QI1jg=
X-Gm-Gg: ASbGncvFvVvSTdttK6nvs8JVnFHzt5tvbL9jo4CPuhqGlX+XnbTTlROSDayn3Abc0kz
	6iyVCf9pORNeeDRNOpDqhxYM81g5Malz7q/BTBsY8YydfwZQA+HTgUxxFZDsKzheRqEvWE7X43e
	0NXfhHhyiW6tNxDDuOENFbSV7HhEjUTkIdeSmp4/p6s9EgxbM8YwdYdgBAdK2fmE1hDfVCAT8Oq
	iXaQ1/p17j7OKR3BJmmDwGe/0oJhVfJKD42MSayiB4GF26ca/tSsCNCjQGEmiBlXVOZFKtJhTTz
	7sSGYmKYRXNVWrkDqMgN2eW3mUxS5Ni3QnTkrOLujt/JhpDpoAiq7vqgM2lPsAy9Sh6ah5wu9aH
	o8Y6ChbV5Ik91NgjBPyGrGILozK5giPCxYd8Q/sQtuiuHUpWDmzNQYzT3NtWEFmi3DjsNsyXpBp
	kgUjI6ak97KIwJOMaXkIiTKJs=
X-Received: by 2002:a05:620a:f07:b0:8b2:eb79:d380 with SMTP id af79cd13be357-8b33d1b24ffmr2365546885a.5.1764115780537;
        Tue, 25 Nov 2025 16:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqMwCIj9jauJnl/IsvBUByU2zMoHt50S9NDQDNYt4LnWXnAr38CbQEpcue1dMnJM0/WkNb2g==
X-Received: by 2002:a05:620a:f07:b0:8b2:eb79:d380 with SMTP id af79cd13be357-8b33d1b24ffmr2365542385a.5.1764115779961;
        Tue, 25 Nov 2025 16:09:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8d967sm5474329e87.43.2025.11.25.16.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:09:39 -0800 (PST)
Date: Wed, 26 Nov 2025 02:09:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display
 clock controller Kaanapali
Message-ID: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDIwMSBTYWx0ZWRfX01CzEg/VqCkF
 f1xEkfin+VbLOYUEt9R4A+AxffXJCjA/ULW/p/g3RNnc/DodhrHcTqgbVP8oGHQv3aoaH5yHROR
 5y07kH4u+95309M4hetNDxXnOrS0TJNUUIM7DmYd9ZGCJtyqTlkRCUlnAEic7SBi9CPb7ogTlYS
 8A7GrvOgHbXlb0l7Ghc4/2bpgjsQwUDynU6W9vj6XR/PdbE8wXF6gDnU6Xam1YYHXPRMJmuH7PQ
 6Zosh7HqBhWY+7O9YErUB3z3v0b6r/L5318myjwWTrZPldD9OkyIJFFJyj1gOUrNch5T2qvN3MT
 OTZqAqvBN29jhav2bYcC1QpSrhU1+o0C0jEZWH9sDam/62mtv9uYDd3D2p1+WBA5r+cBgy7NX7z
 Hiyp4K53Z2Vd9lccvJv617mvPRce6g==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=69264545 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Z2JA_5PlO6FJ_Fz2AdgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3rV--5l9NGKTBK_GbnlFypHxUmo9d9n8
X-Proofpoint-GUID: 3rV--5l9NGKTBK_GbnlFypHxUmo9d9n8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250201

On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a284ba040b78ba2f7b7c7ead14023c0ec637f841..e293d1a816c2eece0291e9ee707698e97ed75cd8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,16 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_DISPCC
> +	tristate "Kaanapali Display Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_KAANAPALI_GCC
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  Kaanapali devices.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config CLK_X1E80100_CAMCC
>  	tristate "X1E80100 Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 0ac8a9055a43230d848c6a0c1ac118c03c3e18d2..98ec8aeb5d5049855bb65f7371a10fb2418a468f 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
> diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..baae2ec1f72aac04b265fb62433c75e9bd425d4d
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-kaanapali.c
> @@ -0,0 +1,1956 @@
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
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
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
> +
> +#define DISP_CC_MISC_CMD	0xF000
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_AHB_CLK,
> +	DT_SLEEP_CLK,
> +	DT_DP0_PHY_PLL_LINK_CLK,
> +	DT_DP0_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP1_PHY_PLL_LINK_CLK,
> +	DT_DP1_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP2_PHY_PLL_LINK_CLK,
> +	DT_DP2_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP3_PHY_PLL_LINK_CLK,
> +	DT_DP3_PHY_PLL_VCO_DIV_CLK,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DISP_CC_PLL0_OUT_MAIN,
> +	P_DISP_CC_PLL1_OUT_EVEN,
> +	P_DISP_CC_PLL1_OUT_MAIN,
> +	P_DISP_CC_PLL2_OUT_MAIN,
> +	P_DP0_PHY_PLL_LINK_CLK,
> +	P_DP0_PHY_PLL_VCO_DIV_CLK,
> +	P_DP1_PHY_PLL_LINK_CLK,
> +	P_DP1_PHY_PLL_VCO_DIV_CLK,
> +	P_DP2_PHY_PLL_LINK_CLK,
> +	P_DP2_PHY_PLL_VCO_DIV_CLK,
> +	P_DP3_PHY_PLL_LINK_CLK,
> +	P_DP3_PHY_PLL_VCO_DIV_CLK,
> +	P_DSI0_PHY_PLL_OUT_BYTECLK,
> +	P_DSI0_PHY_PLL_OUT_DSICLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> +};
> +
> +static const struct pll_vco pongo_eko_t_vco[] = {
> +	{ 38400000, 153600000, 0 },
> +};
> +
> +static const struct pll_vco taycan_eko_t_vco[] = {
> +	{ 249600000, 2500000000, 0 },
> +};
> +
> +/* 257.142858 MHz Configuration */

This is a bit strange frequency for the boot config.

> +static const struct alpha_pll_config disp_cc_pll0_config = {
> +	.l = 0xd,
> +	.cal_l = 0x48,
> +	.alpha = 0x6492,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000008,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +

-- 
With best wishes
Dmitry
