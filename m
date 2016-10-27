Return-Path: <mirza.krak@gmail.com>
MIME-Version: 1.0
In-Reply-To: <201610280016.MiLeMJw9%fengguang.wu@intel.com>
References: <1477576872-2665-6-git-send-email-mirza.krak@gmail.com> <201610280016.MiLeMJw9%fengguang.wu@intel.com>
From: Mirza Krak <mirza.krak@gmail.com>
Date: Thu, 27 Oct 2016 20:55:08 +0200
Message-ID: <CALw8SCXKBvpBKuDWVhNLtLPuO60wF1YPHm0hUZ7xverxrPT=Aw@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] ARM: tegra: Add Tegra20 GMI support
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
	Alexandre Courbot <gnurou@gmail.com>, linux@armlinux.org.uk, pdeschrijver@nvidia.com,
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org,
	robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-10-27 19:09 GMT+02:00 kbuild test robot <lkp@intel.com>:
> Hi Mirza,
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.9-rc2 next-20161027]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
>
> url:    https://github.com/0day-ci/linux/commits/Mirza-Krak/clk-tegra-add-TEGRA20_CLK_NOR-to-init-table/20161027-225528
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm-davinci_all_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm/boot/dts/tegra20.dtsi:1.1-8 syntax error
>    FATAL ERROR: Unable to parse input tree

That one was embarrassing. Sorry...

Best Regards
Mirza
