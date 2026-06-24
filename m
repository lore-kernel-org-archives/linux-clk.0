Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A063093CB
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291240; cv=none; b=BjS73DLoMp6V29fRJjTqX/c1DIxqRRhGEXFNG2hXmwtFqbwRpXCmONgjH/PYmVv2/JRmuDRs4awlGsCn9K5luMkyKVghKSMLFMcwfWqlJKsKNDSZLP0+CAaODeRb0pvoWkG1coSbSMi71uTL1+ZOs2zyagipwJn8anuJIeuLftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291240; c=relaxed/simple;
	bh=31M5oDzvv7jUkHK/L53fJqHSTyhvuwPx0+bN3Xi2/vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+rXsJMTeBrzVnS0z9bagzovAdSCTshO6m39n4k1VvIuZYAB8Rf9qKW+++gtpsrMelF2L0W+s4PfYZv/BuOXUkDf8Z5KcGawo1CgicEbtKujt5b2IstmHEkGtb5RboM9jVICFYF171BdsorQLPOyXQjhwxZ6TbijaRRHWXxz6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVhn+24W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVhn+24W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717AD1F000E9;
	Wed, 24 Jun 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291239;
	bh=4Zl5Ebn9buIu2G1ZtxyEcZ4/F83TLtSV53gJrVovQNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVhn+24WGRJEbfzhY0ffLwBbOQwPb2tPq0CJtDgTbT9gnHigERZTZlSgsCSnEIYE5
	 /iBpHxhf+aBY0D31GAm4o6Y0z9vYsFRlLmBsgDPHTkg3qdhZB0Akg9wN3GarVpt8qk
	 1DJ8XAz4s7mLxouI3gX1dvFnq/H8ACKd9cf+5b/iSHvhWcgZEKlEsRieBsKp1MyNqH
	 mPnFEA+AuWG2ke6iQf0BygHBaYMsAE9LvQ3Xw9AQ3T8mu3kvpiPChGZloyB0uLpH6f
	 ZRRQfsfxQAE+NIHCsCwAB1D5rSt56kXAHpvAdWqTar9ivaOaedJqpUgaZXKYfnbWrz
	 U4MRTcqabGZ6A==
Date: Wed, 24 Jun 2026 10:53:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and
 use this in simple[fb|drm]
Message-ID: <20260624-ultramarine-beetle-of-vastness-acd51e@houat>
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
 <ahd4XgTo3KZqGS9M@redhat.com>
 <66a76d9f-fe04-4a72-b6fe-42c2922fe9d9@oss.qualcomm.com>
 <20260528-sloth-of-delightful-chaos-1f02dc@houat>
 <4b09bd91-9a08-407a-9b01-216dd4d7aae0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3v5pwppls5iobxny"
Content-Disposition: inline
In-Reply-To: <4b09bd91-9a08-407a-9b01-216dd4d7aae0@oss.qualcomm.com>


--3v5pwppls5iobxny
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and
 use this in simple[fb|drm]
MIME-Version: 1.0

On Thu, May 28, 2026 at 03:02:09PM +0200, Hans de Goede wrote:
> On 28-May-26 2:08 PM, Maxime Ripard wrote:
> > On Thu, May 28, 2026 at 12:12:10PM +0200, Hans de Goede wrote:
> >> Hi Brian,
> >>
> >> On 28-May-26 1:03 AM, Brian Masney wrote:
> >>> Hi Hans,
> >>>
> >>> On Wed, May 27, 2026 at 11:48:08AM +0200, Hans de Goede wrote:
> >>>> 2) One option considered was detaching the simple-framebuffer driver=
 later,
> >>>>    after the real display driver has had a chance to claim the clock=
s. But
> >>>>    this won't work in cases where the real display driver picks diff=
erent
> >>>>    parent clocks then the boot firmware did and needs to reparent cl=
ocks.
> >>>
> >>> Why won't that work in the case where different parent clocks are sel=
ected?
> >>> I'll describe a scenario below.
> >>>
> >>>>
> >>>>    Basically the goal is for things to behave as if the simple-frame=
buffer
> >>>>    driver was not there at all, because that leaves the hw in the st=
ate
> >>>>    the real display driver expects.
> >>>
> >>> I think the deferred unbinding could have some potential here where
> >>> there is some kind of notification mechanism between simple-framebuff=
er
> >>> and the real drm driver. So:
> >>>
> >>> - simple-framebuffer driver takes reference(s) to the clk(s).
> >>>
> >>> - real drm driver eventually loads, takes reference(s) to the necessa=
ry
> >>>   clk(s).
> >>>
> >>> - real drm driver sends a notification to simple-framebuffer that it's
> >>>   done, and has control.
> >>>
> >>> - simple-framebuffer can unbind and release its references to the clk=
s.
> >>>
> >>> No clks will be shutdown prematurely in this scenario.
> >>>
> >>> If the real drm driver needs a different parent, then presumably thin=
gs
> >>> should be setup correctly, and simple-framebuffer can have the clocks
> >>> shut down when it calls clk_disable_unprepare().
> >>
> >> If the real drm driver needs a different parent, then how does it
> >> do the reparenting while the simple-framebuffer driver is holding
> >> a reference to the clock ?  In that case the clock might have
> >> a protected_count of non 0 (depends on the core-clk flags) and
> >> reparenting won't work.
> >=20
> > The only case where it should reparent you listed was that you might
> > need to pick up a different resolution. However, that can only be
> > enforced by an ioctl or a client.
> >=20
> > simplefb/drm is removed in msm_drm_kms_init. The device is published
> > drm_dev_register called right after msm_drm_kms_init, and the clients
> > are registered in msm_drm_kms_post_init, called after drm_dev_register.
> >=20
> > There's no way in the current msm architecture to have a modeset happen
> > while the simpledrm driver is still active.
>=20
> Ok, new plan, please let me know what you think about this:
>=20
> 1. Add a new "disable" callback argument to
> devm_aperture_acquire_for_platform_device() and store this in
> struct aperture_range
>=20
> 2. Add a new aperture_disable_conflicting_devices() which
> calls the disable callback for matching devices.
>=20
> 3. Have the simple[fd|drm] drivers implement a disable callback
> which unregisters the drm dev and releases any claims on the
> aperture mem-region, while keeping clks, regulators, etc.
> enabled. And have them check if disable was called on remove()
> and if not do the disable() things on remove(0
>=20
> 4. Have msm call aperture_disable_conflicting_devices() where it
> now call aperture_remove_conflicting_devices() and call
> aperture_remove_conflicting_devices() at the point where it has
> claimed any clks it needs.
>=20
> Does this sound like something which would be acceptable ?

Generally speaking, yes, but I'd also like to understand what you're
trying to fix exactly, because I don't see how it can be what you hinted
at before.

Maxime

--3v5pwppls5iobxny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajubIgAKCRAnX84Zoj2+
dvMDAYCoDoEuVS2C+WS3QyeeEXq7mW3a6slIYHufpnpz3Eex/cfoISTR//povPdq
oy3gMYwBfRblB2aWaEAHLvyzzJhFRNyYOVCSWrWj3cO5CX9yzWi0T2ZR6XG6qJFQ
69ZadJ3xjA==
=3T3C
-----END PGP SIGNATURE-----

--3v5pwppls5iobxny--
