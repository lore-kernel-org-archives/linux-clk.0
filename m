Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: cpg_mstp: build for R8A774{3,5}
Date: Thu, 24 Nov 2016 17:42:50 +0100
Message-ID: <3519250.EUT2N03tcp@wuerfel>
In-Reply-To: <CAMuHMdUY2S4gXANwGj3fYwtADQyQH-ZFT6EUQrViSYYq-LQ+xw@mail.gmail.com>
References: <20161124162448.3761610-1-arnd@arndb.de> <CAMuHMdUY2S4gXANwGj3fYwtADQyQH-ZFT6EUQrViSYYq-LQ+xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Thursday, November 24, 2016 5:38:45 PM CET Geert Uytterhoeven wrote:
> 
> R8A7745 and R8A7743 don't need the CPG_MSTP driver, they select
> CLK_RENESAS_CPG_MSSR instead.
> 
> Perhaps you still have your patch "[PATCH] clk: fix link error for rcar-gen2"
> applied to enable clk-rcar-gen2.o on R8A7745?
> 
> Gr{oetje,eeting}s,
> 

Ah, right. My mistake. I'll drop both then.

	Arnd
