Return-Path: <prvs=818483168=david.vrabel@citrix.com>
Message-ID: <569CCB58.5040904@citrix.com>
Date: Mon, 18 Jan 2016 11:24:08 +0000
From: David Vrabel <david.vrabel@citrix.com>
MIME-Version: 1.0
To: Peng Fan <van.freenix@gmail.com>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Ian Campbell <ian.campbell@citrix.com>, Michael Turquette
	<mturquette@baylibre.com>, Stefano Stabellini
	<stefano.stabellini@eu.citrix.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>, David Vrabel
	<david.vrabel@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<linux-clk@vger.kernel.org>
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device passthrough
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
In-Reply-To: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: david.vrabel@citrix.com
List-ID: <linux-clk.vger.kernel.org>

On 16/01/16 05:22, Peng Fan wrote:
> This patch was just a initial patch, not sure whether this way
> is ok from you side for handlding clk when doing platform device
> passhthrough. Any comments are appreciated, and your comments may
> give me a better direction.

There's no documentation on the interface, which makes it difficult to
review.  At a first look it looks very specific to the particular Linux
implementation of a clk subsystem.

> --- /dev/null
> +++ b/include/xen/interface/io/clkif.h
> @@ -0,0 +1,41 @@
> +/*
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */

ABIs should be under a more permissive license so they can be used by
other (non-GPLv2) operating systems.

> +
> +#ifndef __XEN_PUBLIC_IO_CLKIF_H__
> +#define __XEN_PUBLIC_IO_CLKIF_H__
> +
> +#include <xen/interface/io/ring.h>
> +#include <xen/interface/grant_table.h>
> +
> +/**/
> +enum {
> +	XENCLK_PREPARE,		/* clk_prepare_enable */
> +	XENCLK_UNPREPARE,	/* clk_unprepare_disable */
> +	XENCLK_GET_RATE,	/* clk_get_rate */
> +	XENCLK_SET_RATE,	/* clk_set_rate */
> +	XENCLK_END,
> +};
> +
> +struct xen_clkif_request {
> +	int id;

You should use fixed width types so the ABI is the same on 32-bit and
64-bit guests.

> +	unsigned long rate;
> +	char clk_name[32];

Where does the frontend get these names from?  31 character names seems
rather limiting.

> +};
> +
> +struct xen_clkif_response {
> +	int id;
> +	int success;
> +	unsigned long rate;
> +	char clk_name[32];
> +};

I don't think you need to the name in the response.  The id will tie the
response to the request.

> +
> +DEFINE_RING_TYPES(xen_clkif, struct xen_clkif_request, struct xen_clkif_response);
> +#define XEN_CLK_RING_SIZE __CONST_RING_SIZE(xen_clkif, PAGE_SIZE)
> +
> +#endif
> 
