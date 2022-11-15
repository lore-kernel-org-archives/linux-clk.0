Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758A3C43217
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 13:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiKONNJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiKONNI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 08:13:08 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C617C2AC7E
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 05:13:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id be13so24359828lfb.4
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTB4xFkuSqDJkguPgbNRXgSTiSjC5T2+Eayiy8u0drU=;
        b=qkr1mPq/Iaq6jH68zz8NMaNhWjw1jXQNLTUA5ro/GwxRqLhvYOZZJggPfjJLkD/sDC
         OybF5JEtdGoOcSJxev4oDb3DAV/yywXLFJre0xAjokkiNWsg3uVG9YHJdmit0j0MpjIC
         eapXuzqulT4CYxV4+AsCscwvDmRIK+62394ng8bV4CSuxQL3wmriKBpy+2TApOKbthG3
         hA09F9owNUYO9l4rc+W0cwptaDo2BnaUgPk8XFlfhZwYF2sJRUzYymXKaAbwFsQc5dKc
         crN8yNqhipyN9V2aV7rBaJjk6g2aC+z9RyAwL4+U0e3b4bDXGENEaJ4Ri57Kv/Gf4fyR
         Hapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTB4xFkuSqDJkguPgbNRXgSTiSjC5T2+Eayiy8u0drU=;
        b=mP6EjWchw5bzoka8asA7Wyz7x1owGgWubnq2t/ICtpgRRMukGJyIIp5u/HgE53OAhI
         dwf68K9eE2rqle3l9TLd7Vis0BACe2SozBdIib2leEwgNlCWbI4uuOyk4WhEfbaRyhv+
         I19/eiuE0FABMrB2+nOurpRkruNp9DoDEMpxUiyEe46rShVNtsf562TLHcipvYS7k0KH
         a+/3EWSzjHYjz1VFo+ooLcFtJPKeLuJLV+6jJgO8r5UZki4Yd9ZaeTcY/oesmdBL7ezI
         LS/tVAU5iY8bBnWz1foJoi+67hgFiP8ArcogEVAvODg/cip7BvMXVUIuQsOwhL8jTmkE
         97iA==
X-Gm-Message-State: ANoB5pk0a0CDYTJHJ2+9ctLMlAze1FdFLNSg8WH/AeQHfu1dDr9hoKqP
        Su/rA2d7wYVMUX1ieFcHDOGWLg==
X-Google-Smtp-Source: AA0mqf6bmDAkHFG20vnLLPsWE6BGuUChzkPAn4GcFmO719fkh9AATz5foTHq2aVxbcn4IGkfFeB/cQ==
X-Received: by 2002:a19:645e:0:b0:4a9:e27a:1cfa with SMTP id b30-20020a19645e000000b004a9e27a1cfamr5452473lfj.147.1668517982163;
        Tue, 15 Nov 2022 05:13:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05651c169800b0026e04cc88cfsm2501210ljb.124.2022.11.15.05.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:13:01 -0800 (PST)
Message-ID: <a5d53378-51dc-a024-bbda-5dd03bbf37b3@linaro.org>
Date:   Tue, 15 Nov 2022 14:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/7] dt-bindings: usb: add the Renesas RZ/N1 USBF
 controller binding
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
 <20221114111513.1436165-5-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114111513.1436165-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/11/2022 12:15, Herve Codina wrote:
> The Renesas RZ/N1 USBF controller is an USB2.0 device controller
> (UDC) available in the Renesas r9a06g032 SoC (RZ/N1 family).

Subject: drop redundant, second "binding".

> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/usb/renesas,rzn1-usbf.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml b/Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
> new file mode 100644
> index 000000000000..b67e9cea2522
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rzn1-usbf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1 SoCs USBF (USB Function) controller binding

Drop "binding"

With two above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

