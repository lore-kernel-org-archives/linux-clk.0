Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD29B3750BE
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700828; cv=none; b=rxavb6xIA4jhuTmDRLFJbg6uZCzhsB2IoonKcFFt3JDCN+xQbxcJa4vH+5hMap/wIJA5E4anf/lX7ZGbVOOi3eJU4Rk8N+Di7D6b53wSdtDK3fRUkyvlGW+BGKW00Ya2344IA4Tqh2DJby8zQO50NO+iY/Fd/Ko9+XnvGgz23gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700828; c=relaxed/simple;
	bh=g72iVl9U5HM9n+fiEwdIJh7nyYcCS/n2Mf5HPw+45ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoTHwrB0ptto7Q1YlS5MVF6OEYdYvUS7sitkOgw+rN54kspgKZCaOh+pOq9ZkYkY6hXzh1NU9TbegcqXRmrIybsu1+90nyhL9f81RB0mTSvaCHbm4bdZSmVYLtVzjDMMOsQnvprW7Qq0Cd4JWzJ/djh1jRHW8KoeGNMFoTNworE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Haft0vZl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Haft0vZl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A67DC116C6;
	Thu,  5 Mar 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772700828;
	bh=g72iVl9U5HM9n+fiEwdIJh7nyYcCS/n2Mf5HPw+45ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Haft0vZlu5WKCYI8SG96a55+tzNaVOQgUPwajW9y9Xxd9bD/uc5Y7QwIrABkY8vJ+
	 WKbmVrjQJ0Hlf/TQd04hYghNTawePDk+RJ61+GsMeJBtN9Wlt3KzKfK4NhguZc3o9+
	 CPhG6EatlfrSTlJdRarp2cfrok8Mo334XQhQBgyhLfdW2VFYiE4x5BgKJqDJHV9DF1
	 8Cr9Ys/l3+tay19A54Dmd9U+83x7f/Ln8Grqtt3QQRLd2HhdgOouC490XFEZpJ5dvS
	 1vFJULwUsZI9Od9Rj+6iS1Nih8MTyz6AaR3aI57vfzeYiEm62Q2iHn2eZIUQgrneOm
	 oqTxnYunR8x7A==
Date: Thu, 5 Mar 2026 09:53:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
Message-ID: <20260305-unyielding-sponge-of-efficiency-07218c@houat>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
 <20260224-curvy-shiny-dodo-e50cef@houat>
 <481489f1-850f-44ae-8586-b69c1d2faf8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rsl6glzzmmnhyjuq"
Content-Disposition: inline
In-Reply-To: <481489f1-850f-44ae-8586-b69c1d2faf8e@igalia.com>


--rsl6glzzmmnhyjuq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
MIME-Version: 1.0

On Wed, Feb 25, 2026 at 10:57:11AM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 24/02/26 11:11, Maxime Ripard wrote:
> > Hi Maira,
> >=20
>=20
> [...]
>=20
> > > @@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(s=
truct clk_hw *hw,
> > >   static int raspberrypi_fw_prepare(struct clk_hw *hw)
> > >   {
> > >   	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> > > +	struct raspberrypi_clk_variant *variant =3D data->variant;
> > >   	struct raspberrypi_clk *rpi =3D data->rpi;
> > >   	u32 state =3D RPI_FIRMWARE_STATE_ENABLE_BIT;
> > >   	int ret;
> > >   	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > >   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> > > -	if (ret)
> > > +	if (ret) {
> > >   		dev_err_ratelimited(rpi->dev,
> > >   				    "Failed to set clock %s state to on: %d\n",
> > >   				    clk_hw_get_name(hw), ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (variant->maximize)
> > > +		ret =3D raspberrypi_fw_set_rate(hw, variant->max_rate, 0);
> >=20
> >=20
> > It's not clear to me why you would want to force it to the max there,
> > and especially the max of the clock. It would make more sense to me to
> > set it to whatever maximum rate clk_hw_get_rate_range would return
> > (which should be the minimum of variant->max_rate + all clk->max_rate),
> > but even then it would erase every call to clk_set_rate before calling
> > clk_prepare().
> >=20
> > I'd understand lowering the clock rate in unprepare to avoid wasting too
> > much power, but why do we need to raise it here?
>=20
> This only applies to clocks with variant->maximize =3D=3D true, which is
> exclusively the V3D clock. The V3D driver doesn't do fine-grained rate
> control, it always wants maximum performance. In the case of V3D, there
> are no intermediate clk_set_rate() calls to preserve.
>=20
> >=20
> > >   	return ret;
> > >   }
> > > @@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw=
 *hw)
> > >   static void raspberrypi_fw_unprepare(struct clk_hw *hw)
> > >   {
> > >   	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> > > +	struct raspberrypi_clk_variant *variant =3D data->variant;
> > >   	struct raspberrypi_clk *rpi =3D data->rpi;
> > >   	u32 state =3D 0;
> > >   	int ret;
> > > +	/*
> > > +	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn=
't
> > > +	 * actually power off the clock. To achieve meaningful power consum=
ption
> > > +	 * reduction, the driver needs to set the clock rate to minimum bef=
ore
> > > +	 * disabling it.
> > > +	 */
> > > +	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);
> >=20
> > I'm not sure setting it to variant->min_rate would work directly either,
> > since it would break consumers expectations. Also, can we guard it with
>=20
> The clock is being unprepared, which means that any consumer that wants
> to use it again must call clk_prepare() first, at which point the rate
> gets restored (for maximize clocks) or re-established by the consumer
> via clk_set_rate(). Considering that no consumer should be relying on
> the rate of an unprepared clock, I understand that there are no
> expectations to break here.

For both of those, I still feel like it's a pretty strong deviation from
the general expected behaviour of the CCF API. From what you're saying,
we shouldn't notice it too much, but at the very least we should
document it explicitly, both what the deviation is, and why we think
it's ok.

> > a version check if we know that there's some good and bad firmwares?
>=20
> So far, all firmware versions have this issue. For future firmware
> releases, it might change, but so far, all firmware versions have this
> issue.

ack :)

> >=20
> > >   	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > >   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> > >   	if (ret)
> > > @@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(st=
ruct raspberrypi_clk *rpi,
> > >   {
> > >   	struct raspberrypi_clk_data *data;
> > >   	struct clk_init_data init =3D {};
> > > -	u32 min_rate, max_rate;
> > > +	unsigned long rate;
> > >   	int ret;
> > >   	data =3D devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
> > > @@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(=
struct raspberrypi_clk *rpi,
> > >   	data->hw.init =3D &init;
> > > -	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > > -					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> > > -					 &min_rate);
> > > -	if (ret) {
> > > -		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> > > -			id, ret);
> > > -		return ERR_PTR(ret);
> > > +	if (!variant->min_rate) {
> > > +		ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > > +						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> > > +						 &variant->min_rate);
> > > +		if (ret) {
> > > +			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> > > +				id, ret);
> > > +			return ERR_PTR(ret);
> > > +		}
> > >   	}
> >=20
> > It feels to me like it would need to be a separate patch. Why do you
> > need to override the minimum clock rate reported by the firmware?
>=20
> This change is needed because the prepare/unprepare callbacks need
> access to the min/max rates. In the current code, these are local
> variables in raspberrypi_clk_register(). Storing them in the variant
> struct makes them available to the callbacks. The `if (!variant-
> >min_rate)` guard only preserves the existing behavior for clocks like
> M2MC that have a hard-coded minimum rate.

min_rate itself is indeed available only in raspberrypi_clk_register(),
but its main use is to call clk_hw_set_rate_range to use it as the
minimum clock rate.

In prepare/unprepare, you should be able to use clk_hw_get_rate_range()
to retrieve it, or am I missing something?

Maxime

--rsl6glzzmmnhyjuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaalElQAKCRAnX84Zoj2+
dq4PAYCPY9g7d5egQ6wghudGoDzx9SHRivvClwKyoKk1AodMMK9NTvkbz1M0ygp3
KeJQSpEBf39z7CUZJB1YDJbR1YN0OePlyJploZSkmc72zTPwl2RyrpMor29K1LfH
eOPgy8oVMw==
=GW7L
-----END PGP SIGNATURE-----

--rsl6glzzmmnhyjuq--
