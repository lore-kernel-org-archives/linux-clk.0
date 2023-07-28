Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02606C04A94
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 07:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbjG1HTD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 03:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbjG1HSu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 03:18:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F305212A
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 00:18:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5221f193817so2285972a12.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690528727; x=1691133527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFRs+1l4ttYgce/W/Q/lR0//anrGUYTWZshXgYuQpfM=;
        b=X+8YpOCRlNu+CrYzZ9s51R51phORgLLkvU1YXhrdW4w3DQXRasewx+yxyK/GVhvqv0
         m6wo2m08SQArbieyg2c9eHYamZfJHMvQ9UMYU4EX7bqS7UsOWwi2wSpsgeopvZLgt1RD
         w2LMTxdQQrn6oenHpc2ZPpAlYtMuDy+TsEYOIo8gyykcJqYmkCtkC05G3M+MZvhuZeZn
         MwraUPRQUDxjDLIyH0g2yPlWHU/fQLHCbpDH4pLVw+2Iwm+HolXeILpXhjvWOcXJPBnE
         ZdtTKK9oXIu1mRsBQDqmTgeylHBOBDnikFUMkUw2GqVA3KYLHHoLXnJ7hsaTn2NAuudZ
         xyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690528727; x=1691133527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFRs+1l4ttYgce/W/Q/lR0//anrGUYTWZshXgYuQpfM=;
        b=Bg3jVjzR5k8LiNJHf/ahVICBbTqGnuS/38/qFH4hY6MLv1VfByPXxqcfOTrldMD2Gx
         joShElhgrO8zGtZ9ZdDcRFDshbaVrBQvjqlvzl3ZKe8TK2r/u9ZqSTdvn00o9NJ+hjvE
         VgBMQVB6eOFzfciWoQZNKEdAKwCKpVSens3KQZjwv7oQuwiWIDVc0Uhn+oXE/y2RHD/E
         2cv3kGOaMrKtzG2X7d9equcw6u7Sx3z3am9BfQgz8r8ESU23qNKaWErnOCMGD9eb0vb1
         3uP9uFq8kDtNnIWsc/T1ZquZHQNmFel39d+reOXE/xFDti6ilp7luuGNq58jeMmPZNgG
         qHCQ==
X-Gm-Message-State: ABy/qLb9Pig336nERSOW3NGm5IQABR35Pmvv95QkDXsNdbuyFStDhka3
        4um8UHQkLLpUdKFiCa0MDA+mVw==
X-Google-Smtp-Source: APBJJlHB7YcDxfEFdwmeU91iDamcQPeuv4jgYP8CBYnnw95qVTyfL/9+3ouqOSWZtgQ1H53Yh82/3w==
X-Received: by 2002:aa7:df89:0:b0:522:3aae:c69b with SMTP id b9-20020aa7df89000000b005223aaec69bmr918747edy.20.1690528727494;
        Fri, 28 Jul 2023 00:18:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e8-20020a056402148800b0052227c4384esm1467532edv.34.2023.07.28.00.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:18:46 -0700 (PDT)
Message-ID: <fe60d09a-aa79-f3b9-cf9d-e8ae8ff58d09@linaro.org>
Date:   Fri, 28 Jul 2023 09:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] dt-bindings: clock: Add Marvell PXA1908 clock
 bindings
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.com
References: <20230727162909.6031-1-duje.mihanovic@skole.hr>
 <20230727162909.6031-5-duje.mihanovic@skole.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727162909.6031-5-duje.mihanovic@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2023 18:29, Duje Mihanović wrote:
> Add dt bindings and documentation for the Marvell PXA1908 clock
> controller.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---

...

> +/* apb (apbc) peripherals */
> +#define PXA1908_CLK_UART0		1
> +#define PXA1908_CLK_UART1		2
> +#define PXA1908_CLK_GPIO		3
> +#define PXA1908_CLK_PWM0		4
> +#define PXA1908_CLK_PWM1		5
> +#define PXA1908_CLK_PWM2		6
> +#define PXA1908_CLK_PWM3		7
> +#define PXA1908_CLK_SSP0		8
> +#define PXA1908_CLK_SSP1		9
> +#define PXA1908_CLK_IPC_RST		10
> +#define PXA1908_CLK_RTC			11
> +#define PXA1908_CLK_TWSI0		12
> +#define PXA1908_CLK_KPC			13
> +#define PXA1908_CLK_SWJTAG		17
> +#define PXA1908_CLK_SSP2		20
> +#define PXA1908_CLK_TWSI1		25
> +#define PXA1908_CLK_THERMAL		28
> +#define PXA1908_CLK_TWSI3		29
> +#define PXA1908_APBC_NR_CLKS		48
> +
> +/* apb (apbcp) peripherals */
> +#define PXA1908_CLK_UART2		7
> +#define PXA1908_CLK_TWSI2		10
> +#define PXA1908_CLK_AICER		14
> +#define PXA1908_APBCP_NR_CLKS		14
> +
> +/* axi (apmu) peripherals */
> +#define PXA1908_CLK_CCIC1		9
> +#define PXA1908_CLK_ISP			14

Why do you have gaps between IDs? The clock IDs are supposed to be
continuous, otherwise it is not an ID.

> +#define PXA1908_CLK_GATE_CTRL		16

Best regards,
Krzysztof

