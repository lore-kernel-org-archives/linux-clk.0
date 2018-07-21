Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:38218 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbeGUW3C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Jul 2018 18:29:02 -0400
MIME-Version: 1.0
References: <20180717095617.12240-1-jbrunet@baylibre.com> <20180717095617.12240-4-jbrunet@baylibre.com>
 <d4e5e35a-39e0-fe27-8d27-387c5312ca32@baylibre.com> <CAFBinCBc_cFD2ACiSHVuRrXaqSyDnkJb2rem1_k2jwved=QXVw@mail.gmail.com>
 <1532206010.26720.84.camel@baylibre.com>
In-Reply-To: <1532206010.26720.84.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 21 Jul 2018 23:34:39 +0200
Message-ID: <CAFBinCD3i5pRzSp4Sx5349p_2XQfdCNguxU-gU1tD_asFu6YjA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: drop hard-coded rates from pll tables
To: jbrunet@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

On Sat, Jul 21, 2018 at 10:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat, 2018-07-21 at 22:16 +0200, Martin Blumenstingl wrote:
> > > We could even add ranges instead of table when we know the PLL supports a well-known continuous dividers range.
> >
> > I had a look at the sys_pll settings on Meson8b, here's what
> > Meson8/Meson8b/Meson8m2 support for sys_pll:
> > - 50..74
> > - 76
> > - 78
> > - 80
> > - 82
> > - 84
> > - 86
> > - 88
> > - 90
> > - 92
> > - 94
> > - 96
> > - 98
>
> Are those values with the same predivider (n) value ?
yes, all are using n = 1

> I suspect the ability of the DCO to lock might depends on its input rate and an
> m range
>
> So if n change, it might possible that the m range will be different.
>
> ... at least, that's my guess :)
for the Meson8b's SYS_PLL Amlogic's GPL kernel is using bits 15:14 in
HHI_SYS_PLL_CNTL for frequencies above 1.64GHz (below that these
reserved bits are always 0).
if the values are useful for you (format is: frequency, m, n, od and
bits 15:14. what's missing here is the "cpu_scale_div" divider which
is for example why you'll see the "56, 1, 2, 0" tuple multiple times):
SYS_PLL(24000, 56, 1, 2, 0)
SYS_PLL(48000, 64, 1, 2, 0)
SYS_PLL(72000, 72, 1, 2, 0)
SYS_PLL(96000, 64, 1, 2, 0)
SYS_PLL(120000, 80, 1, 2, 0)
SYS_PLL(144000, 96, 1, 2, 0)
SYS_PLL(168000, 56, 1, 1, 0)
SYS_PLL(192000, 64, 1, 1, 0)
SYS_PLL(216000, 72, 1, 1, 0)
SYS_PLL(240000, 80, 1, 1, 0)
SYS_PLL(264000, 88, 1, 1, 0)
SYS_PLL(288000, 96, 1, 1, 0)
SYS_PLL(312000, 52, 1, 2, 0)
SYS_PLL(336000, 56, 1, 2, 0)
SYS_PLL(360000, 60, 1, 2, 0)
SYS_PLL(384000, 64, 1, 2, 0)
SYS_PLL(408000, 68, 1, 2, 0)
SYS_PLL(432000, 72, 1, 2, 0)
SYS_PLL(456000, 76, 1, 2, 0)
SYS_PLL(480000, 80, 1, 2, 0)
SYS_PLL(504000, 84, 1, 2, 0)
SYS_PLL(528000, 88, 1, 2, 0)
SYS_PLL(552000, 92, 1, 2, 0)
SYS_PLL(576000, 96, 1, 2, 0)
SYS_PLL(600000, 50, 1, 1, 0)
SYS_PLL(624000, 52, 1, 1, 0)
SYS_PLL(648000, 54, 1, 1, 0)
SYS_PLL(672000, 56, 1, 1, 0)
SYS_PLL(696000, 58, 1, 1, 0)
SYS_PLL(720000, 60, 1, 1, 0)
SYS_PLL(744000, 62, 1, 1, 0)
SYS_PLL(768000, 64, 1, 1, 0)
SYS_PLL(792000, 66, 1, 1, 0)
SYS_PLL(816000, 68, 1, 1, 0)
SYS_PLL(840000, 70, 1, 1, 0)
SYS_PLL(864000, 72, 1, 1, 0)
SYS_PLL(888000, 74, 1, 1, 0)
SYS_PLL(912000, 76, 1, 1, 0)
SYS_PLL(936000, 78, 1, 1, 0)
SYS_PLL(960000, 80, 1, 1, 0)
SYS_PLL(984000, 82, 1, 1, 0)
SYS_PLL(1008000, 84, 1, 1, 0)
SYS_PLL(1032000, 86, 1, 1, 0)
SYS_PLL(1056000, 88, 1, 1, 0)
SYS_PLL(1080000, 90, 1, 1, 0)
SYS_PLL(1104000, 92, 1, 1, 0)
SYS_PLL(1128000, 94, 1, 1, 0)
SYS_PLL(1152000, 96, 1, 1, 0)
SYS_PLL(1176000, 98, 1, 1, 0)
SYS_PLL(1200000, 50, 1, 0, 0)
SYS_PLL(1224000, 51, 1, 0, 0)
SYS_PLL(1248000, 52, 1, 0, 0)
SYS_PLL(1272000, 53, 1, 0, 0)
SYS_PLL(1296000, 54, 1, 0, 0)
SYS_PLL(1320000, 55, 1, 0, 0)
SYS_PLL(1344000, 56, 1, 0, 0)
SYS_PLL(1368000, 57, 1, 0, 0)
SYS_PLL(1392000, 58, 1, 0, 0)
SYS_PLL(1416000, 59, 1, 0, 0)
SYS_PLL(1440000, 60, 1, 0, 0)
SYS_PLL(1464000, 61, 1, 0, 0)
SYS_PLL(1488000, 62, 1, 0, 0)
SYS_PLL(1512000, 63, 1, 0, 0)
SYS_PLL(1536000, 64, 1, 0, 0)
SYS_PLL(1560000, 65, 1, 0, 0)
SYS_PLL(1584000, 66, 1, 0, 0)
SYS_PLL(1608000, 67, 1, 0, 0)
SYS_PLL(1632000, 68, 1, 0, 0)
SYS_PLL(1656000, 68, 1, 0, 1)
SYS_PLL(1680000, 68, 1, 0, 2)
SYS_PLL(1704000, 68, 1, 0, 3)
SYS_PLL(1728000, 69, 1, 0, 0)
SYS_PLL(1752000, 69, 1, 0, 1)
SYS_PLL(1776000, 69, 1, 0, 2)
SYS_PLL(1800000, 69, 1, 0, 3)
SYS_PLL(1824000, 70, 1, 0, 0)
SYS_PLL(1848000, 70, 1, 0, 1)
SYS_PLL(1872000, 70, 1, 0, 2)
SYS_PLL(1896000, 70, 1, 0, 3)
SYS_PLL(1920000, 71, 1, 0, 0)
SYS_PLL(1944000, 71, 1, 0, 1)
SYS_PLL(1968000, 71, 1, 0, 2)
SYS_PLL(1992000, 71, 1, 0, 3)
SYS_PLL(2016000, 72, 1, 0, 0)
SYS_PLL(2040000, 72, 1, 0, 1)
SYS_PLL(2064000, 72, 1, 0, 2)
SYS_PLL(2088000, 72, 1, 0, 3)
SYS_PLL(2112000, 73, 1, 0, 0)


Regards
Martin
