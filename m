Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B69288C34;
	Sun, 12 Apr 2026 00:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775955055; cv=none; b=FwkqijislqAHKDj6+hm5GpHzY7kSNt9nlAzbNPsckKwJ8Bq9HfL3bC4JXih75CUronM+gGc68mYuBgubArp/hMqYhmBzXoTKI/tvYZULCGHEVdgCABYbjbjUevuspEe9tedtliVuEw0slkaBtjSIIzqgDr75h8vy2J3Mm1j0r/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775955055; c=relaxed/simple;
	bh=J3RlzVQDpHN0P49EKarfoaHvvMI4FzxvuwZU2WePGtk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kTYqR+2zAUaK242jUj68EebFyh0lMvgIpbqxvR5eKj4LABKRS1BuyIy7+doZkwk7ZEO92/xOv+O8xgJ3df9tWLhzr5aN4hEl0BooR4Y7tCgYYTTbBQ5watpgL79YD2XTiV4q8UCjATNut8jDvJyKkWZ2e48vASP0mGx/uX03lAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBNRkuu7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBNRkuu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08357C116C6;
	Sun, 12 Apr 2026 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775955055;
	bh=J3RlzVQDpHN0P49EKarfoaHvvMI4FzxvuwZU2WePGtk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tBNRkuu7uQgRa3Z22XlTC0u+H1mPwMWXUK4LUmx4D68xjqVSpavVkr5+/tDz43uCW
	 P7VJB0I7Uq9PwY6YBEhj6ILqYlinRl28tQ/shkelQODzOJrMTsqULufZLKei2TzXbm
	 CbU5ZJ3DFy7tdsyzVPh/OF4L8UQn1Un+JCveTAUEPIHnjrPIKYpQT2P7VRqrQRNv+l
	 mNdk9rXbUIVRAOfODNjOQEFNgYM6W3G6kM5E3vZJIv+/ENLmJeo8RenYDeYjKxhYj5
	 om+L7IWNE2eGm2EA5RuVolDQNdux3PHs/tsYuQCLQgyQt74e61ZwKFzuterleHNRle
	 ru9s2PfsWoDqg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260408094814.321072-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260408094814.321072-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] clk: divider: Fix overflow in clk_divider_bestdiv() for large rate requests
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Prabhakar <prabhakar.csengg@gmail.com>
Date: Sat, 11 Apr 2026 17:50:52 -0700
Message-ID: <177595505293.5403.10549666544609254028@lazor>
User-Agent: alot/0.12

Quoting Prabhakar (2026-04-08 02:48:14)
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> clk_divider_bestdiv() clamps maxdiv using:
>=20
>     maxdiv =3D min(ULONG_MAX / rate, maxdiv);
>=20
> to avoid overflow in rate * i. However requests like
> clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
> supported rate of a clock, result in maxdiv being clamped to 1. If no
> valid divider of 1 exists in the table the loop is never entered and
> bestdiv falls back to the maximum divider with the minimum parent rate,
> causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
> supported rate instead of the maximum.
>=20
> Fix this by replacing the maxdiv clamping and the unprotected rate * i
> multiplications with check_mul_overflow(), clamping target_parent_rate
> to ULONG_MAX on overflow. This allows the loop to iterate all valid
> dividers regardless of the requested rate, and clk_hw_round_rate() with
> ULONG_MAX will correctly return the maximum supported parent rate.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/clk-divider.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Please add kunit tests to show the broken behavior that you're fixing.
Make a clk-divider_test.c file for this instead of adding it to the
clk_test.c file.

>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 45e7ebde4a8b..dc486c2aa946 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -15,6 +15,7 @@
>  #include <linux/err.h>
>  #include <linux/string.h>
>  #include <linux/log2.h>
> +#include <linux/overflow.h>
> =20
>  /*
>   * DOC: basic adjustable divider clock that cannot gate
> @@ -301,6 +302,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, str=
uct clk_hw *parent,
>         int i, bestdiv =3D 0;
>         unsigned long parent_rate, best =3D 0, now, maxdiv;
>         unsigned long parent_rate_saved =3D *best_parent_rate;
> +       unsigned long target_parent_rate;
> =20
>         if (!rate)
>                 rate =3D 1;
> @@ -315,15 +317,11 @@ static int clk_divider_bestdiv(struct clk_hw *hw, s=
truct clk_hw *parent,
>                 return bestdiv;
>         }
> =20
> -       /*
> -        * The maximum divider we can use without overflowing
> -        * unsigned long in rate * i below
> -        */
> -       maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> -
>         for (i =3D _next_div(table, 0, flags); i <=3D maxdiv;
>                                              i =3D _next_div(table, i, fl=
ags)) {
> -               if (rate * i =3D=3D parent_rate_saved) {
> +               if (check_mul_overflow(rate, (unsigned long)i, &target_pa=
rent_rate))

Please add some sort of comment above this if condition to tell us what
a target_parent_rate of ULONG_MAX means and why overflowing we set the
rate to that.

> +                       target_parent_rate =3D ULONG_MAX;
> +               if (target_parent_rate =3D=3D parent_rate_saved) {
>                         /*
>                          * It's the most ideal case if the requested rate=
 can be
>                          * divided from parent clock without needing to c=
hange
