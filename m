Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 30 Nov 2015 20:58:23 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Josef Gajdusek <atx@atx.name>
Cc: linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	gpatchesrdh@mveas.com, mturquette@linaro.org, hdegoede@redhat.com,
	sboyd@codeaurora.org, mturquette@baylibre.com, emilio@elopez.com.ar,
	linux@arm.linux.org.uk, edubezval@gmail.com, rui.zhang@intel.com,
	wens@csie.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk,
	mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
Subject: Re: [linux-sunxi] Re: [PATCH v2 3/5] thermal: Add a driver for the
 Allwinner THS sensor
Message-ID: <20151130195823.GE3664@lukather>
References: <20151124084342.GJ32142@lukather>
 <cover.1448263428.git.atx@atx.name>
 <ea5d8edefd251f2b76660b43a4ea4dc89c3b2f38.1448263428.git.atx@atx.name>
 <0edf1031924124377647dfb0f62ec6c8@rainloop.atalax.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
In-Reply-To: <0edf1031924124377647dfb0f62ec6c8@rainloop.atalax.net>
List-ID: <linux-clk.vger.kernel.org>


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 11:02:34AM +0000, Josef Gajdusek wrote:
> >> +struct sun8i_ths_type {
> >> + int (*init)(struct platform_device *, struct sun8i_ths_data *);
> >> + int (*get_temp)(struct sun8i_ths_data *, int *out);
> >> + void (*irq)(struct sun8i_ths_data *);
> >> + void (*deinit)(struct sun8i_ths_data *);
> >> +};
> >=20
> > AFAIK, you never got back on why it was actually needed, instead of
> > directly calling these functions.
>=20
> It is preparation for supporting the other SoCs with THS as they have
> slightly different register layouts and thus cannot be controlled by the
> same code.

Do you have support and / or informations on what's going to be needed
for these other SoCs yet?

Which SoCs are we talking about?

> >> + /* The final sample period is calculated as follows:
> >> + * (THERMAL_PER + 1) * 4096 / f_clk * 2^(FILTER_TYPE + 1)
> >> + *
> >> + * This results to about 1Hz with these settings.
> >> + */
> >> + ret =3D clk_set_rate(data->clk, 4000000);
> >=20
> > I don't follow you here. You have a complicated math function, that
> > has many input variables, and then, you just set the clock rate to a
> > constant?
>=20
> How should this be handled then? I guess the sampling rate could
> be set in the device tree and then the values calculated, but none
> of the other thermal drivers seem to have configurable sample rate.

I don't know, I would have expected some actual computation, like a
function taking the frequency as a parameter and returning the clock
rate. At least that way we now what we're doing and which part might
change and which will not.

But you do not need to change the sample rate itself.

> >> +static int sun8i_ths_h3_get_temp(struct sun8i_ths_data *data, int *ou=
t)
> >> +{
> >> + int val =3D readl(data->regs + THS_H3_DATA);
> >> + *out =3D sun8i_ths_reg_to_temperature(val, 8253, 217000);
> >> + return 0;
> >=20
> > Can't you just return the value directly?
>=20
> I did that in the v1, clabbe.montjoie suggested to use temp variable to
> avoid column wrap.

I was talking about the out pointer. Can the value not be returned?

> >> + ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> >> + sun8i_ths_irq_thread, IRQF_ONESHOT,
> >> + dev_name(&pdev->dev), data);
> >=20
> > Why a threaded irq?
>=20
> I thought threaded IRQs are preferred? Other thermal drivers
> use them too.

It's close to pointless in this case. You're not doing much more than
what the default handler will do anyway, and you avoid scheduling a
thread doing so.

And other thermal drivers use a regular interrupt handler too :)

> I am also not really sure thermal_zone_device_update() can even be
> called in interrupt context.

I can't really tell on this one. Judging from a quick look, I can't
see anything that could prevent it, and since others are using it, it
seems doable.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXKpfAAoJEBx+YmzsjxAgBeAP/jeiOlcPldKdsFtbtunxaYoA
Dv7MhCKdEKi8gG8h1COL8WqpZIS4LmJqBQfdH55naoFXVto6JAIweLJvZJ++kMAI
es+05SJEvkx5mu/J02TXeqMaf2P9gvtw1+kktLc/DeNSGG17oK4tF+DCx1BQD/FO
r4K62JNTLTzMPIjlH6fvk3cJCvjSa5LzAwzTGDQTlF80fQyl/3nWyrzr+4Vb4sQl
lUzuVZelsPoRFI1y0s0xjUUdKYUeAzWpgUT4Wdvh9rxbM/WF98aOFLafiYfU3ulY
dpnRbnsKAQ8xTyMcYLUsAgIS3XmBJJuofaK+DoOnwWRgRP5H8V35Rx6DBAuklGnw
ahtPHSJqeM/vwF6PGRCnrywP242i+QLiPFLCW5WEpHNwlftYsHtATC0qYhxlehJ4
iJkJoOu0X+cOVSnoIz3tpmD2q1dMR9cD2yGFm8Yg4q10EW8ox2IlV+xORs7nD37A
3vbOzz3nYGjbkGD4vwHIs8MNZF8P+zJIrGFnPpZVwX2VjUnaAQ8lhxI3vdhm195D
q7S4LRD1VSqzMxucfGQX2AJ7EyZwgW9gmQygPkPQ0jE4PNTTMTGw/kENH+ixLjG5
gNUGxmCybl0NOmvwE5PhZGgh6aX5g1A70QiWjzyhOM5LFAXWP9Wr2Znojd8Fixju
wSvwcXRh5LPLjmP4XYpY
=4m++
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
