Return-Path: <prvs=818d0ce80=Ian.Campbell@citrix.com>
Message-ID: <1453120919.6020.142.camel@citrix.com>
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device
 passthrough
From: Ian Campbell <ian.campbell@citrix.com>
To: David Vrabel <david.vrabel@citrix.com>, Peng Fan <van.freenix@gmail.com>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stefano Stabellini
	<stefano.stabellini@eu.citrix.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <linux-clk@vger.kernel.org>
Date: Mon, 18 Jan 2016 12:41:59 +0000
In-Reply-To: <569CCB58.5040904@citrix.com>
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
	 <569CCB58.5040904@citrix.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: ian.campbell@citrix.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2016-01-18 at 11:24 +0000, David Vrabel wrote:
> On 16/01/16 05:22, Peng Fan wrote:
> > This patch was just a initial patch, not sure whether this way
> > is ok from you side for handlding clk when doing platform device
> > passhthrough. Any comments are appreciated, and your comments may
> > give me a better direction.
>=20
> There's no documentation on the interface, which makes it difficult to
> review.=C2=A0=C2=A0At a first look it looks very specific to the particul=
ar Linux
> implementation of a clk subsystem.
>=20
> > --- /dev/null
> > +++ b/include/xen/interface/io/clkif.h
> > @@ -0,0 +1,41 @@
> > +/*
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
>=20
> ABIs should be under a more permissive license so they can be used by
> other (non-GPLv2) operating systems.

... along the same lines proposals for new ABIs should be made in the form
of patches to xen.git:xen/include/public/io/ before being submitted as an
implementation for one particular os.


> > +	unsigned long rate;
> > +	char clk_name[32];
>=20
> Where does the frontend get these names from?=C2=A0=C2=A031 character nam=
es seems
> rather limiting.

Indeed.

At a guess I would assume they come from the device-tree given to the guest
and tie into the host device tree.

I think a better model might be for each clk to have it's own subdirectory
under the overall clock bus node, e.g. something like:

/local/domain/<...>/clk/0/nr-clks =3D 4
/local/domain/<...>/clk/0/clk-0/ ...
/local/domain/<...>/clk/0/clk-1/ ...
/lo
cal/domain/<...>/clk/0/clk-2/ ...
/local/domain/<...>/clk/0/clk-3/ ...

and for each subdirectory to contain the a node containing the correspondin=
g firmware table identifier (so path in the DT case), which the toolstack k=
nows, so it can setup the f/e and b/e to correspond as necessary, and the f=
/e device needn't necessarily use the same name as the backend/host).

The request would then include the index and not the name (and as David obs=
erves the response only needs the id).

As well as properly documenting the meaning of the operations=C2=A0
the clkif.h should also define the xenstore nodes and contain the binary la=
youts of the req/rsp structs (see netif.h for examples of both, blkif.h als=
o includes examples of the former).

I'd also like to see a description of the DT bindings, which I assume must =
be needed such that the devices clocks property has something to refer to. =
For example maybe it doesn't make sense for xenstore to contain the path, b=
ut for the pvclk node in xenstore to contain the index.

> > +
> > +DEFINE_RING_TYPES(xen_clkif, struct xen_clkif_request, struct
> > xen_clkif_response);
> > +#define XEN_CLK_RING_SIZE __CONST_RING_SIZE(xen_clkif, PAGE_SIZE)
> > +
> > +#endif
> >=20
>=20
