Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E854CCA47C
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jun 2022 12:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243300AbiFGMCZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243301AbiFGMCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jun 2022 08:02:23 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E64D1572C
        for <linux-clk@vger.kernel.org>; Tue,  7 Jun 2022 05:02:22 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id h23so23644979ejj.12
        for <linux-clk@vger.kernel.org>; Tue, 07 Jun 2022 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2zKuan/jhAX3A2Hdr1EYY7YvJVTUTaaQGbbK7GiBIAY=;
        b=BYSoUTcYNzXYREenAq5WuhMq77F78MMKa/95jv78RnMpGUJCN6WFcW09EL8IZhC7nL
         1i5ZcYUKNUmxEkKxF0cZVnEE9gx6N6+gIt6q4pcK6GWB7QNL+bDEaqoC3CbfGpwzIL0F
         Ry7N5Lo0Iac5uAy7OATWwqjpJOkVAzTKXSYqbOaMXb/s1pG7AiQh8w5+Wcb2cYSdWVPq
         yypnNnAy9NR9SU4IekQ/bpONQNbhNI57VpG699BSU66vEBBSrPYLct5mXVSiedPoLAOQ
         +43wI0ztEc2Vz5DyCXKzxhvH8cGeSazFY6tzTJ7F9bxeYHMKTXpVOqtzH/fFlGXc5u1j
         JzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2zKuan/jhAX3A2Hdr1EYY7YvJVTUTaaQGbbK7GiBIAY=;
        b=c98sOv1TDr002SVaaq2x3jYd0cEAaxpOwYi2rKiCa9/7ySYjsMx2VHlau7ernunfLy
         NHPLw2bRvrxE/7dkXoE4uD5dCNi2KrB1BnNZ4aavAhmtFjPbLqVkxvtVlx+hb2Nfudya
         4ipBlcSBfn3HKBzECSrWOW3a/4THo9Rahw1+ih8HrtrNc+7YUxHGkebZQ0ZChnyBH1nA
         uY9YWML7s8Y0ci+el3C181GrNf4MnIdovvMUxm1zAWPgKhhtUFr86vo7SbiXTeA8Re7k
         NeO1zCQnblq2FARpVcUsVM/cagZOBYYYjv871xl79Qr7Dq2HPJCb8KQUEfjIrVzTwlUu
         W8/A==
X-Gm-Message-State: AOAM531kNHSm9CAYtrlqT/PSDCSz8AKiTq1MTWxIFhME7y6d2JwoAZV1
        62AmPjIWF69ks++cObngLnz6yw==
X-Google-Smtp-Source: ABdhPJzyzhCbH0aRCnoNsl2kXIEk2elKa3s5CRkcJOZswzVuspuW5H+8i2qQuzuxCq81eEpr83XarA==
X-Received: by 2002:a17:906:685:b0:6fa:8e17:e9b5 with SMTP id u5-20020a170906068500b006fa8e17e9b5mr27657846ejb.522.1654603331838;
        Tue, 07 Jun 2022 05:02:11 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o7-20020a50fd87000000b0042dc25fdf5bsm10189078edt.29.2022.06.07.05.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:02:10 -0700 (PDT)
Message-ID: <fc7a6f0e-e93d-a645-8078-2d747c4208d0@linaro.org>
Date:   Tue, 7 Jun 2022 14:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v17 10/10] ARM: dts: Add Sunplus SP7021-Demo-V3 board
 device tree
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
        olof@lixom.net, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1654565776.git.qinjian@cqplus1.com>
 <e54fac0acbcedddb37a572e47face7edbacbec5d.1654565776.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e54fac0acbcedddb37a572e47face7edbacbec5d.1654565776.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2022 03:58, Qin Jian wrote:
> Add the basic support for Sunplus SP7021-Demo-V3 board.
> 
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---
> Fix the comments from Krzysztof.
> ---

> +
> +		pctl: pinctl@9c000100 {

Wrong node name - the schema requires "pinctrl" or "pinmux".

> +			compatible = "sunplus,sp7021-pctl";
> +			reg = <0x9C000100 0x100>,
> +			      <0x9C000300 0x100>,
> +			      <0x9C0032e4 0x1C>,
> +			      <0x9C000080 0x20>;
> +			reg-names = "moon2", "gpioxt", "first", "moon1";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			clocks = <&clkc CLK_GPIO>;
> +			resets = <&rstc RST_GPIO>;
> +
> +			leds_pins: pinmux_gpio_leds-pins {
> +				sunplus,pins = < SPPCTL_IOPAD(0,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L_OUT) >;
> +			};
> +
> +			emmc_pins: emmc-pins {
> +				function = "CARD0_EMMC";
> +				groups = "CARD0_EMMC";
> +			};
> +
> +			sdcard-pins {
> +				function = "SD_CARD";
> +				groups = "SD_CARD";
> +				sunplus,pins = < SPPCTL_IOPAD(91, SPPCTL_PCTL_G_GPIO, 0, 0) >;
> +			};
> +
> +			emac_pins: pinmux_emac_demo_board_v3-pins {
> +				sunplus,pins = <
> +					SPPCTL_IOPAD(49,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_CLK_OUT,0)
> +					SPPCTL_IOPAD(44,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDC,0)
> +					SPPCTL_IOPAD(43,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDIO,0)
> +					SPPCTL_IOPAD(52,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXEN,0)
> +					SPPCTL_IOPAD(50,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD0,0)
> +					SPPCTL_IOPAD(51,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD1,0)
> +					SPPCTL_IOPAD(46,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_CRSDV,0)
> +					SPPCTL_IOPAD(47,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD0,0)
> +					SPPCTL_IOPAD(48,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD1,0)
> +					SPPCTL_IOPAD(45,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXER,0)
> +					SPPCTL_IOPAD(59,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXEN,0)
> +					SPPCTL_IOPAD(57,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD0,0)
> +					SPPCTL_IOPAD(58,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD1,0)
> +					SPPCTL_IOPAD(54,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_CRSDV,0)
> +					SPPCTL_IOPAD(55,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD0,0)
> +					SPPCTL_IOPAD(56,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD1,0)
> +					SPPCTL_IOPAD(53,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXER,0)
> +				>;
> +				sunplus,zerofunc = <
> +					MUXF_L2SW_LED_FLASH0
> +					MUXF_L2SW_LED_FLASH1
> +					MUXF_L2SW_LED_ON0
> +					MUXF_L2SW_LED_ON1
> +					MUXF_DAISY_MODE
> +				>;
> +			};
> +
> +			uart0_pins: pinmux_uart0-pins {
> +				function = "UA0";
> +				groups = "UA0";
> +			};
> +
> +			uart1_pins: pinmux_uart1-pins {

No underscores in node names.


Best regards,
Krzysztof
