Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C53EB64DB
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 07:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245025AbjFOHdV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 03:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244040AbjFOHcz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 03:32:55 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AFF2D5A
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 00:32:40 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5196a728d90so1762417a12.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686814359; x=1689406359;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0T01BUR4iszPkfnXV4jgUMkmxhDftwtafpe9lYKGnDA=;
        b=WOUH9Nbt08zqpgFCndvBJAwWodKyinVlSsIdRlxu87njqklXzJoKG4tz78RGoxdBMq
         eMPmQWN3FREY1Ofwo4Rc0CohiZJVMxyAvmSGkzuEVsAMdNhhxTGtBqoTdH4VWEQngAhG
         OoTIasWySTORlamWrug9m4lSJoF/Sc0MEHiQGWnCSaAAsSGOMkbhIjYob3LEKIjc3oij
         ic8vMYSm0Q+7JNL4EcWSBa+3SIJACce3UAStkO4WqWeNQlnW6sgZlPwlRSUgWcRUIE3f
         LZ85xIWqFDjQtqta6bkVgbGksYO37nndDM0NETnZfQvOwI/BsoZEl0wZ5FsnWi7Vak28
         XuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814359; x=1689406359;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0T01BUR4iszPkfnXV4jgUMkmxhDftwtafpe9lYKGnDA=;
        b=J4TRhyqLxfh+QtpPezoPhvfEcvS6rn+kzQv/1R0eihD4/c9rhU0YNz5tTF0WYjbDSi
         5Na5Fj3U1E5rZaz+hi6+hJ65yuhmHmrhIDi6R4HgCNLFIPMtkdpXyRravFk7Fxes//lx
         CFoL+HIKaNZXq1ZhmEO+FIqdOKAkfw1dSlXT2WRfweJLyqI3lJF0z01okQBFu5gTNOHU
         y0r99C/tR80ajZexyJsFVPxXTD7onj2NXcFhrxfP/XkLrWwYEXUuejXDtSrKhsZ2ivtT
         BvEKF0oZ8YUrWasfIZXjYpJzNddaHHmbJvlk41Gb2Bf53dp30slMhq2zta+walVVwzIl
         CSLA==
X-Gm-Message-State: AC+VfDxLZ4e8Pu3u6ufI/4xTwG6a8t4gcfeRi+ETaos0F5BFx0qVvwRW
        5wB8TqZva7DqHgn1xgqxKc/r8NJD6/OMke3mHjU=
X-Google-Smtp-Source: ACHHUZ4vc4UKj8FD6SlKtS2PYzsT6NzQeOIOWArA5HI/qAH+CQhyfwIsc1QUnMosg4S/oHU9avvWTg==
X-Received: by 2002:aa7:d756:0:b0:516:416b:f736 with SMTP id a22-20020aa7d756000000b00516416bf736mr11247984eds.35.1686814358858;
        Thu, 15 Jun 2023 00:32:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c489000000b0051422f31b1bsm8437975edq.63.2023.06.15.00.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 00:32:38 -0700 (PDT)
Message-ID: <df613aa9-00ea-2a8d-cf61-f1e85d26cd4d@linaro.org>
Date:   Thu, 15 Jun 2023 09:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: clock: drop unneeded quotes and use absolute
 /schemas path
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20230609140751.65129-1-krzysztof.kozlowski@linaro.org>
 <b07d3bfae4702417010ed5ee14739bb0.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b07d3bfae4702417010ed5ee14739bb0.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/06/2023 02:35, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-06-09 07:07:51)
>> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
>> checking for this can be enabled in yamllint.  Also absolute path
>> starting with /schemas is preferred.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> It's not clear if I should pick this up. Do you want to take it through
> some DT tree?

Please grab it.

Best regards,
Krzysztof

