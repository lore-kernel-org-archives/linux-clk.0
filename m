Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: bcm2835: De-assert/assert PLL reset signal when appropriate
In-Reply-To: <20180214113722.6b9f578c@bbrezillon>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-3-boris.brezillon@bootlin.com> <87po5f5x7l.fsf@anholt.net> <20180214113722.6b9f578c@bbrezillon>
Date: Thu, 22 Feb 2018 12:18:07 -0800
Message-ID: <87sh9ssrr4.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> On Thu, 08 Feb 2018 15:15:42 +0000
> Eric Anholt <eric@anholt.net> wrote:
>
>> Boris Brezillon <boris.brezillon@bootlin.com> writes:
>>=20
>> > In order to enable a PLL, not only the PLL has to be powered up and
>> > locked, but you also have to de-assert the reset signal. The last part
>> > was missing. Add it so PLLs that were not enabled by the FW/bootloader
>> > can be enabled from Linux.
>> >
>> > Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the au=
dio domain clocks")
>> > Cc: <stable@vger.kernel.org>
>> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> > ---
>> >  drivers/clk/bcm/clk-bcm2835.c | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm28=
35.c
>> > index a07f6451694a..6c5d4a8e426c 100644
>> > --- a/drivers/clk/bcm/clk-bcm2835.c
>> > +++ b/drivers/clk/bcm/clk-bcm2835.c
>> > @@ -602,6 +602,9 @@ static void bcm2835_pll_off(struct clk_hw *hw)
>> >  	const struct bcm2835_pll_data *data =3D pll->data;
>> >=20=20
>> >  	spin_lock(&cprman->regs_lock);
>> > +	cprman_write(cprman, data->a2w_ctrl_reg,
>> > +		     cprman_read(cprman, data->a2w_ctrl_reg) &
>> > +		     ~A2W_PLL_CTRL_PRST_DISABLE);
>> >  	cprman_write(cprman, data->cm_ctrl_reg,
>> >  		     cprman_read(cprman, data->cm_ctrl_reg) |
>> >  		     CM_PLL_ANARST);=20=20
>>=20
>> For turning off, the FW just does the equivalent of:
>>=20
>> 	cprman_write(cprman, data->cm_ctrl_reg, CM_PLL_ANARST);
>> 	cprman_write(cprman, data->a2w_ctrl_reg, A2W_PLL_CTRL_PWRDN);
>
> Hm, the write to ->a2w_ctrl_reg overwrites the=20
> NDIV/PDIV values done in bcm2835_pll_set_rate(). So, either we do:
>
> 	cprman_write(cprman, data->cm_ctrl_reg, CM_PLL_ANARST);
> 	cprman_write(cprman, data->a2w_ctrl_reg,
> 		     cprman_read(cprman, data->a2w_ctrl_reg) |
> 		     A2W_PLL_CTRL_PWRDN);
>
> or we cache the pdiv/ndiv values in struct bcm2835_pll and only apply
> them in bcm2835_pll_on().
>
> I'd recommend going for the former to keep the changes easily
> backportable to older kernels.

Oh, right.  I like your cprman_write() solution above.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqPJX8ACgkQtdYpNtH8
nuiN2w/8D6Tdik7p5RiE0SguTzoogDplLJSe6O/Ha1+2gIwDEx5Pg69tJ9vPNNVb
bcytI583fjDTYtWj0rAxfCDZkYhPlrbdFuFL1QgjvXPOrdE7r2h12+JxPB4SxdPq
qLa16yQslaSdLQmkzZmsRqzfkkDIxAEmFwo+fp31GqKtZkAJj+OnKNHD+hRWOxHw
30LUFOerGlz5b/lH34TRigRDauzHj7s/BYs+7/sW8eEhZlRzrf41+bFAL+G0FU3t
9r+VSn6izJ6SwyFpWFl1+9n63WWpdmTNz7Zsv8o/n5aNRW0xPQbsmVEdEmeA9b/R
8Avl1nXC36BqDFIfdyVUsRcGBY4RXBvYwF7JiRQo7CRwuIb8gX2uoAzzI2xXSIN0
djT7Ene5Uws3j4c3vxmQg9hKBW2B7pDIA8/VvVtbK/H8r84Mkb83a01rgguHgEPP
jh+AYvg+ulJjijjCdffJ7Jl1ZudyZboH1XL/V3/SZ9zTTFRHR9OokntxQ5unqBkb
Xyh58ycrvbMjlfonQm1WBshbxnbV0CFmqgISBBeSB+x0bcvMPjqr5VAPG+uV0BBR
gYSnyn34fDezaGn6kpM2BXqQhum9gyYNMtS6j0n3H0k2IezKYbcAYWJogEe4lQQc
cFwq+A9TlZiENhOFOYcw1lhT4HJhGTzj/tENo9tO93HdNtBzKiM=
=xkF5
-----END PGP SIGNATURE-----
--=-=-=--
