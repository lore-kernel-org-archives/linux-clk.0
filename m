Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1532204819.26720.68.camel@baylibre.com>
Subject: Re: [PATCH 1/3] clk: meson: clk-pll: add enable bit
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Date: Sat, 21 Jul 2018 22:26:59 +0200
In-Reply-To: <CAFBinCCDGKu5U1xY1WG2BHF28YEWd1HbKdDeTCc9fEV_YjSNew@mail.gmail.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
         <20180717095617.12240-2-jbrunet@baylibre.com>
         <CAFBinCCDGKu5U1xY1WG2BHF28YEWd1HbKdDeTCc9fEV_YjSNew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-07-21 at 21:48 +0200, Martin Blumenstingl wrote:
> > @@ -250,11 +264,15 @@ static const struct reg_sequence axg_hifi_init_regs[] = {
> >          { .reg = HHI_HIFI_PLL_CNTL3,    .def = 0x0a6a3a88 },
> >          { .reg = HHI_HIFI_PLL_CNTL4,    .def = 0xc000004d },
> >          { .reg = HHI_HIFI_PLL_CNTL5,    .def = 0x00058000 },
> > -       { .reg = HHI_HIFI_PLL_CNTL,     .def = 0x40010250 },
> 
> is this change on purpose? this line set en, m, n, l and od before
> maybe you can document it in the commit message

Yes the change is on purpose, but as you pointed out it is worth a comment

Actually, when taking od out of the pll driver, I remembered this 'initial
setting' and it kinda bothered me

If the od divider registers after the DCO, the value could have changed with it,
which is why I wanted to remove the write on this register

As you pointed out, in this register, we find m, n, od ... and enable. In a way,
removing this register setting was the reason why I wanted to add the enable bit
to begin with :)
