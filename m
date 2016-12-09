Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:18205 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750728AbcLIX3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2016 18:29:48 -0500
Subject: Re: [PATCH 2/6] net: ethernet: ti: cpts: add support for ext rftclk
 selection
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20161128230428.6872-1-grygorii.strashko@ti.com>
 <20161128230428.6872-3-grygorii.strashko@ti.com>
 <20161130095632.GC28680@localhost.localdomain>
 <bf207ac4-0f9f-d4a7-14ac-704d93fb7764@ti.com>
 <11994fbc-3713-6ef7-8a44-8a2442106dfc@ti.com>
 <20161209004745.GJ5423@codeaurora.org>
CC: Richard Cochran <richardcochran@gmail.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>, <netdev@vger.kernel.org>,
        Mugunthan V N <mugunthanvnm@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, Wingman Kwok <w-kwok2@ti.com>,
        <linux-clk@vger.kernel.org>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <a2656eaf-403c-39f2-5fdf-75d46fab0f9a@ti.com>
Date: Fri, 9 Dec 2016 17:29:42 -0600
MIME-Version: 1.0
In-Reply-To: <20161209004745.GJ5423@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 12/08/2016 06:47 PM, Stephen Boyd wrote:
> On 12/06, Grygorii Strashko wrote:
>> Subject: [PATCH] cpts refclk sel
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>  arch/arm/boot/dts/keystone-k2e-netcp.dtsi | 10 +++++-
>>  drivers/net/ethernet/ti/cpts.c            | 52 ++++++++++++++++++++++++++++++-
>>  2 files changed, 60 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
>> index 919e655..b27aa22 100644
>> --- a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
>> +++ b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
>> @@ -138,7 +138,7 @@ netcp: netcp@24000000 {
>>  	/* NetCP address range */
>>  	ranges = <0 0x24000000 0x1000000>;
>>
>> -	clocks = <&clkpa>, <&clkcpgmac>, <&chipclk12>;
>> +	clocks = <&clkpa>, <&clkcpgmac>, <&cpts_mux>;

					^^ mux clock used here

>>  	clock-names = "pa_clk", "ethss_clk", "cpts";
>>  	dma-coherent;
>>
>> @@ -162,6 +162,14 @@ netcp: netcp@24000000 {
>>  			cpts-ext-ts-inputs = <6>;
>>  			cpts-ts-comp-length;
>>
>> +			cpts_mux: cpts_refclk_mux {
>> +				#clock-cells = <0>;
>> +				clocks = <&chipclk12>, <&chipclk13>;
>> +				cpts-mux-tbl = <0>, <1>;
>> +				assigned-clocks = <&cpts_mux>;
>> +				assigned-clock-parents = <&chipclk12>;
> 
> Is there a binding update?
 
this was pure RFC-DEV patch just to check the possibility of modeling 
CPTS_RFTCLK_SEL register as mux clock. 
Original patch:
https://lkml.org/lkml/2016/11/28/780

I've plan to resend it using clk framework.

 Why the subnode? 

Sry, I did not get this question - is there another way to pas phandle on clock
in clocks list property? Am I missing smth.?

Sry, this is my first clock :)

> Why not have it as part of the netcp node?

cpts is part of gbe ethss, which is part of netcp.

Only netcp is modeled as DD - cpts and gbe ethss implemented without using DD model,
so generic resources acquired by netcp and then passed to cpts and gbe ethss.

CPTS has register to control an external multiplexer that selects
one of up to 32 clocks for time sync reference (RFTCLK)

> Does the cpts-mux-tbl property change?

On Keystone 2 66AK2e (as example) the following list of clocks can be selected 
as ref clocks (list is different for other SoCs):
0000 = SYSCLK2
0001 = SYSCLK3
0010 = TIMI0
0011 = TIMI1
0100 = TSIPCLKA
1000 = TSREFCLK
1100 = TSIPCLKB
Others = Reserved

and only 0 and 1 are internal, other external and board specific
(parameters unknown and corresponding inputs can be used for other purposes),
so I can't define all parent clocks, only internal:

clocks = <&chipclk12>, <&chipclk13>;
cpts-mux-tbl = <0>, <1>;

to use another, external, clock - it should be explicitly defined in board file the board file 

timi1clk: timi1clk {
	#clock-cells = <0>;
	compatible = "fixed-clock";
...

&cpts_mux {
	clocks = <&chipclk12>, <&chipclk13>, <timi1clk>;
						^^^ i can't predict value here
	cpts-mux-tbl = <0>, <1>, <3>;
				^^i can't predict value here
	assigned-clocks = <&cpts_mux>;
	assigned-clock-parents = <&timi1clk>;
};

or I understood your question wrongly?

> 
>> +			};
>> +
>>  			interfaces {
>>  				gbe0: interface-0 {
>>  					slave-port = <0>;
>> diff --git a/drivers/net/ethernet/ti/cpts.c b/drivers/net/ethernet/ti/cpts.c
>> index 938de22..ef94316 100644
>> --- a/drivers/net/ethernet/ti/cpts.c
>> +++ b/drivers/net/ethernet/ti/cpts.c
>> @@ -17,6 +17,7 @@
>>   * along with this program; if not, write to the Free Software
>>   * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
>>   */
>> +#include <linux/clk-provider.h>
>>  #include <linux/err.h>
>>  #include <linux/if.h>
>>  #include <linux/hrtimer.h>
>> @@ -672,6 +673,7 @@ int cpts_register(struct cpts *cpts)
>>  	cpts->phc_index = ptp_clock_index(cpts->clock);
>>
>>  	schedule_delayed_work(&cpts->overflow_work, cpts->ov_check_period);
>> +
> 
> Maybe in another patch.
> 

sure

>>  	return 0;
>>
>>  err_ptp:
>> @@ -741,6 +743,54 @@ static void cpts_calc_mult_shift(struct cpts *cpts)
>>  		 freq, cpts->cc_mult, cpts->cc.shift, (ns - NSEC_PER_SEC));
>>  }
>>

...

>> +
>> +	reg = &cpts->reg->rftclk_sel;
>> +
>> +	clk = clk_register_mux_table(cpts->dev, refclk_np->name,
>> +				     parent_names, num_parents,
>> +				     0, reg, 0, 0x1F, 0, mux_table, NULL);
>> +	if (IS_ERR(clk))
>> +		return PTR_ERR(clk);
>> +
>> +	return of_clk_add_provider(refclk_np, of_clk_src_simple_get, clk);
> 
> Can you please use the clk_hw APIs instead?
> 

ok

-- 
regards,
-grygorii
