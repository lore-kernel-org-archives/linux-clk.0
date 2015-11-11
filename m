Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 11 Nov 2015 14:14:12 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 08/19] drm: Add Allwinner A10 Display Engine support
Message-ID: <20151111221412.GH6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-9-git-send-email-maxime.ripard@free-electrons.com>
 <20151030144409.GZ16848@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qPhbOctOI3h5o759"
In-Reply-To: <20151030144409.GZ16848@phenom.ffwll.local>
List-ID: <linux-clk.vger.kernel.org>


--qPhbOctOI3h5o759
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for your review!

On Fri, Oct 30, 2015 at 03:44:09PM +0100, Daniel Vetter wrote:
> > +static void sun4i_crtc_disable(struct drm_crtc *crtc)
> > +{
> > +	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
> > +	struct sun4i_drv *drv =3D scrtc->drv;
> > +
> > +	DRM_DEBUG_DRIVER("Disabling the CRTC\n");
> > +
> > +	if (!scrtc->enabled)
> > +		return;
>=20
> Please don't do this - the atomic state should always reflect the true hw
> state (fix that up with either hw state readout or reset in the ->reset
> callbacks), and the atomic helpers guarantee that they'll never call you
> when not needed. If you don't trust them do a WARN_ON at least, but no
> early silent returns.
>=20
> Personally I'd just rip it out, it's too much trouble. And for debugging
> the atomic helpers already trace it all (or at least should).

Ok. Is there a preferred way to do HW state readout, or should I just
add that to my probe?

> > +static int sun4i_drv_connector_plug_all(struct drm_device *drm)
>=20
> Laurent Pinchart has this as a rfc patch for drm core, please coordinate
> with him and rebase on top of his patches.

Ack, I will.

> > +static int sun4i_drv_enable_vblank(struct drm_device *drm, int pipe)
> > +{
> > +	struct sun4i_drv *drv =3D drm->dev_private;
> > +	struct sun4i_tcon *tcon =3D drv->tcon;
> > +
> > +	DRM_DEBUG_DRIVER("Enabling VBLANK on pipe %d\n", pipe);
> > +
> > +	sun4i_tcon_enable_vblank(tcon, true);
> > +
> > +	return 0;
>=20
> atomic helpers rely on enable_vblank failing correctly when the pipe is
> off and vlbanks will never happen. You probably need a correct error code
> here that checks crtc->state->active (well not that directly but something
> derived from it, since the pointer chase would be racy).

Ok.

> I know it's a bit a mess since we don't have kms-native vblank driver
> hooks yet and really the drm core should get this right for you. It'll
> happen eventually, but drm_irq.c is a bit moldy ;-)

I can't really use drm_irq anyway, since we don't have a single
interrupt for the VBLANK, but two, that we have to use depending on
the output.

> > +static void sun4i_drv_disable_vblank(struct drm_device *drm, int pipe)
> > +{
> > +	struct sun4i_drv *drv =3D drm->dev_private;
> > +	struct sun4i_tcon *tcon =3D drv->tcon;
> > +
> > +	DRM_DEBUG_DRIVER("Disabling VBLANK on pipe %d\n", pipe);
> > +
> > +	sun4i_tcon_enable_vblank(tcon, false);
> > +}
> > +
> > +static int sun4i_drv_load(struct drm_device *drm, unsigned long flags)
>=20
> load/unload callbacks are depracated since fundamentally racy, and we
> can't fix that due to the pile of legacy dri1 drivers. Please use
> drm_dev_alloc/register/unregister/unref functions instead, with the
> load/unload code placed in between to avoid races with userspace seeing
> the device/driver (e.g. in sysfs) while it's in a partially defunct state.
>=20
> Relevant kerneldoc has the details, at least in linux-next.

Ok.

> > +static void sun4i_backend_layer_atomic_update(struct drm_plane *plane,
> > +					      struct drm_plane_state *old_state)
> > +{
> > +	struct sun4i_layer *layer =3D plane_to_sun4i_layer(plane);
> > +	struct sun4i_drv *drv =3D layer->drv;
> > +	struct sun4i_backend *backend =3D drv->backend;
> > +
> > +	sun4i_backend_update_layer_coord(backend, layer->id, plane);
> > +	sun4i_backend_update_layer_formats(backend, layer->id, plane);
> > +	sun4i_backend_update_layer_buffer(backend, layer->id, plane);
> > +	sun4i_backend_layer_enable(backend, layer->id, true);
> > +	sun4i_backend_commit(backend);
>=20
> Not idea how exactly your hw works, but the call to sun4i_backend_commit
> probably should be in the crtc->atomic_flush function, to make sure that
> plane updates across multiple planes are indeed atomic.

The hardware will not take the register writes into account until a
bit is set (in the _commit function), so I guess putting it in
atomic_flush makes sense.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qPhbOctOI3h5o759
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWQ720AAoJEBx+YmzsjxAgqDUQAJJ0RjttqmgDoNtDhWgjw+To
HQeI+bXYaHmHyyNOpEQ7+zTHOBL1gf+60XFrpsYpZvWqkgqZkkZugpeRAVr/M0e8
2IuqBgIpiUJGYVFBtT/HOqN7sUGdxyGPLhO3LoycPEKzOXODDCF43OmdSfjlQrKF
dzuwpaVP5YJedEfC7Tu5v8H4wG8E310/2e27u/t0MbfucMfCsScFwaOkhzUdhAOO
oPixR21SjT5+PGMKnIkFHgIxs1oWVDidrkWZ1iqscUA1yHh6JJ3Pw1OsoYYunNi4
BAzx7rJOroIzsdCOZMi0ZzljR10NmdswAPq6qck1X4sYmRUwRHKUnwM4NkIa4fjP
JWG3K0wLqsjEZvGWvGEFuTlzStItpNp00CA46F7GOf+WCGeXk6lqklkrd+6iaBPB
O3VzBc7xXSIgowYl0iomzeov08sQnTpI5yOZy4XVi74Gz3qD38WR3renebmkmQ0W
AdqWFOU2ceDE2x/fww21RN/dDuvaHEgX4JNiRPZarbB4YCdlfp1r2qd3pAhBVJCt
FBRA8RIauxvMqhzvkSsuJ+QvLESNXB5QxZLjsPDcQ8YXVicMw93pgdUtZVcVz9QK
lsFUuM5+vCcoGvxOf7b88U/T6OH95mBeXGg2pZldoZnQB1isLx74rfLW85rqizn/
u5CHtx6OFVlGoJJC2BYO
=ZWcD
-----END PGP SIGNATURE-----

--qPhbOctOI3h5o759--
