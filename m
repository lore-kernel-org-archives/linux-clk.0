Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D51EC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 12:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F22961212
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 12:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhJRMFp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 08:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhJRMFo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 08:05:44 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9EDC061714
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 05:03:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k7so40734201wrd.13
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 05:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=Nce8CnTyXfjSYzZLWq3ZfLvVXKy7UFb5OiCTyZIfNRc=;
        b=Y4CMeyS1ouEtK5Ad+kDBkh67k4nmqAkkPHRJPN9dpWDa+uGSy2Z3Zeav22R8cZljbP
         tuxsJMy9ET32WGEOrUkKL6N/emDzt7NZxLDeJs62Ulv2MFF16CZT3Lm5+0p3+JEqmJ7t
         wX8kqnSv5BBP+GTXhwXtDfLJvXfBL+LVxayBomhNpSAX1H7JA6jjC3glDocERmmgwHgK
         wZezYIzYz1eMjupsn5JFEk8WgTemVvWdUrGeS+IKqh6fIB5ZsjZ9Y2MlGaCJqIlV06is
         fnvhWrU2IPtjklJkfHCc9IgvttnFZ57OnMbevVXhgfoCl7DwRXjVhLV6rmADRxOt8uaE
         ZU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=Nce8CnTyXfjSYzZLWq3ZfLvVXKy7UFb5OiCTyZIfNRc=;
        b=Mi/+PuKlJY67LFsciuIFK0L45CH629DjmvUshHKmQYQ18/J8ZD8L9dXvp2+BdplJ4Q
         csMlYKXSi/8efSnWQeTdJoKd34iDBc5A9OCXj+m0mbJbBaqq9f6T/3rMt269HDLZk46j
         6eip7eXQyVCMfTJdjcBU1yQlePA5M2EGUonS37jxAJ1sF9wPIBqVdIFfdKjKkPW5fc5W
         8NVwkJwFGL1ObGdfbkEyPC5G+A1NjVFNtH0vqdnqz/JQ+D90eODwZ73Bbah/ltnYdODd
         /IltIlXzbLdDuxNTQffcr0f5XerCunIkcWgI44Fgz/CtzXSnw2cYfJ9V6ov0j/kJcxgZ
         oC1g==
X-Gm-Message-State: AOAM53240HUSHr6LKJQhU5ZnCR/iS4Q9AdBh+Py9qiI3BUOrz1tQv/nm
        Am4p5Ioco4tXkR9J9xkML0dQyQ==
X-Google-Smtp-Source: ABdhPJx8JOBz9Bj9EqtN2yR3LB9LTvY+vlWXlf3dUqk2giRYXbracK6yOh99Rj32q8UGhsZZu53xcA==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr35865595wrg.359.1634558611593;
        Mon, 18 Oct 2021 05:03:31 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t11sm12386134wrz.65.2021.10.18.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 05:03:31 -0700 (PDT)
References: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
 <1j5ytuvdmw.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBGZi3MRqTRshyCkq8AAaqHi2NkZVV80ppZr4Lx=xWOWA@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] clk: meson: gxbb: Add the spread spectrum bit for MPLL0
 on GXBB
Date:   Mon, 18 Oct 2021 13:55:32 +0200
In-reply-to: <CAFBinCBGZi3MRqTRshyCkq8AAaqHi2NkZVV80ppZr4Lx=xWOWA@mail.gmail.com>
Message-ID: <1jmtn6tu99.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 18 Oct 2021 at 13:44, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Mon, Oct 18, 2021 at 12:19 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Sat 16 Oct 2021 at 16:59, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > Christian reports that 48kHz audio does not work on his WeTek Play 2
>> > (which uses a GXBB SoC), while 44.1kHz audio works fine on the same
>> > board. He also reports that 48kHz audio works on GXL and GXM SoCs,
>> > which are using an (almost) identical AIU (audio controller).
>>
>> The above is a bit "personal" - it is not great fit for the commit
>> description. Please rephrase or put it in comment section bellow
> sure, I can rephrase that
>
> [...]
>> > Add the SSEN (spread spectrum enable) bit and add the
>> > CLK_MESON_MPLL_SPREAD_SPECTRUM flag to enable this bit for MPLL0. Do
>> > this for GXBB *only* since GXL doesn't seem to care if this bit is set
>> > or not, meaning that meson-clk-msr always sees (approximately) the same
>> > frequency as common clock framework.
>>
>>  1 - it is odd that we need to poke a bit in the register related to the
>>  fixed PLL but ok ...
>>  2 - 3.14 does yes, 4.9 does not soooo ... no real proof there
> The fact that 4.9 doesn't do it is also no proof for anything either.
> Amlogic hasn't ported forward GXBB support to their 4.9 kernel. Even
> "mesongxbb.dtsi" is missing there [0]
> So in my opinion the code from Amlogic's patched 4.9 kernel cannot be
> used as reference for anything GXBB related. Only the 3.14 code can be
> used as reference.
>
> [...]
>> So 2 things:
>>  - If this bit really enables spread spectrum on MPLL0 (or worse, the
>>  Fixed PLL) - checking clk measure is not enough. It is just a mean of
>>  the rate seen by the SoC itself. You would not see the effect of the
>>  spread spectrum here ... you need to capture the clock output with a
>>  scope for that.
> I suspect that a board with pin headers is needed to route the signal there?
> Personally I don't have any GXBB board(s).
>
>>  - Or the bit is incorrectly documented (or DDS0_SSEN does not mean
>>  spread spectrum). If it is not a spread spectrum function, then this
>>  patch seems to indicate it is and it is misleading.
>>
>> Either way, I'm not OK with it.
>>
>> To me, the rate drop that happens when you flip this bit looks more like
>> the effect SDM_EN should have.
>>
>> Could you check the internal values (n2 and sdm) compare this to the
>> output rate you actually get ? see if this leads to anything ? does
>> SDM_EN really has an effect on this MPLL ? it is a combination of both ?
> Christian has provided a dump of the HHI registers (via userspace,
> regmap makes them accessible).
> On GXBB WP2 HHI_MPLL_CNTL7 is set to 0x0006f208
> On GXL Le Potato (which he used for comparison as it wasn't affected
> by the MPLL0 issue) HHI_MPLL_CNTL7 is set to 0x0006b208
>
> If you're interested in the full HHI register dump you can find it here: [1]
> GXBB WP2 is on the left and GXL Le Potato is on the right.
>
> The difference here is BIT(14). un-setting BIT(14) (documented as
> EN_DDS0) did not change anything according to Christian's test.
> That also means that SDM, SDM_EN and N2 have the expected values.
> I manually did the maths:
> (2000000000Hz * 16384) / ((16384 * 6) + 12808) = 294909640.7Hz
> which matches what clk_summary sees:
> 294909641Hz

 ... and (2000000000Hz * 16384) / ((16384 * 6) = 333MHz which is fairly close
 to what you get w/o flipping the bit

>
> Just to clarify that I am not wasting Christian's time when I ask him
> to test something:
> next up we'll set SDM_EN to 0 (instead of 1) and see the reaction using clk-msr?
>

For example yes. I am asking check a bit more what this bit does and
what it does not:
 - I need confirmation whether or not it does spread spectrum. Yes this
 needs to be observed on a SoC pin, like MCLK with a fairly low divider
 to the averaging effect which could partially mask spread spectrum.

 - Get an idea what it actually does. The 2 calculations above are an
 hint. (Spread spectrum does not change the rate mean value)

>
> Best regards,
> Martin
>
>
> [0] https://github.com/hardkernel/linux/tree/db88db3864c5d6903fb11f6528874887d1c473ce/arch/arm64/boot/dts/amlogic
> [1] https://pastebin.com/raw/1cjPFsfa

