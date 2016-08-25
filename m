Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH v3] clk: let clk_disable() return immediately if clk is
 NULL
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-clk@vger.kernel.org
References: <1472059613-30551-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-mips@linux-mips.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Eric Miao
 <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
 adi-buildroot-devel@lists.sourceforge.net, Greg Ungerer
 <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 bcm-kernel-feedback-list@broadcom.com, Wan ZongShun <mcuos.com@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven Miao <realmz6@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <194aebe5-38dd-f43d-fb4d-16ce592a68e8@gmail.com>
Date: Thu, 25 Aug 2016 08:27:07 -0700
MIME-Version: 1.0
In-Reply-To: <1472059613-30551-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 08/24/2016 10:26 AM, Masahiro Yamada wrote:
> Many of clk_disable() implementations just return for NULL pointer,
> but this check is missing from some.  Let's make it tree-wide
> consistent.  It will allow clock consumers to call clk_disable()
> without NULL pointer check.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Wan Zongshun <mcuos.com@gmail.com>
> ---
> 
> I came back after a long pause.
> You can see the discussion about the previous version:
> https://www.linux-mips.org/archives/linux-mips/2016-04/msg00063.html
> 
> 
> Changes in v3:
>   - Return only when clk is NULL.  Do not take care of error pointer.
> 
> Changes in v2:
>   - Rebase on Linux 4.6-rc1
> 
>  arch/arm/mach-mmp/clock.c        | 3 +++
>  arch/arm/mach-w90x900/clock.c    | 3 +++
>  arch/blackfin/mach-bf609/clock.c | 3 +++
>  arch/m68k/coldfire/clk.c         | 4 ++++
>  arch/mips/bcm63xx/clk.c          | 3 +++

For bcm63xx:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
