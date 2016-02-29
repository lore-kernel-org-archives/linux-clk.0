Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 6/6] clk: bcm2835: clean up coding style issues
In-Reply-To: <1456745963-2403-7-git-send-email-kernel@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-7-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:20:05 -0800
Message-ID: <87oaaz5kwa.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Fix all the checkpatch complaints for clk-bcm2835.c
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c |   14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index da77069..105a42f 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -12,9 +12,6 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 =
 USA
>   */
>=20=20
>  /**
> @@ -300,7 +297,7 @@
>  struct bcm2835_cprman {
>  	struct device *dev;
>  	void __iomem *regs;
> -	spinlock_t regs_lock;
> +	spinlock_t regs_lock; /* spinlock for all clocks */
>  	const char *osc_name;

I don't think this comment adds anything at all, but I understand you're
trying to shut checkpatch up and I don't think there's much to say.  I'd
drop it, but I won't block the patch for it.  Everything else in the
patch looks good.

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1Kf1AAoJELXWKTbR/J7oQGMP/1Q2nW153m0A9yZrIyZyKTN4
wbs2tb6mHcto20bcGV3MAu5yNGoHpzCPLkKh3wwpVrG3UgEHhW/NLo2bTPzkIvHd
p1N7FEY1EIBIUy31THj4NfLjo7YfDy8wgY/XLVq32V5IzoBYeuJgO9lL1ue9r77C
sKebTh+X3swvg9o/x93wsToyTAlYHyHBpLWjFh9fQp0yv2/l67GoioOYNrUqgIig
35T4pa2E5NuLbZwGWC5P6geAZ5OWB+Pw6P4RodbPnAwnrfDQwNY/H1Pe92sksV6x
2kcg6HJCM1cgqwaJ2GA3NpXz5gT1chf39RyGyGdjWgHY9x6IVOgETm7TC2ibovwc
p4ETAvpkOuCR1gZZpfMF1PTPfettI4GWJ0qfnsrKK9kzcC+qmeUO6Ij45jt06oxF
I0JryJDW4AgXBym+JvIMSquyIt8ogpVAPhlNDmiunrOGzTDdA2Qg2yIu50U+4mgN
9B12pi2mGJRDLjH9HZ/LsOoVd9ExPiO6TPWzxqOYYMHMCONDXv7hfKd3BOOOSGCp
Hdb7mK/cRiXm36kpmGpgv2uFrqshSb3LPtAW9ns2F1g4wl5VhH5eo3svsGYl22FV
V6bnNMJZ+Myz7w4TMluha/h/1nSdj5ITrK5p/IUzqeHDA8qVHv7zV3Cw2EDTVYqH
tHQ8FcpNGBcA2xuzBYu1
=OTrI
-----END PGP SIGNATURE-----
--=-=-=--
