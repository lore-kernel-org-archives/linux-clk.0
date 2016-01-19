Return-Path: <van.freenix@gmail.com>
Return-Path: <van.freenix@gmail.com>
Date: Tue, 19 Jan 2016 10:43:09 +0800
From: Peng Fan <van.freenix@gmail.com>
To: Ian Campbell <ian.campbell@citrix.com>
Cc: David Vrabel <david.vrabel@citrix.com>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-clk@vger.kernel.org
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device
 passthrough
Message-ID: <20160119024307.GC12932@linux-7smt.suse>
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
 <569CCB58.5040904@citrix.com>
 <1453120919.6020.142.camel@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1453120919.6020.142.camel@citrix.com>
List-ID: <linux-clk.vger.kernel.org>

Hello Ian,

On Mon, Jan 18, 2016 at 12:41:59PM +0000, Ian Campbell wrote:
>On Mon, 2016-01-18 at 11:24 +0000, David Vrabel wrote:
>> On 16/01/16 05:22, Peng Fan wrote:
>> > This patch was just a initial patch, not sure whether this way
>> > is ok from you side for handlding clk when doing platform device
>> > passhthrough. Any comments are appreciated, and your comments may
>> > give me a better direction.
>> 
>> There's no documentation on the interface, which makes it difficult to
>> review.  At a first look it looks very specific to the particular Linux
>> implementation of a clk subsystem.
>> 
>> > --- /dev/null
>> > +++ b/include/xen/interface/io/clkif.h
>> > @@ -0,0 +1,41 @@
>> > +/*
>> > + * The code contained herein is licensed under the GNU General Public
>> > + * License. You may obtain a copy of the GNU General Public License
>> > + * Version 2 or later at the following locations:
>> > + *
>> > + * http://www.opensource.org/licenses/gpl-license.html
>> > + * http://www.gnu.org/copyleft/gpl.html
>> > + */
>> 
>> ABIs should be under a more permissive license so they can be used by
>> other (non-GPLv2) operating systems.
>
>... along the same lines proposals for new ABIs should be made in the form
>of patches to xen.git:xen/include/public/io/ before being submitted as an
>implementation for one particular os.

I had no idea about this before. Do you mean that before I implement
pvclk for linux, I need to first post the clkif part to xen devel?

If it is, I'll split the interface part and send this part to
xen-devel@lists.xenproject.org for review.

>
>
>> > +	unsigned long rate;
>> > +	char clk_name[32];
>> 
>> Where does the frontend get these names from?  31 character names seems
>> rather limiting.
>
>Indeed.
>
>At a guess I would assume they come from the device-tree given to the guest
>and tie into the host device tree.

Yeah. the clk_name is got from DomU dts, and in Dom0 there is also a same
name.

>
>I think a better model might be for each clk to have it's own subdirectory
>under the overall clock bus node, e.g. something like:
>
>/local/domain/<...>/clk/0/nr-clks = 4
>/local/domain/<...>/clk/0/clk-0/ ...
>/local/domain/<...>/clk/0/clk-1/ ...
>/lo
>cal/domain/<...>/clk/0/clk-2/ ...
>/local/domain/<...>/clk/0/clk-3/ ...
>
>and for each subdirectory to contain the a node containing the corresponding firmware table identifier (so path in the DT case), which the toolstack knows, so it can setup the f/e and b/e to correspond as necessary, and the f/e device needn't necessarily use the same name as the backend/host).
>
>The request would then include the index and not the name (and as David observes the response only needs the id).

For now, I have not began the userspace libxl part for pvclk, I use the libxl pvusb code for test (:
The id acctually means what operation is needed, such as CLK_PREPARE, CLK_UNPREPARE, CLK_SET_RATE, CLK_GET_RATE. I'll add more text to document this in V2.

>
>As well as properly documenting the meaning of the operations 
>the clkif.h should also define the xenstore nodes and contain the binary layouts of the req/rsp structs (see netif.h for examples of both, blkif.h also includes examples of the former).

ok. I'll take netif/blkif for reference.

>
>I'd also like to see a description of the DT bindings, which I assume must be needed such that the devices clocks property has something to refer to. For example maybe it doesn't make sense for xenstore to contain the path, but for the pvclk node in xenstore to contain the index.

The DT bindings for xen pvclk, I use this:
"
                clks: clks {
			compatible = "xen,xen-clk";
			#clock-cells = <1>;
			clock-output-names = "uart2_root_clk";
		};
"
the clock-output-names will be parsed and be registered as clk root. The device will use index to refer to the clk, as the following:
"
                clocks = <&clks 0>, <&clks 0>;
	        clock-names = "ipg", "per";
"
0 means the first one in clock-output-names.

To the xenstore part, I am not sure whether need to expose the clock relate info to xenstore. I just want to store the clock names in xenstore to let
user know what clocks are now handled by DomU.

How about the following?

doamin1:
/local/domain/1/device/vclk/nr-clks
/local/domain/1/device/vclk/clk-0/name
/local/domain/1/device/vclk/clk-1/name

domain2:
/local/domain/2/device/vclk/nr-clks
/local/domain/2/device/vclk/clk-0/name
/local/domain/2/device/vclk/clk-1/name

domain0:
/local/domain/0/backend/vclk/1/0/nr-clks
/local/domain/0/backend/vclk/1/0/clk-0/name
/local/domain/0/backend/vclk/1/0/clk-1/name
/local/domain/0/backend/vclk/1/1/nr-clks
/local/domain/0/backend/vclk/1/1/clk-0/name
/local/domain/0/backend/vclk/1/1/clk-1/name

Or do not store the name and nr-clks in domain0?

Thanks,
Peng.

>
>> > +
>> > +DEFINE_RING_TYPES(xen_clkif, struct xen_clkif_request, struct
>> > xen_clkif_response);
>> > +#define XEN_CLK_RING_SIZE __CONST_RING_SIZE(xen_clkif, PAGE_SIZE)
>> > +
>> > +#endif
>> > 
>> 
