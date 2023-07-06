Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA9DEB64D9
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 07:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbjGFHvl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 03:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbjGFHvk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 03:51:40 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8941BDB
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 00:51:38 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98de21518fbso47055066b.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688629897; x=1691221897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XPuUPdPd4IL646MDP7xQxkm1mxaIaMz/LLFTlhEzpE=;
        b=jeihfA3SSlUzxo1jmrNrjXL158/UeCT7uZNbXEIqrzTux9MU7iS5WGGbJDTyncIKef
         a5qOL8cxKFTRDK1JEAQhioSHbp+K3JShdU14BfRA+g8bPiK13EUwSpK51+ZbTJLqGH+U
         EkbIsgnUJso8nWScVjexmDbyyM5QWz0enpCjUOis3Eid+Al+yBXkdYxC/W4mwXD4SIFi
         P3JuNpBuLAB55CRQAjYRboSOBZmUO0sh3I7xfVVVEj/UYh1WFZX9UyGz5piDNVQyz1Qk
         EoJTv3RTM97sM2FRGR1Wo0dHQYvUlmcT974XIJe1mdkkhrmFuB4q6NhcjLQUsOyjyc8X
         h7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629897; x=1691221897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XPuUPdPd4IL646MDP7xQxkm1mxaIaMz/LLFTlhEzpE=;
        b=Tg1dCbLY3LlBU8aQObfeEhEOJKPsg8Uz2qZzHRe7MgQ3Kx8F2k1znNNSAuII56hJnd
         zWyIDeaAqIvH6Y5moriiyLqAAgFl60uGIN5rSKASNyW47jGhjPsQ3lPpqqHrSQrcVz1C
         2i47Fo0IMhJsxP1zPXUHjegmZA3Angu+LS/jJpj3Kvo7YUAuU3g5FKW51BA6Q3T8qVFH
         5kkYvcclIRrS4YRNBM7wDpkZYw2S69RR2vI4Sd+XuFALzCwdEzCyRbvalwRzxrqCl5UZ
         3BZjtEAp0km/4r1JnvP/nGrK9L/aKde7Ei+5Nzyk331f/H+87uuWXd6ZUCcSaXzNyS1Y
         8VLQ==
X-Gm-Message-State: ABy/qLYJ865DwtQ2NVkTfUoocsTgTdQzbDD7Z6xjFQV3ygKLjlev6sov
        O8B7gSPnku/+ggXBCIIlcmhBiA==
X-Google-Smtp-Source: APBJJlE1GzFFS11/BQZeeuoEMCqQI7WOCjyS5Cnvkbo7+aWcUl/LnigXelgXFEqsiJSV/bIfhHuY4g==
X-Received: by 2002:a17:906:5346:b0:992:13c7:56d with SMTP id j6-20020a170906534600b0099213c7056dmr708586ejo.33.1688629897001;
        Thu, 06 Jul 2023 00:51:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lh6-20020a170906f8c600b0098e48ad11f2sm462030ejb.93.2023.07.06.00.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:51:36 -0700 (PDT)
Message-ID: <e1e12c86-da0d-0ae0-0542-86bdc4c81bb3@linaro.org>
Date:   Thu, 6 Jul 2023 09:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-aoclkc.txt to dt-schema
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
 <20230705-b4-amlogic-bindings-convert-take2-v2-2-22be915ddc3b@linaro.org>
 <20230705195631.GA1732680-robh@kernel.org>
 <1jttuh5www.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jttuh5www.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2023 09:15, Jerome Brunet wrote:
>>> +    then:
>>> +      properties:
>>> +        clock-names:
>>> +          minItems: 2
>>> +          items:
>>> +            - const: xtal 
>>> +            - const: mpeg-clk
>>> +            - const: ext-32k-0
>>> +            - const: ext-32k-1
>>> +            - const: ext-32k-2
>>
>> As the names are always the same, move this to top-level and just set 
>> the length here (except the constraints are the same as top-level, so 
>> you can just drop this if/then).
> 
> If this is done, aren't we losing information ?
> 
> For example, "ext-32k-1" would become valid with a g12a as long as the
> number of clocks is alright, which it is not.

How it would be valid? It would be fourth item but only three are allowed.

> 
> I'm not concerned by the automated verification, more the information
> provided to the users, which we used to have in the txt format.

No information is lost here, unless you claim that entries are entirely
different?


Best regards,
Krzysztof

