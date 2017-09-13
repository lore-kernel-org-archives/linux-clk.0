Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <201709130826.AnbwLF3k%fengguang.wu@intel.com>
References: <1505115413-25483-1-git-send-email-aisheng.dong@nxp.com> <201709130826.AnbwLF3k%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 15:40:32 +0200
Message-ID: <CAMuHMdWQtKPbSUmyKQdMzuRuk2GZ2AD-XAosCo-of+_+x6pU5A@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: bulk: add of_clk_bulk_get()
To: kbuild test robot <lkp@intel.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, "kbuild-all@01.org" <kbuild-all@01.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
	Russell King <linux@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 13, 2017 at 2:34 AM, kbuild test robot <lkp@intel.com> wrote:
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on v4.13 next-20170912]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Dong-Aisheng/clk-bulk-add-of_clk_bulk_get/20170913-075645
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: x86_64-randconfig-x001-201737 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/dma/dw.h:15:0,
>                     from drivers//tty/serial/8250/8250_lpss.c:18:
>    include/linux/clk.h: In function 'of_clk_bulk_get':
>>> include/linux/clk.h:692:9: warning: return makes integer from pointer without a cast [-Wint-conversion]
>      return ERR_PTR(-ENOENT);
>             ^~~~~~~~~~~~~~~~
>    At top level:
>    include/linux/clk.h:689:12: warning: 'of_clk_bulk_get' defined but not used [-Wunused-function]
>     static int of_clk_bulk_get(struct device_node *np, int num_clks,
>                ^~~~~~~~~~~~~~~
>
> vim +692 include/linux/clk.h
>
>    681
>    682  #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
>    683  int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
>    684                                   struct clk_bulk_data *clks);
>    685  struct clk *of_clk_get(struct device_node *np, int index);
>    686  struct clk *of_clk_get_by_name(struct device_node *np, const char *name);
>    687  struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec);
>    688  #else
>    689  static int of_clk_bulk_get(struct device_node *np, int num_clks,
>    690                             struct clk_bulk_data *clks)
>    691  {
>  > 692          return ERR_PTR(-ENOENT);

That should be plain "return -ENOENT;".

>    693  }
>    694

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
