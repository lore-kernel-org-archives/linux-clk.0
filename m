Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAF7C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 23 Nov 2021 17:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236778AbhKWRrc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 12:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbhKWRrb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Nov 2021 12:47:31 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCF5C061574
        for <linux-clk@vger.kernel.org>; Tue, 23 Nov 2021 09:44:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id r11so95485020edd.9
        for <linux-clk@vger.kernel.org>; Tue, 23 Nov 2021 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vrY1zJ4n68tLP0TAn7XBsH+/OL/+n5K9MMhzClHSR88=;
        b=NtaY1WjxJpV5MjxOKVpDj1uFrKbVrKpI6DVvdeX8Ht1XJUXZriIQ5DhhkgAdAgnldl
         v7UmAi1e5Tmv0oYC3UlrR3T57eAuLPEEUSg4kLaH9r0v4gBSX4OvwFGbRsT16+cMc3u1
         Ylcp39f/XlSsozadGkaxofs6OtqlOX8homjkunZk91MmZFztibTADvfQ1WhKBCAECE4S
         AakzKFQkZbmzkOmR4lO0xJPOdo5QRm9R/mBXKsmlRuq19MVgGNlHf7vzIH2dd28HxR59
         PnPdPvprPnnYtjafQDka/cvN5QOEsEOmcRhIrIHQYGX/Odgn6smtWVWvRU1OXiWMgmqq
         db0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vrY1zJ4n68tLP0TAn7XBsH+/OL/+n5K9MMhzClHSR88=;
        b=U6QzssaTtin1qK7XEoFIiQq+ob/ngbrFGH5A8NIjnWiDCs8Bq3gXiKRV2Wt8PzaaQm
         u8Uhn8FFuPMWRhvdz/PORk5sQnP1F5BcwMDC1V+3LZrdQqPK4MFJo7vxFlYUw71hn1fD
         BN8Otg6rgbKPd5hN7A8mwwV5wVDmdBYzAOB0/ADgy6e3jMk5bWhEtX7pyTC5Pm685qMP
         cNlidkconPl5PE5EPEbtg9X/a8Fys49BFhrOybzX0th/mzMpE/KjARuMPE4DXp3MhC+E
         98FdH8DT1sU4/e9LXDMklyEO4EDV4uPUpx/IEtDM0lNZImRJT/tjukoVSFJeejayoliS
         ev9A==
X-Gm-Message-State: AOAM533W2ODRZU3iffiD+2xnyf8OClRO0CF/T+XJ0AKcXVjassEyQ+j/
        dyRUEmBQFJyhxiSX28+IXx7CtjTZ1USQLHKRL8WKEA==
X-Google-Smtp-Source: ABdhPJwDddXRJ/odEdDjW0g5a5Ipj9Bv+URAsRCGMS9nCn9jivqxCoNCrrOhZVDV5lH8UnS+BwmUJTFB7d5au1f5aWc=
X-Received: by 2002:a17:906:58ce:: with SMTP id e14mr9672142ejs.525.1637689461995;
 Tue, 23 Nov 2021 09:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20211013172042.10884-1-semen.protsenko@linaro.org>
 <CAOMZO5CT+5=py=TBUMOZKRDsacNnGWV2TPBE7RtnZ3ocBBVReA@mail.gmail.com>
 <CAPLW+4ne9xDxDW=RCzjXURujGCwbCU5mOrfPJ6bn2wY41jstiw@mail.gmail.com> <CAPLW+4kp6G8QeMUggEhMLyB6gfbNpiyp1hn_+O76C_iVoAj53g@mail.gmail.com>
In-Reply-To: <CAPLW+4kp6G8QeMUggEhMLyB6gfbNpiyp1hn_+O76C_iVoAj53g@mail.gmail.com>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 23 Nov 2021 11:43:55 -0600
Message-ID: <CAEG3pNCxuPNwqvRWnMuFNMmiV0nZRwC+1M69jVC=uMyS5Jie6Q@mail.gmail.com>
Subject: Re: [PATCH v6] clk: Add write operation for clk_parent debugfs node
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 22, 2021 at 10:03 AM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
>
> On Tue, 19 Oct 2021 at 16:32, Sam Protsenko <semen.protsenko@linaro.org> wrote:
> >
> > On Wed, 13 Oct 2021 at 21:04, Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > Hi Sam,
> > >
> > > On Wed, Oct 13, 2021 at 2:20 PM Sam Protsenko
> > > <semen.protsenko@linaro.org> wrote:
> > > >
> > > > Useful for testing mux clocks. One can write the index of the parent to
> > > > be set into clk_parent node, starting from 0. Example
> > > >
> > > >     # cd /sys/kernel/debug/clk/mout_peri_bus
> > > >     # cat clk_possible_parents
> > > >       dout_shared0_div4 dout_shared1_div4
> > > >     # cat clk_parent
> > > >       dout_shared0_div4
> > > >     # echo 1 > clk_parent
> > > >     # cat clk_parent
> > > >       dout_shared1_div4
> > > >
> > > > CLOCK_ALLOW_WRITE_DEBUGFS has to be defined in drivers/clk/clk.c in
> > > > order to use this feature.
> > > >
> > > > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > This is useful, thanks:
> > >
> > > Reviewed-by: Fabio Estevam <festevam@gmail.com>
> >
> > Hi Michael, Stephen,
> >
> > If there are no outstanding comments, can you please take this one?
> >
>
> Bump.

Looks good to me.

Acked-by: Michael Turquette <mturquette@baylibre.com>

Stephen, can you take it into your tree?

Best,
Mike

>
> > Thanks!



-- 
Michael Turquette
CEO - Los Angeles, CA
http://baylibre.com/
