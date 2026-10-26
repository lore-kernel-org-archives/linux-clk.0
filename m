Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014752;
	b=szvlAAcmGYLTZlBaUbJPl5hsa0YmaYoAolL9uwV/BmP87rzzmGM3Gpj84e16IBXb52/o
	 GnG6A6qhDliyUDq7R6J0WxflfYY6Eh7gpMmIFCOiQNLvWo9dK2rpwyHHYzI+l1DB2nqSM
	 i97uGR0UfzVr8/YMi8xz0sngjTMp12ST1vRcb+k9l9YEDW9L6rNUL/iW+aEhGw8D4SYGt
	 1VkndnMckDxoO3EPLQ80ky7qGGQedfzrUtgqYCxJ0X42jB9i2JgRvLmy4Bb94XcDbXc/c
	 cERplR73g/DYg6SukptKEMyA9/gUC3byNWblWD3gk/0NZ//gjRH49SOpOvKGo2ZXJ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sEGl1kr+LOTY/uOhl2cUp1LHQGHo4hphbGOxURpaZTA=;
	b=RNylkPjnQofvo7/rRSEMi0HUrwLlKDxeeoTQLNdDC+mw4oKvwstnT/nWmLc9RxwPn5Vx
	 6p22FrqZxWzcLb8d+3GUOxAjGKOGudU2cMsogtpdaJd29g4plJ7twJf0/8upV0E1coKD7
	 gaV5ML2+PrXfjggC7F1DcVLh7sv9aYsbQtHitHtPW7jkLfR4J3vaW8wbnrj2q80SKvBuc
	 h12losE1nICjTdnYO1mjWxZU9QXFYgCI10xgsSeeqCHVbEqozPA9w/0q6FRdwSS9Nevxn
	 urwFKXRpvM+bfjAMfxxcsRaAaOnQFqTBERGBf4xMFKeWRLKR3obXm1CXNXmRCwC3duw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYb4Vcxa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B6tbGlJp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F680606A322
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F680606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYb4Vcxa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B6tbGlJp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtDfw3633582
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEGl1kr+LOTY/uOhl2cUp1LHQGHo4hphbGOxURpaZTA=; b=RYb4VcxaqewmSLNy
	cYZOoj+TwMX51j6QBv4ruA1Typ7IXD+gaLFMxLS4ENXe9QJNePkhp8PtNPsuU1mu
	Qh/1orrasEGaWQvmvuzwWXDfILRUNVFm8AP867ObVg07u7ItHav3WNV1MAi8N9Gw
	0Dpk70TEjnLUS9M6q1ZENb9QjksyyYevhKsGBE/WChDMXogw+03SBhQbWz6n6TaY
	p8JB5yTfPHxWjK96JZQafyZSwIOrTlMTffDVmwdJFBzhFJLQA9Yc+ZXLBihO/KiW
	1qmkKOOEwoCDUCi6EiFflpPWjh5XpRePl1jOA5jURXWg/rZmVqjw0UMGuszJBnK+
	OImRng==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0au2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:39:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so2057277b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014749; x=1793619549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEGl1kr+LOTY/uOhl2cUp1LHQGHo4hphbGOxURpaZTA=;
        b=B6tbGlJptpJN7jGNGSc870hsSNvNNULN3rwWzgjhkbJSOk37hbvkdDwXOTg4tMrVXQ
         fpCeqOafCHwOm8Vt1oulow7f9M2c2Dl4w7eVb4PTZTpAGjY5y2fh9YQXvYBcuUrBThQ2
         DL1OsXvc0+RDJoEfvLVwFMR3VBkLGJHyXDpI3SsrxYlDuZDbdNQSQDgUyWBKuh379ZmL
         DqK8uCQqiyb0p1JxIpXGDQU+NLGzVxE46naGLSoktH1O302qE2RNh+Di9nH8VfgwICs9
         J+xSXy3nYdICPsXpJeQ4RrhUnFh1Sme1q4srJ67vFVPH8f+upndMxFuWP/lt/XmCMNxC
         WJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014749; x=1793619549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEGl1kr+LOTY/uOhl2cUp1LHQGHo4hphbGOxURpaZTA=;
        b=kvM9f2D/c+M/TAv50d/ZLKDYjfXzZ84tcOk2OPgHbLktSg/llaVlOPB8bBIFEWMymp
         +Cogw6ESrBZltCn9xPJLmy3wJlo6EuS4qYwSeVo5os4X5M3M0woRqqn0MOfXD4SRzCBE
         6iMl0wScc4n5Qozk6IX4XJZW/uRnHEXO3vyOYKZVc2AALWgSq5Kl/vNnCHcXQI84W7PE
         FgSYp7aNCXX7F/BQJhqBJhEd2FIw9IAxDrGyTcGPud7mOG4PZPsG65/hLSmcSCqSRkte
         siTsDncJMfqBT7hQNTE1488ieF6EJ9UfSzebCbmlpyrFLNMZXWmLWbSMwIkBBjWxI2QF
         yhVw==
X-Forwarded-Encrypted: i=1; AKwUvBy6CtcqZITVJKs1i0u0WhQNZaHCJ3/YGj9VfbiptaLBTJHqVN/SWOZ5lmrWNJmgLIUDgeUtNM7ou/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH7ORQXoH29dfUWS+ddRkJ1gbHapCeTWTgVSH9A4SeJTa5DfoZ
	DijIWF2euPuBOezHUvtm1aCaBqxXzk0FYFXH6+VESpr06bdRsmJyt7xkx1p01qwERhNBN8Nf0rw
	8ksDLIp0WC+BcRuREDXN9VwUdO9Oy06fWRjO266kS0U/wlYaowEDeZZyndA0UvmU=
X-Gm-Gg: AYBFou1lYnrr0Ravj76sq9vjLOSg6CcaZy9d3dpIGAjHVYEnToaB+RIT51NzKE1btG9
	Sm8YmpWtX3GklaynRkrtYAmSgLoz2Agc6PFh5IdeJvDHElfgrbbhG6YR8ODShQ5OHVBGcSN3Ab2
	W2U1IPw/TwcFbNTTZPPCpmrBPZKB6uHQ1/Xq2EUjh4k7AEN2qyxJ5RC0Pytmd6DOLakxJ4ZhxO+
	XtqFxvDhvZjl5n7IoDBUchrCvrx3X/TODISNEiHyKv/c32+ImWlqMnK5E6TI1r0uT9pJaPV0AFL
	G8FuHtdd4TT2eZwOEOIJuINoxychlfVFulVjTPb8Oj/vwrPre+rNxEAHX4elMM+3HUG7J1+BX1u
	Y+AOY/mfIjjcAaBQ1CojqbdS07yU=
X-Received: by 2002:a05:6a00:400d:b0:8a0:70d8:a2ee with SMTP id d2e1a72fcca58-8a3681eec9cmr4984824b3a.60.1793014748990;
        Mon, 26 Oct 2026 04:39:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:400d:b0:8a0:70d8:a2ee with SMTP id d2e1a72fcca58-8a3681eec9cmr4984787b3a.60.1793014748253;
        Mon, 26 Oct 2026 04:39:08 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb29f9fsm1174233b3a.38.2026.10.26.04.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:39:07 -0700 (PDT)
Message-ID: <d617ada4-52a0-4e04-aff8-cb3a0165b63a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:09:01 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add SM7250 display clock controller driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
 <20261023-dispcc-sm7250-v1-2-07bdefb99801@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261023-dispcc-sm7250-v1-2-07bdefb99801@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX7sBReupgJbru
 lIVHVZX2C/NmM3/ljMKqrI4pktS2VkHMmYU1WVBaIquvP3FsrmKv3KGZ2piPqABz2xsT2YDHm/N
 KOG9erMfo751ESS8+w7qPZ6PZdhO/DE=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf3bde cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7ibcVnAUAAAA:8 a=OuZLqq7tAAAA:8 a=W508_0N85UxcitKx69QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=HywIFdX19-EX8Ph82vJO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: TR7UBrJGZxL-AlRB6NAwTN2OtkjyrwJc
X-Proofpoint-ORIG-GUID: TR7UBrJGZxL-AlRB6NAwTN2OtkjyrwJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX3StQoIAhsyCF
 KL+bSiknAss+aqwSkTiLnxLl7v1NlrsYxNXuKdyqiv1j5FitwxHM1vO0SYQRAlYxau13SCQZCJw
 GRhj6o2dAu50hzeXF/hsDqIqCCHdiyxUzliAgcl5T0hyfMNkb1XDq/53jmmVhFEwwm6BqG5FpK+
 z9HBdZLqCza9A6M1hEgJr5ONEeOdJfTuXbgP67jwMuj6BIU32Jqk4SgPTWrI0Ib9icEfMW/TzfD
 WOAFQZRXZ+V+wSa1F1ZXTTIPUnJ56xkZ7I7PnSfw0UM3f5RbMdRKlZPObGtEg/P5M3w0pugWJVZ
 3TnWj2SsBkSm2Lm/Ryrg/qaiXTmULSWNZmHXqnw+Vakoft/pYaZ0mjjEbmA6sGB3qUcjHJoIMvo
 bjPPLN7nHuPdcZxfJN9W46ghBxCLfg1HEsgUk75/ujkWRZ+xzkXvfdd0maRTSl83sPkLsOoCKQw
 hC2wrib+5/pe6BvGX6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260046



On 10/23/2026 3:48 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the display clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the MDSS clocks, the MDSS
> GDSC and the core reset. The register layout is the same as on SM7150,
> which this driver is derived from; the differences are the Lucid PLL, whose
> settings come from the downstream driver of the platform, and the AHB, MDP
> and rotator clocks, which take GPLL0 from the GCC as a parent.
> 
> Tested on a OnePlus Nord: the controller probes and the MDSS clocks and
> power domain drive the DSI panel.
> 
> Assisted-by: Claude
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig         |   11 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/dispcc-sm7250.c | 1009 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1021 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 27d0ab24d..503b6aa12 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1609,6 +1609,17 @@ config SM_DISPCC_7150
>  	  Say Y if you want to support display devices and functionality such as
>  	  splash screen.
>  
> +config SM_DISPCC_7250
> +	tristate "SM7250 Display Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	depends on SM_GCC_7250
select GCC driver> +	default m if ARCH_QCOM
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  SM7250 devices.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config SM_DISPCC_8250
>  	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6affb5073..995be8e92 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -181,6 +181,7 @@ obj-$(CONFIG_SM_DISPCC_6125) += dispcc-sm6125.o
>  obj-$(CONFIG_SM_DISPCC_6350) += dispcc-sm6350.o
>  obj-$(CONFIG_SM_DISPCC_6375) += dispcc-sm6375.o
>  obj-$(CONFIG_SM_DISPCC_7150) += dispcc-sm7150.o
> +obj-$(CONFIG_SM_DISPCC_7250) += dispcc-sm7250.o
>  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
>  obj-$(CONFIG_SM_DISPCC_8450) += dispcc-sm8450.o
>  obj-$(CONFIG_SM_DISPCC_8550) += dispcc-sm8550.o
> diff --git a/drivers/clk/qcom/dispcc-sm7250.c b/drivers/clk/qcom/dispcc-sm7250.c
> new file mode 100644
> index 000000000..f114a9f54
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-sm7250.c
> @@ -0,0 +1,1009 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
> + * Copyright (c) 2024, David Wronek <david@mainlining.org>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm7250-dispcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

This should not be required.
> +	DT_GCC_DISP_GPLL0_CLK,
> +	DT_CHIP_SLEEP_CLK,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
> +	DT_DP_PHY_PLL_LINK_CLK,
> +	DT_DP_PHY_PLL_VCO_DIV_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_CHIP_SLEEP_CLK,
> +	P_DISPCC_PLL0_OUT_EVEN,
> +	P_DISPCC_PLL0_OUT_MAIN,
> +	P_DP_PHY_PLL_LINK_CLK,
> +	P_DP_PHY_PLL_VCO_DIV_CLK,
> +	P_DSI0_PHY_PLL_OUT_BYTECLK,
> +	P_DSI0_PHY_PLL_OUT_DSICLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> +	P_GCC_DISP_GPLL0_CLK,
> +};
> +
> +static const struct pll_vco lucid_vco[] = {
> +	{ 249600000, 2000000000, 0 },
> +};
> +
> +/* 1035 MHz configuration (19.2 MHz * (0x35 + 0xe800 / 2^16)) */
> +static const struct alpha_pll_config dispcc_pll0_config = {
> +	.l = 0x35,
> +	.cal_l = 0x44,
> +	.alpha = 0xe800,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00002261,
> +	.config_ctl_hi1_val = 0x329a699c,
> +	.user_ctl_val = 0x00000001,
> +	.user_ctl_hi_val = 0x00000805,
> +	.user_ctl_hi1_val = 0x00000000,
> +	.test_ctl_hi1_val = 0x01800000,
> +};
> +
> +static struct clk_alpha_pll dispcc_pll0 = {
> +	.offset = 0x0,
> +	.vco_table = lucid_vco,
> +	.num_vco = ARRAY_SIZE(lucid_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map dispcc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
> +	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
> +	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
> +};
> +
> +static const struct parent_map dispcc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DP_PHY_PLL_LINK_CLK, 1 },
> +	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .index = DT_DP_PHY_PLL_LINK_CLK },
> +	{ .index = DT_DP_PHY_PLL_VCO_DIV_CLK },
> +};
> +
> +static const struct parent_map dispcc_parent_map_2[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_2[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_2_ao[] = {
> +	{ .index = DT_BI_TCXO_AO },
> +};
> +
> +static const struct parent_map dispcc_parent_map_3[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DISPCC_PLL0_OUT_MAIN, 1 },
> +	{ P_GCC_DISP_GPLL0_CLK, 4 },
> +	{ P_DISPCC_PLL0_OUT_EVEN, 5 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_3[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &dispcc_pll0.clkr.hw },
> +	{ .index = DT_GCC_DISP_GPLL0_CLK },
> +	{ .hw = &dispcc_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map dispcc_parent_map_4[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_4[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
> +	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
> +};
> +
> +static const struct parent_map dispcc_parent_map_5[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GCC_DISP_GPLL0_CLK, 4 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_5[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .index = DT_GCC_DISP_GPLL0_CLK },
> +};
> +
> +static const struct parent_map dispcc_parent_map_6[] = {
> +	{ P_CHIP_SLEEP_CLK, 0 },
> +};
> +
> +static const struct clk_parent_data dispcc_parent_data_6[] = {
> +	{ .index = DT_CHIP_SLEEP_CLK },
> +};
> +
> +static const struct freq_tbl ftbl_dispcc_mdss_ahb_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(37500000, P_GCC_DISP_GPLL0_CLK, 16, 0, 0),
> +	F(75000000, P_GCC_DISP_GPLL0_CLK, 8, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_ahb_clk_src = {
> +	.cmd_rcgr = 0x22bc,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_5,
> +	.freq_tbl = ftbl_dispcc_mdss_ahb_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_ahb_clk_src",
> +		.parent_data = dispcc_parent_data_5,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_5),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dispcc_mdss_byte0_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_byte0_clk_src = {
> +	.cmd_rcgr = 0x2110,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_0,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_byte0_clk_src",
> +		.parent_data = dispcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_byte2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_byte1_clk_src = {
> +	.cmd_rcgr = 0x212c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_0,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_byte1_clk_src",
> +		.parent_data = dispcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_byte2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_dp_aux_clk_src = {
> +	.cmd_rcgr = 0x21dc,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_2,
> +	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_dp_aux_clk_src",
> +		.parent_data = dispcc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_2),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dispcc_mdss_dp_crypto_clk_src[] = {
> +	F(108000, P_DP_PHY_PLL_LINK_CLK, 3, 0, 0),
> +	F(180000, P_DP_PHY_PLL_LINK_CLK, 3, 0, 0),
> +	F(360000, P_DP_PHY_PLL_LINK_CLK, 1.5, 0, 0),
> +	F(540000, P_DP_PHY_PLL_LINK_CLK, 1.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_dp_crypto_clk_src = {
> +	.cmd_rcgr = 0x2194,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_1,
> +	.freq_tbl = ftbl_dispcc_mdss_dp_crypto_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_dp_crypto_clk_src",
> +		.parent_data = dispcc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_dp_link_clk_src = {
> +	.cmd_rcgr = 0x2178,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_1,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_dp_link_clk_src",
> +		.parent_data = dispcc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_byte2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_dp_pixel1_clk_src = {
> +	.cmd_rcgr = 0x21c4,
> +	.mnd_width = 16,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_1,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_dp_pixel1_clk_src",
> +		.parent_data = dispcc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_dp_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_dp_pixel_clk_src = {
> +	.cmd_rcgr = 0x21ac,
> +	.mnd_width = 16,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_1,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_dp_pixel_clk_src",
> +		.parent_data = dispcc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_dp_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_esc0_clk_src = {
> +	.cmd_rcgr = 0x2148,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_0,
> +	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_esc0_clk_src",
> +		.parent_data = dispcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_esc1_clk_src = {
> +	.cmd_rcgr = 0x2160,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_0,
> +	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_esc1_clk_src",
> +		.parent_data = dispcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dispcc_mdss_mdp_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(200000000, P_GCC_DISP_GPLL0_CLK, 3, 0, 0),
> +	F(300000000, P_GCC_DISP_GPLL0_CLK, 2, 0, 0),
> +	F(345000000, P_DISPCC_PLL0_OUT_MAIN, 3, 0, 0),
> +	F(460000000, P_DISPCC_PLL0_OUT_MAIN, 3, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_mdp_clk_src = {
> +	.cmd_rcgr = 0x20c8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_3,
> +	.freq_tbl = ftbl_dispcc_mdss_mdp_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_mdp_clk_src",
> +		.parent_data = dispcc_parent_data_3,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_3),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
> +	.cmd_rcgr = 0x2098,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_pclk0_clk_src",
> +		.parent_data = dispcc_parent_data_4,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +		.ops = &clk_pixel_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_pclk1_clk_src = {
> +	.cmd_rcgr = 0x20b0,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_pclk1_clk_src",
> +		.parent_data = dispcc_parent_data_4,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> +		.ops = &clk_pixel_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dispcc_mdss_rot_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(200000000, P_GCC_DISP_GPLL0_CLK, 3, 0, 0),
> +	F(300000000, P_GCC_DISP_GPLL0_CLK, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_rot_clk_src = {
> +	.cmd_rcgr = 0x20e0,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_3,
> +	.freq_tbl = ftbl_dispcc_mdss_rot_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_rot_clk_src",
> +		.parent_data = dispcc_parent_data_3,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_3),
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_mdss_vsync_clk_src = {
> +	.cmd_rcgr = 0x20f8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_2,
> +	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_mdss_vsync_clk_src",
> +		.parent_data = dispcc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_2),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dispcc_sleep_clk_src[] = {
> +	F(32000, P_CHIP_SLEEP_CLK, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dispcc_sleep_clk_src = {
> +	.cmd_rcgr = 0x6060,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_6,
> +	.freq_tbl = ftbl_dispcc_sleep_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_sleep_clk_src",
> +		.parent_data = dispcc_parent_data_6,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_6),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 dispcc_xo_clk_src = {
> +	.cmd_rcgr = 0x6044,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dispcc_parent_map_2,
> +	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dispcc_xo_clk_src",
> +		.parent_data = dispcc_parent_data_2_ao,
> +		.num_parents = ARRAY_SIZE(dispcc_parent_data_2_ao),

This can use the normal XO parent.

> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_ahb_clk = {
> +	.halt_reg = 0x2080,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2080,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_byte0_clk = {
> +	.halt_reg = 0x2028,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2028,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_byte0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_div dispcc_mdss_byte0_div_clk_src = {
> +	.reg = 0x2128,
> +	.shift = 0,
> +	.width = 2,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_byte0_div_clk_src",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_div_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_byte0_intf_clk = {
> +	.halt_reg = 0x202c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x202c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_byte0_intf_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte0_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_byte1_clk = {
> +	.halt_reg = 0x2030,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2030,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_byte1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_div dispcc_mdss_byte1_div_clk_src = {
> +	.reg = 0x2144,
> +	.shift = 0,
> +	.width = 2,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_byte1_div_clk_src",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_div_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_byte1_intf_clk = {
> +	.halt_reg = 0x2034,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2034,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_byte1_intf_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte1_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_dp_aux_clk = {
> +	.halt_reg = 0x2054,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2054,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_dp_aux_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_dp_aux_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_dp_crypto_clk = {
> +	.halt_reg = 0x2048,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2048,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_dp_crypto_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_dp_crypto_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_dp_link_clk = {
> +	.halt_reg = 0x2040,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_dp_link_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_dp_link_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_dp_link_intf_clk = {
> +	.halt_reg = 0x2044,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2044,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_dp_link_intf_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_dp_link_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_dp_pixel1_clk = {
> +	.halt_reg = 0x2050,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2050,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_dp_pixel1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_dp_pixel1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_dp_pixel_clk = {
> +	.halt_reg = 0x204c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x204c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_dp_pixel_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_dp_pixel_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_esc0_clk = {
> +	.halt_reg = 0x2038,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2038,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_esc0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_esc0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_esc1_clk = {
> +	.halt_reg = 0x203c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x203c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_esc1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_esc1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_mdp_clk = {
> +	.halt_reg = 0x200c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x200c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_mdp_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_mdp_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_mdp_lut_clk = {
> +	.halt_reg = 0x201c,
> +	.halt_check = BRANCH_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x201c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_mdp_lut_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_mdp_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_non_gdsc_ahb_clk = {
> +	.halt_reg = 0x4004,
> +	.halt_check = BRANCH_VOTED,

Why VOTED? if it is not polled during enable, it is going to return back
wrong status.

> +	.clkr = {
> +		.enable_reg = 0x4004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_non_gdsc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_pclk0_clk = {
> +	.halt_reg = 0x2004,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_pclk0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_pclk0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_pclk1_clk = {
> +	.halt_reg = 0x2008,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_pclk1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_pclk1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_rot_clk = {
> +	.halt_reg = 0x2014,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2014,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_rot_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_rot_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_rscc_ahb_clk = {
> +	.halt_reg = 0x400c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x400c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_rscc_ahb_clk",
> +			.parent_names = (const char *[]) {
> +				"dispcc_mdss_ahb_clk_src",
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_rscc_vsync_clk = {
> +	.halt_reg = 0x4008,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_rscc_vsync_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_vsync_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_vsync_clk = {
> +	.halt_reg = 0x2024,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2024,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_mdss_vsync_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dispcc_mdss_vsync_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_sleep_clk = {
> +	.halt_reg = 0x6078,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x6078,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dispcc_sleep_clk",
> +			.parent_names = (const char *[]) {
> +				"dispcc_sleep_clk_src",
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc mdss_gdsc = {
> +	.gdscr = 0x3000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "mdss_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL,
> +};
> +
> +static struct clk_regmap *dispcc_sm7250_clocks[] = {
> +	[DISPCC_MDSS_AHB_CLK] = &dispcc_mdss_ahb_clk.clkr,
> +	[DISPCC_MDSS_AHB_CLK_SRC] = &dispcc_mdss_ahb_clk_src.clkr,
> +	[DISPCC_MDSS_BYTE0_CLK] = &dispcc_mdss_byte0_clk.clkr,
> +	[DISPCC_MDSS_BYTE0_CLK_SRC] = &dispcc_mdss_byte0_clk_src.clkr,
> +	[DISPCC_MDSS_BYTE0_DIV_CLK_SRC] = &dispcc_mdss_byte0_div_clk_src.clkr,
> +	[DISPCC_MDSS_BYTE0_INTF_CLK] = &dispcc_mdss_byte0_intf_clk.clkr,
> +	[DISPCC_MDSS_BYTE1_CLK] = &dispcc_mdss_byte1_clk.clkr,
> +	[DISPCC_MDSS_BYTE1_CLK_SRC] = &dispcc_mdss_byte1_clk_src.clkr,
> +	[DISPCC_MDSS_BYTE1_DIV_CLK_SRC] = &dispcc_mdss_byte1_div_clk_src.clkr,
> +	[DISPCC_MDSS_BYTE1_INTF_CLK] = &dispcc_mdss_byte1_intf_clk.clkr,
> +	[DISPCC_MDSS_DP_AUX_CLK] = &dispcc_mdss_dp_aux_clk.clkr,
> +	[DISPCC_MDSS_DP_AUX_CLK_SRC] = &dispcc_mdss_dp_aux_clk_src.clkr,
> +	[DISPCC_MDSS_DP_CRYPTO_CLK] = &dispcc_mdss_dp_crypto_clk.clkr,
> +	[DISPCC_MDSS_DP_CRYPTO_CLK_SRC] = &dispcc_mdss_dp_crypto_clk_src.clkr,
> +	[DISPCC_MDSS_DP_LINK_CLK] = &dispcc_mdss_dp_link_clk.clkr,
> +	[DISPCC_MDSS_DP_LINK_CLK_SRC] = &dispcc_mdss_dp_link_clk_src.clkr,
> +	[DISPCC_MDSS_DP_LINK_INTF_CLK] = &dispcc_mdss_dp_link_intf_clk.clkr,
> +	[DISPCC_MDSS_DP_PIXEL1_CLK] = &dispcc_mdss_dp_pixel1_clk.clkr,
> +	[DISPCC_MDSS_DP_PIXEL1_CLK_SRC] = &dispcc_mdss_dp_pixel1_clk_src.clkr,
> +	[DISPCC_MDSS_DP_PIXEL_CLK] = &dispcc_mdss_dp_pixel_clk.clkr,
> +	[DISPCC_MDSS_DP_PIXEL_CLK_SRC] = &dispcc_mdss_dp_pixel_clk_src.clkr,
> +	[DISPCC_MDSS_ESC0_CLK] = &dispcc_mdss_esc0_clk.clkr,
> +	[DISPCC_MDSS_ESC0_CLK_SRC] = &dispcc_mdss_esc0_clk_src.clkr,
> +	[DISPCC_MDSS_ESC1_CLK] = &dispcc_mdss_esc1_clk.clkr,
> +	[DISPCC_MDSS_ESC1_CLK_SRC] = &dispcc_mdss_esc1_clk_src.clkr,
> +	[DISPCC_MDSS_MDP_CLK] = &dispcc_mdss_mdp_clk.clkr,
> +	[DISPCC_MDSS_MDP_CLK_SRC] = &dispcc_mdss_mdp_clk_src.clkr,
> +	[DISPCC_MDSS_MDP_LUT_CLK] = &dispcc_mdss_mdp_lut_clk.clkr,
> +	[DISPCC_MDSS_NON_GDSC_AHB_CLK] = &dispcc_mdss_non_gdsc_ahb_clk.clkr,
> +	[DISPCC_MDSS_PCLK0_CLK] = &dispcc_mdss_pclk0_clk.clkr,
> +	[DISPCC_MDSS_PCLK0_CLK_SRC] = &dispcc_mdss_pclk0_clk_src.clkr,
> +	[DISPCC_MDSS_PCLK1_CLK] = &dispcc_mdss_pclk1_clk.clkr,
> +	[DISPCC_MDSS_PCLK1_CLK_SRC] = &dispcc_mdss_pclk1_clk_src.clkr,
> +	[DISPCC_MDSS_ROT_CLK] = &dispcc_mdss_rot_clk.clkr,
> +	[DISPCC_MDSS_ROT_CLK_SRC] = &dispcc_mdss_rot_clk_src.clkr,
> +	[DISPCC_MDSS_RSCC_AHB_CLK] = &dispcc_mdss_rscc_ahb_clk.clkr,
> +	[DISPCC_MDSS_RSCC_VSYNC_CLK] = &dispcc_mdss_rscc_vsync_clk.clkr,
> +	[DISPCC_MDSS_VSYNC_CLK] = &dispcc_mdss_vsync_clk.clkr,
> +	[DISPCC_MDSS_VSYNC_CLK_SRC] = &dispcc_mdss_vsync_clk_src.clkr,
> +	[DISPCC_PLL0] = &dispcc_pll0.clkr,
> +	[DISPCC_SLEEP_CLK] = &dispcc_sleep_clk.clkr,
> +	[DISPCC_SLEEP_CLK_SRC] = &dispcc_sleep_clk_src.clkr,
> +	[DISPCC_XO_CLK_SRC] = &dispcc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *dispcc_sm7250_gdscs[] = {
> +	[MDSS_GDSC] = &mdss_gdsc,
> +};
> +
> +static const struct qcom_reset_map dispcc_sm7250_resets[] = {
> +	[DISPCC_MDSS_CORE_BCR] = { 0x2000 },
> +};
> +
> +static const struct regmap_config dispcc_sm7250_regmap_config = {
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.max_register	= 0x10000,
> +	.fast_io	= true,
> +};
> +
> +static const struct qcom_cc_desc dispcc_sm7250_desc = {
> +	.config = &dispcc_sm7250_regmap_config,
> +	.clks = dispcc_sm7250_clocks,
> +	.num_clks = ARRAY_SIZE(dispcc_sm7250_clocks),
> +	.gdscs = dispcc_sm7250_gdscs,
> +	.num_gdscs = ARRAY_SIZE(dispcc_sm7250_gdscs),
> +	.resets = dispcc_sm7250_resets,
> +	.num_resets = ARRAY_SIZE(dispcc_sm7250_resets),
> +};
> +
> +static const struct of_device_id dispcc_sm7250_match_table[] = {
> +	{ .compatible = "qcom,sm7250-dispcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dispcc_sm7250_match_table);
> +
> +static int dispcc_sm7250_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &dispcc_sm7250_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_lucid_pll_configure(&dispcc_pll0, regmap, &dispcc_pll0_config);
> +	/* Enable clock gating for DSI and MDP clocks */
> +	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);

please follow the latest way of using the call-backs to configure PLL
and any other misc registers.

> +
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
> +
> +	return qcom_cc_really_probe(&pdev->dev, &dispcc_sm7250_desc, regmap);
> +}
> +
> +static struct platform_driver dispcc_sm7250_driver = {
> +	.probe = dispcc_sm7250_probe,
> +	.driver = {
> +		.name = "dispcc-sm7250",
> +		.of_match_table = dispcc_sm7250_match_table,
> +	},
> +};
> +
> +module_platform_driver(dispcc_sm7250_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SM7250 Display Clock Controller");
> +MODULE_LICENSE("GPL");
> 

-- 
Thanks,
Taniya Das

