Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54234C74A4B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 09:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjCMJVb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 05:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjCMJVU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 05:21:20 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612C04989C
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 02:21:09 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so7345490wmq.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678699268;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=NyKmnb2IGGlRYKdA8v+Oi9cQGOt819vf2di9Hwq+CB0=;
        b=mSVsf+a/ifTL56wAV9Qw2FDlsV5LEVpddsOHAnmgmNWX8ZYxk80hyF4aQqagAEUpRc
         jDtW5tGU1a1sIXrahUuJD2t838vwVvvnj4Ixlt8aS35T1up5M9BaMB/TiJMSOI2IGuV9
         4DpczCsw5ChdGLdIiV66BOPSrFanB1m6q32U2VqzOEmNpUIv9k55vB8EjTbMZCdowJuu
         /SVQvLaRF7kjaEKEuU54weShdspUHgoj7wr916M1wsEnxth4j2CBMJB6SrbWvLaot6br
         AjjW9ZVSxTuneR96w0vxXlzXrgJAt5qX1svj0H5QfW8P15XTzrOhQpO06GBAV80jJ6Q2
         9YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678699268;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyKmnb2IGGlRYKdA8v+Oi9cQGOt819vf2di9Hwq+CB0=;
        b=7xzQZqCjHwJrBWvxxE/8dUpHNCnepXOseUzU25CruK0SPzmIdrMKZ/syf8/kdD652D
         k4rABTp6OGejPy9Cqw0QWx6E68JLkZvY4aSchHC9cEJDfqxYKZuj8whh+13l6iEegpmU
         aDTFAjlFrk+x8xs1dXf+1NlT0y02yRqa6rR2pf6dD7A0NV3A3myUA5G/KWsFg0ZKTWaN
         OrlLF9NyZW54OCvVjbREubx7iq26SIW7ER6yjpAQeZgOI0LnEUI9Qc0OtV0TMU6VWeds
         YmAYaHcnex3upsnzZSS1Tw/cdOuGHIg+6q4dIHO+8VqpeknVOURwFFWs6FzyTEgB3IQw
         rbXw==
X-Gm-Message-State: AO0yUKVnBDd8byHbAzmcd3GD/YHdxSpYohkowpDHJtRGztxj3pofojfk
        q20wbpg2fvSL8fl/00DnQcCoLw==
X-Google-Smtp-Source: AK7set+ffANocDz449+nx/CU8mE/uaLR+A5C2On6Z7RmrE6Px8IYI5sqoAqzr08nkoqwgeu6K+3K2w==
X-Received: by 2002:a05:600c:1c9a:b0:3ed:2418:6cbe with SMTP id k26-20020a05600c1c9a00b003ed24186cbemr2701778wms.39.1678699267735;
        Mon, 13 Mar 2023 02:21:07 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c378400b003e215a796fasm8292361wmr.34.2023.03.13.02.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 02:21:07 -0700 (PDT)
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-3-ddrokosov@sberdevices.ru>
 <1jr0u2azfi.fsf@starbuckisacylon.baylibre.com>
 <20230306200549.7iuedbl27ejfhf6b@CAB-WSD-L081021>
 <1jlek60zun.fsf@starbuckisacylon.baylibre.com>
 <20230309182857.a2fzotcejueio23w@CAB-WSD-L081021>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     neil.armstrong@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
        kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Date:   Mon, 13 Mar 2023 10:18:02 +0100
In-reply-to: <20230309182857.a2fzotcejueio23w@CAB-WSD-L081021>
Message-ID: <1j5yb50zxz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 09 Mar 2023 at 21:28, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

>> >> 
>> >> This last poke should not bits otherwise handled by parms.
>> >> This is a rate init in disguise.
>> >> 
>> >
>> > I believe, you are talking about hifi_pll clk_regmap conflicts with
>> > hifi_init_regs. The above init sequence shouldn't affect pll regmap setup,
>> > it doesn't touch them (we assume that default bit values are all zero):
>> >
>> >     .en = {
>> >         .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> >         .shift   = 28,
>> >         .width   = 1,
>> >     },
>> >     // init_value = 0x01f18440
>> >     // en_mask    = 0x10000000
>> >
>> >     .m = {
>> >         .reg_off = ANACTRL_HIFIPLL_CTRL0,
>> >         .shift   = 0,
>> >         .width   = 8,
>> >     },
>> >     // init_value = 0x01f18440
>> >     // m_mask     = 0x0000000f
>> 
>> mask is 0xff with width 8
>> 
>
> Ah, you're right. Anyway, I think this is just init value and it's okay
> to set it during initialization and rewrite after in parameter
> propagation stage.
>

... But the magic pokes are there only to initialize the unmanaged part
of the clock regs. I'd like it to be clear and stay that way.

So please, clear the managed fields from the initial poke table.


