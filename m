Return-Path: <van.freenix@gmail.com>
Return-Path: <van.freenix@gmail.com>
Date: Tue, 19 Jan 2016 09:33:11 +0800
From: Peng Fan <van.freenix@gmail.com>
To: David Vrabel <david.vrabel@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Ian Campbell <ian.campbell@citrix.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-clk@vger.kernel.org
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device
 passthrough
Message-ID: <20160119013310.GB12932@linux-7smt.suse>
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
 <569CCB58.5040904@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <569CCB58.5040904@citrix.com>
List-ID: <linux-clk.vger.kernel.org>

Hello David,

On Mon, Jan 18, 2016 at 11:24:08AM +0000, David Vrabel wrote:
>On 16/01/16 05:22, Peng Fan wrote:
>> This patch was just a initial patch, not sure whether this way
>> is ok from you side for handlding clk when doing platform device
>> passhthrough. Any comments are appreciated, and your comments may
>> give me a better direction.
>
>There's no documentation on the interface, which makes it difficult to
>review.  At a first look it looks very specific to the particular Linux
>implementation of a clk subsystem.

My bad. I'll add more text in commit log or cover letter in V2 to describe
the interface.

>
>> --- /dev/null
>> +++ b/include/xen/interface/io/clkif.h
>> @@ -0,0 +1,41 @@
>> +/*
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>
>ABIs should be under a more permissive license so they can be used by
>other (non-GPLv2) operating systems.

ok. I'll change this.

>
>> +
>> +#ifndef __XEN_PUBLIC_IO_CLKIF_H__
>> +#define __XEN_PUBLIC_IO_CLKIF_H__
>> +
>> +#include <xen/interface/io/ring.h>
>> +#include <xen/interface/grant_table.h>
>> +
>> +/**/
>> +enum {
>> +	XENCLK_PREPARE,		/* clk_prepare_enable */
>> +	XENCLK_UNPREPARE,	/* clk_unprepare_disable */
>> +	XENCLK_GET_RATE,	/* clk_get_rate */
>> +	XENCLK_SET_RATE,	/* clk_set_rate */
>> +	XENCLK_END,
>> +};
>> +
>> +struct xen_clkif_request {
>> +	int id;
>
>You should use fixed width types so the ABI is the same on 32-bit and
>64-bit guests.

Will fix in V2.

>
>> +	unsigned long rate;
>> +	char clk_name[32];
>
>Where does the frontend get these names from?  31 character names seems
>rather limiting.

The clk_name is got from DomU device tree. In the commit log, I wrote this:
"
                clks: clks {
			compatible = "xen,xen-clk";
			#clock-cells = <1>;
			clock-output-names = "uart2_root_clk";
		};
"
The clk_name is one of the entry from clock-output-names, clk_name will
be passed to Dom0, Dom0 will use the clk_name to find the clk structure using
__clk_lookup.


>
>> +};
>> +
>> +struct xen_clkif_response {
>> +	int id;
>> +	int success;
>> +	unsigned long rate;
>> +	char clk_name[32];
>> +};
>
>I don't think you need to the name in the response.  The id will tie the
>response to the request.

My original idea is to  use id and clk_name to check whether the response is for the requester.
You can see in the patch:
" if ((id == comp->id) && !strncmp(name, comp->clk_name, sizeof(comp->clk_name)))"

Maybe clk_name is redundant here. I will remove it in V2.

Thanks for your comments.

Peng.

>
>> +
>> +DEFINE_RING_TYPES(xen_clkif, struct xen_clkif_request, struct xen_clkif_response);
>> +#define XEN_CLK_RING_SIZE __CONST_RING_SIZE(xen_clkif, PAGE_SIZE)
>> +
>> +#endif
>> 
>
