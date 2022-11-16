Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59A5C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 08:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbiKPIxX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 03:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbiKPIxQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 03:53:16 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08A21B798
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 00:53:14 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id l8so20901703ljh.13
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 00:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX8ah5T0/iLSL/Fim9YhBIFFhjs5Vth0dUWvFyZmVDU=;
        b=jNEtxr4pTo9hmm5t6/4vMoMHAniQd8GdAsih9IKTUaPbRAqjHUkwPvHmOBPU6pO1ON
         w1twDWAM0S9vxqiIWtbY3Wo/xcxa3a6pHXhAHlWAWpppgWetykXE/x/AzPvGPJLYaolw
         eVFVDld2SeDfvCRBZweHdb2rYUDWRDzXDuGaa9EHZpafgiBs4IxkzsLD7TtJG13O7n7C
         8GMuz48ywlFM0bBOFJGXdj9ujt13UuoypDpVxrn/VHMgmr/KeC2P+d9fDpS26spREQbi
         /Po08FUIdXT5rEr0XjyUbz5z2pwZlAnFE+b+vBmFzWHadtYOB7uC96oN3/gsnnfBzgYF
         YRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX8ah5T0/iLSL/Fim9YhBIFFhjs5Vth0dUWvFyZmVDU=;
        b=Y9CEaNhtUxoGChuvA6QgNyMCCfhCpsyP56j8p8e2GGf0cp9kxjkvmLBMYelWHU76N2
         H9XADvjdgoc6+HZkVNyn/32nTPGgDOG+aBZz6piixZj1PEqNcS6PwtBKgXBIha6OqCxn
         MKnRXI5YXMNBYwt4mEZWzWPrDMTC9j+bkNYJdL079H6M4TvnAvuojvhYgNDYOzVN4ksh
         +6D4xAyhZ4iZaE1fh7zdbdheIue0IFazBNsUx99FSk3WVTleiCr6V0O+LtuHxJ2ipCAl
         k5VX0/2r4H0PfBiE1X3VV4cvObzi8YnioZ7/LZS8BI+XuD7QC9qko2TcnjFZT0+TSfqg
         78vA==
X-Gm-Message-State: ANoB5pnPNIWyKIcpO/Qq//G2s4AjzANlQVjIbwmE0qw2bANYfkoin0jC
        y8ZoiGISuesgeIKT+VzFEpzqOw==
X-Google-Smtp-Source: AA0mqf6EY9pQr2FuRTG5fxcDvh9Lu1gBIaJ6jne60X3dd+vg0TXoj0wnJKITmss8jN64NFFLCiAg/g==
X-Received: by 2002:a2e:97c4:0:b0:277:5ce7:3411 with SMTP id m4-20020a2e97c4000000b002775ce73411mr7377186ljj.37.1668588793067;
        Wed, 16 Nov 2022 00:53:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a2e8e6e000000b0026bf0d71b1esm2893138ljk.93.2022.11.16.00.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:53:12 -0800 (PST)
Message-ID: <ad644e66-2443-3315-7e7b-e808a431638c@linaro.org>
Date:   Wed, 16 Nov 2022 09:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Add bindings for Renesas ProXO
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be
References: <20221115233749.10161-1-alexander.helms.jy@renesas.com>
 <20221115233749.10161-2-alexander.helms.jy@renesas.com>
 <83492f7f-1217-69aa-8b38-ec1f08995832@linaro.org>
In-Reply-To: <83492f7f-1217-69aa-8b38-ec1f08995832@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/11/2022 09:50, Krzysztof Kozlowski wrote:

>> +
>> +  renesas,crystal-frequency-hz:
>> +    description: Internal crystal frequency, default is 50000000 (50MHz)
> 
> If it is internal, then it is fixed, right? Embedded in the chip, always
> the same. Why do you need to specify it?
> 

BTW, this ignores Rob's comment, so go back to it.

Best regards,
Krzysztof

