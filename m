Return-Path: <slash.tmp@free.fr>
Subject: Re: [PATCH v1] clk: Sigma Designs Tango4 cpuclk driver
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 clk <linux-clk@vger.kernel.org>, Mans Rullgard <mans@mansr.com>
References: <5613DBA2.20708@sigmadesigns.com>
 <20151008013054.GC26883@codeaurora.org>
From: Mason <slash.tmp@free.fr>
Message-ID: <56163BE1.6040402@free.fr>
Date: Thu, 8 Oct 2015 11:48:17 +0200
MIME-Version: 1.0
In-Reply-To: <20151008013054.GC26883@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

On 08/10/2015 03:30, Stephen Boyd wrote:

> Marc Gonzalez wrote:
>
>> Date: Tue, 6 Oct 2015 16:07:45 +0200
>> Subject: [PATCH] clk: Sigma Designs Tango4 cpuclk driver
> 
> This part doesn't go here. Please fix your mailer. Also, please
> add some commit text.

Sorry, I misread the instructions. Next submission will be
properly formatted.

Could you point out the most recent driver additions, so that
I may copy their log style?

>>  drivers/clk/Makefile     |  1 +
>>  drivers/clk/clk-tango4.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
> 
> Is there a DT binding document somewhere?

I assume this is a roundabout request for said document? :-)

Here's the actual clock tree DT I'm using:

+	clocks {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		xtal: xtal {
+			compatible = "fixed-clock";
+			clock-frequency = <27000000>;
+			#clock-cells = <0>;
+		};
+
+		pll0: pll0 {
+			compatible = "sigma,tango4-pll";
+			reg = <0x10000 4>;
+			clocks = <&xtal>;
+			#clock-cells = <0>;
+		};
+
+		pll1: pll1 {
+			compatible = "sigma,tango4-pll";
+			reg = <0x10008 4>;
+			clocks = <&xtal>;
+			#clock-cells = <0>;
+		};
+
+		cpuclk: cpuclk {
+			compatible = "sigma,tango4-cpuclk";
+			reg = <0x10024 4>;
+			clocks = <&pll0>;
+			#clock-cells = <0>;
+		};
+
+		periphclk: periphclk {
+			compatible = "fixed-factor-clock";
+			clocks = <&cpuclk>;
+			clock-mult = <1>;
+			clock-div  = <2>;
+			#clock-cells = <0>;
+		};
+
+		sysclk: sysclk {
+			compatible = "fixed-factor-clock";
+			clocks = <&pll1>;
+			clock-mult = <1>;
+			clock-div  = <3>; /* HW bug precludes other dividers */
+			#clock-cells = <0>;
+		};
+	};

"sigma,tango4-pll" requires two properties:
- reg: the address of the relevant clkgen register (size 4)
- clocks: the input clock (must be the crystal oscillator)
(I don't know if "#clock-cells = <0>;" is required?)

"sigma,tango4-cpuclk" requires two properties:
- reg: the address of the clkdiv register (size 4)
- clocks: the input clock (always pll0)
(I don't know if "#clock-cells = <0>;" is required?)

IIUC, I should provide this documentation in my patch?
(Will probably require an iteration or two to work out the
proper format.)

>>  2 files changed, 60 insertions(+)
>>  create mode 100644 drivers/clk/clk-tango4.c
>>
>> diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
>> new file mode 100644
>> index 000000000000..9c21e8c0b6e8
>> --- /dev/null
>> +++ b/drivers/clk/clk-tango4.c
>> @@ -0,0 +1,59 @@
>> +#include <linux/clk-provider.h>
>> +#include <linux/of_address.h>
> 
> We need a few more includes here for iomap, __init, readl().

OK.

<linux/clk-provider.h>
<linux/of_address.h>
<linux/init.h>
<linux/io.h>

>> +#define REG(name, ...) union name { struct { u32 __VA_ARGS__; }; u32 val; }
>> +
>> +REG(SYS_clkgen_pll, N:7, :6, K:3, M:3, :5, Isel:3, :3, T:1, B:1);
> 
> This is new to me. Using bitfields like this is not really a good
> idea though. Please just use masks, shifts, etc. instead.

You don't say /why/ it's not a good idea ;-)

The typical objection to bit-fields is that they are not portable.
As far as the compiler is concerned, the kernel community seems
to have "standardized" on gcc, for its convenient extensions.

<parenthesis>
Some people want to compile the kernel with icc or clang, but
there are several pit-falls.
https://llvm.linuxfoundation.org/index.php/Main_Page
https://software.intel.com/sites/default/files/article/146679/linuxkernelbuildwhitepaper.pdf
</parenthesis>

"bit-fields in gcc" are more easy to deal with than bit-fields
in general. Their behavior is specified here:

https://gcc.gnu.org/onlinedocs/gcc/Structures-unions-enumerations-and-bit-fields-implementation.html

Since this driver is only intended to be compiled for arm
(if ARCH_TANGOX), non-portability is not an issue. In gcc,
the order of allocation of bit-fields within a unit is
"Determined by [the] ABI". (I'm using EABI)

I've also relied on this gcc extension:
https://gcc.gnu.org/onlinedocs/gcc/Unnamed-Fields.html
to be able to write e.g. pll.N
(It's used elsewhere in the kernel)

What I like about the implementation using bit-fields is
that one only needs specify the layout, and computing the
offsets is left to the compiler (which is less error-prone).
Also the definition is short, and I find that the intent of

  pll.K

is clearer than

  (pll >> 13) & 7


[...] That being said, if I must forgo bit-fields to get this
driver accepted, I can write:

#define PLL_N(val) ((val) >>  0 & 0x7f)
#define PLL_K(val) ((val) >> 13 & 0x07)
#define PLL_M(val) ((val) >> 16 & 0x07)

Is that the preferred way?

>> +static void __init tango4_pll_setup(struct device_node *np)
>> +{
>> +	unsigned int mul, div;
>> +	union SYS_clkgen_pll pll;
>> +	const char *name = np->name;
>> +	const char *parent = of_clk_get_parent_name(np, 0);
>> +
>> +	void __iomem *clkgen_pll = of_iomap(np, 0);
> 
> What if of_iomap() fails?

If of_iomap() fails, the system will panic when it tries to
read from address 0.

I can make it explicit, if you prefer:

	if (clkgen_pll == NULL)
		panic("%s: invalid reg property\n", np->full_name);

>> +	pll.val = readl_relaxed(clkgen_pll);
>> +	iounmap(clkgen_pll);
>> +
>> +	mul = (pll.N + 1);
> 
> Parenthesis are useless, please remove.

They are aesthetic, to align the mul and div expressions.

>> +	div = (pll.M + 1) << pll.K;
>> +	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
>> +}
>> +
>> +static void __init tango4_div_setup(struct device_node *np)
>> +{
>> +	const char *name = np->name;
>> +	const char *parent = of_clk_get_parent_name(np, 0);
>> +	void __iomem *div_ctrl = of_iomap(np, 0);
>> +
>> +	clk_register_divider(NULL, name, parent, 0,
>> +		div_ctrl, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
>> +}
>> +
>> +CLK_OF_DECLARE(tango4_pll,    "sigma,tango4-pll",    tango4_pll_setup);
>> +CLK_OF_DECLARE(tango4_cpuclk, "sigma,tango4-cpuclk", tango4_div_setup);
> 
> More discussion will come with the binding, but we're pushing
> people towards making real platform drivers for their clock
> controllers, instead of parsing everything out of DT and having
> one node per clock. So if these are picking things out of some
> larger clock controller block, please rewrite the binding to be a
> real clock provider.

I don't understand what you wrote.

Could you explain what you meant?

Regards.
