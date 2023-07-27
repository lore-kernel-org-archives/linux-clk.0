Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D69C0015E
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 09:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbjG0JGS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 05:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbjG0JF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 05:05:59 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEA28A41
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 01:46:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so940181a12.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690447613; x=1691052413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ets1w26MUwejoH+A9n2QYCu2qpqKJHRSC2S8at9KYEk=;
        b=mcZhvnB02gKM3qOKeT5DfaC1RexC0wy1Ty75fYaAahmJwcr8hMghjI1raaAiOMpkaN
         0Zchaj7bFyjPGtf16dCrzVMyPuyuH/+Ay8MtpDPyhayksIhPUQL1GREYmzV/sGoEcAyw
         LmWXK4V+iO2KzfVeOCKOXlD8q1HjWy8O4QjPni3Hre5ppq+l42TLPEb/BZwNfw3Ss57J
         EiwV2gwB77bDIx9lxxYQPPaeFKanyB4MqlMZlN0hlDhG/9Hyr6F8QQ6KYowUtPm2vcxL
         Fg8uK2kG85pUKOX9etQOCe5xFTu+uWIePyYGcRZUoZLjo++jmaA6E6SynY8s+VLTBEPd
         JG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690447613; x=1691052413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ets1w26MUwejoH+A9n2QYCu2qpqKJHRSC2S8at9KYEk=;
        b=gYx1PlcQMaBElxVPxITyGvmfETWFvq4ywRdwYrOMlO+FrASZk+IDk4rKGEWTKV9tE8
         +OtkpdFQR5uadY70As5brU6CXez8bg+NXxxKa0nKp1IU/0vUJQpxyVCiPWYl9xTUhEZL
         lpqEzfYf/Nb7Wk3Nl0wg4okJFl25Ct5g5nYv8WChqyEg0Wj69h2Wv+Na0kbaB5TxBEhI
         wXnPzFAXbLn3STjwEzMdv3mV12CPAu+I4nqNS2ZlD1+x1CbaoEver9egDIqK2VVK/CBG
         eviObgbCtXNGXHvIp3WqrfGe832APubSXTgIwephyls+aJI/bRdI9SjzjKwwzkk8NE4F
         BW3A==
X-Gm-Message-State: ABy/qLaRh1qAm+GWjyaFGsnYfvy6r4EeM1lhQVyuT/hgRkat5547i3Ky
        i6Zr3ir0iSzX/iozs04ZC2p5Gw==
X-Google-Smtp-Source: APBJJlFxdL0vdm+bMblC4hZEphjyfMCt1APebzBtD1OFoA5fB+WkLPwO3nmCxBu4/5qgvq5ojn1hbQ==
X-Received: by 2002:aa7:c906:0:b0:522:3849:48d8 with SMTP id b6-20020aa7c906000000b00522384948d8mr1317797edt.9.1690447612836;
        Thu, 27 Jul 2023 01:46:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s11-20020aa7c54b000000b0051df54c6a27sm390970edr.56.2023.07.27.01.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:46:52 -0700 (PDT)
Message-ID: <d8cd4f03-6824-da32-4e96-d7f750cbcf09@linaro.org>
Date:   Thu, 27 Jul 2023 10:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 17/42] clk: at91: at91rm9200: fix checkpatch.pl check
Content-Language: en-US
To:     Claudiu Beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com,
        sboyd@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
 <20230727053156.13587-18-claudiu.beznea@tuxon.dev>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727053156.13587-18-claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2023 07:31, Claudiu Beznea wrote:
> Fix the following checkpatch.pl check:
> drivers/clk/at91/at91rm9200.c:100: CHECK: Alignment should match open parenthesis
> 

Doing such trivial changes per one file is way too much churn. Fix all
these trivial checkpatch issues in all at91 clock drivers at once.

Best regards,
Krzysztof

