Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99126C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbjHHRAv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbjHHRAD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:00:03 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32D62706
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:00:28 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99cdb0fd093so312574866b.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510398; x=1692115198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rq9CGfMIPSDr9ZlL/JERcR7sYpgjvn+r29Kl2qTSWpE=;
        b=vfo0i+LiAZi38xsroAnRMiOkDYYymf6/ozqTivpl/Lt+lPHwreovDxVnzdePaAudc4
         111/2k78EMTUEz7t3xmFZqiJVoAY9QgYPCh/RkUg1qe4A1kKDF4tfOzfoxC038Lh9mY9
         L8mP5XO/NpKZw7D1J/VeIB3yWfzUDFiDO5oC5Jh31kAI0aQDCZ9iidKY1nsvOtESFvvM
         kjbNMYMIdB7JcwmcRmN/qCNZuVW8oElJGDHokUIINV4u1ZtvE8Gexk3EN9+g0Rfvzwqu
         cpsbXObTYZ4RtigWrz/5CETPbaUNIeQTR9wWBxkovJlMuO1vi3rSye0DB4d7pS/jEaW6
         sAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510398; x=1692115198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rq9CGfMIPSDr9ZlL/JERcR7sYpgjvn+r29Kl2qTSWpE=;
        b=g7ufq8O1dE/Iz4ocT+vAdQmc5tuNnIUB/hYbXqsFKMDNcTzGr+PhX6LkcRloaJOgxV
         ijtK0W1uT6Nyt6eMPMIMq3Y0FIy3rIPoWsN5j7rMsPToozDhCIUxLxEhCezraosOyVA0
         YXD7Kp9drRCT+3ukZJDn/fnxwh/17Z79A4n07MvpMsZGhK9/tAWtPZv5kEjvwHh+/swl
         27/cUTvhVqNxaMxT8DfwifWJ2gm+BJo+RMjLr142/7NzTm2POB/MV1ogUkKX0P+96FZK
         rUILSm1RNwDEf8frAR1VQFzAKdSUWiBEKWtEAGRdZKBVlfMKuCXsuCZ4ntEBlbiHwafs
         /iyQ==
X-Gm-Message-State: AOJu0Yy28TR6B+2WCXzahu76M5GRrN2oilNcmpA9q4Eo+/wvDhK5OJyK
        OmHp020oAYPo/YcHH3sMy3tqdB4mZuUcDnnDtEQ=
X-Google-Smtp-Source: AGHT+IHxzkAXBfNJDNcknbZH6tlIYjJNFyXEZDfCnRpxQMJVfuN4V6svYqKu4KC6ef0+KBpYIwyrmA==
X-Received: by 2002:a2e:9f4b:0:b0:2b9:3db7:322f with SMTP id v11-20020a2e9f4b000000b002b93db7322fmr8508153ljk.18.1691492178941;
        Tue, 08 Aug 2023 03:56:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c378c00b003fd2e89620asm17797634wmr.40.2023.08.08.03.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:56:18 -0700 (PDT)
Message-ID: <d7cc1aec-17be-502d-47c1-3163a2766ee4@linaro.org>
Date:   Tue, 8 Aug 2023 12:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 11/11] dt-bindings: clock: samsung: remove define with
 number of clocks
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
 <20230808082738.122804-12-krzysztof.kozlowski@linaro.org>
 <20230808-scarcity-sprung-c0c2abc2971f@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808-scarcity-sprung-c0c2abc2971f@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2023 12:53, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 10:27:38AM +0200, Krzysztof Kozlowski wrote:
>> Number of clocks supported by Linux drivers might vary - sometimes we
>> add new clocks, not exposed previously.  Therefore this number of clocks
>> should not be in the bindings, because otherwise we should not change
>> it.
> 
> This sentence reads super awkwardly, not by any means important to
> change, but I'd likely word it "Therefore these numbers of clocks should
> not be in the bindings, as that prevents changing them".

That's better, thanks.

> 
>> Remove it entirely from the bindings, once Linux drivers stopped
>> using them.
> 
> I figure there are no consumers in other projects then? If so,

Difficult to say, nothing known to me. Anyway these are not clock IDs,
so if anyone actually relied on number of clocks in the bindings, they
would have trouble in the first place.


> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


Best regards,
Krzysztof

