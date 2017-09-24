Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <201709240941.1xKB0Rqm%fengguang.wu@intel.com>
References: <1505893753-16143-1-git-send-email-aisheng.dong@nxp.com> <201709240941.1xKB0Rqm%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 24 Sep 2017 10:05:36 +0200
Message-ID: <CAMuHMdX5Sg+=DVDn9sgk5ikr5T8ygnHRCcrpPGEZPub0EDvbCw@mail.gmail.com>
Subject: Re: [PATCH V3 1/1] clk: bulk: add of_clk_bulk_get()
To: kbuild test robot <lkp@intel.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, "kbuild-all@01.org" <kbuild-all@01.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King <linux@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sun, Sep 24, 2017 at 4:06 AM, kbuild test robot <lkp@intel.com> wrote:
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.14-rc1 next-20170922]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Dong-Aisheng/clk-bulk-add-of_clk_bulk_get/20170921-203645
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: sh-apsh4a3a_defconfig (attached as .config)
> compiler: sh4-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=sh
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/sh/kernel/setup.c:28:0:
>>> include/linux/clk.h:689:12: error: 'of_clk_bulk_get' defined but not used [-Werror=unused-function]
>     static int of_clk_bulk_get(struct device_node *np, int num_clks,
>                ^~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
>
> vim +/of_clk_bulk_get +689 include/linux/clk.h
>
>    681
>    682  #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
>    683  int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
>    684                                   struct clk_bulk_data *clks);
>    685  struct clk *of_clk_get(struct device_node *np, int index);
>    686  struct clk *of_clk_get_by_name(struct device_node *np, const char *name);
>    687  struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec);
>    688  #else
>  > 689  static int of_clk_bulk_get(struct device_node *np, int num_clks,

static inline

>    690                             struct clk_bulk_data *clks)
>    691  {
>    692          return -ENOENT;
>    693  }
>    694

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
