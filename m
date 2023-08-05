Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA167C00528
	for <linux-clk@archiver.kernel.org>; Sat,  5 Aug 2023 20:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjHEUwa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Aug 2023 16:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjHEUw3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Aug 2023 16:52:29 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E321273A
        for <linux-clk@vger.kernel.org>; Sat,  5 Aug 2023 13:52:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso29614455e9.3
        for <linux-clk@vger.kernel.org>; Sat, 05 Aug 2023 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691268746; x=1691873546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMZ57FK/F5HfkVLTGQC4S3eZbwmC8Kg8tkKbLHOwgJU=;
        b=fQ7k4sBnsoIVWX6Rccv2pmzsDjUrD/hEX4hi511Qfd3ayuvEJSt89N1Cx89fNbVVIP
         yswyuL/YaHHd+5EHc7en9iiCw4R863j9HG3ZwIp0vRJTgdr0RzeoS7Fg890uvNHJjWHl
         G7Y84XNGZymtnnJcnUqWYYCgVcjcGnQOqQJ8WBkFcenFclZ7AxkEZjMvoFYLXO3BX4XH
         1rlSUhq+PNdVtF0LcmqlnsfeDU2GgwEodBbsT00V9yNcNjMcfgjbt1QAqMEOJ8Q8r5Mp
         GknRHJlbEAZOh4DzXjyo95/PqocXP0v4EkrYDjPP2Rm5vcpEmhPR+ibwzGbdN8KNeQBE
         4zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691268746; x=1691873546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMZ57FK/F5HfkVLTGQC4S3eZbwmC8Kg8tkKbLHOwgJU=;
        b=lvwMAcxkJrFK8sEeOeQDzs4fqlEq7ubkPirVVSsi8AB2f7m7j9Rz4iNXqVTOukC0g9
         qnBtS36cFMvY68EybouhQTOMnQxCvY483aqP8BuFzQxLqMfe1Rvt4FQPPBGdV92CIWjM
         z+YRg2ekhZRHX1K0x29Nf57uRWrn5VaJp2MN759x5Pld8hclLUynO7vjk95lPWHpFdjp
         EodQJ3Mra822hWzSKDW2aQp6X4cvo+kYkNCjh9OQiPksKwQ8YiJIHCm5odNdBqX5pTp2
         9SY6aFnVQnFUg7kgZ+pgPxY7LGVNtIdpqnPOLuNRiBwMRsv0pXwTbUdWOCbprhj/rPXT
         KtiQ==
X-Gm-Message-State: AOJu0YyZCTRtLEZ0m5dP2hNcVieYM8jM1GE6sRid/lLYqm63EhEYnKA6
        9bsfy1uSMkBkTrHp+PqMS/x3TQ==
X-Google-Smtp-Source: AGHT+IGlrHt+sxR7RnSvkI2RJnZZ+LB3aM9gw03DbVGz3kyVX5ECy+z4K5V6A9++7KFbnt6QeCDAsA==
X-Received: by 2002:a05:600c:3794:b0:3fe:2102:8085 with SMTP id o20-20020a05600c379400b003fe21028085mr3690414wmr.8.1691268745782;
        Sat, 05 Aug 2023 13:52:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id l12-20020adff48c000000b0030ada01ca78sm5946071wro.10.2023.08.05.13.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:52:25 -0700 (PDT)
Message-ID: <609d5c1d-4ef7-22d5-d951-f32dbe410906@linaro.org>
Date:   Sat, 5 Aug 2023 22:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/8] dt-bindings: clock: Add Marvell PXA1908 clock
 bindings
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de
References: <20230804-pxa1908-lkml-v3-0-8e48fca37099@skole.hr>
 <20230804-pxa1908-lkml-v3-3-8e48fca37099@skole.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230804-pxa1908-lkml-v3-3-8e48fca37099@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/08/2023 15:32, Duje Mihanović wrote:
> Add dt bindings and documentation for the Marvell PXA1908 clock
> controller.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>


> +++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2

...

> +examples:
> +  # APMU block:
> +  - |
> +    clock-controller@d4282800 {
> +      compatible = "marvell,pxa1908-apmu";
> +      reg = <0xd4282800 0x400>;
> +      #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/marvell,pxa1908.h b/include/dt-bindings/clock/marvell,pxa1908.h
> new file mode 100644
> index 000000000000..1fff3bcefd21
> --- /dev/null
> +++ b/include/dt-bindings/clock/marvell,pxa1908.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */

Any particular reason to use different BSD-3 than bindings? Not easy to
spot this difference...

Best regards,
Krzysztof

