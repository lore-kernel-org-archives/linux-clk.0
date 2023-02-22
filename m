Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DF7C6379F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 09:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbjBVJKC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 04:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjBVJJ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 04:09:58 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1912036FCD
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 01:09:57 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r7so6817708wrz.6
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ubuy4lrHVayY+gCmE+zSECXr6/1O7hAoJ2UbRAjtNSw=;
        b=GaNiGUYdc/5Rd9TgV8ZhJyQgKwb86qxML5ImgRwqDaILUvc4RQMMqYQ1Ai+6aFMQNh
         alvxIy7fdDFomBJnMqUeuR5cLOGJBNA9DoFr/fIvIFf20jIrYJfMFOaq9lGx7anYIFon
         7OP/fuhru9ehYV1ikjg2StHR0CJ6lWXtMsLwSxfG8OpDtVQ2CKgYrw69ZJmCVHo8XTay
         MBHBGZIQTgXy/WfOe1/aKWNpOdcMKAoorL+JPAjq3PTvM12BvD75cKSGOfZXxLDP6XmK
         /3vHfqDswB7Ivmp7wPDcBPL3NtmoglTBPGZbOP7WyYE0N4eFSmCkKPR2yVsX46u+OZCf
         RJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubuy4lrHVayY+gCmE+zSECXr6/1O7hAoJ2UbRAjtNSw=;
        b=gVPaGoePqJoYzkJgHNLpbJYfBquBfiZ7araOGQgcGgsG5u5MPl5Ga0QLuiSVl2GD+B
         WK7ZQyotQXZai1a15MYCKcd9i75W0ikXMhjpJDJyeP+n3eTIKE94Dv7Uw8fKml16SP+x
         AVhm3kgPalYK2sO3w2po/WMzY5T5uQKRr+fkW+57jtN8wD31HdQINdFCoeN4J0KbX9iS
         6Nt2Hcy5KSDIKH0HC1/lWr+U9keqkSrqdiulWsC53WWh3tn635gZGf2PTCfjbXWaheAe
         zgwG7Ad6EBJNd7wy9JhW9jT59tUjx/coK6w6euH+UwtEDEdgLIwkKsOshnmF4AZaLimn
         s7Kg==
X-Gm-Message-State: AO0yUKVieEq0f1I+fH1YM6il1RgvF3j4L37477CfBythmXdhRawMLPVe
        bR3sSumcEdwJMgq7vjsVHHZqyg==
X-Google-Smtp-Source: AK7set9dCMxJ/Z20zUDFqH3zxjNit+AwoLo+j7n6AMy1qGnV0bAqTf0janE3/tVP+eAS5g+i3WOkRg==
X-Received: by 2002:a05:6000:18a5:b0:2c3:d032:5b29 with SMTP id b5-20020a05600018a500b002c3d0325b29mr7485828wri.12.1677056995564;
        Wed, 22 Feb 2023 01:09:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u4-20020adfed44000000b002c706c754fesm3425292wro.32.2023.02.22.01.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:09:55 -0800 (PST)
Message-ID: <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
Date:   Wed, 22 Feb 2023 10:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add PLL clock node
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
 <20230221141147.303642-4-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221141147.303642-4-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 15:11, Xingyu Wu wrote:
> Add the PLL clock node for the Starfive JH7110 SoC and
> modify the SYSCRG node to add PLL clocks.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index b6612c53d0d2..0cb8d86ebce5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -461,12 +461,16 @@ syscrg: clock-controller@13020000 {
>  				 <&gmac1_rgmii_rxin>,
>  				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>  				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -				 <&tdm_ext>, <&mclk_ext>;
> +				 <&tdm_ext>, <&mclk_ext>,
> +				 <&pllclk JH7110_CLK_PLL0_OUT>,
> +				 <&pllclk JH7110_CLK_PLL1_OUT>,
> +				 <&pllclk JH7110_CLK_PLL2_OUT>;
>  			clock-names = "osc", "gmac1_rmii_refin",
>  				      "gmac1_rgmii_rxin",
>  				      "i2stx_bclk_ext", "i2stx_lrck_ext",
>  				      "i2srx_bclk_ext", "i2srx_lrck_ext",
> -				      "tdm_ext", "mclk_ext";
> +				      "tdm_ext", "mclk_ext",
> +				      "pll0_out", "pll1_out", "pll2_out";
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  		};
> @@ -476,6 +480,13 @@ sys_syscon: syscon@13030000 {
>  			reg = <0x0 0x13030000 0x0 0x1000>;
>  		};
>  
> +		pllclk: pll-clock-controller {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions). You should see here warnings of mixing non-MMIO nodes
in MMIO-bus.

Best regards,
Krzysztof

