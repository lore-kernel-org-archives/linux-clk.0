Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616F5C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 13:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbjFBNTl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 09:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236150AbjFBNTj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 09:19:39 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B98E55
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 06:19:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-969f90d71d4so290062666b.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 06:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711958; x=1688303958;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBNFld6x+FD3yAk+79YEoPyi/MHsa3BOoLdsyaVmPR8=;
        b=MkPFzKJ1ZteRe5HoTqFkv1oW7AGMHQG8UQ/9I+yFUC8OF38sPc+TJT+HuxeWywaHvK
         6svn/iw/BInzAoScleJskTvDJ05OaL6zEsyMdVo+WMeQ8A4OHIfpsoizYR9DPB+9i+hQ
         HYyUkSeoo/tROlPVW+0+b2ljDaEHZO9FZsY58G3IcdGIdznGEM6dkOmV8RZoMg12LWk4
         dQBMqiGNufdG9NB0obeLQl5l4k178c4GpjD4TCihvpiEU83XKFj23a4m+KHE2BG1hYQS
         XQSf16s9g1s2WUkcWMUHh9lk0YutqEf0S7+x4f8f6Avhb3BDTHEmlPFwa6ist+XLU0XH
         duBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711958; x=1688303958;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBNFld6x+FD3yAk+79YEoPyi/MHsa3BOoLdsyaVmPR8=;
        b=bnrKOsyW/5vN6m7MUC1EaxP8abxcl9zqaA9adywXpkSQbJNBPHWEOgx9puWwPocl1+
         f9IyQyzHr0lF14klcblBHcuNhtMgTzRaD9WJoAK5WzKsJWGeKrSEO0sUJ4GAu/KZVC9W
         2Xs/vAqMzTxMss8nFaCYlSKgLQQ1rm6ED7LPKjcJJs6d1QYg3OS9uQ0xtZVWbZvXxtf0
         lOnL08bKgWudzYTsekPryzmjNjOD/q9EEV59fAJEFZd4FTxluzTQSPLSegKl0HS6pRLb
         Em9bSD/b2AqhvGyguTKIA9P2Z1+770fxo3BwspldC81buL9hWuH2n7nhOEM8+291HBzZ
         2cJA==
X-Gm-Message-State: AC+VfDykuUyCWZkucNZM3pPlmiGnqEt5Zh/2IYZ9mOk5aOFd5JP4hjY7
        F9M90c/l2nQaXc9n7cBzSAM62A==
X-Google-Smtp-Source: ACHHUZ7zMgpL53XXDN3fliIzzCq2tEI+Abjh93xl4xgpetYD0ZyxlHnaj+VktT5BO058F/xfMpgo3A==
X-Received: by 2002:a17:907:9813:b0:965:6cb9:b768 with SMTP id ji19-20020a170907981300b009656cb9b768mr8974330ejc.31.1685711958189;
        Fri, 02 Jun 2023 06:19:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906851500b00965e9a23f2bsm747873ejx.134.2023.06.02.06.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:19:17 -0700 (PDT)
Message-ID: <92428212-2fe5-a07a-66d1-67b6939c7c9b@linaro.org>
Date:   Fri, 2 Jun 2023 15:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add nvmem-clock
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.2167d5ad-7e99-4eb9-a313-030fc7a7d546@emailsignatures365.codetwo.com>
 <20230526143807.10164-1-mike.looijmans@topic.nl>
Content-Language: en-US
In-Reply-To: <20230526143807.10164-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Resending as my previous email probably got lost. If you got it twice,
apologies.


On 26/05/2023 16:38, Mike Looijmans wrote:
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

This does not look like real hardware. I mean, the clock does not fetch
its rate from nvmem, right? It's the Linux which does it, so basically
you described here driver, not hardware.

Extend existing fixed-clock bindings to allow reading frequency via
nvmem cells.



Best regards,
Krzysztof

