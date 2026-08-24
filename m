Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1837AA61
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565143; cv=none; b=IwxA/UmXmmPFhb+w7Hwj1+2jnSJE9ukOTUPUA1GsGVYWbdif9CnAaIZIR1jM1OgKnLRkyc4b5DsxQ5XnwrfyClFoX3O3FKnHKIvk9UMTK5ErCDP/X0fD23n4MY13sBmaIYUvAUmc6AZrH0OxbfIYOKPj4fKc7s49uKCmAWiJuUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565143; c=relaxed/simple;
	bh=G8YOmgtsM1pHai5T07GQVnDJ+gTFpM/SG9Zj/zKar2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqAzKOXCxgsjWlFshokrkUCaEWjl2M4snw/a2GF6KOD5cO131UCVAi9SAAZEXSu2EE0GUWISz3aGIAZB2mvHgcVfCCyViFdIn+oIcoZoAYVYsG/yn/o6RRB4+rWAiNCJs4iPwhld3nc7v0dRxzUfqm5+5bQn3BnPh5VdqNisp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtR0TXhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RuyY4dc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtR0TXhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RuyY4dc9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9WNRl2035998
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvBF0M61sE+RigWcAb/VlCXIeSNo1IdZb6Fbk2p5FtQ=; b=PtR0TXhAZ6K93Tog
	ivCcS8+LJMweBlf3yJRlZFvonQrbFey0XwijPEijPQZ20fyljIgMdnaHQcaMKb2R
	X6ZCgYfS5xBArOssK4Huh+RAx6oL45STO+/XA8+PoxYoeKTK3NUNoFtZ9vZNR1sp
	09mNr5/va76xmuJ1+OrIUQ4eoujC7Xhd2ByTefL8mN4oZ8t4PEitSh6C5dVXKpn1
	1lRZQkhcFM4nIlFEfpIIlig5kei1rr+QX38gRnejam1hQne0mGLOvOneka11sbVq
	wkCCQZ/GSlmRoQwybWFhaDVSS4a1AzH6ofQ/mviIZrHL3kLh6Yby5+OULF3yukuQ
	WYuMpQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsg2eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:52:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso3990512a91.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787565139; x=1788169939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvBF0M61sE+RigWcAb/VlCXIeSNo1IdZb6Fbk2p5FtQ=;
        b=RuyY4dc91J2cPXq50zLtRfBiheiRg7cTYPGQXPLSRxSjCmciwAt6AKy7z66nyAtaRW
         LXaS9A0C+CtNVp+Ma27YJJxAO3LSeCE/bRq1/F4we4We4f8UAdGf2s1TRUbIIi0T7ajg
         m9YEj7WFssWK1xpJsRn7T950Hjw83S7dODzA5gZmuzzQl0VYyxBth4SFkRGxiwX/VXWX
         NLKGPK9WCpL9C7D+bP0LCD+MbMTlDUfZrqQa28X8kGOzP7h0SCB1wLuWtaIdk0pwg9FW
         QoqxMyQmUlF5u5UUzsKRqLda3o6XUiSdlVNfSE5S42MOjow7jSh8r5awbsK1N3E1PrLA
         6ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565139; x=1788169939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvBF0M61sE+RigWcAb/VlCXIeSNo1IdZb6Fbk2p5FtQ=;
        b=TiXjtKRYr0JKLN1k0ipAtv5PRI8fsZFVMyeGSeP533QkpoFKtg0kT/2E7Dp8aPuFCs
         FL3SvS+o3COLF0/PLY67SLprE2YxOo3d4YJAWNZ2DHLIaYtTjJqa59LOgNjVXtSYtFAN
         rqySHKeXENM5f1OdyAdCXQJ+o3wJX+/tiJIFvepw9vRUYl38Ha3nylO4QC7pSRw/+A0J
         wO2gM5l1ehQ8iLiW0MhTUtB+HXBp2pImFQk1O7MnazpM3o1C9NuuBqvWbzpAEw9FQW8J
         QMIugYnEYtM+DLO+q4GjBX/bSqYCVzA7Rb617sJVea7ZEW4WDOBObhGUajW2KuSuZpIZ
         RPlA==
X-Forwarded-Encrypted: i=1; AHgh+Rq84Jrqxo7Nkhxf7F72EaBX43wT29NYl6SNPKq6giJUCyXeWYaPZFv5F4d2q9m/yLL7/5JVaxvgTRY=@vger.kernel.org
X-Gm-Message-State: AFuF++mu2dVtFGzf0vsJjoZNKOvmFuqRDfU0paWctiYxyOeI/ossCxls
	7Q3Pq35XCkrSK5XLhtmWzaUPeCOMtYJNoAFMTIInwZbbD45SGZLz9pT3qwekEImWJZaQOp4aT1V
	av/7xCPsV3L5KjwWxboLMUlUMP63+fs6o7vf7iqexgGT6ZQUmoLFZuL79TTX6/DE=
X-Gm-Gg: AR+sD12BO4woxGvp1Gbcxe4vLuiyuRggQAen45TXCArLq+acbKD8iqLdnQehAQDjIST
	tV525Ed1CVI9dGPckvzb6LvWJ2H915H9eoOCIIgXhAD4gseA0ShGSpsOUTWy76xLvWl4nCqevag
	BtKRQQWXZ9AFTFjQQiPJcNOxJth0NBeJrNQa6yH80U2iEM4srnDdTVd2cPqHHEJ7zcpM/bXd5ix
	eOZhEFIZuGmEHtKjRpp1igqSv5zll464XEReHYhsvaueqa/b2R8AoR37XX1BDKKpFb8PimkYLoK
	p2oBH5+8TIfidW0hEGmpved4VH6V8jVPuto0mV9v2ym2/iBG2sAKItXYAtQDaLuoVB+hb8Rg0Pw
	KYpCozQmpFLxhP+D6fjyWDJyY6syKz/KHMg==
X-Received: by 2002:a17:90b:5886:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-395dee7d5f6mr33449773a91.3.1787565138623;
        Mon, 24 Aug 2026 02:52:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5886:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-395dee7d5f6mr33449672a91.3.1787565138094;
        Mon, 24 Aug 2026 02:52:18 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e496a27esm9749465a91.2.2026.08.24.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:52:17 -0700 (PDT)
Message-ID: <906cee12-6872-429b-8356-08a53c962d9a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:22:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-heartbeat-v6-next-20260821-send-v6-0-62c5df84ce21@oss.qualcomm.com>
 <20260821-heartbeat-v6-next-20260821-send-v6-2-62c5df84ce21@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260821-heartbeat-v6-next-20260821-send-v6-2-62c5df84ce21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfXxIsPEnRKd+1o
 UfiCxe1c6SV62lKYZ0O949HXXfSwX63YSHvJv7baebsPDRUK7bbGOEYqyInYAHLYKxJKR0mOoHd
 UgQeXb1ohF5//XbAVT338B11ngnJmWk=
X-Proofpoint-ORIG-GUID: 1zbzPZ8ySzn-O-X0CeD_m3FxAhnCdjy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX7haCCiJBq5n9
 h32JC+iPdbU0gRudajvwhle38Vh+OhFlu7Sb5BuFAwo4yijj5gLGMll5hnZKlWxAO8MsumlzVgf
 JGvLT6UIKdYLVhkMi4/bffph4a5EE+JrlxC0CA8C8wx85qCdrlmHYaAc6uw/eE9GCUEDUhr3cDf
 sjD1JZasAhXDGM+GY030DbQnI4X0G7w/+EvuALYHyjJrdeHpmoRMKdxvNPpD0hmwsyC1dja6f/L
 9HiCXzOWfBM0h4En4QbugSzTJeDAFcXa76SEKyGUcyxLuC3C5wb2PsqBPEEu4e0OSeK5eiy2xTz
 6CGqSGPwejjBwrX5ztE6OgBWLzLdBoWIqD8FspmIhuV2wH9nbU+EAL8Evhq85tgmc3hEOXuqXw2
 CblVQ2rRAafN5hLc5n2IIbrql4fbN8hsUOSVA0UXJKmwSj8Xs18t3im9mTlk0cz/ztGepTmgXWs
 kKbhqnsA0zsiKM7dcUg==
X-Proofpoint-GUID: 1zbzPZ8ySzn-O-X0CeD_m3FxAhnCdjy_
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c1453 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DXzLyDNX0Fr8cL_R7gUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084


On 8/21/2026 11:26 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
>
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
>
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the other
> clocks during runtime PM resume and suspend.

Thanks for Patch.

Tested this patch on Hawi, WCD Headset Record working fine.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig        |  14 ++++
>   drivers/clk/qcom/Makefile       |   1 +
>   drivers/clk/qcom/lpass-va-csr.c | 148 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 163 insertions(+)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e07..502acd86efd6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2105,6 +2105,20 @@ config CLK_GFM_LPASS_SM8250
>   	  Support for the Glitch Free Mux (GFM) Low power audio
>             subsystem (LPASS) clocks found on SM8250 SoCs.
>   
> +config QCOM_CLK_LPASS_HEARTBEAT_PULSE
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	depends on COMMON_CLK
> +	depends on ARM64 || COMPILE_TEST
> +	select REGMAP_MMIO
> +	default m if ARCH_QCOM
> +	help
> +	  Qualcomm LPASS VA CSR block contains the rate generator hardware
> +	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
> +	  This driver models the rate generator as a clock provider so
> +	  that consumers can enable or disable it via the common clock
> +	  framework, and it can be used to synchronize the start of DMAs
> +	  and Codec Interfaces or as a periodic wakeup source for the DSP.
> +
>   config SM_VIDEOCC_8450
>   	tristate "SM8450 Video Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b8590963736a..3f6a52cc7ec7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>   obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
>   obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
> new file mode 100644
> index 000000000000..8438d000814e
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#define LPASS_RATE_GEN_CTRL		0xd000
> +#define LPASS_RATE_GEN_COUNTER_0	0xd004
> +#define LPASS_RATE_GEN_DELAY		0xd010
> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct regmap *regmap;
> +	const struct lpass_va_csr_data *data;
> +	struct clk_hw hb_hw;
> +};
> +
> +#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
> +
> +static int heartbeat_pulse_prepare(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +	int ret;
> +
> +	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
> +}
> +
> +static void heartbeat_pulse_unprepare(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_clear_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
> +}
> +
> +static int heartbeat_pulse_is_prepared(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	return regmap_test_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
> +}
> +
> +static const struct clk_ops heartbeat_pulse_ops = {
> +	.prepare = heartbeat_pulse_prepare,
> +	.unprepare = heartbeat_pulse_unprepare,
> +	.is_prepared = heartbeat_pulse_is_prepared,
> +};
> +
> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lpass_va_csr *csr;
> +	struct clk_init_data init = {
> +		.name = "lpass_heartbeat_pulse",
> +		.ops = &heartbeat_pulse_ops,
> +	};
> +	void __iomem *base;
> +	int ret;
> +
> +	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
> +	if (!csr)
> +		return -ENOMEM;
> +
> +	csr->data = of_device_get_match_data(dev);
> +	if (!csr->data)
> +		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	csr->regmap = devm_regmap_init_mmio(dev, base,
> +					    &lpass_rate_gen_regmap_config);
> +	if (IS_ERR(csr->regmap))
> +		return dev_err_probe(dev, PTR_ERR(csr->regmap),
> +				     "failed to init regmap\n");
> +
> +	csr->hb_hw.init = &init;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	ret = devm_clk_hw_register(dev, &csr->hb_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lpass_va_csr_dt_match[] = {
> +	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
> +
> +static struct platform_driver lpass_va_csr_driver = {
> +	.driver = {
> +		.name = "qcom-lpass-va-csr",
> +		.of_match_table = lpass_va_csr_dt_match,
> +	},
> +	.probe = lpass_va_csr_probe,
> +};
> +
> +module_platform_driver(lpass_va_csr_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
> +MODULE_LICENSE("GPL");
>
