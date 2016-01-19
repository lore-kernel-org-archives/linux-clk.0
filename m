Return-Path: <prvs=8191aee2d=Ian.Campbell@citrix.com>
Message-ID: <1453197968.6020.233.camel@citrix.com>
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device
 passthrough
From: Ian Campbell <ian.campbell@citrix.com>
To: Peng Fan <van.freenix@gmail.com>
CC: David Vrabel <david.vrabel@citrix.com>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, Michael Turquette
	<mturquette@baylibre.com>, Stefano Stabellini
	<stefano.stabellini@eu.citrix.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <linux-clk@vger.kernel.org>
Date: Tue, 19 Jan 2016 10:06:08 +0000
In-Reply-To: <20160119024307.GC12932@linux-7smt.suse>
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
	 <569CCB58.5040904@citrix.com> <1453120919.6020.142.camel@citrix.com>
	 <20160119024307.GC12932@linux-7smt.suse>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: ian.campbell@citrix.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2016-01-19 at 10:43 +0800, Peng Fan wrote:
> Hello Ian,
>=20
> On Mon, Jan 18, 2016 at 12:41:59PM +0000, Ian Campbell wrote:
> > On Mon, 2016-01-18 at 11:24 +0000, David Vrabel wrote:
> > > On 16/01/16 05:22, Peng Fan wrote:
> > > > This patch was just a initial patch, not sure whether this way
> > > > is ok from you side for handlding clk when doing platform device
> > > > passhthrough. Any comments are appreciated, and your comments may
> > > > give me a better direction.
> > >=20
> > > There's no documentation on the interface, which makes it difficult
> > > to
> > > review.=C2=A0=C2=A0At a first look it looks very specific to the part=
icular
> > > Linux
> > > implementation of a clk subsystem.
> > >=20
> > > > --- /dev/null
> > > > +++ b/include/xen/interface/io/clkif.h
> > > > @@ -0,0 +1,41 @@
> > > > +/*
> > > > + * The code contained herein is licensed under the GNU General
> > > > Public
> > > > + * License. You may obtain a copy of the GNU General Public
> > > > License
> > > > + * Version 2 or later at the following locations:
> > > > + *
> > > > + * http://www.opensource.org/licenses/gpl-license.html
> > > > + * http://www.gnu.org/copyleft/gpl.html
> > > > + */
> > >=20
> > > ABIs should be under a more permissive license so they can be used by
> > > other (non-GPLv2) operating systems.
> >=20
> > ... along the same lines proposals for new ABIs should be made in the
> > form
> > of patches to xen.git:xen/include/public/io/ before being submitted as
> > an
> > implementation for one particular os.
>=20
> I had no idea about this before. Do you mean that before I implement
> pvclk for linux, I need to first post the clkif part to xen devel?
>=20
> If it is, I'll split the interface part and send this part to
> xen-devel@lists.xenproject.org for review.

Yes, please.

xen.git contains the canonical definition of all Xen PV protocols, copies
are then taking into OSes for implementation purposes.

>=20
> >=20
> >=20
> > > > +	unsigned long rate;
> > > > +	char clk_name[32];
> > >=20
> > > Where does the frontend get these names from?=C2=A0=C2=A031 character=
 names
> > > seems
> > > rather limiting.
> >=20
> > Indeed.
> >=20
> > At a guess I would assume they come from the device-tree given to the
> > guest
> > and tie into the host device tree.
>=20
> Yeah. the clk_name is got from DomU dts, and in Dom0 there is also a same
> name.
>=20
> >=20
> > I think a better model might be for each clk to have it's own
> > subdirectory
> > under the overall clock bus node, e.g. something like:
> >=20
> > /local/domain/<...>/clk/0/nr-clks =3D 4
> > /local/domain/<...>/clk/0/clk-0/ ...
> > /local/domain/<...>/clk/0/clk-1/ ...
> > /lo
> > cal/domain/<...>/clk/0/clk-2/ ...
> > /local/domain/<...>/clk/0/clk-3/ ...
> >=20
> > and for each subdirectory to contain the a node containing the
> > corresponding firmware table identifier (so path in the DT case), which
> > the toolstack knows, so it can setup the f/e and b/e to correspond as
> > necessary, and the f/e device needn't necessarily use the same name as
> > the backend/host).
> >=20
> > The request would then include the index and not the name (and as David
> > observes the response only needs the id).
>=20
> For now, I have not began the userspace libxl part for pvclk, I use the
> libxl pvusb code for test (:

Sure, but eventually this will need implementing in the toolstack and the
protocol design should be what is most suitable for the usecase, not what
happens to be most convenient for testing via some quick hack.

> The id acctually means what operation is needed, such as CLK_PREPARE,
> CLK_UNPREPARE, CLK_SET_RATE, CLK_GET_RATE. I'll add more text to document
> this in V2.

Ah, then for consistency with other PV protocols I would suggest renaming
your "id" as "cmd" and adding an "id" field which is simply echoed in the
response to allow the frontend to match responses to requests.

Note however that the important thing in my paragraphs above was the
decoupling of the naming from the f/e and b/e and avoiding the use of the
DT specific path in the ring requests.

The PV protocol should ideally be independent of DT (lets assume we will
want to use it for e.g. ACPI too), although there would probably in this
case need to be a binding from the DT world to the pvclk world to allow the
guest DT to remain consistent (i.e. so devices have something they can
point at which can be resolved into a pvclk).

> >=20
> > I'd also like to see a description of the DT bindings, which I assume
> > must be needed such that the devices clocks property has something to
> > refer to. For example maybe it doesn't make sense for xenstore to
> > contain the path, but for the pvclk node in xenstore to contain the
> > index.
>=20
> The DT bindings for xen pvclk, I use this:
> "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clks: clks {
> 			compatible =3D "xen,xen-clk";
> 			#clock-cells =3D <1>;
> 			clock-output-names =3D "uart2_root_clk";
> 		};
> "
> the clock-output-names will be parsed and be registered as clk root. The
> device will use index to refer to the clk, as the following:
> "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clocks =3D <&clks 0>, <&clks 0>;
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clock-names =3D "ipg", "=
per";
> "
> 0 means the first one in clock-output-names.

This binding should be defined in Documentation/devicetree/Bindings in the
usual way.

>=20
> To the xenstore part, I am not sure whether need to expose the clock
> relate info to xenstore. I just want to store the clock names in xenstore
> to let
> user know what clocks are now handled by DomU.
>=20
> How about the following?
>=20
> doamin1:
> /local/domain/1/device/vclk/nr-clks
> /local/domain/1/device/vclk/clk-0/name
> /local/domain/1/device/vclk/clk-1/name

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^/0

>=20
> domain2:
> /local/domain/2/device/vclk/nr-clks
> /local/domain/2/device/vclk/clk-0/name
> /local/domain/2/device/vclk/clk-1/name

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^/0

>=20
> domain0:
> /local/domain/0/backend/vclk/1/0/nr-clks
> /local/domain/0/backend/vclk/1/0/clk-0/name
> /local/domain/0/backend/vclk/1/0/clk-1/name

Correct.

> /local/domain/0/backend/vclk/1/1/nr-clks
> /local/domain/0/backend/vclk/1/1/clk-0/name
> /local/domain/0/backend/vclk/1/1/clk-1/name

Should be:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /2/0

In /local/domain/*/device/vclk/<N> the <N> is the devid or bus number
(better to think of it as the latter in this case).

In /local/domain/<X>/backend/vclk/<Y>/<Z>/ you have:
    X -- the backend domid (may not be 0 in all cases, needs to be planned
    for but not necessarily implemented)
    Y -- the frontend domain
    Z -- the devid/bus within frontend domain

> Or do not store the name and nr-clks in domain0?

The f/e directory should contain the identifier which the frontend needs to
=C2=A0do the lookup from the firmware tables into pvclk space -- i.e. the n=
ame
given in the f/e device tree node (maybe call it dt-name?).

The b/e directory should contain the name of the clock from the backend
(i.e. host) pov i.e. the thing which needs to be looked up in the host
firmware tables.

The two names are not necessarily the same, just as a thought experiment
consider a DT using domU on an ACPI host or vice versa.

Ian.
