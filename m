Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:40161 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbeGZKEF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 06:04:05 -0400
Received: by mail-wm0-f65.google.com with SMTP id y9-v6so1148364wma.5
        for <linux-clk@vger.kernel.org>; Thu, 26 Jul 2018 01:48:15 -0700 (PDT)
Message-ID: <190f2749c6e65fddcd2fd17ebdb45be5a434b869.camel@baylibre.com>
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: drop hard-coded rates from pll
 tables
From: jbrunet@baylibre.com
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Date: Thu, 26 Jul 2018 10:48:12 +0200
In-Reply-To: <CAFBinCD3i5pRzSp4Sx5349p_2XQfdCNguxU-gU1tD_asFu6YjA@mail.gmail.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
         <20180717095617.12240-4-jbrunet@baylibre.com>
         <d4e5e35a-39e0-fe27-8d27-387c5312ca32@baylibre.com>
         <CAFBinCBc_cFD2ACiSHVuRrXaqSyDnkJb2rem1_k2jwved=QXVw@mail.gmail.com>
         <1532206010.26720.84.camel@baylibre.com>
         <CAFBinCD3i5pRzSp4Sx5349p_2XQfdCNguxU-gU1tD_asFu6YjA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-07-21 at 23:34 +0200, Martin Blumenstingl wrote:
> On Sat, Jul 21, 2018 at 10:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > 
> > On Sat, 2018-07-21 at 22:16 +0200, Martin Blumenstingl wrote:
> > > > We could even add ranges instead of table when we know the PLL supports a well-known continuous dividers range.
> > > 
> > > I had a look at the sys_pll settings on Meson8b, here's what
> > > Meson8/Meson8b/Meson8m2 support for sys_pll:
> > > - 50..74
> > > - 76
> > > - 78
> > > - 80
> > > - 82
> > > - 84
> > > - 86
> > > - 88
> > > - 90
> > > - 92
> > > - 94
> > > - 96
> > > - 98
> > 
> > Are those values with the same predivider (n) value ?
> 
> yes, all are using n = 1

The table proposed in this patch keeps things the way they were before the
change. We could extend the table with these values in a follow up patch.

If those value are with n=1, then I would guess that odd values from 75 to 97
work as well. 


