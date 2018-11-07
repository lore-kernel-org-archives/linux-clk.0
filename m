Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE18C0044C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 18:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 874172081D
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 18:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="dYm9xICH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 874172081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbeKHETQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Nov 2018 23:19:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37052 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbeKHETQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Nov 2018 23:19:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id p17so12242268lfh.4
        for <linux-clk@vger.kernel.org>; Wed, 07 Nov 2018 10:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=fdhesnwODR1IUqoa62aCJQitJnka6y/M2DWmc07iOSo=;
        b=dYm9xICHkHRE5lBCEYV2BPKQ56Y2eKahzBo+6ZIwkVzlt1yB3VUs3+brOiFmTk6dIe
         IL18AFnwXmewlwwqtu0wD3Im1jp4o2NBEPnhw2pYLNZQbnhgd+hN5UdzJNfoept1rKcg
         zQ0sdLJUcQfMeVKRyj7FJFcT3WexBQdUgiVtVnSr0scn41hljQropzo6w6+bgwomTAh0
         FvoW8gC+8xTCnEbFmJfLKCiqAKKJpP0AzwyzHjsDcoO+jALG+2IMlp2Fr3wRuhnfKJ+D
         HF4zt0IA9/qjf/tOkQaIYl0A8FPIAGwkeMvizjP9NTPoxI8uh6N+V9UDoBFQ2B0ss1HR
         u2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fdhesnwODR1IUqoa62aCJQitJnka6y/M2DWmc07iOSo=;
        b=G6ZBSNGldv7MDexFU/nJ+OXxo33569AzziJqOJx6ZcLA2n8hKrfIOtzSw22yMfRrYt
         ZQ8jtRgcDdK0smFd+o2EVChI7HDojiL8Ej4RLvhtGe6v7WgMz49YU/EsXSjEjW3AYR9n
         w1bXkV3Vj4xBE7LwXy28pNhVRAyE9BGTTNHKhGn8y6TtlxOFCgHkmreYogwhr9DTx1LM
         hmzrr9GH002CUkUuL71eEai/7WzK9olWNSprpOhgwt5Isd7VwJTNQ/yZfm6ZFeucnz5Q
         xK2FVJL89bf804NW1NByL18o2eS0rxwJ2XLFuuZfc2ASCeTSQIt7WnTrXpPxCtLvAZT4
         k1Bw==
X-Gm-Message-State: AGRZ1gLpZQ48NRfH0spi2iurxfgUa1wZCzG9D7tgNSoVzk9qmdNR71Ad
        hFicVRCCR4eL36nR+OhIVv3eJvDN8iBfYZy8zNv5kA==
X-Google-Smtp-Source: AJdET5dgEsX+VCUe3E+btA7Zs0MRxvxhzwAPzLR3Sfs6cagOwHfG4mfvPJBb5Rn3w+vGu9/fFrA/0irWawPe158p2qo=
X-Received: by 2002:a19:1901:: with SMTP id 1mr729485lfz.99.1541616456574;
 Wed, 07 Nov 2018 10:47:36 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <20181107171723.GI9919@thunk.org> <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
In-Reply-To: <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Wed, 7 Nov 2018 10:47:24 -0800
Message-ID: <CAOesGMg+jW7SN2+E_FYbwi8GdNhc8KrEsahB-Nn+AseO6kLGXA@mail.gmail.com>
Subject: Re: [TECH TOPIC] SoC maintainer group
To:     Theodore Tso <tytso@mit.edu>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Russell King <rmk@armlinux.org.uk>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kevin Hilman <khilman@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 7, 2018 at 9:35 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Nov 7, 2018 at 9:17 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> >
> > On Tue, Nov 06, 2018 at 02:16:27PM -0800, Olof Johansson wrote:
> > >
> > > Olof Johansson (arm-soc)
> > > Arnd Bergmann (arm-soc)
> > > Kevin Hilman (arm-soc)
> > > Mike Turquette (clk)
> > > Stephen Boyd (clk)
> > > Linus Walleij (pinctrl + more)
> > > Mike Brown (gpio/regmap + more)
> >
> > Could the poeple listed on this list please list potential schedule conflicts?
> >
> > I'm going to assume we should avoid: Andriod uConf, RISC-V uConf,
> > Device Tree uConf.  What are other potential conflicts.  I'm going to
> > guess this might be "interesting" to schedule.  :-)
>
> Yeah, apologies for adding a bunch of cross-coordination this late too.
>
> It's likely going to be conflict-ridden no matter what we do. RISC-V
> and DT are the main conflicts, Android probably has a bit less.
>
> Tuesday afternoon looks least conflict-y when I squint at the
> schedule, or Thursday afternoon (but ideally not overlapping with
> Daniel's DRM/gitlab session).

Ted,

Can we have 3pm-3:30pm on Thursday? It seems relatively low on
embedded-related conflicts and at 3  people would have time to migrate
from Daniel Vetter's gitlab talk if needed.


-Olof
