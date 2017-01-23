Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Mon, 23 Jan 2017 07:53:21 +0000
Message-ID: <be295fd327674a2ca91437456db7a047@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-2-chris.packham@alliedtelesis.co.nz>
 <20170121004819.GA8801@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 21/01/17 13:48, Stephen Boyd wrote:=0A=
> On 01/13, Chris Packham wrote:=0A=
>> @@ -158,6 +170,14 @@ static const struct coreclk_soc_desc axp_coreclks =
=3D {=0A=
>>  	.num_ratios =3D ARRAY_SIZE(axp_coreclk_ratios),=0A=
>>  };=0A=
>>=0A=
>> +static const struct coreclk_soc_desc mv98dx3236_coreclks =3D {=0A=
>> +	.get_tclk_freq =3D mv98dx3236_get_tclk_freq,=0A=
>> +	.get_cpu_freq =3D mv98dx3236_get_cpu_freq,=0A=
>> +	.get_clk_ratio =3D NULL,=0A=
>> +	.ratios =3D NULL,=0A=
>> +	.num_ratios =3D 0,=0A=
>=0A=
> Are these intentionally initialized to 0 explicitly? Otherwise we=0A=
> could leave them out and it's all the same.=0A=
>=0A=
=0A=
No reason, just didn't remove the unused members when copying the =0A=
armada-xp example above.=0A=
=0A=
>> +};=0A=
>> +=0A=
>>  /*=0A=
>>   * Clock Gating Control=0A=
>>   */=0A=
> [..]=0A=
>> @@ -243,5 +245,30 @@ static void __init of_cpu_clk_setup(struct device_n=
ode *node)=0A=
>>  	iounmap(clock_complex_base);=0A=
>>  }=0A=
>>=0A=
>> +/* Use this function to call the generic setup with the correct=0A=
>> + * clock operation=0A=
>> + */=0A=
>> +static void __init of_cpu_clk_setup(struct device_node *node)=0A=
>> +{=0A=
>> +	_of_cpu_clk_setup(node, &cpu_ops);=0A=
>> +}=0A=
>> +=0A=
>>  CLK_OF_DECLARE(armada_xp_cpu_clock, "marvell,armada-xp-cpu-clock",=0A=
>>  					 of_cpu_clk_setup);=0A=
>> +=0A=
>> +/* Define the clock and operations for the mv98dx3236 - it cannot perfo=
rm=0A=
>> + * any operations.=0A=
>> + */=0A=
>> +static const struct clk_ops mv98dx3236_cpu_ops =3D {=0A=
>> +	.recalc_rate =3D NULL,=0A=
>> +	.round_rate =3D NULL,=0A=
>> +	.set_rate =3D NULL,=0A=
>=0A=
> But clk_set_rate() works silently? Why not just register a clk=0A=
> provider that returns a NULL pointer? Then there isn't any=0A=
> structure to maintain?=0A=
>=0A=
=0A=
Not 100% sure what you mean. Something like this?=0A=
=0A=
+static void __init of_mv98dx3236_cpu_clk_setup(struct device_node *node)=
=0A=
+{=0A=
+       of_clk_add_provider(node, of_clk_src_simple_get, NULL);=0A=
+}=0A=
=0A=
Seems to work as expected (i.e. does nothing, kernel boots/runs).=0A=
=0A=
