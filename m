Return-Path: <mirza.krak@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1472627744.31008.2.camel@toradex.com>
References: <1472569308.5703.22.camel@toradex.com> <1472627744.31008.2.camel@toradex.com>
From: Mirza Krak <mirza.krak@gmail.com>
Date: Wed, 31 Aug 2016 11:47:03 +0200
Message-ID: <CALw8SCUHjFAr7RT3UCOkZ9W4Uf=nLHr2F3A_DqKiw1q_LOXDrg@mail.gmail.com>
Subject: Re: [Fwd: Re: [PATCH v2 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table]
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, mchourasia@nvidia.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-08-31 9:15 GMT+02:00 Marcel Ziswiler <marcel.ziswiler@toradex.com>:
> On Wed, 2016-08-24 at 15:37 +0200, Mirza Krak wrote:
>>
>> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add TEGRA20_CLK_NOR to init tabel and set default rate to 92 MHz
>> which
>> is max rate.
>
> table

ACK

>
>>
>> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.g
>> mane.org>
>> ---
>> Changes in v2:
>> - no changes
>>
>>  drivers/clk/tegra/clk-tegra20.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-
>> tegra20.c
>> index 837e5cb..13d3b5a 100644
>> --- a/drivers/clk/tegra/clk-tegra20.c
>> +++ b/drivers/clk/tegra/clk-tegra20.c
>> @@ -1047,6 +1047,7 @@ static struct tegra_clk_init_table init_table[]
>> __initdata = {
>>       { TEGRA20_CLK_SDMMC3, TEGRA20_CLK_PLL_P, 48000000, 0 },
>>       { TEGRA20_CLK_SDMMC4, TEGRA20_CLK_PLL_P, 48000000, 0 },
>>       { TEGRA20_CLK_SPI, TEGRA20_CLK_PLL_P, 20000000, 0 },
>> +     { TEGRA20_CLK_NOR, TEGRA20_CLK_PLL_P, 92000000, 0 },
>
> I'm just curious where that 92 MHz came from. According to the Tegra 2
> Interface Design Guide up to 133 MHz should actually be possible.

The maximum rates for both T20 and T30 are values that are set as
maximum in the downstream L4T kernel.

In tegra2_clocks.c:
PERIPH_CLK("nor", "tegra-nor", NULL, 42, 0x1d0, 0x31E, 92000000,
mux_pllp_pllc_pllm_clkm, MUX | DIV_U71), /* requires min voltage */

And in tegra3_clocks.c
PERIPH_CLK("nor", "tegra-nor", NULL, 42, 0x1d0, 127000000,
mux_pllp_pllc_pllm_clkm, MUX | DIV_U71), /* requires min voltage */

I looked up the commit in the downstream kernel that added the "nor"
clock, it does not mention reason behind the maximal rates. Author was
Manoj Chourasia, added him to CC.

I actually do not have the Tegra2 Interface Design Guide, do not know
if I can get access to it.

Best Regards
Mirza
