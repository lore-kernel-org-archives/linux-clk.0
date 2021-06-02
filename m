Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6DAC4708F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 09:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A741E613B1
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 09:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhFBJei (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 05:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhFBJei (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Jun 2021 05:34:38 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4D2C061574
        for <linux-clk@vger.kernel.org>; Wed,  2 Jun 2021 02:32:55 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so1300670wmq.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Jun 2021 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=+4n68OhQQoaJqMJRmFarUHWhO6SLp5CZpVwSs3bY57M=;
        b=QdtCH6OwgAWbnUTfXQQobKbEMVCsv/NfJBaCfk/cjIBLyX30zRtdf7I9yQR+a8zN7w
         So9FhMuKA51H7t0Iz3VwB3j6Y+y0rR9b07MQUlWinb/vlJWd8I5IBTtQb069NU9HuDWP
         fLeP7MfTvg2JL45gQzLpPV4+slEzo5rsKvvV2WtDTNP6vjH/3CInyKKzEF6Ma1rj2bM9
         HUvJfc0h6LLqF35WgVDrMEElaxEE5nvXub1O7TidzmVnkRo0rYXaHG4Qmpj4k4njYByT
         fxtAjVXR+oCPy33idGpVPAxm0H1Tchr1vktUJ8TIScJuR/CrW7k2vq9fxUDhLbJ2xoMh
         mZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=+4n68OhQQoaJqMJRmFarUHWhO6SLp5CZpVwSs3bY57M=;
        b=VLpH4TdgpTIRbx/KgiIE2vDug76PiQ2/pS+ZyQfzxdvDcvXgPadta0mN7nZxZacxul
         eqHhMeno/t8nBb62d5dYUeIaAEbTbuW3ms3sdzHo8Xz+wpRR75PYJbI+yI7H+9cilUBh
         zW7H6vFbwlI7vMrPUFTC+sf3qt1V3YuI9wVsoqrlhzs1iftHswJWY/A4s03sIqeanijW
         c0ejJKpWPvcwFdBos50PQwPBK3RptMeLQa6FCUjvv1MNo7S+NiYRPYttZIdLAabrNR5P
         1RYWV3LwNvKUrEdG04a1pRe30yvLnU7BR9dqQI2KSDWx2MogXiSCh1QEiIyj+V6PNqkS
         uGFA==
X-Gm-Message-State: AOAM532uCeOImQPwiVHvz4aevXN9KLNttuneNruAJ/GCqxM7ebnQiDgW
        g/lx3pt0ddbufoczoNc/d/RyhQ==
X-Google-Smtp-Source: ABdhPJwZcWsNVrWqTEgyqX4RTciLjOYhDu9RIA3kyZPccOlhw3ys9rCcBYEhOiKNeMrrX03S7NOU+g==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr4378881wmf.12.1622626373963;
        Wed, 02 Jun 2021 02:32:53 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id j14sm2093415wmi.32.2021.06.02.02.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 02:32:53 -0700 (PDT)
References: <20210528113403.5374-1-peng.fan@oss.nxp.com>
 <162262192433.4130789.1017942859005253343@swboyd.mtv.corp.google.com>
 <a5833012-3e86-5be0-71f2-de4d9b32a152@pengutronix.de>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Marc Kleine-Budde <mkl@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, mturquette@baylibre.com
Cc:     Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] clk: support regmap
In-reply-to: <a5833012-3e86-5be0-71f2-de4d9b32a152@pengutronix.de>
Message-ID: <1j1r9kobln.fsf@starbuckisacylon.baylibre.com>
Date:   Wed, 02 Jun 2021 11:32:52 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 02 Jun 2021 at 10:21, Marc Kleine-Budde <mkl@pengutronix.de> wrote:

> On 6/2/21 10:18 AM, Stephen Boyd wrote:
>> Quoting Peng Fan (OSS) (2021-05-28 04:34:00)
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> To i.MX8ULP, a PCC register provides clk(mux, gate, divider) and peripheral
>>> reset functionality, so we need make sure the access to the PCC register
>>> be protected to avoid concurrent access from clk and reset subsystem.
>>>
>>> So let's use regmap here.
>>>
>>> The i.MX specific code will be posted if this patchset is ok for you.
>> 
>> We have a couple regmap clk drivers in the tree. Either combine the
>> different regmap clk drivers or duplicate it into the imx directory. I'd
>> prefer we combine them but last time I couldn't agree on the approach
>> when Jerome wanted to do it. Maybe now is the time to combine them all
>> into one common piece of code.
>
> IMHO for the basic drivers, such as gate, divider, mux, mux-div, etc... it makes
> no sense to have them in an arch specific subdir, like meson.

Indeed, those basic types were not meant to remain platform
specific. Some framework (ASoC for ex) make heavy use of regmap and
could welcome regmap based basic clock types.

At the time, Stephen (qcom) and I (meson) had slightly different
approaches. Before having those types spread through the kernel, I think
testing things out was a good thing ... this is why these are platform
specific ATM.

It's been 3 years now ... and it has not been a total disaster :)

In the end things are not so different. Let's compare:
a. Both have a generic "clk_regmap" type common to all regmap based
  types. This is very useful to easily fix the regmap pointer in static
  clocks (which are heavily used by both platform)

b. Meson uses a generic pointer to store the type specific info.
  Qcom embeds the generic clk_regmap into the specific type one.
  => In the end, I don't see any advantage to the meson
  approach. Switching to the qcom method would be quite a big bang
  for meson but it is doable (nothing difficult, just a huge line count)
  
c. Qcom basic regmap type deviates a bit from the regular basic ones
  when it comes to the actual data. The qcom "clk_regmap" also provides
  the gate, mux have the qcom "parent_map". In meson, I tried to keep as
  close as possible to regular basic types ... at least what they were 3
  years ago. Only the register poking part should be different actually.
  => I'd be in favor of keeping close to meson here.

A possible plan could be:
1. Rework meson as explained in [b] above.
2. reword types in qcom where necessary to avoid name clashes (add
   "_qcom" extension for ex)
3. Move the clk_regmap implementation out of meson to drivers/clk
4. Things are yours to play with ...

I can take care of 1. and 3. I would welcome help for 2. especially since
I won't be able to test it.

>
> regards,
> Marc

