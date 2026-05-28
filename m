Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9BE1E5714
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970095; cv=none; b=p0u/T2y/j3+zwPMQ6IInUMDBScpw6hVF3Xmf0vUS4/xRbqGeqNUYc357EDdqS39thRuv1RGna+ksyd42Vq7wbcScef2HOWVmw9lUn30KxE1CGt7KaXCZvRaiKwQ2X9JW7sv48rUKEfhO96DHrUbUpzToRKqo2M2THzoTE2tMITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970095; c=relaxed/simple;
	bh=AQHisDNqogmQvZgezzDUBs28nFIfXOCPs5dPiHXS798=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICY0gcpO+5SBUWWaS0nsHGqt/zq+HOO6RJfdvhyy2ByzRccJKxE1k4DecpP3RIb1CTRQoOnGfhq6qTsvMQRDASSKszVHL3IJXnpEb8IoRj7uue3r9vzslBw9w+rN1rVJIpWOV+GDhIl498Ubiq6vhc+pW1ljsZwZi8yhE1tcGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0Pkp/by; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0Pkp/by"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BED1F000E9;
	Thu, 28 May 2026 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779970093;
	bh=jZdiQWfbNCmHdbL0qPXuLtZ2WwmAbORNr9dD2tiwIWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R0Pkp/bywSa5wZecNxWFjvuNmmOhKGsGCZCd/TN/Ov9dyhzqhy0orYmp518YA/+7f
	 J+byUKSIf0dg2TAmDwR7DToNwbv/siyAHsRgIOwrd5/jsRz8v6mzDrQ+PSz7p+hB8h
	 qwP1gYGMJHBFn42Yw/N0wVISvOSZuC/og4Xcn6+Wi7Wy/GYv7fAwBT9a9ccwumkFS7
	 hEgUqUZU6G4Gmxwp5WBklDnhE+SjJ+GlAmcPan0QeYxBJGldZMobwsEOP/ITKnZbsN
	 FCeS5zj6I100j/8LAM/2pcPSge6F+7HkKOI5BOXFG6Eaylg77ku1y3MoWyYgQMhKqo
	 JW1fMvLuRomSw==
Date: Thu, 28 May 2026 14:08:10 +0200
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
Message-ID: <20260528-sloth-of-delightful-chaos-1f02dc@houat>
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
 <ahd4XgTo3KZqGS9M@redhat.com>
 <66a76d9f-fe04-4a72-b6fe-42c2922fe9d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sloh5l5jsj3qmgsm"
Content-Disposition: inline
In-Reply-To: <66a76d9f-fe04-4a72-b6fe-42c2922fe9d9@oss.qualcomm.com>


--sloh5l5jsj3qmgsm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and
 use this in simple[fb|drm]
MIME-Version: 1.0

On Thu, May 28, 2026 at 12:12:10PM +0200, Hans de Goede wrote:
> Hi Brian,
>=20
> On 28-May-26 1:03 AM, Brian Masney wrote:
> > Hi Hans,
> >=20
> > On Wed, May 27, 2026 at 11:48:08AM +0200, Hans de Goede wrote:
> >> 2) One option considered was detaching the simple-framebuffer driver l=
ater,
> >>    after the real display driver has had a chance to claim the clocks.=
 But
> >>    this won't work in cases where the real display driver picks differ=
ent
> >>    parent clocks then the boot firmware did and needs to reparent cloc=
ks.
> >=20
> > Why won't that work in the case where different parent clocks are selec=
ted?
> > I'll describe a scenario below.
> >=20
> >>
> >>    Basically the goal is for things to behave as if the simple-framebu=
ffer
> >>    driver was not there at all, because that leaves the hw in the state
> >>    the real display driver expects.
> >=20
> > I think the deferred unbinding could have some potential here where
> > there is some kind of notification mechanism between simple-framebuffer
> > and the real drm driver. So:
> >=20
> > - simple-framebuffer driver takes reference(s) to the clk(s).
> >=20
> > - real drm driver eventually loads, takes reference(s) to the necessary
> >   clk(s).
> >=20
> > - real drm driver sends a notification to simple-framebuffer that it's
> >   done, and has control.
> >=20
> > - simple-framebuffer can unbind and release its references to the clks.
> >=20
> > No clks will be shutdown prematurely in this scenario.
> >=20
> > If the real drm driver needs a different parent, then presumably things
> > should be setup correctly, and simple-framebuffer can have the clocks
> > shut down when it calls clk_disable_unprepare().
>=20
> If the real drm driver needs a different parent, then how does it
> do the reparenting while the simple-framebuffer driver is holding
> a reference to the clock ?  In that case the clock might have
> a protected_count of non 0 (depends on the core-clk flags) and
> reparenting won't work.

The only case where it should reparent you listed was that you might
need to pick up a different resolution. However, that can only be
enforced by an ioctl or a client.

simplefb/drm is removed in msm_drm_kms_init. The device is published
drm_dev_register called right after msm_drm_kms_init, and the clients
are registered in msm_drm_kms_post_init, called after drm_dev_register.

There's no way in the current msm architecture to have a modeset happen
while the simpledrm driver is still active.

Maxime

--sloh5l5jsj3qmgsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCahgwKgAKCRAnX84Zoj2+
dlOJAX96DdfsdZKRS3tZrj8a1VUU2rzbl1mUZaskqOqZfG/kbz3+Lb+Zvn8k3mk6
RSr8TkABfRhGxxwt/MTLRFMANNnZcBbeKvb9D5JxMC/ptdCTInr5jsGu4L6IBHU/
pYaPdM2CiQ==
=EqOj
-----END PGP SIGNATURE-----

--sloh5l5jsj3qmgsm--
