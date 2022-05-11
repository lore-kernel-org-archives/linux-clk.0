Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C669C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 16:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343827AbiEKQIC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 12:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiEKQIB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 12:08:01 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481811FD1F9
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 09:07:57 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id n10so5036140ejk.5
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=r8lfBq49CvpqwCcxIZTebGdOGfYEQH4rNVpXiGqsOY4=;
        b=zBrDVbZ+aoW9LO2HjaKaE5TxzqbWcPqbqtbgVWQixSh6GRQ20DEfCklDX1LJ/IWEMh
         wRD2A1nQt0PilHzHcjFm1BHq+rVxD/vDM0KxPjw6mcU2Dv3flUPxKGuHK18KJ02q8tCR
         +HnyPolC332d6F+n/uK3KRrj2lND77MlHsPHJfmYbrkyPxbcdTYLRt0MlOG5RlFXsMfh
         27fT2mpXGXVtB/fymMcwSGGjhLVV1ks2IoS3TkAxUm4It1nJuERh+PywdbN7/063J63w
         gRIhPSii9vCqFx5rFN9E6FTxNwDRL0Ua0+BrsiPk6tfMXrXd+bF8FjKUuQJ2V2w/VY8i
         Whag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r8lfBq49CvpqwCcxIZTebGdOGfYEQH4rNVpXiGqsOY4=;
        b=egmyBz3lC4KZoobBh6h9l8wsxCH+2Misq5K9IBUKsuM6zwLsVNpVY6LQieUV6LoG2x
         8VkOHxVR5qA2/IvoebxHzXoctStEUwcHjmVo6J5MfWPVquujr8T7qvJGwy3mkUr0PmE4
         lpqPpPHuweztCFmw+8aURc1XKbdmG0Un+ghIgvSwQl6Ft9XtytvNjuOtNBzxsVVrOTfn
         BeuxsRvv97MlmUxO3sUbOodPJ1nMeQ0gzhxq2gSXKqe9CYzb0IqmYGo3ziDDz85J+AVk
         NqfXLTT14UQ9x49Sbmij5zBTLratVzYWfrdUN6UluQm8X1+50wekxD1fruPJ0HlL33yc
         m/mQ==
X-Gm-Message-State: AOAM532oBegnhiVdAPV8R/ZRfOtwXaE5hZYaxhnN+F/wsbvv15nW4WzV
        XKAc8B9XCAp7FserGkJtnlzkuw==
X-Google-Smtp-Source: ABdhPJztaxLoLolaMvsN/SCV1RH7GIA07aUJUlY/wRpTHca7AQITjd2axM8ICmxJk2CXFDJSQu/ixA==
X-Received: by 2002:a17:907:9690:b0:6f5:160a:25b8 with SMTP id hd16-20020a170907969000b006f5160a25b8mr25695788ejc.504.1652285275795;
        Wed, 11 May 2022 09:07:55 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id rv23-20020a17090710d700b006f3ef214e22sm1087837ejb.136.2022.05.11.09.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:07:50 -0700 (PDT)
Message-ID: <e5055507-1841-1c46-c817-8b1d95ea973e@linaro.org>
Date:   Wed, 11 May 2022 18:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: vc5: Add 5P49V6975
Content-Language: en-US
To:     Matthias Fend <matthias.fend@emfend.at>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20220511053455.360335-1-matthias.fend@emfend.at>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511053455.360335-1-matthias.fend@emfend.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/05/2022 07:34, Matthias Fend wrote:
> The 5P49V6975 is a member of the VersaClock 6E family and supports four
> fractional dividers (FODs), five clock outputs and an internal oscillator.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  Documentation/devicetree/bindings/clock/idt,versaclock5.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
