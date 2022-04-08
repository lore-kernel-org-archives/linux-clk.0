Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD2DC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 14:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233097AbiDHPBD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 11:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237329AbiDHPAu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 11:00:50 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437F11C8A91
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 07:58:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id m67-20020a1ca346000000b0038e6a1b218aso5747681wme.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Apr 2022 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=/GhDgYpJKAjq8F7U625CS8dfjMT5iJwKDRVbQ76w9VI=;
        b=IKsl2zADU9KWaVRX6lU0f3gZTxDvpYC4sve0nY93ZRAOf0kMF4wS278zK28eu7/hXM
         YtmaKLOSBewG63ZfcAXSM9ZnrehCw+Yij8w2j7m++HshOIkgYdRSLEdT0wkAkc+AbkeB
         3xhD6P8HFkL7vbA81/gP+LySPU2yxKUj+nkhVsN2ZtMlABee5TpRTUV3jQRqz51j2+Vk
         qUUN+01Lj3NYsyh3yBOugtcJ1oihqV24XCUjLdqhUeVm7FXi87CdBJ2fbRtAmWohu1Jz
         VGyDWagio9LyYtA1wKtsqPCKjbPyWP4U+71wu3UCrrNNVkV4LuUf/A8rmAYvBR29yoi9
         HFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=/GhDgYpJKAjq8F7U625CS8dfjMT5iJwKDRVbQ76w9VI=;
        b=CJG5SoJpLQr4IYaUZ0L6lcsn16AClXJC76JJGcmx8pIL5CCOjyFzJDammOiYn3K1Fv
         ITXBx/DN+S+t5srD/iY+Z0Uc+4iUGn16fAT2RNDb+AUFwkjIRgu+Qn+Ri82nF+CkMQ4n
         iKkC2IkM881Lxp87XwUUHREH0FKODfmxv3R+cmZI68nQ6yEiRB5k9LtS8zFYbk2ri7E5
         vGH9UeEu7UVXYJCJ7PagjqCO+hLfnBWYnDbDmpZse5/zz3+kw+E/1TEVJ007bF88hWVq
         w4+FCEE/X2F0OsCdE1A7fvlgNnZjOk9ixcf8N9nm/xWS5Fna46rJKNOxp+ixDGFpi6ql
         Ok5w==
X-Gm-Message-State: AOAM5303PCzoB/mA6i0uw23x7oxyU2VFXLg/j12PNhAz1xSYSysm6q0y
        jkSgIhkW7ttihRpXD7oEXj3Fow==
X-Google-Smtp-Source: ABdhPJy9f6DO3i7XTsdzW7u3wJt3tBP2iPvIjpG+9XZXcUoDIK+yDgUsi116Wox2BSb6GTjpXvl5bA==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id d7-20020a05600c3ac700b0038bf9c627b8mr16939929wms.75.1649429923681;
        Fri, 08 Apr 2022 07:58:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm14634302wml.5.2022.04.08.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 07:58:43 -0700 (PDT)
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
 <20220408125526.ykk5ktix52mnwvh2@houat>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Date:   Fri, 08 Apr 2022 16:48:08 +0200
In-reply-to: <20220408125526.ykk5ktix52mnwvh2@houat>
Message-ID: <1jlewflizh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 08 Apr 2022 at 14:55, Maxime Ripard <maxime@cerno.tech> wrote:

>> 
>> No, they don't expect anything. They will return 0 until they are set
>> with a an actual rate. I don't think returning 0 should be
>> problem and it has not been so far.
>
> So, if I was to rephrase, gp0_pll_dco and hifi_pll_dco expect someone to
> call clk_set_rate() before clk_get_rate() to have it return anything
> other than 0.

Yes. It has no rate. I won't change until something make it so

>
>> I understand the ambiguity you mentioned above. If the framework decides
>> it is clearly forbidden to return 0, we'll change.
>> 
>> Still I don't think it would be wise. What are the alternative if you
>> can't compute a rate ? return 1 ? This looks aweful to me. At least 0 is
>> a clear indication that the clock is not in a working state.
>
> No, the alternative would be to initialize the clock to something
> sensible before registering it (or in init).

Well, I disagree :/

>
>> > and hdmi_pll_dco because it will always return 0,
>> 
>> It is a read-only clock - whatever we do in CCF, it is not going to
>> change. CCF has always supported RO clocks.
>
> Yes, if a clock has a rate of 0Hz it's entirely useless. And if it's
> useful in anyway, it should report its current rate. Read-only or not.
>

It does report its rate, it does not have any.
... and It would pretty weird to initialize a read-only clock.

>> > unless the display driver comes around and updates it. If it never does,
>> > or if it's not compiled in, then you're out of luck.
>> 
>> I'm all for managing the display clocks from CCF but it has proved tricky
>> so far. Maybe it will someday.
>> 
>> Being a read-only clock, the value is what it is and CCF should
>> deal with it gracefully. It has so far.
>>
>> If the driver actually managing the clock is not compiled in, then the
>> clock will never be set, and it should not be a problem either.
>
> Again, it depends on what you expect from clk_get_rate(). If it can only
> report a rate of 0 on error, then it's definitely a problem.

Agreed, it depends on what you expect from clk_get_rate().
Still when something does not oscillate, the rate is 0.

If a driver call clk_get_rate() on an uninitialized, unlocked PLL, I
think returning 0 makes sense.

>
> And it's not because it was done before that it wasn't just as
> problematic then.
>
>> >> IMO, whenever possible we should not put default values in the clocks
>> >> which is why I chose to leave it like that.
>> >>
>> >> The PLL being unlocked, it has no rate. It is not set to have any rate.
>> >> IMO a returning a rate of 0 is valid here.
>> >
>> > If there's not a sensible default in the hardware already, I don't see
>> > what the big issue is to be honest. You already kind of do that for all
>> > the other PLL parameters with init_regs
>> 
>> Those initial parameters are "magic" analog setting which don't have an
>> impact on the rate setting. The initial rate of the clock is never set
>> by the clock driver on purpose.
>
> It's still fundamentally the same: whatever is there at boot isn't good
> enough, so you change it to have a somewhat sensible default.

If you don't need it, no.

>
>> > , and most drivers do that for
>> > various stuff:
>> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/imx/clk-imx6q.c#L917
>> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32xx.c#L1550
>> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/rockchip/clk-rk3036.c#L448
>> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu-sun8i-h3.c#L1157
>> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/tegra/clk-tegra20.c#L1013
>> 
>> It is done by other drivers or controllers, yes. It does not make it
>> right (again, it is just my opinion). Rate should never be set by the
>> clock driver or the clock controller - Those should just implement what
>> consumer wants. I would agree it sometimes proves tricky to hold onto
>> this.
>> 
>> Taking one of the example above:
>> https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32xx.c#L1550
>> 
>> I think it would be better to have an "assigned-clock" on the related
>> PLL in the USB node of the platform DT. That way the PLL is set when
>> needed.
>
> Both are valid. Assigned-clocks is arguably more fragile, but that's not
> really the point.
>
>> If we go down the road of "others are doing it, so why not ?", I think Marek
>> initial regression report mentioned Exynos too ;) 
>
> Yes, he did mention exynos as well, but the issue was entirely
> different.
>
> Exynos had the issue that req_rate wasn't updated whenever a clock
> wasn't orphan anymore because it changed parent. It's fixed in patch 10.
>
> Out of the drivers I tested this week (sunxi-ng, exynos, omap3, qcom,
> imx6, imx8 and g12b), only meson is in this case.
>
>> > If the driver needs that kind of quirks in order to make the clock
>> > usable in itself, then it just makes sense to do that, especially if
>> > it's to avoid breaking a generic API.
>> 
>> As it is the clock are usable and it did not break anything so far.
>
> Anything but the abstraction.
>
>> I have no problem updating the drivers if need be. I do have a problem
>> with the framework changing and requiring the clock driver to set an
>> initial rate to make it happy.
>
> I mean, the alternative is changing the semantics of clk_get_rate(), and
> all the call sites. Fixing one inconsistent driver definitely seems
> preferable.
>
> Maxime
>
> [[End of PGP Signed Part]]

