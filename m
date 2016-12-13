Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 13 Dec 2016 16:08:13 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Alexander Graf <agraf@suse.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [linux-sunxi] sunxi-ng clocks: leaving certain clocks alone?
Message-ID: <20161213150813.uq6megq24nmaircc@lukather>
References: <d70f2809-102c-a3de-c77c-43af27bbcbbc@arm.com>
 <CAGb2v67kCAr6Ty5=Gg8vOGNC6xhuRM66Wa=H+C3AD=_d_H+N8w@mail.gmail.com>
 <4e6ddb18-0686-1639-544c-c02371331d3c@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ajclx75yaysqsba3"
In-Reply-To: <4e6ddb18-0686-1639-544c-c02371331d3c@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--ajclx75yaysqsba3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 12, 2016 at 12:16:07PM +0000, Andre Przywara wrote:
> Hi Chen-Yu,
>=20
> thanks for the answer!
>=20
> On 12/12/16 04:41, Chen-Yu Tsai wrote:
> > On Mon, Dec 12, 2016 at 7:54 AM, Andr=E9 Przywara <andre.przywara@arm.c=
om> wrote:
> >> Hi,
> >>
> >> I was observing that the new sunxi-ng clock code apparently explicitly
> >> turns off _all_ clocks that are not used or needed. I find this rather
> >> unfortunate, as I wanted to use the THS temperature sensor from ARM
> >> Trusted Firmware to implement emergency shutdown or DVFS throttling.
> >> That works until the clock framework finds the clock (as enumerated in
> >> ccu-sun50i-a64.c) and obviously explicitly clears bit 31 in the THS mod
> >> clock register and bit 8 in the respective clock gate register.
> >> Turning them manually back on via /dev/mem or removing the THS clock
> >> from the sunxi-ng driver fixes this for me.
> >>
> >> This was not happening with the old Allwinner clocks, since the kernel
> >> wouldn't even know about it if there was no driver and the clock wasn't
> >> mentioned in the DT.
> >>
> >> Now with sunxi-ng even though the THS clock is not actually referenced
> >> or used in the DT, the kernel turns it off. I would expect that upon
> >> entering the kernel all unneeded clocks are turned off anyway, so there
> >> is no need to mess with clocks that have no user, but are enumerated in
> >> the ccu driver.
> >=20
> > I can't say that's absolutely true (wink).
> >=20
> >>
> >> I wonder if this kills simplefb as well, for instance, since I believe
> >> that U-Boot needs to turn on certain clocks and relies on them staying=
 up.
> >=20
> > The simplefb bindings takes clocks and regulators expressly for the
> > purpose of keeping them enabled.
>=20
> Right, I should have checked this before ...
>=20
> >>
> >> So my questions:
> >> 1) Is this expected behaviour?
> >=20
> > Yes.
> >=20
> >> 2) If yes, should it really be?
> >> 3) If yes, shouldn't there be way to explicitly tell Linux to leave th=
at
> >> clock alone, preferably via DT? Although the sunxi-ng clocks take
> >> control over the whole CCU unit, I wonder if it should really mess with
> >> clocks there are not referenced in the DT.
> >=20
> > As it owns the whole CCU unit, why not? And how would it know if some
> > clock is referenced or not, unless going through the whole device tree?
>=20
> I was hoping that it just provides clocks to any users (drivers) and
> wouldn't bother with tinkering with every clock unless explicitly being
> asked for (by a driver being pointed to a specific clock through DT).
> So it would need to iterate through anything - neither the whole DT nor
> it's own list of clocks.
>=20
> > Furthermore, nothing prevents another device driver from referencing
> > said clock and turning it off when it's not in use. Think THS driver
> > with runtime PM.
>=20
> I am totally OK with that: Any potential Linux THS driver can take over,
> if the DT references this device and the clock.
> My point is that atm there is no such driver and so the clocks framework
> shouldn't turn that clock off.

You could turn that exact argument the other way though. If there's no
user in the system, why should we waste power and leave it enabled?

> > Are you also mapping the THS to secure only? Otherwise nothing would
> > prevent Linux from also claiming it.
>=20
> Unfortunately the THS is always unsecure. And even if it could be
> switched, after a recent IRC discussion I came to believe that those
> secure peripherals features only works when the secure boot feature is
> used, which requires to blow an efuse and thus is not easily doable on
> most boards and also irreversible.
> Also I am not sure whether this security feature actually extends to the
> mod clocks and the bus reset and clock gates bits.
>=20
> But I was relying on that Linux doesn't touch hardware that's not
> referenced in the DT, so if firmware uses the THS, any Linux THS node
> would need to go - or the other way around: if there is a Linux THS
> node, firmware backs off.

It's not just about node though, but also based on the kernel
configuration. If the kernel didn't have a THS driver compiled (or not
loaded), then if you want to implement such a behaviour, you should
also keep the THS driver in the firmware.

> >> Maybe there is some way to reference those clocks via some dummy driver
> >> or DT node to avoid this behaviour? Is there any prior art in this res=
pect?
> >=20
> > If you want a clock to not be disabled by anyone, adding CLK_IS_CRITICAL
> > to its flags is the proper option. This is done in the clk driver thoug=
h.
>=20
> Yes, I was thinking about that, but it indeed sounds like a hack to
> follow this.

You also have the option to add a clock-critical property.

Keep in mind that just preventing it from shutting down at boot gives
no warranty that the clock will remain enabled. Other clocks in the
same sub-tree might do a reparenting or a disable that would lead to
that clock being modified or disabled too as a side effect.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ajclx75yaysqsba3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUA7YAAoJEBx+YmzsjxAgkhcQAJb0VHSaliANDQ/liEo+MwrJ
RZE9eW0CngdAgGpk5ualRkzLgBDPeQu5Vuejx/KzuIke4NqRdUEjOIaXWSSblBY2
JmHIMGhktELszDX6GYZp7LvCOU3Q3cmaIYBXkOmx5hq1GS3w7L1NOLMXncMhZFsm
s8Up7F2IrMMImhTqcf/qv8joeSnv9dJICnPlnk51qSFSZE1VOMtsGiP53ecSnz86
V6ngtWkVfB/z/IWFbcYjp7eMdqRWlNL+Tk8NroM2dW6xX2OBBYvvodflVIMoR5YV
MqOxzJXRWfOHJevo9gJ5yYvciK+9u0MoS6YDo1RF0LxhfzpXCSC+r/8GAnEAdgez
ewOzCpAB4aByj1PuJ+Agtj/EV5Gl27vLnFoPWHOdbD0crjz7JsW3yJc545QtZtuB
bWyj8SRuv6IARisb5JaKy+oY2BLH5d09WzZmBEIsi9Pq2l/8yk747TpuXT0gtMcL
Qzn9g7RMA22fFUiTRBu3Hxlwt2RGkZOx1Jd1S4Hz6XQ/SKidZyEXo/uywIvd6cT/
e1iSn7RGWPnJk+ZvG2YtEEByWXYjc1FHoS3esb5pvZfmBCHkuvauobVlCeskxzpW
4J4Vgp/ohyktEz283pzKnqcrCG/cakrrSp6EmcuiQujUghY2VyYkKopc0NvjAn3h
MY1mRksZ3b+y6CMOssnP
=WUgR
-----END PGP SIGNATURE-----

--ajclx75yaysqsba3--
