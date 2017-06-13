Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49233 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752102AbdFMJoA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2017 05:44:00 -0400
Date: Tue, 13 Jun 2017 11:43:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: icenowy@aosc.io
Cc: devicetree@vger.kernel.org,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped mixer<->tcon
 connection for DE2
Message-ID: <20170613094347.nlvxcaopd5qyq3tb@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
 <20170607093512.rfvpefmyskgjw3ik@flea.lan>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
 <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
 <66881eac1dd06d918692482bdb1ea9e6@aosc.io>
 <20170609144649.67i3zscq26jt5hhe@flea.home>
 <03e5cb4ada3e19ed3476e1d562450f6f@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n3g7hmbgriwdkupw"
In-Reply-To: <03e5cb4ada3e19ed3476e1d562450f6f@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--n3g7hmbgriwdkupw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2017 at 10:57:28PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-06-09 22:46=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Thu, Jun 08, 2017 at 01:01:53PM +0800, icenowy@aosc.io wrote:
> > > =E5=9C=A8 2017-06-07 22:38=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=
=EF=BC=9A
> > > > On Wed, Jun 07, 2017 at 06:01:02PM +0800, Icenowy Zheng wrote:
> > > > > >I have no idea what this is supposed to be doing either.
> > > > > >
> > > > > >I might be wrong, but I really feel like there's a big mismatch
> > > > > >between your commit log, and what you actually implement.
> > > > > >
> > > > > >In your commit log, you should state:
> > > > > >
> > > > > >A) What is the current behaviour
> > > > > >B) Why that is a problem
> > > > > >C) How do you address it
> > > > > >
> > > > > >And you don't.
> > > > > >
> > > > > >However, after discussing it with Chen-Yu, it seems like you're =
trying
> > > > > >to have all the mixers probed before the TCONs. If that is so, t=
here's
> > > > > >nothing specific to the H3 here, and we also have the same issue=
 on
> > > > > >dual-pipeline DE1 (A10, A20, A31). Chen-Yu worked on that a bit,=
 but
> > > > > >the easiest solution would be to move from a DFS algorithm to wa=
lk
> > > > > >down the graph to a BFS one.
> > > > > >
> > > > > >That way, we would add all mixers first, then the TCONs, then the
> > > > > >encoders, and the component framework will probe them in order.
> > > > >
> > > > > No. I said that they're swappable, however, I don't want to
> > > > > implement the swap now, but hardcode 0-0 1-1 connection.
> > > >
> > > > We're on the same page, it's definitely not what I was mentionning
> > > > here. This would require a significant rework, and the usecase is
> > > > still unclear for now.
> > > >
> > > > > However, as you and Chen-Yu said, device tree should reflect the
> > > > > real hardware, there will be bonus endpoints for the swapped
> > > > > connection.
> > > >
> > > > If by bonus you mean connections from mixer 0 to tcon 1 and mixer 1=
 to
> > > > tcon 0, then yes, we're going to need it.
> > > >
> > > > > What I want to do is to ignore the bonus connection, in order to
> > > > > prevent them from confusing the code.
> > > > >
> > > > > If you just change the bind sequence, I think it cannot be
> > > > > prevented that wrong connections will be bound.
> > > >
> > > > This is where I don't follow you anymore. The component framework
> > > > doesn't list connections but devices. The swapped connections do not
> > > > matter here, we have the same set of devices: mixer0, mixer1, tcon0
> > > > and tcon1.
> > > >
> > > > The thing that does change with your patch is that before, the bind=
ing
> > > > sequence would have been mixer0, tcon0, tcon1, mixer1. With your
> > > > patch, it's mixer0, tcon0, mixer1, tcon1.
> > > >
> > > > So, again, stating what issue you were seeing before making this pa=
tch
> > > > would be very helpful to see what you're trying to do / fix.
> > >=20
> > > So maybe I can drop the forward search (searching output) code, and
> > > keep
> > > only the backward search (search input) code in TCON?
> > >=20
> > > Forward search code is only used when binding, but backward search
> > > is used
> > > for TCON to find connected mixer.
> >=20
> > It is hard to talk about a solution, when it's not clear what the
> > issue is.
> >=20
> > So please state
> > > > > >A) What is the current behaviour
> > > > > >B) Why that is a problem
> > > > > >C) How do you address it
> >=20
> > We'll talk about a solution once this is done.
>=20
> (All those things are based on the assumption that mixer0, mixer1, tcon0
> and tcon1 are all enabled in DT. If one group of mixer-tcon pair is fully
> disabled in DT it will behave properly.)
>=20
> For the backward search:
>=20
> A) The current behaviour is to take the first engine found, which will be
> wrong in the situation of tcon1 if mixer0 and mixer1 are both enabled:
> mixer0 is taken for tcon1 instead of mixer1.
>=20
> B) It takes mixer0 as it matches the first endpoint of tcon0's input.
>=20
> C) It's a logic failure in the backward search, as it only considered
> the DE1 situation, in which TCONs will only have one engine as input.

That's not true. DE1's can output to several TCONs (or rather, TCONs
can select multiple engines as their input). The A31 for example is in
this case.

I think what Chen-Yu did so far is that he only enables one engine and
TCON for now. That will leave us some time to rework and improve
things gradually. It would probably be easier (and faster) for you too.

> For the bind process:
>=20
> A) The current behaviour is to try to bind all output endpoints of the
> engine, during binding all outputs of mixer0, these will happen:
>   1. tcon1 is bound with mixer0 as its engine if backward searching
>   is not fixed.
>   2. tcon1 fails to be bound as its engine is not yet bound when
>   backward searching works properly, then sun4i_drv will refuse
>   to continue as a component is not properly bound.

So this is the ordering issue I was mentionning earlier. The way to
fix this is to use BFS instead of DFS when building the component
list.

> B) The binding process in sun4i_drv will bind a component that is not
> really an working output of the forward component, but only exists in
> the endpoint list as a theortically possible output (in fact not an
> real output).

I'm not sure what you mean by that. Isn't the tcon1 a real output for
mixer0?

> C) I tested with this patch's sun4i_drv_node_is_swappable_de2_mixer
> function masked (always return false), and then the multiple
> mixer+tcon situations don't work properly.
>=20
> P.S. I think the BFS solution is really a dirty hack -- although we
> bind components, not connections, we should decide the next component
> to bind according to the connections -- not really connected
> components shouldn't be bound.

This isn't really about whether you follow connections or not, in both
cases you do. It's how you follow those connections that matters, and
it does make sense to follow them stage by stage in our
pipeline. ie. something that would bind all the engines, then all the
TCONs, then all the encoders.

All of them would have connections between them.

> For example, if we enabled mixer0, tcon0 and tcon1, tcon1 shouldn't
> be bound at all. However in BFS situation tcon1 will also be bound
> and then fail to be bound if the backward engine searching is fixed.

Short term view: we shouldn't be in that case in the first place.
Long term view: there's no reason it shouldn't work.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--n3g7hmbgriwdkupw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP7PTAAoJEBx+YmzsjxAg4PcP/0yFwpMIxxwLoQDh/6tiy0UC
TCPsPfuQWM61Q2eleTr+XrLqETKRuBlIZDDm2Zv4QDWxeiLAoE8r/WJ709VZHRKq
jNiQZMTxWv6yWiRG+qtmdm0kgo8wL1OA0aCKPV9cVKPjDnfKrEKUe+ecJA8IrHZO
HBmWem2jZTJWmumbsApFYj78v/q1nBP5M0yO37hCOBAXArDWuLGbUmsa9wk7RdNw
4IRHQpKrQ1+cnB+0VkT2XPxrH8PYZEt14Tc/fwJsNQ9GzOubiCCeLs5OTAb7p+eq
JjZtWCeKyHiQOCqc0QeEAyo8qHx0pUbKA386Y6Zwd6Z+Y57cg0+W50Ww1+cLUypc
ylUGxbNw8yuhG9YB8CWpC09MvOjJsQwQsWU5E3mhMaptu6a8QiI2+5C4RMAERJ5W
3w5tEY21rR6JNSueeXE2wAbvmtc0EIR+8WR5jzYjExXC06yZDm+aNooMEpAGP2qn
mZKXmQyFmrGlD8uNhMlZcUMhHv4MFPVpY2LY+1pAXVctaG2Wf+5DDDOG+p4yEaY3
Lwoo2ypjouGuEPClu5n9BeoyUxAJOE9pOFafWJpc8YxeMihxyU4xcyZ06pTuVqrD
+SxdPuSzhMilP1Rpi53rvhqC3aKtQsJKYdh2u1aDUA7bWEw/mJl6SoaQnIc+LuQP
481V6zOyCrFSUmI86rXG
=jN2O
-----END PGP SIGNATURE-----

--n3g7hmbgriwdkupw--
