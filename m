Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DA0C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 18:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjHHSbS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235455AbjHHSbB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:31:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1986282F9
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:51:01 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-523225dd110so5986351a12.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691517060; x=1692121860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/ENPbWDACTq/gT25pwElyGsToVBQemAbfEgTyGefM8=;
        b=DLisWEkyKLhJdEab7XpNHg0OcI/tDG4n3Llbj0Ahxh4JPs6ccSsan1vcolVvpI7PC7
         WmnbuLrqMXsdg8DzKhuPY0ZGXewivAImdx0G0zThtlH1vf68GjnapR6yHrxT1buPGorV
         EpZzjIUtNJSl4ng8AOG91rlk/HI5eS5/UqmdksvcI+i0tz3i25aXg/ISkl6sTnCRQ2/q
         4gIYn2GbQAtHpva9urNvXRC+nTRERrbSvOhcA2gFKpdWLWJnH2kpwYuouiDR6t60pqVy
         KK9ZTxb+0j7ZU6nIzbXNbmXSZ3cyxW4CRNgM74SD9cojoPoMfYd0LS2Q3FnOnCHSUrPy
         LkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691517060; x=1692121860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/ENPbWDACTq/gT25pwElyGsToVBQemAbfEgTyGefM8=;
        b=BNmMf9E0jSrRiq8mggo2WbuCCuFsvVx+XVap8W88UA0sRcx6EsSYn4pCtiy+W9cmmT
         bi1hzq3bEeHIgtthMDnesmJOADvPpXa7tOD18deRfUvQrvB2JGw6i4yiHJ8lrWJYQ3QL
         Qk/fkADLsG/KNPrRHWEuQe7rVCD9L5OXpJGETaYqJCr4RYMFQD+SEeLvt1qEKlbEUVrV
         EMBq44K+jDpcZ79edH0C/tS/2uCq/MzN5G3RSB97MFURQjUfLhP4AffCKUaFmqqpUohM
         ZZhZWfLshifLYAKhyX/vT27NNdNQN47tExu/CQhZKyt8jqpCkhBFXllQHPPQ6PyH2zNd
         YWEA==
X-Gm-Message-State: AOJu0YxmdXVgY3sQepMZD/dhDYqbl423nemkSeCP9c7cGZOo3GPheXM4
        324XeFmiyO8ar/o+lGlWuNkssHVVUEuDrzb1Ur8=
X-Google-Smtp-Source: AGHT+IH20o5oXu1MzFaME7Vqm8k1vG/h5IULgofIK8nWT0wfuYK0Ryctno9bzeuLujRtR/SQOzZBWA==
X-Received: by 2002:a17:906:d8:b0:99b:ca5d:1466 with SMTP id 24-20020a17090600d800b0099bca5d1466mr11379531eji.66.1691474329221;
        Mon, 07 Aug 2023 22:58:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e4-20020a1709062c0400b00982d0563b11sm3463474ejh.197.2023.08.07.22.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 22:58:48 -0700 (PDT)
Message-ID: <9e235de6-972a-84e5-3e09-f0b07b10e28d@linaro.org>
Date:   Tue, 8 Aug 2023 07:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 0/8] Initial Marvell PXA1908 support
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230807-pxa1908-lkml-v4-0-cb387d73b452@skole.hr>
 <5723818.DvuYhMxLoT@radijator>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5723818.DvuYhMxLoT@radijator>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/08/2023 23:02, Duje Mihanović wrote:
> Patch 8/8 is missing because b4 lost connection to my SMTP server while 
> sending it. Should I resend the whole series?
> 
>

Just send patch 8 manually setting in-reply-to= argument to git
send-email. b4 maybe also has this option, I don't know.

Best regards,
Krzysztof

