Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 28 Apr 2016 09:40:59 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 05/11] drm: Add Allwinner A10 Display Engine support
Message-ID: <20160428074059.GC17159@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-6-git-send-email-maxime.ripard@free-electrons.com>
 <20160426111419.63db18d4@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
In-Reply-To: <20160426111419.63db18d4@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Tue, Apr 26, 2016 at 11:14:19AM +0200, Boris Brezillon wrote:
> Hi Maxime,
>=20
> On Mon, 25 Apr 2016 15:22:46 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > The Allwinner A10 and subsequent SoCs share the same display pipeline, =
with
> > variations in the number of controllers (1 or 2), or the presence or no=
t of
> > some output (HDMI, TV, VGA) or not.
> >=20
> > Add a driver with a limited set of features for now, and we will hopefu=
lly
> > support all of them eventually
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Just 2 comments below. Once addressed you can add my
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>=20
> > ---
>=20
> [...]
>=20
> > +
> > +static int sun4i_drv_connector_plug_all(struct drm_device *drm)
> > +{
> > +	struct drm_connector *connector, *failed;
> > +	int ret;
> > +
> > +	mutex_lock(&drm->mode_config.mutex);
> > +	list_for_each_entry(connector, &drm->mode_config.connector_list, head=
) {
> > +		ret =3D drm_connector_register(connector);
> > +		if (ret) {
> > +			failed =3D connector;
> > +			goto err;
> > +		}
> > +	}
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +	return 0;
> > +
> > +err:
> > +	list_for_each_entry(connector, &drm->mode_config.connector_list, head=
) {
> > +		if (failed =3D=3D connector)
> > +			break;
> > +
> > +		drm_connector_unregister(connector);
> > +	}
> > +	mutex_unlock(&drm->mode_config.mutex);
> > +
> > +	return ret;
> > +}
>=20
> You can use the generic drm_connector_register_all() to do that.
>=20
> [...]
>=20
> > +
> > +static void sun4i_drv_unbind(struct device *dev)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(dev);
> > +
>=20
> And you probably miss a call to drm_connector_unregister_all() here.

Thanks, I'll fix that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXIb6LAAoJEBx+YmzsjxAgOD0P+wVvB7asCFP8argdJLzfXZCh
kNzdZwzvxWlXLTN4VSWXY5GGpUxmeP9XmvchxfjXSqWxIQru/6l38dPduIo9MJ/h
BlsEEDXZLS5YCLruCmRcOiLC89oBjAGT5/PQgO+W1EB+3PDWCCxVH7dg7qyUHpF0
6HQkrRMYz5gN7VkYHE5bdKr1CuDbKv2wquA9a9h3gCRN+TODm3v+eWRFrD4d40x0
46Bo3cyEM3DNqhu/RPUmbnIKvRRGFzbsU1NuTa7aC3cy0OW6N+8YA4VscWb6i/Py
n5rE1YS1QaLamLQJmxwAK7OcC2jWNM0za0GkAItHVcv5oEcD3wjn87EOUl35p2Ga
hkOgdhNMuHzBhUMqDXKoyTbGpiChNCvJE3vOkVD5jIM/N6QxC5uxx+5VjU5QPRMW
U9WDa4UmS7CdssJpon4GxHxPfeBPHQjSmAs4tFLHS9+n6v8NsV0HvByIpsAJXJHA
ZWM8c8nRb/YQM0akm26S/9pB6lp2tZENVB8ggEylA8/t+IaW/9MSZgGljTWGXSfe
YdATA0AwaZpxSsstYfJcoJjHX+9k1LfVuLGJaHVMtWOLoEFjcKeTyxHe71Td7Lfw
f+8fHompEjNoPEQk0QDcheEVd9kNI4fQ2GRrLI8BuWx3qOCyq11LC8450q/T/HwW
06QABT3jTRkRZm74NMD2
=zbdR
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
