Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4673AE18D;
	Tue, 17 Mar 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743093; cv=none; b=sMltToN1VuF4jt5y6L5Ccr7MiShtnWrbelN/2CYvqYjRTlH+BO7DMjmwlZGB94YQwXOgjCrLS7jZnZ2dWaJUkxF8gA6JEebYEZC1dSVvc0cZD7f2jiH1hLeHPnRnBICf9DuPArwdK00MIscE4t7bEvpi/45Ii9nk+Nkv9ViRkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743093; c=relaxed/simple;
	bh=al60REhvfvK2SYPZtfpzNWXjAEAkBOKTHyDcGYyYLyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDlfg8FO7vFj4kPkZ3kSX/QrchXAIWstQiS4aUDnkC5q256lImIaEEJNNKN8lXnC5zY5AGFbro8e9PIevCEizVTB+PLKxwlcv1IyaUU0rtXELe0zTL+IXimeMhJvRqegu81YNk15nXm5oc4rPgsqolpNx8e7G/VB+1J+4uZ+8Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4/VpbSM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4/VpbSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3513DC2BC9E;
	Tue, 17 Mar 2026 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773743093;
	bh=al60REhvfvK2SYPZtfpzNWXjAEAkBOKTHyDcGYyYLyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s4/VpbSMH6Rni4zawsGfzudBoK3+hS2LPfa6FWP4Wz5wWaYMO7FO6JxawhNYLQ8l+
	 wC/xU3nPM+5JwQu7CzSM1wctntbVs4pEGS1f+IAUChpNkoxsSUwkfp1i013mDYDKaM
	 PiTvPGoM2eLjREufG2DRsvH/izIjZsdNXKccE3NFQHedNgLuuEXkj3yD29L+CeHSqL
	 f95FzEtBGQPJXcKYHOg/pEGWVkblyhHpaKBl7s/g94hTnFvOljE6hWhgjobqAaP2x+
	 M1QXDix/ZBfiaUtYWMs8TUdO9tBFUdyxfXDIo5fGmN9OaAKHexE+PpiP2zRaW2F4pm
	 LP2b4MdNrOTZg==
Message-ID: <f67c126f-b5ea-43e1-9f68-c8246e641f17@kernel.org>
Date: Tue, 17 Mar 2026 11:24:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com>
 <20260317-clk-qcom-dispcc-eliza-v1-2-be4b0e4eb24a@oss.qualcomm.com>
 <bc90669a-652c-4a10-9755-f4c202506318@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <bc90669a-652c-4a10-9755-f4c202506318@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2026 11:22, Konrad Dybcio wrote:
> On 3/17/26 11:06 AM, Krzysztof Kozlowski wrote:
>> Add a drvier for the display clock controller on Qualcomm Eliza SoC,
>> which is copied from SM8750 driver plus changes:
>>
>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>> 2. Eight new HDMI clocks,
>> 3. Different PLLs (lucid and pongo).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int disp_cc_eliza_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
> 
> -> qcom_cc_desc.use_rpm
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	regmap = qcom_cc_map(pdev, &disp_cc_eliza_desc);
>> +	if (IS_ERR(regmap)) {
>> +		ret = PTR_ERR(regmap);
>> +		goto err_put_rpm;
>> +	}
>> +
>> +	clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>> +	clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
>> +	clk_pongo_elu_pll_configure(&disp_cc_pll2, regmap, &disp_cc_pll2_config);
> 
> -> qcom_cc_driver_data.alpha_plls
> 
>> +
>> +	/* Enable clock gating for MDP clocks */
>> +	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
>> +
>> +	/* Keep some clocks always-on */
>> +	qcom_branch_set_clk_en(regmap, 0xe07c); /* DISP_CC_SLEEP_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0xc00c); /* DISP_CC_MDSS_RSCC_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0xc008); /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
> 
> -> qcom_cc_driver_data.clk_regs_configure
> 

Ack, I took a bit older driver as starting point but should take Kaanapali.

Best regards,
Krzysztof
