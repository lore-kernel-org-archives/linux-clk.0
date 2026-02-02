Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE28309EF2
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061182; cv=none; b=qLFUMPTqpj8l184cfgozugy/OLqJ8cg8JRIKOEAn/oPAcnUfWIa8nVx9AHmyojqv32OuEafgm1tQT15ypbRQltBmzYuwkSWkc63rq7iUUyHFKGAPum0K/npy0NzN7+RjyVTgZbuVXj6HpuKU9st15K0AXJ99uV9uLX3GJ3pKXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061182; c=relaxed/simple;
	bh=pt4kShmmoCd3mgoMo2uPMiVLNAM/T7idh2I97ecTmso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGeeseOJq/29Fg3wI/BXvYWRCimJTNMukeq3CWXvfnIj6JmEESREVljlHURe1n58DKieDesXQWtxjaF72grhaIG9mReNJ7MHok1gROYE01oF4PBsVIaKEcWuiRWyKAnvS+Var5nr+/weLSD+ZfU4pbwBo1MoPN6YNZ7SNg+U5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pt9aBDWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZsyQJYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pt9aBDWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZsyQJYv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612HSv2I3744582
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 19:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zk1ULsaiSOs9L7KZAkb1H21D
	x8Ea4YpAW8YrsTNEF04=; b=Pt9aBDWc/m5oCzFPiZ8cOjG2bdTuFcxUx5uHkmLw
	GksTBfw4IYO9+q2ChSSXqN3rrcHEVRtEEJycxEBTOemNszrCQLfrIsXVFDeMXiCu
	5hkWy0k3NEB4SZ5uxX+cJ/ycERvTqrZUdq0SFRal+Qz8ILPYmO7xiO9e9j2Sw+qs
	Ze92RoZvVwM0Rb6TeiI05rvElm8VkI/j3d2dkTebO4JuJP33Gg4U79ADMCN3UBXl
	xPizGyVCjY6wV732p1fMIpjmLG2Qu+euRqcAjic6FNUlhpK5znezAAIvhGhjeowc
	9z45SKFoQzMpZ8PCn75EhE7pQPzBkIwLgh0bJ4LVP7dODQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0sk8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 19:39:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c277fe676eso1461134485a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770061178; x=1770665978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk1ULsaiSOs9L7KZAkb1H21Dx8Ea4YpAW8YrsTNEF04=;
        b=eZsyQJYvzFCfkLjtritqDwVW5sY6+YsMZ5Dx/dTYyPDhRjGvfx7HfLd6NCjykHjTC+
         Pk2l7ddIo56W0dI7BH/LWuyDeliqDdMNuqwneHYDz6RfXDZ2qJ0p1Kz4A/0SzdWp5pKG
         8jIwfkbGeDe0XbfJtV2WDd1iWa9C1I/8KLI+5fRZMQ9YBUNAO4D46llR5mZqmHN73nyJ
         wgqdklHR225o2Glr2/Mz1tBhgugfXph5F1O7xfdcjjLdYvHWVMtLYm7y9qxH436UM3Cr
         FJMuztOsMx+uQv3+SCmyp4Acy8pTvebvvNhdIkA4YCJc5/1J6waEYzFdgTKP6i+ZTe24
         ey3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061178; x=1770665978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk1ULsaiSOs9L7KZAkb1H21Dx8Ea4YpAW8YrsTNEF04=;
        b=gyyFLTE3twyKOs8XSAvEkieImuXs0gyHiE9iG5ag1sMf7eaWLSahi9frI38RQ+s2bv
         O3V5HQ+CjaAIAkN+St8Y4GTe+XARowrqY69p2WS/3/CnGiawzUDDgR+YZ4/vfN9azm+m
         cqSJAUZKgaBArCOpV471/y8/qUOwI6Crze0A/0KqYpT6tn5gHE6Jva+89iIpOt6IKCCS
         /skbCCBVYI4BlCYE1wPOCgPgue0CUcA6KUDB0hAeiFYcgLZ/cy+txuTdZQy2xGHPYL+f
         gZJOsfK7/bH3mMoGo9QcWb+8Ym8k9JURNAznyFIZKtrlE1Vxk1HifxgXwxgbOB+MRMg8
         OzxA==
X-Forwarded-Encrypted: i=1; AJvYcCUmefEtUKA0r/0tnRJmYDFLQh1oyp/NoMDCQ/Py+qI+9tFsX/MCjl5xGa4HvXCu/kyCvEmb7GPe8Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzqSkRWhUfUB0moxKdNZK1zmpJ99avow3CySgFHzdhbr7gsKz
	cxFkt9cEDQfGz/CmVqJx++OoSBYJL8uByJYyHA6Iw5ra4Gjeb3GBFwXoql71jiKxmY6MzHPV9SB
	Jj56XvIHn2Ktz6QH4jytnWsCvVqbHl3gwd0g9OAfUzBSgN8VrDHC2bj5njSnFraY=
X-Gm-Gg: AZuq6aLsCsLLS+IyrgWHdpoX0Zt0o6comCwDimE+aMbnzw4UkRfaDPfEuRMtnWY+4OU
	mKrgwYr2lTTyrzsqzSbw3sYoKcmeBiYKsxHtj+SR4yAsEMsJR5ZuGofobNWpdIuCGmJYOW701WS
	C2u8htHpr2SmUaAlwyU9fqL1vfoC7S/B5ZFgTzHrwWwAh3BMHy1cv5qMlQ/Oe572rjLVku0shW7
	0Mc4xJB2E8nrm5FOSzB9N8b3zvfefn4kovfzP396cmaeUWCHBjkSbz/B1zRidySMs51LFvL4NxF
	Kp3FN1OidGYPAg3YYCsU9vQPcnrtIRBeV6eLjkZPUtI3lPjqS36Fr3rOJdxhGeejVgvIxAO8jun
	k08l1Om8ibDZWX9D+qL9Hu2T8ap2Ji494abvVIukzhuxahsu9OByKZs3uSP95vOo3wpI02WavAv
	Ji2K+zDV1XqPMJGhI/WNusPxg=
X-Received: by 2002:a05:620a:440b:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c9eb32dfc5mr1640238285a.76.1770061177836;
        Mon, 02 Feb 2026 11:39:37 -0800 (PST)
X-Received: by 2002:a05:620a:440b:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c9eb32dfc5mr1640234985a.76.1770061177333;
        Mon, 02 Feb 2026 11:39:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0748993esm3734670e87.37.2026.02.02.11.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:39:36 -0800 (PST)
Date: Mon, 2 Feb 2026 21:39:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/8] pinctrl: qcom: Allow exposing reference clocks
 living in TLMM reg space
Message-ID: <xkndkbp6w7xh23wc4xd2yjakiic5kcwviwcgi3vq4quct2z4tu@m7dxfub5ike7>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2AqGNYy1hAzbraDlickX1BPmQIMVpXj1
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980fd7a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2tca-NSePewhJHxpEWQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MyBTYWx0ZWRfX1YlU8Czu57K+
 c5vu9hhqQUmAP3d6A0fH/IbcXCMyiGD3JPnDX6xMrjMEdWAotj7kUH/3nyyW92FFmiEbY8gg8fr
 xOjA95Y3r2rQPLTkJbw0JirevuLZKlg7U7DXysLAfZqhT/szz2/TujYlQBbKlmRz7K3kgWeQgQ0
 akQ/dP5xhhvHl6xa4kPpF0BLkwxDyqQ1QY9d/etttqfC6g0uNQWU6QsJ0fduzQ3xBTfOK8/w8T8
 XIeS6MchC1EGcoe6ph6QhjHAqyGp0dAFkGZGcMouxPZgT1DiMSMFmCjV7EWiYyAglOQIm6zZeFU
 CoS7iO0ILEg926GLbmn7W4yLVZnt8mEv9/NvgAcP+v5BHNRAb6QHsFRh8JuWpVSQfunwkW4OXIu
 2JzxXOs1Aa9sGsGvOi7gBUr8+l+pqbyc7k/nkYM3NP2g7qqkXjMSoXGLv6XvvnjCNVXrHV8Enh5
 Ozd4PsgdhIThvyuVqlw==
X-Proofpoint-GUID: 2AqGNYy1hAzbraDlickX1BPmQIMVpXj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020153

On Mon, Feb 02, 2026 at 03:57:35PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain platforms (at least SM8750) had a number of registers
> (responsible for gating refclk output to various consumers) moved to
> TLMM. They're simple on/off toggles.
> 
> Expose them from the msm-pinctrl driver to allow for a reasonable DT
> representation.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 92 ++++++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h | 14 ++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index e99871b90ab9..1a52431a8605 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2013, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/gpio/driver.h>
> @@ -16,6 +17,7 @@
>  #include <linux/pm.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/reboot.h>
> +#include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -80,6 +82,7 @@ struct msm_pinctrl {
>  	const struct msm_pinctrl_soc_data *soc;
>  	void __iomem *regs[MAX_NR_TILES];
>  	u32 phys_base[MAX_NR_TILES];
> +	struct ref_clk ref_clks[];
>  };
>  
>  #define MSM_ACCESSOR(name) \
> @@ -1525,9 +1528,69 @@ SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops, msm_pinctrl_suspend,
>  
>  EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
>  
> +static int clkref_enable(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +	u32 val;
> +
> +	regmap_write(rclk->regmap, rclk->init.offset, BIT(0));
> +	udelay(10);
> +
> +	regmap_read(rclk->regmap, rclk->init.offset, &val);
> +
> +	return (val & BIT(0)) ? 0 : -EINVAL;
> +}
> +
> +static void clkref_disable(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +
> +	regmap_write(rclk->regmap, rclk->init.offset, 0);
> +
> +	udelay(10);
> +}
> +
> +static int clkref_is_enabled(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +	u32 val;
> +
> +	regmap_read(rclk->regmap, rclk->init.offset, &val);
> +
> +	return !!val;
> +}
> +
> +static const struct clk_ops clkref_ops = {
> +	.enable = clkref_enable,
> +	.disable = clkref_disable,
> +	.is_enabled = clkref_is_enabled,
> +};
> +
> +static struct clk_hw *msm_pinctrl_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct msm_pinctrl *pctrl = data;
> +	u32 idx = clkspec->args[0];
> +
> +	if (idx >= pctrl->soc->num_ref_clks)
> +		return ERR_PTR(-EINVAL);
> +
> +	return &pctrl->ref_clks[idx].hw;
> +}
> +
> +static const struct clk_parent_data clkref_parent_data = {
> +	.index = 0, /* RPM(h) XO clock */
> +};
> +
> +static const struct regmap_config clkref_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	struct device *dev = &pdev->dev;
>  	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
> @@ -1595,6 +1658,35 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> +	if (soc_data->num_ref_clks) {
> +		struct regmap *regmap = devm_regmap_init_mmio(dev, pctrl->regs[0],
> +							      &clkref_regmap_config);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +
> +		for (int i = 0; i < soc_data->num_ref_clks; i++) {
> +			struct clk_hw *hw = &pctrl->ref_clks[i].hw;
> +			struct clk_init_data init = { };
> +
> +			init.name = pctrl->soc->ref_clks[i]->name;
> +			init.parent_data = &clkref_parent_data;
> +			init.num_parents = 1;
> +			init.ops = &clkref_ops;
> +			hw->init = &init;
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +			if (ret)
> +				return dev_err_probe(dev, ret, "Couldn't register clock %s\n",
> +						     init.name);
> +
> +			pctrl->ref_clks[i].regmap = regmap;

This will access beyond the end of the allocated chunk, because you
haven't extended pctrl allocation.

> +		}
> +
> +		ret = devm_of_clk_add_hw_provider(dev, msm_pinctrl_clk_get, pctrl);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Couldn't register clk provider\n");
> +	}
> +
>  	platform_set_drvdata(pdev, pctrl);
>  
>  	dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n");
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 4625fa5320a9..213cc789711d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -5,6 +5,7 @@
>  #ifndef __PINCTRL_MSM_H__
>  #define __PINCTRL_MSM_H__
>  
> +#include <linux/clk-provider.h>
>  #include <linux/pm.h>
>  #include <linux/types.h>
>  
> @@ -129,6 +130,17 @@ struct msm_gpio_wakeirq_map {
>  	unsigned int wakeirq;
>  };
>  
> +struct ref_clk_init_data {
> +	const char * const name;
> +	u32 offset;
> +};
> +
> +struct ref_clk {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +	struct ref_clk_init_data init;
> +};
> +
>  /**
>   * struct msm_pinctrl_soc_data - Qualcomm pin controller driver configuration
>   * @pins:	    An array describing all pins the pin controller affects.
> @@ -170,6 +182,8 @@ struct msm_pinctrl_soc_data {
>  	bool wakeirq_dual_edge_errata;
>  	unsigned int gpio_func;
>  	unsigned int egpio_func;
> +	const struct ref_clk_init_data **ref_clks;
> +	unsigned int num_ref_clks;
>  };
>  
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
