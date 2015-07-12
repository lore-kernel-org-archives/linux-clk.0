Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1436569409-27964-7-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
	<1436569409-27964-7-git-send-email-sboyd@codeaurora.org>
Date: Sun, 12 Jul 2015 12:40:18 +0200
Message-ID: <CAMuHMdXsgQQJG99yimSeejsh0wJacMCqHwa9T2gtHuqduKXcwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] simplefb: Include clk.h
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Luc Verhaegen <libv@skynet.be>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	David Herrmann <dh.herrmann@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 11, 2015 at 1:03 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> This driver uses the consumer API, so include clk.h explicitly
> instead of impliclty through the provider API.
>
> Cc: Luc Verhaegen <libv@skynet.be>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: David Herrmann <dh.herrmann@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
