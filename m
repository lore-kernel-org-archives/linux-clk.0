Return-Path: <slash.tmp@free.fr>
From: Mason <slash.tmp@free.fr>
Subject: Two-output clk provider with standard clk consumer
To: clk <linux-clk@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <561CC7DA.1070101@free.fr>
Date: Tue, 13 Oct 2015 10:59:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

Hello everyone,

I'm trying to write a clk driver with the following features:
- a single input (crystal oscillator, modeled by fixed-clock)
- two separate outputs (cpuclk and sysclk) derived from two
separate internal PLLs (pll0 and pll1)

I would like to use cpuclk as the input to a fixed-factor-clock
node (cpuclk/2).

So the device tree would look like this:

	clocks {
		ranges;
		#address-cells = <1>;
		#size-cells = <1>;

		xtal: xtal {
			compatible = "fixed-clock";
			clock-frequency = <27000000>;
			#clock-cells = <0>;
		};

		clkgen: clkgen@10000 {
			compatible = "foo,clkgen";
			reg = <0x10000 0x30>;
			clocks = <&xtal>;
			#clock-cells = <1>;
		};

		periphclk: periphclk {
			compatible = "fixed-factor-clock";
			clocks = <&clkgen 0>;
			clock-mult = <1>;
			clock-div  = <2>;
			#clock-cells = <0>;
		};
	};

Does this look OK so far?


The driver would look like this:
(headers and error handling omitted for brevity)

static struct clk *output[2];
static struct clk_onecell_data clk_data = { output, 2 };
static void __iomem *clkgen_base;

static void __init make_pll(const char *name, const char *parent, void __iomem *reg)
{
	struct clk *clk;
	unsigned int val, mul, div;

	val = readl_relaxed(reg);
	mul = foo(val);
	div = bar(val);
	clk = clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
	printk("clk = %p\n", clk);
}

static void __init clkgen_setup(struct device_node *np)
{
	int ret;
	const char *parent = of_clk_get_parent_name(np, 0);

	clkgen_base = of_iomap(np, 0);
	make_pll("pll0", parent, clkgen_base + 0);
	make_pll("pll1", parent, clkgen_base + 8);
	output[0] = clk_register_divider(NULL, "cpuclk", "pll0", 0,
			clkgen_base + 0x24, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
	output[1] = clk_register_fixed_factor(NULL, "sysclk", "pll1", 0, 1, 3);

	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
	printk("ret=%d out0=%p out1=%p\n", ret, output[0], output[1]);
}

CLK_OF_DECLARE(myclkgen, "foo,clkgen", clkgen_setup);


But the periphclk setup fails because the fixed-factor-clock driver only
looks up the parent name using of_clk_get_parent_name ("clkgen" in my case)
and calls:

clk_register_fixed_factor(NULL, "periphclk", "clkgen", 0, 1, 2);

Which doesn't keep track of the clkgen output index... <confused>

Can someone please point out what I am missing?

Thanks!
