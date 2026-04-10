Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3ED330B14
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775796508; cv=none; b=d+cJ+bcblh89eZfeA4yHl5/7nXdTyaXOgBMIgfMx+jaylVjqnwwfxYc2yzIqPrUFt2xoZ9bKVIKStJosvJSQt0o/eL0Jr8TQe4khoTrK41ex2no1wgAWAMN1KtwxAulA82isjNgyCNZ6Kmu5ZijM0RRw8tbWzixoNkC01HdQ39A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775796508; c=relaxed/simple;
	bh=JhhcLgoFndUtjd3XUV1PfOJTZQjZiNKYVIwCf0EqxTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oB31bGS+LXGpmX3oVHu6m3opaVNkDQQQdgHKj4Zot9GPmowiw5m9AMWsQrVQ6Aa94YdXEAQDTxf0n0LDRa8mLvE5+N5DL1CqqyMpjdcTVgZJMW9g4SZNmfLiqAw+sktXbVQ5xBWJZu3kRjjRKa1hwQAzXTDRCZFQBCOjNZuzqXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e11/9Q5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aM2lsCin; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e11/9Q5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aM2lsCin"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LrKPd3934926
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 04:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=; b=e11/9Q5Nd7IN1JXO
	J4waBqq9PNngRjCr53i0vK5IrofDUCHlGpSWHx/U4w0J8nIL3nT0ycYNYPzgEKQB
	oukBTDE92lzw6jiiLm2ccOUjWZbuC/8deadQ3KhjJLnaguLnEMCZsXkCUqM0kOg+
	R3GM+XKrwCZTRW0Drvo596qoSvdGkRjz12JTml5oX0/kiGyWc5e+YB4j4T+2SX6k
	SkuStwmqmYGWbJJ8vJ/kMuhLf8tQ2V8SLAQ+ltiFRx59B80GNozcWrnguDsAVC36
	bDjGIrE7T+RT8gmtHJu/8wtPkGpnKhTF6AfsmczTmzPYLlJBDEPb2b1iRmv/3her
	EHyuNg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5saj8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 04:48:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso1161801b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 21:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775796505; x=1776401305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=;
        b=aM2lsCinfY7VsqGYFDSVO8AvmMsaUU0/mjkTZKsYuNMBmxjWXHfYURp3lhoG8A1Mpe
         mM7pFR5yzLQHBbVD0i/9Xf8TN7kh8jN+7uTa9KfD9Hs1WBbvaFZynROhvPvZFnw5UQy3
         52vYG80RCQ/I+GfCTcOLsDv2fA8qTsa5dIDhqAdafO+6oGbsx5baErkQSr5o48FKzurn
         gpzov2nLee4LhtvzrTq/qcGalxT30Yndr2IPTgX6va3kxRw97mRlLfc6Loi34HxolmR+
         4MBNNPpyzMG43puzdv7/vgbAM9sGqkBeIcQzRl6VgInr8BKP5Jq261B021bHmlBu6VcC
         MJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775796505; x=1776401305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=;
        b=bFN45mziWfnROxL7kCiwwrYFTF2Xxg2Kfa3et3183wPFmdivL6L8KrVUl7+BEGnj9N
         eNQiAmU6jjmjMqTt5lHwDcoS911lEif9NSkdHFZeYlnJP7axJSIUq6Jy1ig9t2ZxCUdR
         EGiwi+C84KtcdjHC3lfB9Yl7oDzUXi3VLOJhzpc+nUaCpN08hmvDEzNetyyK+GnmnO9W
         ISUNOQ4qXp5ZnXcv162tEaBLo3fF8l0Hdli6OvozoDT0FBil2AyS8dyjX/pC32LleRmj
         /prRGib0324J+Cl0nODamgOS14n+zS7STsEskLUGimpICjWwo6NPtjhEM1CSrGxtthhl
         cABw==
X-Forwarded-Encrypted: i=1; AJvYcCXwZ0EVrraFWnwYbCLdbBIcB05u2VsPvVmcqi2QEnHNgMBab5R27jcLxe0Fq3f8Vq+YjYfAlKeLmPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJNL76IQn+9jDkJLy8xveLnCe4aZ2kv0zBtD9JV6zkqmIXXTB
	Hta9Irw8QSteE8HLYHHjubcQj+CZBRanLe90pmcX0hfgo/iP5RnirBiWc0c2NN9TK4UR9Qj6ZPM
	3RRfZ9w3+8XKIYvhA3z7u8jVRj44OLAkODsvR2nhHxnwabRV61wMhA21gfgjchng=
X-Gm-Gg: AeBDiesvxSTRn9XiQYSCDMP6xY97bCx4bcHIVBm4vNWcHrh/1ciXDWUGNW0lZeY3NVn
	mdvLT3mKnCDBWyoDtCKZ/jbVIpTxDcKJV3HKZpslbVE5LukcWtg8jZ9EL0ZnW4+6bimw/FYOj6D
	ctGKvs9DMfIDhP3mZSO8iVBJ7hCtx3HxhC0Wlir+7sbVUL/m4q5A8cYZpZquEsUQOIoMWpKEauw
	6wG4CZ0VyrLK2FHwSCf7eUmTtZ/sfHVvTmCgR+9/yYTwmyPZLGE4y1URIqaG+JDs1jZsdSKuyWH
	lNK9KdaJ2e07OCMzatODAxE3WORdg7f2/BLDeqonR8Vv4LfQAppXnnFyQvBvKr2ywNMcWaZwcdY
	gaDi1ehNCYlm62X7+x6KL5fFx6m7LZwWHj11VVHZs56iqs0WESXl4j4YyiKUDYuLYhy3at/cbxq
	hb7CFgQ9bBLA==
X-Received: by 2002:a05:6a00:f0a:b0:81f:4884:4fed with SMTP id d2e1a72fcca58-82f0c24e21emr1813448b3a.7.1775796504554;
        Thu, 09 Apr 2026 21:48:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0a:b0:81f:4884:4fed with SMTP id d2e1a72fcca58-82f0c24e21emr1813419b3a.7.1775796504014;
        Thu, 09 Apr 2026 21:48:24 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b3dc2sm1278206b3a.34.2026.04.09.21.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 21:48:23 -0700 (PDT)
Message-ID: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:48:17 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lo67cDrq32TBGrOMBCL3xDYHwjs-H9E3
X-Proofpoint-GUID: Lo67cDrq32TBGrOMBCL3xDYHwjs-H9E3
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d88119 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JKCxmoqLevzGYRfko-YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0MSBTYWx0ZWRfX229omTDzONzv
 0IGA67FSKTwuuv1xsTbcHcAL3jyEijg53fSpuKR1SZa+RaCzSuPm8TFuGuVtanjbtWoW2t+z9Vq
 C2o+GsoY/MIyi5H6WoW4q0NhPPw2MIRjWZPqzuaZob/PHJ++0Kd/4uLUh45UkpECAmQM+tKcCy5
 P+z3GKx2NUVn95J7+A26CQKWu7GYsHcG/T4dNgD/4GP2uwSZjYB5MTxmxPUgX+cKsuk8kdc033j
 /OZlqDOe6t4GjtHJowl1CJy5wwR1ypIIeu4+Oj68YB4+bqKRVvfaj5JcY2LjgeqeLKXSaQTwntn
 ftg06qToKpjEuq8iLHV/ly5ceG7hSGQd15h4izD/QdAn9msiDJIv6J/HZe31nLKnu000Dccb672
 ssiuLMWv2eGerCU4ThaA0T9eZv/TVC2KJaStHo1MPnDyjd3RwFKalN2a3D9NFCiM3wVEPzKCTvn
 xfOh151jcbOX/Zh8euA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100041



On 4/10/2026 2:10 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig         |   9 +
>   drivers/clk/qcom/Makefile        |   1 +
>   drivers/clk/qcom/videocc-eliza.c | 403 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 413 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..4b0d40a38a6328fe9c41ebb15ae6821012223920 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,15 @@ config CLK_ELIZA_TCSRCC
>   	  Support for the TCSR clock controller on Eliza devices.
>   	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
>   
> +config CLK_ELIZA_VIDEOCC
> +	tristate "Eliza Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC

Hi,

My bot found a [BUG] here, please ignore it if it's a false positive issue.

CLK_ELIZA_VIDEOCC selects CLK_GLYMUR_GCC instead of CLK_ELIZA_GCC

- select CLK_GLYMUR_GCC pulls in gcc-glymur.c instead of gcc-eliza.c
- On an Eliza system, gcc-glymur.c will never probe (no matching DTS 
node), so GCC_VIDEO_AHB_CLK from the Eliza GCC will never be available 
to videocc
- The videocc driver's clocks = <&gcc GCC_VIDEO_AHB_CLK> will fail to 
resolve at runtime
- The correct fix is select CLK_ELIZA_GCC, consistent with all other 
Eliza clock controllers

Thanks,
Jie

> +	help
> +	  Support for the video clock controller on Eliza devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode and decode.
> +
>   config CLK_GLYMUR_DISPCC
>   	tristate "Glymur Display Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b818fd5af8bfb85a51ee90fdc3baa93af30dc39a..e7e239c5a0d088b2e78354bf421d871a4e4e6d9d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>   obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
> +obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>   obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>   obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
> diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-eliza.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cb541cfec50c12761251a822e32094e763922cdb
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-eliza.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,eliza-videocc.h>
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
> +enum {
> +	DT_BI_TCXO,
> +	DT_SLEEP_CLK,
> +	DT_AHB_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_SLEEP_CLK,
> +	P_VIDEO_CC_PLL0_OUT_MAIN,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +/* 576.0 MHz Configuration */
> +static const struct alpha_pll_config video_cc_pll0_config = {
> +	.l = 0x1e,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll video_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &video_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map video_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct parent_map video_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &video_cc_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map video_cc_parent_map_2[] = {
> +	{ P_SLEEP_CLK, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_2[] = {
> +	{ .index = DT_SLEEP_CLK },
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_ahb_clk_src = {
> +	.cmd_rcgr = 0x8018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_0,
> +	.freq_tbl = ftbl_video_cc_ahb_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_ahb_clk_src",
> +		.parent_data = video_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
> +	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(633000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1113000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs0_clk_src = {
> +	.cmd_rcgr = 0x8000,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_1,
> +	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_clk_src",
> +		.parent_data = video_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
> +	F(32000, P_SLEEP_CLK, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_sleep_clk_src = {
> +	.cmd_rcgr = 0x8110,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_2,
> +	.freq_tbl = ftbl_video_cc_sleep_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_sleep_clk_src",
> +		.parent_data = video_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 video_cc_xo_clk_src = {
> +	.cmd_rcgr = 0x80f4,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_0,
> +	.freq_tbl = ftbl_video_cc_ahb_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_xo_clk_src",
> +		.parent_data = video_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
> +	.reg = 0x80ac,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs0_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
> +	.reg = 0x8058,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0c_div2_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs0_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_clk = {
> +	.halt_reg = 0x80a0,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80a0,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80a0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_shift_clk = {
> +	.halt_reg = 0x8144,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8144,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8144,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_clk = {
> +	.halt_reg = 0x804c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x804c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_shift_clk = {
> +	.halt_reg = 0x8148,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8148,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8148,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc video_cc_mvs0c_gdsc = {
> +	.gdscr = 0x8034,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0c_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs0_gdsc = {
> +	.gdscr = 0x808c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &video_cc_mvs0c_gdsc.pd,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
> +};
> +
> +static struct clk_regmap *video_cc_eliza_clocks[] = {
> +	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
> +	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
> +	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
> +	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
> +	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
> +	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
> +	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
> +	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
> +	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
> +	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
> +	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *video_cc_eliza_gdscs[] = {
> +	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
> +	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
> +};
> +
> +static const struct qcom_reset_map video_cc_eliza_resets[] = {
> +	[VIDEO_CC_INTERFACE_BCR] = { 0x80d8 },
> +	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80a0, 2 },
> +	[VIDEO_CC_MVS0_BCR] = { 0x8088 },
> +	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
> +	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
> +	[VIDEO_CC_XO_CLK_ARES] = { 0x810c, 2 },
> +};
> +
> +static struct clk_alpha_pll *video_cc_eliza_plls[] = {
> +	&video_cc_pll0,
> +};
> +
> +static u32 video_cc_eliza_critical_cbcrs[] = {
> +	0x80dc, /* VIDEO_CC_AHB_CLK */
> +	0x8128, /* VIDEO_CC_SLEEP_CLK */
> +	0x810c, /* VIDEO_CC_XO_CLK */
> +};
> +
> +static const struct regmap_config video_cc_eliza_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x9f50,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data video_cc_eliza_driver_data = {
> +	.alpha_plls = video_cc_eliza_plls,
> +	.num_alpha_plls = ARRAY_SIZE(video_cc_eliza_plls),
> +	.clk_cbcrs = video_cc_eliza_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(video_cc_eliza_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc video_cc_eliza_desc = {
> +	.config = &video_cc_eliza_regmap_config,
> +	.clks = video_cc_eliza_clocks,
> +	.num_clks = ARRAY_SIZE(video_cc_eliza_clocks),
> +	.resets = video_cc_eliza_resets,
> +	.num_resets = ARRAY_SIZE(video_cc_eliza_resets),
> +	.gdscs = video_cc_eliza_gdscs,
> +	.num_gdscs = ARRAY_SIZE(video_cc_eliza_gdscs),
> +	.driver_data = &video_cc_eliza_driver_data,
> +};
> +
> +static const struct of_device_id video_cc_eliza_match_table[] = {
> +	{ .compatible = "qcom,eliza-videocc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, video_cc_eliza_match_table);
> +
> +static int video_cc_eliza_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &video_cc_eliza_desc);
> +}
> +
> +static struct platform_driver video_cc_eliza_driver = {
> +	.probe = video_cc_eliza_probe,
> +	.driver = {
> +		.name = "videocc-eliza",
> +		.of_match_table = video_cc_eliza_match_table,
> +	},
> +};
> +
> +module_platform_driver(video_cc_eliza_driver);
> +
> +MODULE_DESCRIPTION("QTI VIDEOCC Eliza Driver");
> +MODULE_LICENSE("GPL");
> 

