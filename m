Return-Path: <gabriel.fernandez@st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "andrea.merello@gmail.com" <andrea.merello@gmail.com>,
        "radoslaw.pietrzyk@gmail.com" <radoslaw.pietrzyk@gmail.com>,
        Lee Jones
	<lee.jones@linaro.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        Ludovic BARRE <ludovic.barre@st.com>,
        "Olivier
 BIDEAU" <olivier.bideau@st.com>,
        Amelie DELAUNAY <amelie.delaunay@st.com>,
        "gabriel.fernandez.st@gmail.com" <gabriel.fernandez.st@gmail.com>
Subject: Re: [PATCH v5 1/2] clk: gate: expose clk_gate_ops::is_enabled
Date: Mon, 17 Jul 2017 07:30:08 +0000
Message-ID: <cca4fdb9-7150-0259-4a78-b705b76f2986@st.com>
References: <201707150222.ogIMUhKu%fengguang.wu@intel.com>
In-Reply-To: <201707150222.ogIMUhKu%fengguang.wu@intel.com>
Content-Type: text/plain; charset="Windows-1252"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


On 07/14/2017 08:52 PM, kbuild test robot wrote:
> Hi Gabriel,
>
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.12 next-20170714]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/gabriel-fernandez-st-com=
/clk-stm32h7-Add-stm32h743-clock-driver/20170714-170518
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-next
> config: arm-lpc32xx_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>          wget https://raw.githubusercontent.com/01org/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=3Darm
>
> All errors (new ones prefixed by >>):
>
>>> drivers/clk/nxp/clk-lpc32xx.c:906:12: error: static declaration of 'clk=
_gate_is_enabled' follows non-static declaration
>      static int clk_gate_is_enabled(struct clk_hw *hw)
>                 ^~~~~~~~~~~~~~~~~~~
>     In file included from drivers/clk/nxp/clk-lpc32xx.c:13:0:
>     include/linux/clk-provider.h:346:5: note: previous declaration of 'cl=
k_gate_is_enabled' was here
>      int clk_gate_is_enabled(struct clk_hw *hw);
>          ^~~~~~~~~~~~~~~~~~~
>
> vim +/clk_gate_is_enabled +906 drivers/clk/nxp/clk-lpc32xx.c
>
> f7c82a60 Vladimir Zapolskiy 2015-12-06  905
> f7c82a60 Vladimir Zapolskiy 2015-12-06 @906  static int clk_gate_is_enabl=
ed(struct clk_hw *hw)
> f7c82a60 Vladimir Zapolskiy 2015-12-06  907  {
> f7c82a60 Vladimir Zapolskiy 2015-12-06  908  	struct lpc32xx_clk_gate *cl=
k =3D to_lpc32xx_gate(hw);
> f7c82a60 Vladimir Zapolskiy 2015-12-06  909  	u32 val;
> f7c82a60 Vladimir Zapolskiy 2015-12-06  910  	bool is_set;
> f7c82a60 Vladimir Zapolskiy 2015-12-06  911
> f7c82a60 Vladimir Zapolskiy 2015-12-06  912  	regmap_read(clk_regmap, clk=
->reg, &val);
> f7c82a60 Vladimir Zapolskiy 2015-12-06  913  	is_set =3D val & BIT(clk->b=
it_idx);
> f7c82a60 Vladimir Zapolskiy 2015-12-06  914
> f7c82a60 Vladimir Zapolskiy 2015-12-06  915  	return (clk->flags & CLK_GA=
TE_SET_TO_DISABLE ? !is_set : is_set);
> f7c82a60 Vladimir Zapolskiy 2015-12-06  916  }
> f7c82a60 Vladimir Zapolskiy 2015-12-06  917  EXPORT_SYMBOL_GPL(__clk_gate=
_is_enabled);
>
>
> :::::: The code at line 906 was first introduced by commit
> :::::: f7c82a60ba26c2f003662bcb2cff131021c1e828 clk: lpc32xx: add common =
clock framework driver
>
> :::::: TO: Vladimir Zapolskiy <vz@mleia.com>
> :::::: CC: Michael Turquette <mturquette@baylibre.com>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion

Rename 'clk_gate_is_enabled' into'__clk_gate_is_enabled' from clk-gate.c=20
file, is it a good solution for you ?

i could add also EXPORT_SYMBOL_GPL(__clk_gate_is_enabled) if you are ok.


Best Regards
Gabriel=
