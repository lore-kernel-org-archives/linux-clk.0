Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 4 Mar 2016 16:27:11 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
Message-ID: <20160304152711.GR8418@lukather>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
 <20160303191604.GW24999@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="szlDyXxWT551m6yh"
In-Reply-To: <20160303191604.GW24999@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--szlDyXxWT551m6yh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 03, 2016 at 11:16:04AM -0800, Stephen Boyd wrote:
> On 03/03, Chen-Yu Tsai wrote:
> > On Tue, Mar 1, 2016 at 4:20 PM, Stephen Boyd <sboyd@codeaurora.org> wro=
te:
> > >         div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> > > @@ -107,6 +111,8 @@ err_free_div:
> > >         kfree(div);
> > >  err_unmap:
> > >         iounmap(reg);
> > > +err_free_parents:
> > > +       kfree(parents);
> >=20
> > AFAIK the CCF makes a deep copy of parents, so you should
> > always free it? I specifically checked it before using
> > VLAIS here.
> >=20
>=20
> Yes. Good catch. Here's the update.
>=20
> --8<---
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] clk: sunxi: Remove use of VLAIS

VLAIS?

> Using an array allocated on the stack may lead to stack overflows
> and other problems. Furthermore, VLAIS doesn't work well with
> LLVM compilers, so move the allocation to the heap and avoid the
> use of VLAIS here.
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/sunxi/clk-sun8i-mbus.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-sun8i-mbus.c b/drivers/clk/sunxi/clk-s=
un8i-mbus.c
> index 3aaa9cbef791..90acc8549d60 100644
> --- a/drivers/clk/sunxi/clk-sun8i-mbus.c
> +++ b/drivers/clk/sunxi/clk-sun8i-mbus.c
> @@ -33,7 +33,7 @@ static DEFINE_SPINLOCK(sun8i_a23_mbus_lock);
>  static void __init sun8i_a23_mbus_setup(struct device_node *node)
>  {
>  	int num_parents =3D of_clk_get_parent_count(node);
> -	const char *parents[num_parents];
> +	const char **parents;
>  	const char *clk_name =3D node->name;
>  	struct resource res;
>  	struct clk_divider *div;
> @@ -43,10 +43,14 @@ static void __init sun8i_a23_mbus_setup(struct device=
_node *node)
>  	void __iomem *reg;
>  	int err;
> =20
> +	parents =3D kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
> +	if (!parents)
> +		return;
> +
>  	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
>  	if (!reg) {
>  		pr_err("Could not get registers for sun8i-mbus-clk\n");
> -		return;
> +		goto err_free_parents;
>  	}
> =20
>  	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> @@ -90,6 +94,7 @@ static void __init sun8i_a23_mbus_setup(struct device_n=
ode *node)
>  	if (err)
>  		goto err_unregister_clk;
> =20
> +	kfree(parents); /* parents is deep copied */
>  	/* The MBUS clocks needs to be always enabled */
>  	__clk_get(clk);
>  	clk_prepare_enable(clk);
> @@ -107,6 +112,8 @@ err_free_div:
>  	kfree(div);
>  err_unmap:
>  	iounmap(reg);
> +err_free_parents:
> +	kfree(parents);
>  	of_address_to_resource(node, 0, &res);
>  	release_mem_region(res.start, resource_size(&res));

The error path is wrong here, if you jump here from a failing call to
of_io_request_and_map, you'll end up releasing a memory region which
is not requested.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--szlDyXxWT551m6yh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW2alPAAoJEBx+YmzsjxAgw54QAL3F9+SuukVPo4aZFUCBBSh7
VrhLCHO3NYVpmUYqiM5hwRuKpmcUAazTwBLS/ptlsDSztat9HxhMZy/U2PGwaWnk
g+GU+2TlCSi3LsMbGueoq+HtxIhdLCSE1OEu0+SlmTodUicClwZMZ0kP15n60gxx
5kcmbOLJ3kOtxJNiYb9HCotFqKvo/Uq2JDYuCEO9omtE15JD7jHxexkzlSRZtguh
QSDz+WBcD2D1UnleQAXFXLryNHy6sIfTDqKTw/+QRuE2dmC4QIX/NaDY8W/14kIW
lJ5IgfTLDEX+pYPz+NRyi3+75UimY4GikGwxJ6YCW9h+aJKTDqEQcpalbdebc5Zm
X6ftXKQto3BmC6lcaNFBERITa0MgSMUofPXP/pSk1gX5Lj8KNVJ5uiKDtT1Uxe3j
5myYdeRWx8wtRRtANd9KzC4/mNO0siTZSlkLLZyyFUigwvwY/JjQMkR6qgcDRsDK
o+BS2H629ad0VRFOHah2Ji2egzF9ivbz8WfAYVA6qCg19Si81wKvwTzbaRZxPfKj
8gSnAKZAiQ9zZOeTlG7LF5sXmzWH1iL3lzO2rl9fNm7vG5WaCYKcBYXPJDOH8Vfu
KIPLk7B0uXo2DC74PRZ7Q6dKDe0d1WAMbdBRjilim3C502I7EoC7Ff5VGNfqAgR/
7VSqsrIsBMEV0GFsEjro
=8vw0
-----END PGP SIGNATURE-----

--szlDyXxWT551m6yh--
