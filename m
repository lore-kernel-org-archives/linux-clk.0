Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] drm/vc4: Add support for feeding DSI encoders from the pixel valve.
In-Reply-To: <20170131193901.dz7o5g36hqwcsmgt@phenom.ffwll.local>
References: <20161214194621.16499-1-eric@anholt.net> <20161214194621.16499-6-eric@anholt.net> <20170131193901.dz7o5g36hqwcsmgt@phenom.ffwll.local>
Date: Tue, 31 Jan 2017 11:54:04 -0800
Message-ID: <87wpdbxaxv.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, Dec 14, 2016 at 11:46:15AM -0800, Eric Anholt wrote:
>> We have to set a different pixel format, which tells the hardware to
>> use the pix_width field that's fed in sideband from the DSI encoder to
>> divide the "pixel" clock.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>  drivers/gpu/drm/vc4/vc4_crtc.c | 33 +++++++++++++++++++--------------
>>  drivers/gpu/drm/vc4/vc4_regs.h |  2 ++
>>  2 files changed, 21 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_cr=
tc.c
>> index a0fd3e66bc4b..cd070e0c79a6 100644
>> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
>> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
>> @@ -349,38 +349,40 @@ static u32 vc4_get_fifo_full_level(u32 format)
>>  }
>>=20=20
>>  /*
>> - * Returns the clock select bit for the connector attached to the
>> - * CRTC.
>> + * Returns the encoder attached to the CRTC.
>> + *
>> + * VC4 can only scan out to one encoder at a time, while the DRM core
>> + * allows drivers to push pixels to more than one encoder from the
>> + * same CRTC.
>>   */
>> -static int vc4_get_clock_select(struct drm_crtc *crtc)
>> +static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
>>  {
>>  	struct drm_connector *connector;
>>=20=20
>>  	drm_for_each_connector(connector, crtc->dev) {
>>  		if (connector->state->crtc =3D=3D crtc) {
>> -			struct drm_encoder *encoder =3D connector->encoder;
>> -			struct vc4_encoder *vc4_encoder =3D
>> -				to_vc4_encoder(encoder);
>> -
>> -			return vc4_encoder->clock_select;
>> +			return connector->encoder;
>>  		}
>>  	}
>>=20=20
>> -	return -1;
>> +	return NULL;
>>  }
>>=20=20
>>  static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
>>  {
>>  	struct drm_device *dev =3D crtc->dev;
>>  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>> +	struct drm_encoder *encoder =3D vc4_get_crtc_encoder(crtc);
>> +	struct vc4_encoder *vc4_encoder =3D to_vc4_encoder(encoder);
>>  	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>>  	struct drm_crtc_state *state =3D crtc->state;
>>  	struct drm_display_mode *mode =3D &state->adjusted_mode;
>>  	bool interlace =3D mode->flags & DRM_MODE_FLAG_INTERLACE;
>>  	u32 pixel_rep =3D (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
>> -	u32 format =3D PV_CONTROL_FORMAT_24;
>> +	bool is_dsi =3D (vc4_encoder->type =3D=3D VC4_ENCODER_TYPE_DSI0 ||
>> +		       vc4_encoder->type =3D=3D VC4_ENCODER_TYPE_DSI1);
>> +	u32 format =3D is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_=
24;
>>  	bool debug_dump_regs =3D false;
>> -	int clock_select =3D vc4_get_clock_select(crtc);
>>=20=20
>>  	if (debug_dump_regs) {
>>  		DRM_INFO("CRTC %d regs before:\n", drm_crtc_index(crtc));
>> @@ -436,17 +438,19 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc=
 *crtc)
>>  		 */
>>  		CRTC_WRITE(PV_V_CONTROL,
>>  			   PV_VCONTROL_CONTINUOUS |
>> +			   (is_dsi ? PV_VCONTROL_DSI : 0) |
>>  			   PV_VCONTROL_INTERLACE |
>>  			   VC4_SET_FIELD(mode->htotal * pixel_rep / 2,
>>  					 PV_VCONTROL_ODD_DELAY));
>>  		CRTC_WRITE(PV_VSYNCD_EVEN, 0);
>>  	} else {
>> -		CRTC_WRITE(PV_V_CONTROL, PV_VCONTROL_CONTINUOUS);
>> +		CRTC_WRITE(PV_V_CONTROL,
>> +			   PV_VCONTROL_CONTINUOUS |
>> +			   (is_dsi ? PV_VCONTROL_DSI : 0));
>>  	}
>>=20=20
>>  	CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
>>=20=20
>> -
>>  	CRTC_WRITE(PV_CONTROL,
>>  		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
>>  		   VC4_SET_FIELD(vc4_get_fifo_full_level(format),
>> @@ -455,7 +459,8 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *=
crtc)
>>  		   PV_CONTROL_CLR_AT_START |
>>  		   PV_CONTROL_TRIGGER_UNDERFLOW |
>>  		   PV_CONTROL_WAIT_HSTART |
>> -		   VC4_SET_FIELD(clock_select, PV_CONTROL_CLK_SELECT) |
>> +		   VC4_SET_FIELD(vc4_encoder->clock_select,
>> +				 PV_CONTROL_CLK_SELECT) |
>
> Hm, so the usual way we solve the "crtc needs information from the encoder
> problem" is to add bits to the crtc state, and then fill those out in the
> encoders ->atomic_check function. In your case ->clock_select and is_dsi.
>
> The benefit is mostly when you start doing hw readout (which is great even
> just to cross-check your modeset code), or when you need that information
> to check limits (which sooner or later tends to happen ime).
>
> Anyway, this works too, just an idea for the future.
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I like the idea!  I'll try following up with that.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliQ61wACgkQtdYpNtH8
nuhfFA/+JC1vO7VMKVbtGZuMorZzSipv4FUNurpqpFhOyuc1sYmN357d8wQauVO3
nuEEsIbNInxjUN/p8P0yFmx3E7E6A58K/wgqSlQya1oSe4hjjmh2vrqompmucJEo
5ABUrtdAcO+NnL0xIP945VnJx9z82E6YcpfsD7HCr/gvCvJiC5EEZb2ql/BAafk7
lYN5A02yCEfUiDYFRO3jo8299va/1MtT5De4RIQYT2NOnjfpg6/nTDptUFXU+8l7
2d0Kq3j8ezP/6kj/p/3/zrnMmIkdPzQVYJt3KRaQy2nDJYO9Q3YPO2QRJkhm8A2U
YPmYfjJXnR8oQ5AnBVmTm/MJp+RHuY/NUjfWiGCCt16gjWAwxuuFcveOmOJ0Vl1U
F5e3jmUm8o8XseZGddBsMLsneYtWKsqRxmu0GU4S7T19Tvmm1CZawkAW5ReFpAwa
uKjdOkVBMMm7WXaMQghEY8WzmMGr8AS+22P4zoxP7CUAiXcVBB+xpvwKu2JYMk8E
BmyQY7fnHP3s2RdnlTJn8u7wCBJ1TyBU3uOVg9ftJvWkTO6AJf/og44OnbgVUEAd
2SrS4pA901VvAxS9QgGJdvXsSIpVqZESMYezrFw0W+W2ky/xe/h/f6pj+CWTwRh9
Q5sl4qfYn9leDAup5F08vljECuuXXJ67Wa68CYHJB9TyFwtl7/E=
=nsew
-----END PGP SIGNATURE-----
--=-=-=--
