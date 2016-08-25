Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1472059613-30551-1-git-send-email-yamada.masahiro@socionext.com>
References: <1472059613-30551-1-git-send-email-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Aug 2016 09:52:47 +0200
Message-ID: <CAMuHMdUC9d4KNPTDY51DCptmMFQ1F2jLmRDO9WLt=WZA09qRew@mail.gmail.com>
Subject: Re: [PATCH v3] clk: let clk_disable() return immediately if clk is NULL
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>,
	Linux MIPS Mailing List <linux-mips@linux-mips.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
	Eric Miao <eric.y.miao@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>,
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
	bcm-kernel-feedback-list@broadcom.com, Wan ZongShun <mcuos.com@gmail.com>,
	Steven Miao <realmz6@gmail.com>, Russell King <linux@armlinux.org.uk>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 24, 2016 at 7:26 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Many of clk_disable() implementations just return for NULL pointer,
> but this check is missing from some.  Let's make it tree-wide
> consistent.  It will allow clock consumers to call clk_disable()
> without NULL pointer check.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Wan Zongshun <mcuos.com@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
