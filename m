Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 8 Mar 2016 23:13:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
Message-ID: <20160308221320.GI8418@lukather>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
 <20160303191604.GW24999@codeaurora.org>
 <20160304152711.GR8418@lukather>
 <20160304171841.GF24999@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ON+QUYPPdli25pUV"
In-Reply-To: <20160304171841.GF24999@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--ON+QUYPPdli25pUV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2016 at 09:18:41AM -0800, Stephen Boyd wrote:
> On 03/04, Maxime Ripard wrote:
> > On Thu, Mar 03, 2016 at 11:16:04AM -0800, Stephen Boyd wrote:
> > > From: Stephen Boyd <sboyd@codeaurora.org>
> > > Subject: [PATCH] clk: sunxi: Remove use of VLAIS
> >=20
> > VLAIS?
>=20
> Hmm I guess it's just VLA, so llvm won't break. I'll reword
> commit text.
>=20
> >=20
> > > @@ -107,6 +112,8 @@ err_free_div:
> > >  	kfree(div);
> > >  err_unmap:
> > >  	iounmap(reg);
> > > +err_free_parents:
> > > +	kfree(parents);
> > >  	of_address_to_resource(node, 0, &res);
> > >  	release_mem_region(res.start, resource_size(&res));
> >=20
> > The error path is wrong here, if you jump here from a failing call to
> > of_io_request_and_map, you'll end up releasing a memory region which
> > is not requested.
> >=20
>=20
> Oh right. Let's hope third time is the last.
>=20
> ---8<---
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] clk: sunxi: Remove use of variable length array
>=20
> Using an array allocated on the stack may lead to stack overflows
> and other problems so let's move the allocation to the heap
> instead. This silences the following checker warning as well.
>=20
> drivers/clk/sunxi/clk-sun8i-mbus.c:36:29: warning: Variable length array =
is used.
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ON+QUYPPdli25pUV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW306AAAoJEBx+YmzsjxAgZkgP/Aj6O5pijd3WhzR9hChPpmSn
VUeRd4mNr59KFaFe8siknAnn88shoPHU2Bg4i5htI5xZdloCXUgh/X9fAW6hkdm2
45VZAKN2FUUWnoSj0jm6poV6VQ/L322EXoQxMZGswBnOYcnIEu1XMVyNwrE86E4k
J+gyT5+S2xETbhZM/PP1gUvTW3SbRjqCzYh7aGLJ/CfNXS9Ko2pkbiFLRR5NFoF1
T6BuuY8cwfsbXQwAPgvgblqSBX9PrhuAWDn98SUme9obOTRvvkHgO4cqbnIp1/O2
kLZaE8HN51Xs2QW/CmSEBqUU8UczfZiqLPGTdHIfDrlnjm+e/Dk/Y0bzZ63Rn5CX
DUyS8EKdD8uOOWemZ4mBKf4NURZu/9ftABZ50j+pE9VcFGj0kDO9vHyywykxa8be
BLXynk1g5Oc33yO5KuSZKux4w9Ysso0ngxTrUMysOeqJNYVg8rwf8RP2jbtMW1sv
eMWICrRtBSoJPjiEmxhqSfN5TiLX99e5stUGOgesoP93dCdfgnqrfeij2KAZ2tmd
5Kc86fY25IjgiQl3rpEnYZRgNRhK23+ARGR4p6ufVdNqs2c+LjoHHafKhvzTMZXD
VNwtMoTwZnvGMgdGjzXfPK79apFhA/6Qa1kUfMHyZBTGaQRsEXu4DICap01ffdQl
ekCIIY+vB+5S/cJpgvpA
=GhFp
-----END PGP SIGNATURE-----

--ON+QUYPPdli25pUV--
