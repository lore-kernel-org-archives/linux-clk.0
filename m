Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC0CC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 11:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240821AbiEJLSj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 07:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240781AbiEJLSi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 07:18:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14222A9748
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 04:14:33 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g20so19561296edw.6
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4JwYfzCW0d3vVHs2chH50RoPcTXl+p2rYFHpKu+IVW4=;
        b=AXNP3L1jlNNld+AfYDE4rCUd4CBTBuwdr0eZulRHjY3x0ZZZ3yXH/4Br+OYLJpueaF
         E7KDyugsHlh4UZMxiMPlvzIhDCejBq4R2lfver50RZoZi9yD7tD3IQSoFCaUB81czw4Y
         mhJkH8EtXvaOJWcrfqTwxQc4yXs5wvhqCf0QKdvURRn2bGXCi274HJKlEp8RPLcUvQVS
         DrinH5hNknIK4NOwoVeef7GuWvtRRMvzAgMiDowny8xzM1RDDDty5NBtiL1XplmJtBQc
         eeaJiG2zvEYyOagJg3P1pA3hCe8eHVCFYItSKsqIM1Rzmebr+avNEyYM6OSqOac44pQj
         YatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4JwYfzCW0d3vVHs2chH50RoPcTXl+p2rYFHpKu+IVW4=;
        b=JRK8iJ37+3EoLr7TuiZ4sJJFiLst+QD8i/+ti4khQKv3ncSdCsH39QrX2CBsvAH9kk
         VT6CnVxK1Ad56kiePkcxLQK78E9ewHyZJTl+BQ0A1XYvokWa+bG1s5/MvuHdNhs9Epqu
         845K8d7WtwsxlXblTTnOEPnjSEDQ+b9SCQGX0t+zWEMxlxuEpJzssT9Sw274rRvRQapT
         1m9GJ9ZAnMlxdaTQRElDVXWYKSvwLsnuYnkc68QQthJQH4DEU70TupuQMzTYGa+XNTOL
         M76K9eoU6+2eaNME1KxNZN2gGZ/DSGCHpbrUhtx3gHlop77CUSJZUhF6SsDIYWSFAdjO
         YFZw==
X-Gm-Message-State: AOAM533UyHqSzBUWYY+VqOcIGOsjW2dFfbBo7QGg4xlYiSTlRRB8VhL1
        HabOadH/oEG84NA5EvDrgVqhsg==
X-Google-Smtp-Source: ABdhPJw2may85niAU8fFjZaNm8TxPW3OvlRCJXDNHwFd2/GdAFbmFc7XZO+vX1kHq7qUlyG9Cwm0Ug==
X-Received: by 2002:aa7:dcc1:0:b0:427:e1ae:d822 with SMTP id w1-20020aa7dcc1000000b00427e1aed822mr22254333edu.353.1652181272297;
        Tue, 10 May 2022 04:14:32 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id mm27-20020a170906cc5b00b006f3ef214e1csm6020744ejb.130.2022.05.10.04.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 04:14:31 -0700 (PDT)
Message-ID: <ea361487-60fa-f4ec-2d26-e8a2ad5590bc@linaro.org>
Date:   Tue, 10 May 2022 13:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] clk: vc5: Add support for IDT/Renesas VersaClock
 5P49V6975
Content-Language: en-US
To:     Matthias Fend <matthias.fend@emfend.at>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20220510065150.278349-1-matthias.fend@emfend.at>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510065150.278349-1-matthias.fend@emfend.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2022 08:51, Matthias Fend wrote:
> Update IDT VersaClock 5 driver to support 5P49V6975. The 5P49V6975 is a
> member of the VersaClock 6E family and supports four fractional dividers
> (FODs), five clock outputs and an internal oscillator.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.yaml    |  2 ++

Bindings are a separate patch, please.


Best regards,
Krzysztof
