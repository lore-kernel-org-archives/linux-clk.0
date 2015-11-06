Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 15:39:26 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
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
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/19] clk: sunxi: Add display clock
Message-ID: <20151106233926.GN6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151030212902.GG19782@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+FS1wzm/v+2h3Q5"
In-Reply-To: <20151030212902.GG19782@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--x+FS1wzm/v+2h3Q5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Thanks for your feedback!

On Fri, Oct 30, 2015 at 02:29:02PM -0700, Stephen Boyd wrote:
> > +
> > +	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> > +	if (!mux)
> [..]
> > +		goto free_reset;
> > +	}
> > +
> > +	return;
> > +
> > +free_reset:
> > +	kfree(reset_data);
> > +free_clk:
> > +	clk_unregister(clk);
>=20
> We really ought to have a clk_composite_unregister() API.

Can we?

We can always unregister the clock itself, but do we have a way to
retrieve the structure that has been allocated in there?

(note that it also applies to the generic clocks registration: muxes,
dividers, and so on).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--x+FS1wzm/v+2h3Q5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPTouAAoJEBx+YmzsjxAgFicP/joHV8pJXAO84DPD5ChA0KWe
0QuNbgg4lNQ87Gv9fJyYwQZgb3cM51LvM56N+Q4XrLB6NNPlNW/rx92WMbvfr6N0
FyEopiUPlsNU2AoYTJYno/1gpSQPHe3Da/jhpORek1rfgzJele82oJsOOJldVZMP
Gz+ETn9HDJ7llSQ7CaANN+V9DaIQbJQOZx3gGPpWa3p8y/6fgfwocJBoxlnEHdX0
n2pQcqjWJHVGZaDrekFdFEUrUwPNtAPQ77Clog2qfapsrTWeom/wOMRuZVJ8ksyg
9QsPH/GiTg+gv5nd04G6qFsqnS1VmS3hhkSSCITUuEoCMHAwbzWFmHfqHBiZnITZ
/JNY68ParmonKThAUziXttQKo5vlSJtT4X/IZL+RIS2RO7m8TBYUpTzqQfWoAl/+
5s3wS4HzTezulST/AxA/BrMj28UfVM1ZShFkECceqqunaaB53d2WOnsGg3fC99tG
P3nhi4fi/lPlnzWx/HeHK91dY51wt2LzaY5yMUDR5NUebwwXjOEdyWuMBxmGjlK6
/EOWf3y4jme4sV4ZD1vfjHA266twc/2hb6rxQhsahEtBr51F/3FWyEd/Xss+OdNU
nIpRyQo2Vzl86tghDtIezbjrE6XeVfivGSMntavvSh79215bqPIV4YexU5Go0CzJ
AM5o2560Ynpd8guXVwNb
=WVEV
-----END PGP SIGNATURE-----

--x+FS1wzm/v+2h3Q5--
