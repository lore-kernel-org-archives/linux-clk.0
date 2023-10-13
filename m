Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A78CDB47E
	for <linux-clk@archiver.kernel.org>; Fri, 13 Oct 2023 07:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjJMHqe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Oct 2023 03:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjJMHqb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 03:46:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C78BD9
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 00:46:28 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-505a62d24b9so2290997e87.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697183187; x=1697787987; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wP8hZWh4qXyybXYLkSLcCZu/0fSSL+752WobzxTNboE=;
        b=2PvP0qX1Kb/XjDabWI/PzKNPTRta7BnboXvRCqD9rHVAAgruwu4lsxR7lOFyvR2ez1
         JE4wfU3K8lotvUF2dG88RTSTt6B7rivBrW39Fq49PqL9xUSD4ycIZKR8Qf13bmkVqWQR
         kxFGMGMnxH0ug9B+JLi/JXqcDYTJyhTvZ0Tzd0kneivrFCUjc+t7gKj6NP+CcWgLWBWA
         ZVrqX+cIQC49b3zgjKB8VfsDgr9YHsju9ODo5bCy0QP68GJ4eGCtaJWsHHSjoCjr46XV
         egfobmFMV1y3ngEnwQY+75aYdvBxPA3JHsLca8PHCBOcJe9R+VraEaOErKLPzdBWwF3/
         anYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183187; x=1697787987;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wP8hZWh4qXyybXYLkSLcCZu/0fSSL+752WobzxTNboE=;
        b=GEb53NOXEzmm7qJ1Q++OKHuAYK0ODZc6iOAsK5W1mfhxhA6HNKbR68iARlGfqX2MX5
         tGjG3JCwEDrVp70mqkaOuXUZdPOHUvRPmwB80pJIYXNXU8y5AFqNUOm0e7M6QfswTaR8
         UiAEv8OMFflNtlEoBLJ0Dtb628uOpRWHjZ+q1KPb2YUUwgdwXxaJkW59F+pllT8qiIP3
         drC2rMhNRqZ09yZnoie9Yp79NOUm6eArhqpqd+mOi37ipdh+4Li06HiyYZje4fNh/XKH
         61p8+WHcryoUoEqHJqTToI1qmHsWjCRyRQk7x61XO/GuKyuhPFb9YI32maqc5gnPYvXu
         bfqQ==
X-Gm-Message-State: AOJu0Yz9IoCoDYmJnb/bsGZskAaw+x92Jx2sTuIDLfa80aUCsU1ZfKKW
        eroPMmfVNKtP5uE37EwmLYNnebMsFXz1Feb5+84=
X-Google-Smtp-Source: AGHT+IEkyEN8zAQ5/dhZe4B9ajTP0EDEK/rSt7LjwGLHX2RHEZPT+iFlTiLC7YassaX2zhaMHUp92A==
X-Received: by 2002:a19:5f04:0:b0:4fb:94c6:fd63 with SMTP id t4-20020a195f04000000b004fb94c6fd63mr16394959lfb.17.1697183186650;
        Fri, 13 Oct 2023 00:46:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b50c:c5d5:8b1b:e06d])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4946000000b0032da022855fsm252248wrs.111.2023.10.13.00.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:46:26 -0700 (PDT)
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
 <20231010062917.3624223-5-xianwei.zhao@amlogic.com>
 <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Xianwei Zhao <xianwei.zhao@amlogic.com>,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH V2 4/4] clk: meson: c3: add c3 clock peripherals
 controller driver
Date:   Fri, 13 Oct 2023 09:38:14 +0200
In-reply-to: <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org>
Message-ID: <1jmswnvub2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 12 Oct 2023 at 16:51, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Xianwei Zhao (2023-10-09 23:29:17)
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 76be4bbd2afb..c8d59d28c8ff 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -140,6 +140,19 @@ config COMMON_CLK_C3_PLL
>>           Say Y if you want the board to work, because PLLs are the parent of most
>>           peripherals.
>>  
>> +config COMMON_CLK_C3_PERIPHERALS
>> +       tristate "Amlogic C3 peripherals clock controller"
>> +       default y
>
> Why are these default y? They should depend on something like ARM64 and
> even then I don't see why we want to enable them by default if we're
> building the ARM64 kernel.

Should indeed depend on ARM64.

Those are the main clock controllers. Like for other AML SoC families,
they are necessary to boot the device which is why they use 'default y'

Is it a problem ?

The whole meson directory depends on ARCH_MESON, so the drivers will go
away if Amlogic support is removed on ARM64.
