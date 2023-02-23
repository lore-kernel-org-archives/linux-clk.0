Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC13C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 08:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbjBWI5C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 03:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbjBWI5B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 03:57:01 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31194A1D9
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 00:56:57 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l25so9618063wrb.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 00:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRdDSbS7nEkJ9kdJNqP0X8nEH0I1zPFXRhFF4w2M6FM=;
        b=uof/8xpGNMHg7iY5wJ+1UskO3GHuWWbi+LCRXKfXoZp2VNoFZYGNSfC72Z09UgZuCO
         wvvGj3qqdHqtvjdlCxmiW7a55/x93iaXFJk+1+8i+ITCkmBjBfPy/Bsw17U9V+3dNvND
         zAYnX97eEp4ZXVGmB67Pw5pkjXmKm1SmQuFMUotL0HzqbJbo8kqrONfhTbJ3APnVcQkX
         LRVXogPcFOujMToZtiqtWvsO871CuUA6fSe93FxaLsfCTqQETsXT1zARS2EKYNyXjzcs
         PlthB+V+Ieinf7X2oLasgtlIiiR3fopI6hlQxEEPE0RRdKhpCkWP9ygPo33quzqAPoY6
         Sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRdDSbS7nEkJ9kdJNqP0X8nEH0I1zPFXRhFF4w2M6FM=;
        b=glnfQVILsYx+6UXcSuML5arGrbqFHY+cdA3s96Ih53JAZMkC1kkJpdllaFCRrltUy8
         JyRK4RwJXDH7EJNvmNHD3qpNil+HmDCr3NeghVHQDvFquJrKkI8B4g6Ry22nQ3lZS0ET
         KdiR3yPclSz2raakiHcxua9h7DUMn/PYTzNZryHbMcBEc4DIddxHMnQj9ni5F5v7Q4/o
         bLC2hdB6dnK/Ts72wOwBuhFf+B0/HxkEBLqEBWxshbdaU4AF22QvZxQy9RxzvUQKhF1S
         0pZLioL7779y6fcwfmqPZ16CxLXbeYmuJszmVHEK80laM6wVp+TYZ8aiEFCSExXIbPO1
         Bskw==
X-Gm-Message-State: AO0yUKWTo9PhtIVF58eSEwLQYEbDL7qaIKm2XuT99ZjMCqqnP/VXoz6F
        OT3ez24+ETpv7/W9g2as7fP37g==
X-Google-Smtp-Source: AK7set8NKlL8SHoM9z9qqJPq+MxNrjGbRtINAlauiFot2x6JL9A+CeI+ByZ3GoT99Y+o5rWLUelBvw==
X-Received: by 2002:a5d:5f03:0:b0:2c3:be89:7c2b with SMTP id cl3-20020a5d5f03000000b002c3be897c2bmr9576815wrb.14.1677142616464;
        Thu, 23 Feb 2023 00:56:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm10760022wrp.44.2023.02.23.00.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 00:56:56 -0800 (PST)
Message-ID: <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
Date:   Thu, 23 Feb 2023 09:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] clk: starfive: Add StarFive JH7110 PLL clock
 driver
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-3-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221141147.303642-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 15:11, Xingyu Wu wrote:
> Add driver for the StarFive JH7110 PLL clock controller and
> modify the JH7110 system clock driver to rely on this PLL clocks.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


> +
> +static int jh7110_pll_clk_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct of_phandle_args args;
> +	struct regmap *pll_syscon_regmap;
> +	unsigned int idx;
> +	struct jh7110_clk_pll_priv *priv;
> +	struct jh7110_clk_pll_data *data;
> +	char *pll_name[JH7110_PLLCLK_END] = {
> +		"pll0_out",
> +		"pll1_out",
> +		"pll2_out"
> +	};
> +
> +	priv = devm_kzalloc(&pdev->dev,
> +			    struct_size(priv, data, JH7110_PLLCLK_END),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "starfive,sysreg", 0, 0, &args);

1. Wrong wrapping. Wrap code at 80 as coding style asks.

2. Why you are using syscon for normal, device MMIO operation? Your DTS
also points that this is incorrect, hacky representation of hardware.
Don't add devices to DT to fake places and then overuse syscon to fix
that fake placement. The clock is in system registers, thus it must be
there.

3. Even if this stays, why so complicated code instead of
syscon_regmap_lookup_by_phandle()?


> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse starfive,sys-syscon : %d\n", ret);

dev_err_probe and in other places as well, if applicable.


Best regards,
Krzysztof

