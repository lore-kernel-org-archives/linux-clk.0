Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:56844 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751287AbcHVG3L (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Aug 2016 02:29:11 -0400
Date: Mon, 22 Aug 2016 08:28:56 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] [PATCH v2 0/3] clk: sunxi-ng: Add the A83T clocks
Message-Id: <20160822082856.6ca0aa6705bbadb70edb2330@free.fr>
In-Reply-To: <CAEzqOZuGbn0Qc62mLpPKuH+n8doVLQec5Lg-cvT2C5tqh1GFzg@mail.gmail.com>
References: <cover.1465666788.git.moinejf@free.fr>
        <CAEzqOZuGbn0Qc62mLpPKuH+n8doVLQec5Lg-cvT2C5tqh1GFzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 22 Aug 2016 02:23:51 +0800
Vishnu Patekar <vishnupatekar0510@gmail.com> wrote:

> Thanks for followup patches for a83t modern clock.
> 
> well, this patch series does not apply on sunxi/for-next.

Hi Vishnu,

This series is rather old!
Well, at this time, I was thinking that the 'modern' clock (aka
sunxi-ng) was a good thing, but, just after sending this series, I was
blocked, mainly because of the 'new timing' of the MMC clocks.
So, I rewrote and simplified the sunxi clock driver, and I submitted a
'ccu' patch which was refused by Maxime and Mike.

Actually, my 'ccu' driver is almost finished. The code is only 1200
lines in one file. It contains optimized computation of the clock
parameters, handles the H3 CPU frequency, the MMC 'new timing',
sigma-delta modulation for the audio PLL, the PRCM clocks and more.
The SoC specific tables (actually H3 and A83T) are about 10kB, but they
are defined as templates in .init.rodata, so that only the tables of the
current SoC remain in memory after system init.

This driver works fine for my Allwinner's boards and I will never go
back to the 'sunxi-ng' which is rather complex and lacks of flexibility.
If you are interested, the source is available in my site (see below).

-- 
Ken ar c'hentañ	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
