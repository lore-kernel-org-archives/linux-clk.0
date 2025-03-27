Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64E22092
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091180; cv=none; b=i+UDZJ+nQ2qufgQ4iThBhqaHqVDK5kp59bnygaHYav/UeYrH6O4Po1ZpBGe8H1lxbuicAKUBn7cQjB9te4LIdUy7iJCSI2MLOTAM/v1LFzPFkfZZQaUQM/LCiEngn3AWYix+bHWw8A8g47jO328r9gmHiCuyrqA3g/2NzNWTvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091180; c=relaxed/simple;
	bh=4zwazcHbMAN85Q5YIWO50guLLoljH2OWpw/t9rHm0X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6mWBf2cgHm5ueQQaXy9AaqJ0C1ynvtR95RdD+xlureHtYZGZW4K44TZZRAYGN+Yzu4xET2YZ8R1kuoS9+cJLfPhQMTyDh1iMFUGY9Zl+WqwMgCugfn9WplRFqg7XJYS0wvaWsRBM8bfDgpPg4+fZGsAoghurE18qPSShRm/SKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VI7bUcUZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VI7bUcUZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39127512371so720719f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743091177; x=1743695977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3LYBmOjs9vXus21YCTvRCPx8NmJYW635XOAaJkUhHA=;
        b=VI7bUcUZQDR5f3GFV9mWubVPzyf3DiiUSlJEIEldWekA99ER2YpJSU4ono7xpPU9Nc
         LM87F3AOwIgpmxkwwu0Oh6XIr+xbTGdLiuwsj5DyiFZ5z0iQX4MhPt3e9k0jZu9zaCgJ
         m6CO1O1Gtz+4lEKLSeOmZlR0Gbg0v0hov4E9FFF7797crfFH7WNexP914/SvbN8Cftd3
         2st+StrD/Noqnt/VHmvr4WcAzG8wU4ADKUIXQ8gUln8R3evGBOvxnEoCd25foTE3NAvx
         LuH7DIVUzHq3WOgiYBSmPH2v411Jt3YrHsVxXKgkN68JkGT8ijg3Nl1sQ5oza7QvqiVO
         nk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091177; x=1743695977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3LYBmOjs9vXus21YCTvRCPx8NmJYW635XOAaJkUhHA=;
        b=jgmWPznABD9jdjIfZ1SvZ9IXz0A2N40v56GQQUucyw9L2oZMSZaZ5LynXYMrXdJ36M
         tFsgo0+937NuPHYMuYF90s2pN+CZ9jCVYxbq0DzCFulxnLad4yEKV+gj/wF8UdUmrA5v
         czad1cw/9DlMTgUpFTlGmob57XCB3BQ2WZeSSzKQ4uUAFCRuMtxcU5P1Z9Ea6bjxRUPm
         JH90ubcVZu3EwVyVPRicbefnrisxrV+CEHOlSC4CbEawrMldY17KSVQsq84SRwg05alR
         w6akmtYlLbPt8uf5wxG/jYkO3uU3kmq/0GTnzKXxwPN7qyTeywhfLindLwULqPesTfkW
         4FhA==
X-Forwarded-Encrypted: i=1; AJvYcCWCB3tgdPlssJ3kyutsYqAeoxCmQ6ZudrXMzvwg5BhXgvPbeitCEsd1rChJcSzV1C1j4EOVRPEchjI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4IotnzLw0B6XP6C4YEFjzXHjUbpSk/MSbh/aQaKmMj03FBLck
	LTtTe7ATDL5ixsjMPLoblx2pv//C1g6ZYaxj2diKFdnYTkOGxxYZibDeU0MlmxE=
X-Gm-Gg: ASbGncs1DPOoQGiJ7NKkihbZn7lRgSIAOS8wjY2+5OcNEb/uQqTLxxsD6I72bC224I6
	Er8Clt2nhWFuHXW4IGWEHEMXic9OYqhOVWURgxwOqhrWIaAAh0Z1vOq0jlmIpRU1b+/cClY4jqK
	XsQRZrDPOawxvpsFzCbhCeLzY3pai8AIfSrBFZ99zC5oekxrjuIII1JLR3VgKKVLO5QBPJPQNYz
	AMivss9UVRog2imHrVGJ1hIhpxUFNUcX21TvJR2zn3wdIKPQRbjOrmAB4WS+uirUovNBkV0ZX4A
	EVwgiQQ8Y7DfPuCW0CrlqV0LQ+m9CZ2Ikf8rmG57D5M1x1yBuz59/ksZpiSJ3leRTlgSjlQQLd/
	fWAgEBwtm6w==
X-Google-Smtp-Source: AGHT+IGmDAavivcgiH2y4m4XZXDrn9ZbRWAH7pM1su/BtfNcQn1b5fqQkuccIMqTc2K2ixN2jW9vhg==
X-Received: by 2002:a05:6000:4021:b0:391:27f1:fbf8 with SMTP id ffacd0b85a97d-39ad1742f57mr3570847f8f.4.1743091176931;
        Thu, 27 Mar 2025 08:59:36 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995611sm20673037f8f.15.2025.03.27.08.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:59:36 -0700 (PDT)
Message-ID: <bd2a5cfa-5e7a-42f3-809b-eaf34ef22294@linaro.org>
Date: Thu, 27 Mar 2025 15:59:35 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-12-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-12-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/camcc-x1e80100.c | 63 +++++++++++++++++----------------------
>   1 file changed, 28 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
> index b73524ae64b1b2b1ee94ceca88b5f3b46143f20b..1f2e49c4798f33b2204b95665cc977b4a52b549a 100644
> --- a/drivers/clk/qcom/camcc-x1e80100.c
> +++ b/drivers/clk/qcom/camcc-x1e80100.c
> @@ -7,7 +7,6 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>   
>   #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> @@ -67,6 +66,7 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll0 = {
>   	.offset = 0x0,
> +	.config = &cam_cc_pll0_config,
>   	.vco_table = lucid_ole_vco,
>   	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -144,6 +144,7 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll1 = {
>   	.offset = 0x1000,
> +	.config = &cam_cc_pll1_config,
>   	.vco_table = lucid_ole_vco,
>   	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -194,6 +195,7 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll2 = {
>   	.offset = 0x2000,
> +	.config = &cam_cc_pll2_config,
>   	.vco_table = rivian_ole_vco,
>   	.num_vco = ARRAY_SIZE(rivian_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
> @@ -225,6 +227,7 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll3 = {
>   	.offset = 0x3000,
> +	.config = &cam_cc_pll3_config,
>   	.vco_table = lucid_ole_vco,
>   	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -279,6 +282,7 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll4 = {
>   	.offset = 0x4000,
> +	.config = &cam_cc_pll4_config,
>   	.vco_table = lucid_ole_vco,
>   	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -333,6 +337,7 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll6 = {
>   	.offset = 0x6000,
> +	.config = &cam_cc_pll6_config,
>   	.vco_table = lucid_ole_vco,
>   	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -387,6 +392,7 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
>   
>   static struct clk_alpha_pll cam_cc_pll8 = {
>   	.offset = 0x8000,
> +	.config = &cam_cc_pll8_config,
>   	.vco_table = lucid_ole_vco,
>   	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -2418,6 +2424,21 @@ static const struct qcom_reset_map cam_cc_x1e80100_resets[] = {
>   	[CAM_CC_SFE_0_BCR] = { 0x1327c },
>   };
>   
> +static struct clk_alpha_pll *cam_cc_x1e80100_plls[] = {
> +	&cam_cc_pll0,
> +	&cam_cc_pll1,
> +	&cam_cc_pll2,
> +	&cam_cc_pll3,
> +	&cam_cc_pll4,
> +	&cam_cc_pll6,
> +	&cam_cc_pll8,
> +};
> +
> +static u32 cam_cc_x1e80100_critical_cbcrs[] = {
> +	0x13a9c, /* CAM_CC_GDSC_CLK */
> +	0x13ab8, /* CAM_CC_SLEEP_CLK */
> +};
> +
>   static const struct regmap_config cam_cc_x1e80100_regmap_config = {
>   	.reg_bits = 32,
>   	.reg_stride = 4,
> @@ -2434,6 +2455,11 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>   	.num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>   	.gdscs = cam_cc_x1e80100_gdscs,
>   	.num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
> +	.alpha_plls = cam_cc_x1e80100_plls,
> +	.num_alpha_plls = ARRAY_SIZE(cam_cc_x1e80100_plls),
> +	.clk_cbcrs = cam_cc_x1e80100_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_x1e80100_critical_cbcrs),
> +	.use_rpm = true,
>   };
>   
>   static const struct of_device_id cam_cc_x1e80100_match_table[] = {
> @@ -2444,40 +2470,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_x1e80100_match_table);
>   
>   static int cam_cc_x1e80100_probe(struct platform_device *pdev)
>   {
> -	struct regmap *regmap;
> -	int ret;
> -
> -	ret = devm_pm_runtime_enable(&pdev->dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret)
> -		return ret;
> -
> -	regmap = qcom_cc_map(pdev, &cam_cc_x1e80100_desc);
> -	if (IS_ERR(regmap)) {
> -		pm_runtime_put(&pdev->dev);
> -		return PTR_ERR(regmap);
> -	}
> -
> -	clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> -	clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> -	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> -	clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> -	clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> -	clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> -	clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> -
> -	/* Keep clocks always enabled */
> -	qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> -
> -	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
> -
> -	pm_runtime_put(&pdev->dev);
> -
> -	return ret;
> +	return qcom_cc_probe(pdev, &cam_cc_x1e80100_desc);
>   }
>   
>   static struct platform_driver cam_cc_x1e80100_driver = {
> 

Thanks for this work.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron 
14 Plus 7441
