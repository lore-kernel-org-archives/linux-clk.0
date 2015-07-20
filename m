Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 20 Jul 2015 10:01:16 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 33/45] clk: sunxi: Include clk.h
Message-ID: <20150720080116.GS28632@lukather>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
 <1436571223-10959-34-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hIhQBbMWEy++B+zM"
In-Reply-To: <1436571223-10959-34-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--hIhQBbMWEy++B+zM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Jul 10, 2015 at 04:33:31PM -0700, Stephen Boyd wrote:
> This clock provider uses the consumer API, so include clk.h
> explicitly.
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/sunxi/clk-mod0.c       | 3 ++-
>  drivers/clk/sunxi/clk-sun8i-mbus.c | 2 +-
>  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
>  drivers/clk/sunxi/clk-sun9i-mmc.c  | 3 ++-
>  drivers/clk/sunxi/clk-sunxi.c      | 2 ++
>  drivers/clk/sunxi/clk-usb.c        | 3 ++-
>  6 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> index 9d028aec58e5..39ba5c3d5d3a 100644
> --- a/drivers/clk/sunxi/clk-mod0.c
> +++ b/drivers/clk/sunxi/clk-mod0.c
> @@ -14,8 +14,9 @@
>   * GNU General Public License for more details.
>   */
> =20
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/clkdev.h>
> +#include <linux/slab.h>

I guess you're adding a bit more that clk.h ;)

Could you sort the headers alphabetically please?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--hIhQBbMWEy++B+zM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrKrMAAoJEBx+YmzsjxAg9psQAJGdTzAtlQawc/xzQ7XK1CIH
Xouam0X7TdxBRehFmJXVI7XGZSFxNTx2a2f9XgIVaIwujixZ1s+MU5131fUMP0nU
RnO2VkAccsXx5uENjvJ4lrbwvatMxWlRRTBStK7QmwGgZRLRPcS95bkMIAfP2EbZ
iCFEZDJfos4FF/PQxze9J/VqKMP1ECEl1xkg1t5hgRFNtwY5dzJ/od+WD45Hop5G
dh46Z2yzcDWHUn6pfrac9WwnZy5zaiZ+w+8it4yYt/pLQsHEPKR2llqvkatgN+1C
IaamM/L8IsxZmNRnXGoEInpjkdu4OuX9Fylp+ECR/29HPD9c4B/BHfijVsSb84/S
ChhYjKPH1Wo8IQGJIaIVwjgiu+PnYbaGk12qBJsRaXffoxVHFmOydORmAdmDHzu6
98Xvq9WL+8VczSgkj45C1Mu7+piLD91Os5X4wheWMUWgqJpt65R3a9u1HhZfKb6H
AOKhyqcOtqc+gofPwff4eZf+2B5ttb93Fg1FB2NOkq53zIhWjjsI0j8qL5oVGutB
YzTXlRnI/SY4qVj2gkORn2V2klLG6Qwv2hjVjaZgP6u/p4DjgjiGqz6DimaPIBti
ZCEyMfJytttFUQFF8Mk7rV9AvOm4zQO+4MbwzUrjhyt733Nsk3IhhGeV9ZVfu5Ql
YEsIVdM1ht2jX27d+Hu0
=aFf8
-----END PGP SIGNATURE-----

--hIhQBbMWEy++B+zM--
