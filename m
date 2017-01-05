Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Mark Rutland <mark.rutland@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring
	<robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Thu, 5 Jan 2017 23:05:50 +0000
Message-ID: <b04de1109e7c4c25b4c54aae54f641e2@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170105033641.6212-2-chris.packham@alliedtelesis.co.nz>
 <20170105135302.GB25333@leverpostej>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 06/01/17 03:01, Mark Rutland wrote:=0A=
> On Thu, Jan 05, 2017 at 04:36:37PM +1300, Chris Packham wrote:=0A=
>> The 98DX3236, 98DX3336, 98DX4521 and variants have a different TCLK from=
=0A=
>> the Armada XP (200MHz vs 250MHz). The CPU core clock is fixed at 800MHz.=
=0A=
>>=0A=
>> The clock gating options are a subset of those on the Armada XP.=0A=
>>=0A=
>> The core clock divider is different to the Armada XP also.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - Update devicetree binding documentation for new compatible string=0A=
>>=0A=
>>  .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |   1 +=0A=
>>  drivers/clk/mvebu/Makefile                         |   2 +-=0A=
>>  drivers/clk/mvebu/armada-xp.c                      |  42 +++++=0A=
>>  drivers/clk/mvebu/clk-cpu.c                        |  33 +++-=0A=
>>  drivers/clk/mvebu/mv98dx3236-corediv.c             | 207 ++++++++++++++=
+++++++=0A=
>>  5 files changed, 281 insertions(+), 4 deletions(-)=0A=
>>  create mode 100644 drivers/clk/mvebu/mv98dx3236-corediv.c=0A=
>=0A=
>=0A=
> It looks like you also need to update=0A=
> Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt for the=
=0A=
> addition of "marvell,mv98dx3236-corediv-clock".=0A=
=0A=
Will do.=0A=
=0A=
>=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=
 b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=0A=
>> index 99c214660bdc..7f28506eaee7 100644=0A=
>> --- a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=0A=
>> +++ b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=0A=
>> @@ -3,6 +3,7 @@ Device Tree Clock bindings for cpu clock of Marvell EBU =
platforms=0A=
>>  Required properties:=0A=
>>  - compatible : shall be one of the following:=0A=
>>  	"marvell,armada-xp-cpu-clock" - cpu clocks for Armada XP=0A=
>> +	"marvell,mv98dx3236-cpu-clock" - cpu clocks for 98DX3236 SoC=0A=
>>  - reg : Address and length of the clock complex register set, followed=
=0A=
>>          by address and length of the PMU DFS registers=0A=
>>  - #clock-cells : should be set to 1.=0A=
>=0A=
> [...]=0A=
>=0A=
>> +static void __init mv98dx3236_corediv_clk_init(struct device_node *node=
)=0A=
>> +{=0A=
>> +	struct clk_init_data init;=0A=
>> +	struct clk_corediv *corediv;=0A=
>> +	struct clk **clks;=0A=
>> +	void __iomem *base;=0A=
>> +	const __be32 *off;=0A=
>> +	const char *parent_name;=0A=
>> +	const char *clk_name;=0A=
>> +	int len;=0A=
>> +	struct device_node *dfx_node;=0A=
>> +=0A=
>> +	dfx_node =3D of_parse_phandle(node, "base", 0);=0A=
>> +	if (WARN_ON(!dfx_node))=0A=
>=0A=
> What's going on here? The existing bingings don't mention a "base"=0A=
> phandle, and nothing was added to describe it.=0A=
>=0A=
>> +		return;=0A=
>> +=0A=
>> +	off =3D of_get_property(node, "reg", &len);=0A=
>> +	if (WARN_ON(!off))=0A=
>> +		return;=0A=
>=0A=
> Please don't use of_get_property directly; generally you should use the=
=0A=
> existing higher-level helpers like of_proeprty_read_u32().=0A=
>=0A=
>> +=0A=
>> +	base =3D of_iomap(dfx_node, 0);=0A=
>> +	if (WARN_ON(!base))=0A=
>> +		return;=0A=
>> +=0A=
>> +	of_node_put(dfx_node);=0A=
>> +=0A=
>> +	parent_name =3D of_clk_get_parent_name(node, 0);=0A=
>> +=0A=
>> +	clk_data.clk_num =3D 1;=0A=
>> +=0A=
>> +	/* clks holds the clock array */=0A=
>> +	clks =3D kcalloc(clk_data.clk_num, sizeof(struct clk *),=0A=
>> +				GFP_KERNEL);=0A=
>> +	if (WARN_ON(!clks))=0A=
>> +		goto err_unmap;=0A=
>> +	/* corediv holds the clock specific array */=0A=
>> +	corediv =3D kcalloc(clk_data.clk_num, sizeof(struct clk_corediv),=0A=
>> +				GFP_KERNEL);=0A=
>> +	if (WARN_ON(!corediv))=0A=
>> +		goto err_free_clks;=0A=
>> +=0A=
>> +	spin_lock_init(&corediv->lock);=0A=
>> +=0A=
>> +	of_property_read_string_index(node, "clock-output-names",=0A=
>> +					  0, &clk_name);=0A=
>> +=0A=
>> +	init.num_parents =3D 1;=0A=
>> +	init.parent_names =3D &parent_name;=0A=
>> +	init.name =3D clk_name;=0A=
>> +	init.ops =3D &ops;=0A=
>> +	init.flags =3D 0;=0A=
>> +=0A=
>> +	corediv[0].reg =3D (void *)((int)base + be32_to_cpu(*off));=0A=
>=0A=
> I don't understand this, but I guess this has something to do with that=
=0A=
> base phandle. Is the corediv clock a sub-component of some "base" clock?=
=0A=
> I don't think this binding is the best way of describing that.=0A=
=0A=
Actually once I've got things setup correctly via the dts I only need =0A=
some minor modification to mvebu/clk-corediv.c to handle the differences =
=0A=
in the bit fields used.=0A=
=0A=
>=0A=
> Thanks,=0A=
> Mark.=0A=
>=0A=
=0A=
