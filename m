Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495819DF75
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065555; cv=none; b=XO5q/dX5lNLPNeIOOmCwRIuHfIZ6RRi0/UHB4SqkXTZGn7GF+R0MRtrf1v1zaCziDvifsuN+9b9kwuvP4XBcp2phRub4IvS3rFYAzFK36B5y5ug1e9hkAUkITrrIgxKThWXEuaDxV4dx0yQrawygd4Ez9sWywiXtvJz2KGKZgC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065555; c=relaxed/simple;
	bh=1m6EvQZk7CnET/xsgk2xQUw67afJT9DPC3/M+XzOks4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N55kbXZovqe3DFYDW6W3lmf/IBVKFKMJSetq2ISWNFC9l7TDerZWQ3iuh9xrNoE4i7vfl8c+hoO2td6xkc26angPrklIwgtYWzonGfhlAiLTw2tf68sdfzjikZf/kPKMPmcxikDUzWEBnPB/XleBZoYQ6SbIGYYvSQkUl10ijP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHKCSnSW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHKCSnSW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1cwRW017487
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IT3RuYTVnp2Xx687WWLw7TLUK5Ey0lYbGX0YVOruv0o=; b=SHKCSnSW0Gp+VD6F
	QunzsGD5WGmvBsemRnmXXhSv2SyOklw3Xo91jgIO5yt0TqBTzbBf9Slbeo1OcAzb
	bfs8Qf2DYLUKD0vKq3oEZAqiYGf5MvzfW8aNx6az3tWoFxjvuKlaSAhercWduev0
	0OFgBdQs5Rftoof0B38DL2n/SmifnM7KK0vncyLP44qZByYnZqViClkBd6HCRwS0
	jUZHW9XcruHmgoQ0OhY3e2cuWTh0CX9gwHWJdpvJ78JZzEdxAM/JFUb9kRfqfd/w
	kyXyBvJ6gqRckkasFeIdvSLHGpYtrT1PUbPznJlHHetNhOte+JaAX0sI/rP4CKOy
	NFreGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enrq9663-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:59:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7be6f7207cbso147747985a.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 03:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065551; x=1738670351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IT3RuYTVnp2Xx687WWLw7TLUK5Ey0lYbGX0YVOruv0o=;
        b=dcKV/K4W8zzjsyYQZ5yBcQlVvD7w3WJsCC0HE8H9uU+EmZWYf0pCFatz+jYMFsVQPB
         qG3Z/7JY233d8WKZc2wab1wgCVCiEoLVfhKfcSLHwnW/i8yeR0fWINsmmN6v3SQ0a4OM
         NQjNYOVk0LcdKzd8gPDOMKxG5Bxu0ZRtN4aKWF+3K7CwEVzymHJCMU175RPJXbmmji+D
         /EYkBUWfK+w2gnvLEf73trfqSW3c2WDCEtFvHNo25yRnDG8duX/S6W1t2BrNpOFW1io1
         3voCngIsHmhnS6QyijnHOAt8PxPEz1174CgABcmGgyDQHoOCjnblqQmD8MDoggL+4MVD
         bz5w==
X-Forwarded-Encrypted: i=1; AJvYcCU/5oJLQwuFZo8AD/nTBAEBY6l/Rl7kgSBgKE3EQFvbX5u9Svo5+bhYBJo+6ie4F+vZieGlNyPsgJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGVfgjG5aRbydX45rN/T2ELTYsos07SG1LpG+F0KyJJY383QS
	mIwaMOo8vuZ1apFNfRPD2UAuqNF56mwFHWYePh7VwwNAgx4tCpjZeRYoUL0yrcgvlEScjWfecsZ
	hNUI8dYzBZNC8bfQHtVGv3LrH14MDOF0/35YTIVexnPReBQzqEq0rbxUT3ftF6jORoX4=
X-Gm-Gg: ASbGncsyCpEDGBeMdy6mar5Y7NP+/Dj5bixDXKLIhLvnESEAv+Tcsb52pI7gYiTEbWL
	M7O/CqvIfJXhUjH1Ege6Vab6UYzircQA7R5wpcSSMnebi2j08j/YLpkRYD+kLPhvps8hjTKuTBX
	lBsf4369lQqFLNUXPMZPKOpYSzvtxvnJfG+YNyupVIa1f5HKaNJf5uEvqOK/zSPyhHlGm+mGL4L
	NogKetlYZ0D7oDrlIdkwPDKAEsTWV+OpeuLhT0p0U2dSvnWIZYH+eU3PExw9AYHVO8c026skuyf
	d+6OsDob4hqMqlwgdFfzDeVO8BS6QU/EJHvl4C35yhYSeJ/y5qIK8BDWwME=
X-Received: by 2002:a05:620a:394b:b0:7af:cac7:5017 with SMTP id af79cd13be357-7be8b2eaceamr1329014285a.4.1738065551373;
        Tue, 28 Jan 2025 03:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv83Kd6B3har+HbLPklJvmHeQJ0kER8RsuGuyNzTyCdOKBjiwmrgI+NRrIRlPZqXmcbLxvMQ==
X-Received: by 2002:a05:620a:394b:b0:7af:cac7:5017 with SMTP id af79cd13be357-7be8b2eaceamr1329013385a.4.1738065550983;
        Tue, 28 Jan 2025 03:59:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e63284sm780983766b.56.2025.01.28.03.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:59:10 -0800 (PST)
Message-ID: <47f7553d-74a2-4da0-a64c-cc49a2170efb@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:59:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-3-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127093128.2611247-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3GqOAR64PJKhLU2ut3xBl6Yea1gQzTYR
X-Proofpoint-ORIG-GUID: 3GqOAR64PJKhLU2ut3xBl6Yea1gQzTYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280092

On 27.01.2025 10:31 AM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---

[...]

> +#define GPLL0_CLK_RATE		800000000
> +#define CPU_NOM_CLK_RATE	1416000000
> +#define CPU_TURBO_CLK_RATE	1800000000
> +#define L3_NOM_CLK_RATE		984000000
> +#define L3_TURBO_CLK_RATE	1272000000

Please inline these values

> +
> +enum {
> +	P_XO,
> +	P_GPLL0,
> +	P_APSS_PLL_EARLY,
> +	P_L3_PLL,
> +};
> +
> +struct apss_clk {
> +	struct notifier_block cpu_clk_notifier;
> +	struct clk_hw *hw;
> +	struct device *dev;
> +	struct clk *l3_clk;
> +};
> +

> +static struct clk_branch l3_core_clk = {
> +	.halt_reg = 0x1008c,
> +	.clkr = {
> +		.enable_reg = 0x1008c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "l3_clk",
> +			.parent_hws = (const struct clk_hw *[]){
> +				&l3_clk_src.clkr.hw },

	&l3_clk_src.clkr.hw
},

> +static unsigned long get_l3_clk_from_tbl(unsigned long rate)
> +{
> +	struct clk_rcg2 *l3_rcg2 = container_of(&l3_clk_src.clkr, struct clk_rcg2, clkr);
> +	u8 max_clk = sizeof(ftbl_apss_clk_src) / sizeof(struct freq_tbl);
> +	u8 loop;
> +
> +	for (loop = 0; loop < max_clk; loop++)
> +		if (ftbl_apss_clk_src[loop].freq == rate)
> +			return l3_rcg2->freq_tbl[loop].freq;

This looks extremely explosive if anyone makes changes to the driver..

Use an OPP table in the devicetree instead

And please add a newline before the return statement

> +	return 0;
> +}
> +
> +static int cpu_clk_notifier_fn(struct notifier_block *nb, unsigned long action,
> +			       void *data)
> +{
> +	struct apss_clk *apss_ipq5424_cfg = container_of(nb, struct apss_clk, cpu_clk_notifier);
> +	struct clk_notifier_data *cnd = (struct clk_notifier_data *)data;
> +	struct device *dev = apss_ipq5424_cfg->dev;
> +	unsigned long rate = 0, l3_rate;
> +	int err = 0;

Please use 'ret'

> +
> +	dev_dbg(dev, "action:%ld old_rate:%ld new_rate:%ld\n", action,
> +		cnd->old_rate, cnd->new_rate);
> +
> +	switch (action) {
> +	case PRE_RATE_CHANGE:
> +		if (cnd->old_rate < cnd->new_rate)
> +			rate = cnd->new_rate;
> +	break;

Why are the breaks indented like this?

> +	case POST_RATE_CHANGE:
> +		if (cnd->old_rate > cnd->new_rate)
> +			rate = cnd->new_rate;
> +	break;
> +	};
> +
> +	if (!rate)
> +		goto notif_ret;

In cases like these, just return directly instead of jumping

> +
> +	l3_rate = get_l3_clk_from_tbl(rate);
> +	if (!l3_rate) {
> +		dev_err(dev, "Failed to get l3 clock rate from l3_tbl\n");
> +		return NOTIFY_BAD;
> +	}
> +
> +	err = clk_set_rate(apss_ipq5424_cfg->l3_clk, l3_rate);
> +	if (err) {
> +		dev_err(dev, "Failed to set l3 clock rate(%ld) err(%d)\n", l3_rate, err);
> +		return NOTIFY_BAD;
> +	}
> +
> +notif_ret:
> +	return NOTIFY_OK;
> +}
> +
> +static int apss_ipq5424_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct apss_clk *apss_ipq5424_cfg;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	apss_ipq5424_cfg = devm_kzalloc(&pdev->dev, sizeof(struct apss_clk), GFP_KERNEL);

Since there is no "config" in there, something like "ipq5424_apsscc" would be
more fitting

> +	if (IS_ERR_OR_NULL(apss_ipq5424_cfg))
> +		return PTR_ERR(apss_ipq5424_cfg);

https://elixir.bootlin.com/linux/v6.13/source/include/linux/device.h#L326-L329
|_
   > elixir.bootlin.com/linux/v6.13/source/drivers/base/devres.c#L819-L820

It can never throw an errno, just check for if (!apss...)

> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &apss_ipq5424_regmap_config);
> +	if (!regmap)
> +		return PTR_ERR(regmap);

devm_platform_get_and_ioremap_resource()

> +
> +	clk_alpha_pll_configure(&ipq5424_l3_pll, regmap, &l3_pll_config);
> +
> +	clk_alpha_pll_configure(&ipq5424_apss_pll, regmap, &apss_pll_config);
> +
> +	ret = qcom_cc_really_probe(dev, &apss_ipq5424_desc, regmap);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&pdev->dev, "Registered APSS & L3 clock provider\n");
> +
> +	apss_ipq5424_cfg->dev = dev;
> +	apss_ipq5424_cfg->hw = &apss_silver_clk_src.clkr.hw;
> +	apss_ipq5424_cfg->cpu_clk_notifier.notifier_call = cpu_clk_notifier_fn;
> +
> +	apss_ipq5424_cfg->l3_clk = clk_hw_get_clk(&l3_core_clk.clkr.hw, "l3_clk");
> +	if (IS_ERR(apss_ipq5424_cfg->l3_clk)) {
> +		dev_err(&pdev->dev, "Failed to get L3 clk, %ld\n",
> +			PTR_ERR(apss_ipq5424_cfg->l3_clk));
> +		return PTR_ERR(apss_ipq5424_cfg->l3_clk);
> +	}

Now that you'll use OPP, you can drop all this getting.. maybe even the
apss_ipq5424_cfg struct could be let go
> +
> +	ret = devm_clk_notifier_register(&pdev->dev, apss_ipq5424_cfg->hw->clk,
> +					 &apss_ipq5424_cfg->cpu_clk_notifier);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Just return ret instead

> +}
> +
> +static const struct of_device_id apss_ipq5424_match_table[] = {
> +	{ .compatible = "qcom,ipq5424-apss-clk" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, apss_ipq5424_match_table);
> +
> +static struct platform_driver apss_ipq5424_driver = {
> +	.probe = apss_ipq5424_probe,
> +	.driver = {
> +		.name   = "apss-ipq5424-clk",
> +		.of_match_table = apss_ipq5424_match_table,
> +	},
> +};
> +
> +module_platform_driver(apss_ipq5424_driver);
> +
> +MODULE_DESCRIPTION("QCOM APSS IPQ5424 CLK Driver");
> +MODULE_LICENSE("GPL v2");

Please don't skip running 'checkpatch'.

Konrad
