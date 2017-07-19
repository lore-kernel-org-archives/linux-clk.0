Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170718214339.7774-12-robh@kernel.org>
References: <20170718214339.7774-12-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jul 2017 09:44:23 +0200
Message-ID: <CAMuHMdU6ZV=vHNWjPdzDQ=qmS9GJ0GUUOWGRY7+zJkse_xP1MQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Convert to using %pOF instead of full_name
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Tero Kristo <t-kristo@ti.com>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-tegra@vger.kernel.org,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 18, 2017 at 11:42 PM, Rob Herring <robh@kernel.org> wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  drivers/clk/renesas/clk-mstp.c       |  2 +-
>  drivers/clk/renesas/clk-rcar-gen2.c  |  3 +--

For clk/renesas:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
