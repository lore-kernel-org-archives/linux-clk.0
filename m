Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 26 Jan 2017 10:55:23 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 01/11] clk: sunxi-ng: mux: Fix determine_rate for mux
 clocks with pre-dividers
Message-ID: <20170126095523.rat5wqbj73fkxy6z@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fqlb7rnfodlsakqe"
In-Reply-To: <20170124023230.3990-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--fqlb7rnfodlsakqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Tue, Jan 24, 2017 at 10:32:20AM +0800, Chen-Yu Tsai wrote:
> The determine_rate helper used ccu_mux_helper_adjust_parent_for_prediv()
> to adjust the parent_rate to account for pre-dividers, but then passed
> the pristine parent clock rate from clk_hw_get_rate() to the round()
> callback, thereby ignoring the pre-divider adjustment. In addition,
> it was saving the adjusted parent rate back into struct
> clk_rate_request.
>=20
> This patch fixes this by saving the pristine parent clock rate, and
> adding a copy that is adjusted and passed to the round() callback.
> The pristine copy, if it is the best solution, would be saved back
> to struct clk_rate_request.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index 858a48621631..3445041894e7 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -71,7 +71,7 @@ int ccu_mux_helper_determine_rate(struct ccu_common *co=
mmon,
>  	unsigned int i;
> =20
>  	for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> -		unsigned long tmp_rate, parent_rate;
> +		unsigned long tmp_rate, parent_rate, adj_parent_rate;
>  		struct clk_hw *parent;
> =20
>  		parent =3D clk_hw_get_parent_by_index(hw, i);
> @@ -79,10 +79,11 @@ int ccu_mux_helper_determine_rate(struct ccu_common *=
common,
>  			continue;
> =20
>  		parent_rate =3D clk_hw_get_rate(parent);
> +		adj_parent_rate =3D parent_rate;
>  		ccu_mux_helper_adjust_parent_for_prediv(common, cm, i,
> -							&parent_rate);
> +							&adj_parent_rate);
> =20
> -		tmp_rate =3D round(cm, clk_hw_get_rate(parent), req->rate, data);
> +		tmp_rate =3D round(cm, parent_rate, req->rate, data);

Shouldn't you use the adjusted rate here too?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fqlb7rnfodlsakqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYiceHAAoJEBx+YmzsjxAg/9wQAK1qFkZnsU0vJgJ73x59p9Qw
HhAiuMnSpoZb8e2jEOlOYYMBiDW0/fmv4cyg+CycaAw/TF6yHpGxApKp/HVvh/xb
3jsFc+VgoBSVoGf8nNZaJWwgf9uHRiYtFfeTMMpV/USEWnbSwP3Wy4jstbFS64P1
6S6pcPy1ck+IVzc6iijIxth4ibI1taKa725nESAS6IyvIV8IFfoQvftMasdFZvbA
i599Apx8WBsfSU/dzQXnjz2zVXXxjt6i5VETityVcwYPM/+acOKXjWgSlehwLc0X
CQLh6Ms4cre59S0Nx7A2LRZt6ErivmLdwPaiOg68eH9fG0yUwguJskqmAFD8LliZ
U5eKfouoUSnMQpH9Fd9deGN75Di8H/d6XIePvyYwRSlwyawzmDUC7jyOu0t7Ksss
t98s7ICn6ysCL9YqWtvbW3pw4kUykRzuy6+ClX+dBcqaTIxtaKJKBeu/iutUIyJK
fnCUr8c/LiE3cN/+rr7i5h4bk/VRsbEOPpPwzUxb6nmGu0m2lEU6nnu5afvspyRv
X6GmG/9u4no9q49qKUi/JgF7tPM0fZQakgTasMlU/f3Dda4jZZAwgkF4qGnAALt/
GPlxhHIiMCTtL6/FPuTVWKvMPpNRHk5LehSNhglq8G+1jOMRgdI6XBiFkgGyN3Xd
4s4Xnac5AVdD5HATFiUf
=7eEx
-----END PGP SIGNATURE-----

--fqlb7rnfodlsakqe--
