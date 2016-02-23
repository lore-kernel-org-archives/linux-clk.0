Return-Path: <balbif@gmail.com>
Return-Path: <balbif@gmail.com>
Sender: Felipe Balbi <balbif@gmail.com>
From: Felipe Balbi <balbi@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 8/9] usb: dwc3: Remove impossible check for of_clk_get_parent_count() < 0
In-Reply-To: <1456174487-28397-9-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org> <1456174487-28397-9-git-send-email-sboyd@codeaurora.org>
Date: Tue, 23 Feb 2016 08:48:55 +0200
Message-ID: <87d1rnorag.fsf@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Stephen Boyd <sboyd@codeaurora.org> writes:
> The check for < 0 is impossible now that
> of_clk_get_parent_count() returns an unsigned int. Simplify the
> code and update the types.
>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: <linux-usb@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>
> Please ack so this can go through clk tree along with patch 1.

sure, no problem ;-) patch looks okay

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBAgAGBQJWzADYAAoJEIaOsuA1yqREJR0P90MHVyEHbWfTENPxEGTilNlC
IeSrQVMDS0mvM4oy0ETPq4NAlJWjqXSP2pMdyH8RpCvNLhcv4ApfNwNctNdLlw4N
kSkqvuksJPf2lDU9PsxYUtJNChHsWY5oLOIS3ZUAbRi5YbBAsBJEQrSai+7sAq2K
uxvz5GxTWI2XRLnJ+JJzOrHpRPUgmmeM6eJZfqzxAYS63cVedfwGgEB+j5XBeUZv
bjx0JZaTrJ9W/9n7LV17kNHFjxpz2XU2oUaJ6AOuOKML+Qmri2zD23CgiGdKn1x7
me0ssF8TcEww2uGMrxPu16wHFzak7dLsVuxLJEIT8bkpCd/sHlJaSNHmpUxil/Ju
R2yOP01th5cy6pV6AOtb3iCgPCSCweh6/9I75YGnOB9fspleFWUfLAOzmZbktlUA
wI8NERzbYMayx8NcMirp+r4tZDn4jioUf7vDvXM+BcRH4hlyLuQHg7H7g/hksDdv
EO4zrD4WzNrgL+R8nqEwzvk+uYmjbc2R/ICIquwSnYn5CKFhjvAeZNjmxNTAoXPl
/y2BZVArh2aOKl5ZDpGOk8QC+WBtujwq61XJytEJJNYLSHLUDHNOXgukjXCbch7O
QzdrWLKvu2NOnZsRfjH39MkVfelnFWIKapNMzPYJBrZgEQWbTpyr8Uj17yGrsavE
uCM1I2iHJradlyhuZkM=
=gy2Q
-----END PGP SIGNATURE-----
--=-=-=--
