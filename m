Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC25BC64EBC
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238008AbiKONFo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbiKONFn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 08:05:43 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E83312AED
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 05:05:41 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s8so7167358lfc.8
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 05:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdvIIl4cgeDqGAAZabaWbNUrV+o8u8RyyIYZ5puj5yk=;
        b=qOtJaIwH5zDp2x+c7JZp5p6url0leqnsVkLXKiytCF+mj9qC/OPnLPj+LipgqD5BoI
         hfd1LAOrqW8F0caLVPawRfohG+XUQdZMRPGQDRmQndRQpOke7jigxlvXImtU0edjAQsx
         xFJGxCvvnvcm158dkvd4JFuB0TEz4P7c9P7L/CTPyZrQNGFHJlqpI8U48Ztgi5c+rysz
         mDLJ+ZjLe6xNgIuWvquFNs1ureCvY4ydvXC/UtTMJ4pAXLkC7lQuZ7fzfuguWyYRh6+5
         HhOUZ/+sGDPkLAa6p5dj7ekCJIxNILV+zs3IPIUQnORa0pK9Yb3LJq1ULLXemoB2apHk
         Nd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdvIIl4cgeDqGAAZabaWbNUrV+o8u8RyyIYZ5puj5yk=;
        b=6xVDMhy8dXaeaSPsr6JxMJeXFkEizvVU1tWfVRuXFU5jcpS+EV6UaGJJW6g1GMavC0
         AGLyyypGSA68Tx5+/znVtcEgM4QeFrKrMi5Pk150nCF8y+GIks9KgfS95YDQOvpM1pBo
         ih0LOah8IwCD+2g1hAyks8Hpdnzy4bTNxKmvrzGKLJ7bn2ICvLhho6goxeFQPKWeKUWS
         O8Cd4a4qi64rJrlAbuTPmgtFXpWMSdrpgZD7bhZtuTZEgNlX+frutwMnrzdhMCRPvi1k
         C4bvXBQrDHhb5KOZdlI+5R5vC831d29BxPnxhUQG2QcworUac2967rPiqMIoy95dU1CT
         sdew==
X-Gm-Message-State: ANoB5pmwnFrw6g0adLdkt8FBd4D4tpdbsC6TtgC6aFXcKIGZWOs1Vi8t
        BQ+D7+XydD2lEi71xNT5WxXM2w==
X-Google-Smtp-Source: AA0mqf6kInCc+A0yhclN+A1KPhxr4No2Ve/TJmp4KVoenUiZl6E/W2ygFzWNtp+0/7LIUoFw4og0aw==
X-Received: by 2002:a19:e30e:0:b0:4a2:5163:f61b with SMTP id a14-20020a19e30e000000b004a25163f61bmr5403368lfh.177.1668517539513;
        Tue, 15 Nov 2022 05:05:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e10-20020a19674a000000b0049311968ca4sm2194132lfj.261.2022.11.15.05.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:05:38 -0800 (PST)
Message-ID: <a1a7fdf4-2608-d6c9-7c7a-f8e8fae3a742@linaro.org>
Date:   Tue, 15 Nov 2022 14:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: renesas,r9a06g032-sysctrl: Add
 h2mode property
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
 <20221114111513.1436165-3-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114111513.1436165-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/11/2022 12:15, Herve Codina wrote:
> Add the h2mode property to force the USBs mode ie:
>  - 2 hosts
> or
>  - 1 host and 1 device
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/clock/renesas,r9a06g032-sysctrl.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
> index 95bf485c6cec..f9e0a58aa4fb 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
> @@ -39,6 +39,16 @@ properties:
>    '#power-domain-cells':
>      const: 0
>  
> +  renesas,h2mode:
> +    description: |
> +      Configure the USBs mode.
> +        - <0> : the USBs are in 1 host and 1 device mode.
> +        - <1> : the USBs are in 2 host mode.
> +      If the property is not present, the value used is the one already present
> +      in the CFG_USB register (from reset or set by the bootloader).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

0/1 are quite cryptic. Why not making it a string which is easy to read
and understand? Can be something like "two-hosts" and "one-host". Or
anything you find more readable...

Best regards,
Krzysztof

