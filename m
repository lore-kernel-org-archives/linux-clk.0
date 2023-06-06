Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C13C77B7A
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jun 2023 08:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbjFFIsv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237260AbjFFIsu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2023 04:48:50 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF44F7
        for <linux-clk@vger.kernel.org>; Tue,  6 Jun 2023 01:48:49 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977d55ac17bso364588966b.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Jun 2023 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041328; x=1688633328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEQ4HPULxJqLeCH0M0TT69ZvT5utSd01v7nSaj1PvbU=;
        b=A9gNWmcYIIRYaDF807Oc872JCxo8NSUJuIf4qlKishgVQMwiQuZ4iRC0aq7QqO6b3k
         sP2IwTl6dmvYZQqpEOpHJxjKJ8B81I7rmi064X5aoWTYnpFmiIUQLYcFwJFoXlByTcpr
         Ha8eZaxcilxZtJb7NOWtvf0AgHCHYtHbuSlj3VN7Lbe+ShKekdgPznj62a2sF3Fwliox
         3H9xrV5WwQz6dYWCrGWFRcXmUcNDCQ/aI70zTMITc0hbNLZwoBgglp7MRlske0JhD7XQ
         ahtMLwHaw+z1e7gTCt0tkOhcJGRHa4vFFPYWo1s+Qv1YB6x7QY2fl5HfarICQ6/Qa5zO
         DrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041328; x=1688633328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEQ4HPULxJqLeCH0M0TT69ZvT5utSd01v7nSaj1PvbU=;
        b=WyuMY8WjXp6ZnHM2JgTGT7cgoXw9yozUqAM1/qwvylwYT8IL/VeQmIbe4sumzbHp04
         gRcp3UxKw83GGfAd7U/l1yAWbE+WcZFwNhbhnGKl3m12I87xL+KQ37rdZ/ztPGQsZfWY
         JqbkZvZaNfV/Wa4pAwlukk8xCqkHECByrYFYV3r92OVhZYS0q/ytTnKQqozwOU8hmHlB
         ve0j1OHCpdb5PxB4UUa/Iq/4rH07w4zcFc5BlhIdjSMqYpX00fHtN0wNGIPdaqPAK9Xt
         uALiL7YJC9Xh2/uxLdXBN5XRoJmzvBOqWnN6Yh09q6chfdQk/LH7o5s7AbUEvssXi+eb
         SoiQ==
X-Gm-Message-State: AC+VfDyllOKHGze+xmL67qp54Ig9haFB0++TwrGczLDAC82vJwW2kywy
        Uaq5jc6mktDh4l3cyHF9RW0HNw==
X-Google-Smtp-Source: ACHHUZ6EgOGCiNQhxd/unjp+HDUP7doEpWuo3o4zdAJNkkBfLrPpOX9anpQ0M/lpmLuAEHlh/YUhkw==
X-Received: by 2002:a17:907:6d04:b0:973:946d:36b2 with SMTP id sa4-20020a1709076d0400b00973946d36b2mr1483816ejc.56.1686041328098;
        Tue, 06 Jun 2023 01:48:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020a1709060e0e00b009745eddf997sm5307905eji.198.2023.06.06.01.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:48:47 -0700 (PDT)
Message-ID: <859da276-959d-b1e8-52e2-45e02f65c3ce@linaro.org>
Date:   Tue, 6 Jun 2023 10:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: fixed-clock: Add nvmem support
Content-Language: en-US
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.2d27bfea-4746-444c-89f4-e5d35cb7de66@emailsignatures365.codetwo.com>
 <20230605140149.16841-1-mike.looijmans@topic.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605140149.16841-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/06/2023 16:01, Mike Looijmans wrote:
> Add bindings for a fixed-rate clock that retrieves its rate from an
> NVMEM provider. This allows to store clock settings in EEPROM or EFUSE
> or similar device.
> 
> Component shortages lead to boards being shipped with different clock
> crystals, based on what was available at the time. The clock frequency
> was written to EEPROM at production time. Systems can adapt to a wide
> range of input frequencies using the clock framework, but this required
> us to patch the devicetree at runtime or use some custom driver. This
> provides a more generic solution.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

