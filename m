Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B252E050
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073238; cv=none; b=WzQMMysYQd+6tCisMby6CCACfyt+DtJk8z+5Jk9qW4MGp2tRntPRs7mdWeBd9af9T1LMW2i6KXQcMYscuWNrWUfNPE67zsK9O70RhDEzKHKlPNFJZ71LL5YLQzqEfYlksD0ShAhKrb3OBe4jQJPndkoDcVD1ZJPoqxoZ9CaAzBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073238; c=relaxed/simple;
	bh=ndRlwLZqlF0smt3gKP98+uiSsCZF1QUDAuYz1qdQMkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrC6EJr7lSYQWei3k5le3aekYmn9vxnJaaNU5lv1WMhAdgy7C8saHkX0NPa7+9zqnItbWvsIDOTy7EAWrGufOIqNqBkhe08tuEzAJ+Wdut7mUPXXOJe2y5tFikPQJlKam7udKG/4fEmtFgl1hcZqH9edWsJf37Qs403vBmlxtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fjgvlbyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bzs+VwXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fjgvlbyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bzs+VwXs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jsLl2417395
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	798StpSvWrqpxc0yWdYjohOcDbWcr2YHFlJtI3eAdbM=; b=Fjgvlbyg88uC46h6
	QFFyMHrahSek+BWDbaOm7gDJJwOOYeMgVB2HrDMF2MQjm5ghEuRKcxf6guI7Kj8b
	nD/VNkxwcdDaYTxcj+55VkyktSpaK8dZFpr5nSv8MIi15aTCXjk4b5DhyVveuucN
	YjfqWqCl5NAUcLrlfTf0pS5BtnlvhFg1/E/Viv5lnpzJy+vI8LzTxw/DfNE3VHdD
	V/o2vDb0fEISnZY2RHzmXR0YmNsszhdv7XhmtZhfJEewCtAfRSZM7qsaAjdXnKyq
	rqcyTmoiLs1vqDxMnVkSJf7Kd5hFS5x9JAEPfF1T1lZtLZJMzNBLmrRm0YqiIdVn
	tfxgFw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjfqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:07:15 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-827bc69f686so15837123a34.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073234; x=1792678034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=798StpSvWrqpxc0yWdYjohOcDbWcr2YHFlJtI3eAdbM=;
        b=Bzs+VwXsGHAp2DNclJ5Y7wC9y6AKAbVieyELw6J03mjzWb7nXHOmfToojqJnkC8NkI
         riwylMk/7Bu6brzZ98/raiZr1du1FeYWwJ7cp+DqJ2TkWhg+SjJQtpagZs/oKvrC2sfl
         T74ZgXrt4nWzxLu5vqgCypxIujWivH0dZTU9GgIVkAGZaQ3GsrWb+49J7SlbgJIA28is
         eSlTyJW0KYOUYXLLO4HfhgCuhJThou3Sbp4nqTXcL431L/7CBiqijQ307Lg0bfjuS9j6
         bhV2vIJV1XpkLaw570u3gn3li7QhEcSEogeoYqM1T2YpzoIZTryvOhfQro281eFNj/zw
         BOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073234; x=1792678034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=798StpSvWrqpxc0yWdYjohOcDbWcr2YHFlJtI3eAdbM=;
        b=hILOm6jSk5VqkIBcav1Jr+5jsl87yv5SgPNG5oERC03EJTNJk6m+JykGUp5m1yZPJJ
         kP3UEyLcnhmpH2WnyIutK7UYPvQFeatLSdICfgWdXAk4wyc9JtU87xC8KYkWury9Pr5j
         ogHJCk4o37XpAKysNLuvC1LKcB2x0UYBIqJelvv+JFjAwd1FXm/uZxrqg8xonvXdbITh
         TTrThiT5FSNSr5hSxLQcoRwUXspzVpLJiG32qMFB39jE05Bj5pRNbY8TBJndAq1uVd4N
         UWZEwZbPmwMkCpmXA12mdmtQ55eH9jYakK9+//CjsgYHCMC+bFhLaZYgo4GT3DfEtpWu
         fkSw==
X-Forwarded-Encrypted: i=1; AKwUvBy3wSB4H1QWaH2TtsBwQRblJzPvKpTJnoquHVioM+sD7Nb7j8sAv2puRNNAVa7fjj19zIjTR+soJiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM4pM/Uhea0G8ITtvZqdlsZdGfKB6oMBl6K4KCc53+kClsbsUZ
	MqbXUBNCVtybBgr8HsjjINYcB2A3iq1MD83lu46HOctB9MMTlcNdUB5GC177yrSD9HNC/WNbjp+
	vk25QH0XVTiQ4ZHHa5vNRD6T2L64AmWoiX/Oib3r8gi36OMFn3GD8JL4BkEIXH9w=
X-Gm-Gg: AYBFou1SC+f3nSIuEKbvm3o/2DrlLL3MbJ25bntruT/nNXQ2maS1O5nYKWCWbYTq/Mj
	MllGngM2TlYWZmERa1w1kuBDhUuRHsvRc8qN9kzy+Y0Gmclff5SLcMXwD1J6g1U3yEzHhZNi4zC
	e5GsAxcZAtgD8doWyp664VdTGa0uUP2el4X+k2ck9U/m23B5AMm2ACZsB152IOdLq2f7B4VHkvN
	tDRHdRnb/JHtFDT5U92/iSQfYnc7FmTUbutpfRMIK5uC00Uuui51aFbAdIUlVlP8NRVBmMWIIMu
	STAKAtabjWb59E6lIcyb5zn/hdKaOOR/g1aBg/IiQhe4ZMUYT7li6Ncyj9a5I/VhLMWbBi9rHAZ
	JL4dfjiOAa0vSVUUdvC22v1lhMf0AaQ==
X-Received: by 2002:a05:6820:190b:b0:6f7:3c09:c712 with SMTP id 006d021491bc7-701124b05ebmr74424eaf.18.1792073234139;
        Thu, 15 Oct 2026 07:07:14 -0700 (PDT)
X-Received: by 2002:a05:6820:190b:b0:6f7:3c09:c712 with SMTP id 006d021491bc7-701124b05ebmr74380eaf.18.1792073233568;
        Thu, 15 Oct 2026 07:07:13 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.197.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-830385b9cb0sm17852906a34.4.2026.10.15.07.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:07:12 -0700 (PDT)
Message-ID: <d466c18a-9d33-41d0-8cdb-50af409598b1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:37:00 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-3-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-3-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX6Po++k0tpNXd
 Xi+Ow7/mGWT6cKi7/w5yXo3kduRYUxFnjyOxFNa2wjtagbr+ayk7wbI89bJdi8lyLeck0eemcFH
 m0PXLrIvrKuXXmYZAZrMU1dRYWfsmtHOUfEmAJ08I0vU+vp6QieyJ7FM0LeWLm9VXSCy48dOoid
 tkO2pnX8jayvWLX8DethCXFmXAwMEaAYIf+XEghqrv5xy4A7wPeaBKWjBKZHWnWxwb688z11IVX
 Pzs2WtPPwUlo0kqPo71Ut5Yq6s48JMj/kropELowN4Yk+Ywx4hfITUsODHVZMY26PBw+iBn7FBS
 jpwBYkXkqRQemWD9bEpmXF1hddC3sXyOXevlUjn8D75HKJ3qZ/IiGtc8PFCNcKPvVrsB7mYANpd
 H1EJuOWlgXv+bNyG1qaqBwyqJRdvCnlQVQYUcUrr5FRp5zJXwv2ipEY08Qk7K0StWllgCD4E2ob
 RvtWzdp04Qb/MSRGgkg==
X-Proofpoint-GUID: 9j2B3-4fehcrea_O9CfFxYNICMP3iZ6a
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0de13 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=/y/JNeyFYS62MWjl30sOOw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fkuVY8nhnkbg9sVdVkgA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfXyWyM//SvuWW0
 4URXyjVZ2r1Vv/L8hUSPBln5D2ekegxk7No9Nud6b1FEOuJpW4fVizXxLBl4fPF9Ndvs6Cti6nx
 SDvt0czdRxxPHC/eVJsS+ncGQaz/8Yk=
X-Proofpoint-ORIG-GUID: 9j2B3-4fehcrea_O9CfFxYNICMP3iZ6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056



On 10/15/2026 7:05 PM, Jagadeesh Kona wrote:
> Add support for the AV1 encoder clock controller (AV1ECC) driver
> for clients to be able to request for AV1ECC clocks on Qualcomm
> Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  11 ++
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/av1ecc-glymur.c | 393 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 405 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..94f3445f6bd0ecd297d83b5804ff0e4433d48261 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -69,6 +69,17 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
>  
> +config CLK_GLYMUR_AV1ECC
> +	tristate "Glymur AV1E Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
> +	help
> +	  Support for the video AV1 encoder clock controller on
> +	  Qualcomm Technologies, Inc. Glymur devices.
> +	  Say Y if you want to support functionality such as AV1
> +	  encoding.
> +
>  config CLK_GLYMUR_CAMCC
>  	tristate "Glymur Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..61d4efb7547146544902dddf52e4853d073d5467 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>  obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_CLK_GLYMUR_AV1ECC) += av1ecc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
> diff --git a/drivers/clk/qcom/av1ecc-glymur.c b/drivers/clk/qcom/av1ecc-glymur.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..228e73a1a1357dc9ebe508b9fbcec71326388806
> --- /dev/null
> +++ b/drivers/clk/qcom/av1ecc-glymur.c
> @@ -0,0 +1,393 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,glymur-av1ecc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_IFACE,
> +};
> +
> +enum {
> +	P_AV1E_CC_PLL0_OUT_EVEN,
> +	P_AV1E_CC_PLL0_OUT_MAIN,
> +	P_AV1E_CC_PLL0_OUT_ODD,
> +	P_BI_TCXO,
> +};
> +
> +static const struct pll_vco taycan_eko_t_vco[] = {
> +	{ 249600000, 2500000000, 0 },
> +};
> +
> +/* 600.0 MHz Configuration */
> +static const struct alpha_pll_config av1e_cc_pll0_config = {
> +	.l = 0x1f,
> +	.cal_l = 0x48,
> +	.alpha = 0x4000,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8060e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000008,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +
> +static struct clk_alpha_pll av1e_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &av1e_cc_pll0_config,
> +	.vco_table = taycan_eko_t_vco,
> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map av1e_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_AV1E_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_AV1E_CC_PLL0_OUT_ODD, 2 },
> +	{ P_AV1E_CC_PLL0_OUT_EVEN, 3 },
> +};
> +
> +static const struct clk_parent_data av1e_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &av1e_cc_pll0.clkr.hw },
> +	{ .hw = &av1e_cc_pll0.clkr.hw },
> +	{ .hw = &av1e_cc_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map av1e_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data av1e_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct freq_tbl ftbl_av1e_cc_av1e_core_clk_src[] = {
> +	F(300000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(400000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(600000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 av1e_cc_av1e_core_clk_src = {
> +	.cmd_rcgr = 0x4018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = av1e_cc_parent_map_0,
> +	.freq_tbl = ftbl_av1e_cc_av1e_core_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "av1e_cc_av1e_core_clk_src",
> +		.parent_data = av1e_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_av1e_cc_av1e_xo_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 av1e_cc_av1e_xo_clk_src = {
> +	.cmd_rcgr = 0x601c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = av1e_cc_parent_map_1,
> +	.freq_tbl = ftbl_av1e_cc_av1e_xo_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "av1e_cc_av1e_xo_clk_src",
> +		.parent_data = av1e_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,

Can it be just rcg2_ops?

> +	},
> +};
> +
> +static struct clk_regmap_div av1e_cc_av1e_noc_ahb_div_clk_src = {
> +	.reg = 0x5020,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "av1e_cc_av1e_noc_ahb_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&av1e_cc_av1e_core_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_ahb_clk = {
> +	.halt_reg = 0x6000,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x6000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_core_apb_clk = {
> +	.halt_reg = 0x4044,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4044,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_core_apb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_core_axi_clk = {
> +	.halt_reg = 0x4040,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_core_axi_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_core_clk = {
> +	.halt_reg = 0x4030,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4030,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_core_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_gdsc_noc_ahb_clk = {
> +	.halt_reg = 0x5024,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x5024,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_gdsc_noc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_noc_ahb_clk = {
> +	.halt_reg = 0x5028,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x5028,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_noc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_noc_core_axi_clk = {
> +	.halt_reg = 0x5004,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x5004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_noc_core_axi_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch av1e_cc_av1e_noc_xo_clk = {
> +	.halt_reg = 0x6038,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x6038,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "av1e_cc_av1e_noc_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&av1e_cc_av1e_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc av1e_cc_core_gdsc = {
> +	.gdscr = 0x4004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "av1e_cc_core_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

Will AV1 consumer have any HW_CTRL requirement?

> +};
> +
> +static struct clk_regmap *av1e_cc_glymur_clocks[] = {
> +	[AV1E_CC_AHB_CLK] = &av1e_cc_ahb_clk.clkr,
> +	[AV1E_CC_AV1E_CORE_APB_CLK] = &av1e_cc_av1e_core_apb_clk.clkr,
> +	[AV1E_CC_AV1E_CORE_AXI_CLK] = &av1e_cc_av1e_core_axi_clk.clkr,
> +	[AV1E_CC_AV1E_CORE_CLK] = &av1e_cc_av1e_core_clk.clkr,
> +	[AV1E_CC_AV1E_CORE_CLK_SRC] = &av1e_cc_av1e_core_clk_src.clkr,
> +	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK] = &av1e_cc_av1e_gdsc_noc_ahb_clk.clkr,
> +	[AV1E_CC_AV1E_NOC_AHB_CLK] = &av1e_cc_av1e_noc_ahb_clk.clkr,
> +	[AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC] = &av1e_cc_av1e_noc_ahb_div_clk_src.clkr,
> +	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK] = &av1e_cc_av1e_noc_core_axi_clk.clkr,
> +	[AV1E_CC_AV1E_NOC_XO_CLK] = &av1e_cc_av1e_noc_xo_clk.clkr,
> +	[AV1E_CC_AV1E_XO_CLK_SRC] = &av1e_cc_av1e_xo_clk_src.clkr,
> +	[AV1E_CC_PLL0] = &av1e_cc_pll0.clkr,
> +};
> +
> +static struct gdsc *av1e_cc_glymur_gdscs[] = {
> +	[AV1E_CC_CORE_GDSC] = &av1e_cc_core_gdsc,
> +};
> +
> +static const struct qcom_reset_map av1e_cc_glymur_resets[] = {
> +	[AV1E_CC_AV1E_CORE_AXI_CLK_ARES] = { 0x4040, 2 },
> +	[AV1E_CC_AV1E_CORE_CLK_ARES] = { 0x4030, 2 },
> +	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES] = { 0x5024, 2 },
> +	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES] = { 0x5004, 2 },
> +	[AV1E_CC_AV1E_NOC_XO_CLK_ARES] = { 0x6038, 2 },
> +	[AV1E_CC_CORE_BCR] = { 0x4000 },
> +	[AV1E_CC_NOC_BCR] = { 0x5000 },
> +};
> +
> +static struct clk_alpha_pll *av1e_cc_glymur_plls[] = {
> +	&av1e_cc_pll0,
> +};
> +
> +static const u32 av1e_cc_glymur_critical_cbcrs[] = {
> +	0x6034, /* AV1E_CC_AV1E_CC_XO_CLK */
> +	0x6054, /* AV1E_CC_SLEEP_CLK */
> +};
> +
> +static const struct regmap_config av1e_cc_glymur_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0xa01c,
> +	.fast_io = true,
> +};
> +
> +static const struct qcom_cc_driver_data av1e_cc_glymur_driver_data = {
> +	.alpha_plls = av1e_cc_glymur_plls,
> +	.num_alpha_plls = ARRAY_SIZE(av1e_cc_glymur_plls),
> +	.clk_cbcrs = av1e_cc_glymur_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(av1e_cc_glymur_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc av1e_cc_glymur_desc = {
> +	.config = &av1e_cc_glymur_regmap_config,
> +	.clks = av1e_cc_glymur_clocks,
> +	.num_clks = ARRAY_SIZE(av1e_cc_glymur_clocks),
> +	.resets = av1e_cc_glymur_resets,
> +	.num_resets = ARRAY_SIZE(av1e_cc_glymur_resets),
> +	.gdscs = av1e_cc_glymur_gdscs,
> +	.num_gdscs = ARRAY_SIZE(av1e_cc_glymur_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &av1e_cc_glymur_driver_data,
> +};
> +
> +static const struct of_device_id av1e_cc_glymur_match_table[] = {
> +	{ .compatible = "qcom,glymur-av1ecc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, av1e_cc_glymur_match_table);
> +
> +static int av1e_cc_glymur_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &av1e_cc_glymur_desc);
> +}
> +
> +static struct platform_driver av1e_cc_glymur_driver = {
> +	.probe = av1e_cc_glymur_probe,
> +	.driver = {
> +		.name = "av1ecc-glymur",
> +		.of_match_table = av1e_cc_glymur_match_table,
> +	},
> +};
> +
> +module_platform_driver(av1e_cc_glymur_driver);
> +
> +MODULE_DESCRIPTION("QTI AV1ECC Glymur Driver");
> +MODULE_LICENSE("GPL");
> 

-- 
Thanks,
Taniya Das

