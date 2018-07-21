Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1532206010.26720.84.camel@baylibre.com>
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: drop hard-coded rates from pll
 tables
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Date: Sat, 21 Jul 2018 22:46:50 +0200
In-Reply-To: <CAFBinCBc_cFD2ACiSHVuRrXaqSyDnkJb2rem1_k2jwved=QXVw@mail.gmail.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
         <20180717095617.12240-4-jbrunet@baylibre.com>
         <d4e5e35a-39e0-fe27-8d27-387c5312ca32@baylibre.com>
         <CAFBinCBc_cFD2ACiSHVuRrXaqSyDnkJb2rem1_k2jwved=QXVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-07-21 at 22:16 +0200, Martin Blumenstingl wrote:
> > We could even add ranges instead of table when we know the PLL supports a well-known continuous dividers range.
> 
> I had a look at the sys_pll settings on Meson8b, here's what
> Meson8/Meson8b/Meson8m2 support for sys_pll:
> - 50..74
> - 76
> - 78
> - 80
> - 82
> - 84
> - 86
> - 88
> - 90
> - 92
> - 94
> - 96
> - 98

Are those values with the same predivider (n) value ?
I suspect the ability of the DCO to lock might depends on its input rate and an
m range

So if n change, it might possible that the m range will be different.

... at least, that's my guess :)

> 
> (I'm providing this info because it may help finding a decision
> whether ranges are good or not. I have no preference)
