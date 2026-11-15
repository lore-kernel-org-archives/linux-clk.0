Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794726208;
	b=ohkVqJSpCob4hv0+apI9XE2rUQAJyThhmA0gfydiX2GQ6CWIURKrYMxGxn3WemJiRMnP
	 w9pLLWbhk9Sum6VvpEkSbhRY2VZqP44nf4BIBoR/LV9fYKsDd1fE1FmQ6FCquWJf60gjN
	 I6LyiHVsybIjTV6tcx6GjYIClpo9W+cDzZ5oOD1m5RPePTNUfAfe83CL2UykwiXdoa+CP
	 GXFBu14L5LBk52/j0NpNA4ecVTuK/wvxvr5P/dudgL0bryvSQJNxyWdCPFYuOG1hMUk8c
	 fMQvMazQ1RL1Y1Hrff3GJ9L3CNMbJiiSsU58+gE85/X7oQoHphXDcjfY33L5HKSe5Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794726208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
	b=4f4fJPNws/UAyj2te7zOSZutHuBBOfy0vHRxFx8NyNR7Xrn31RvFEPzBM4pFZCHx+eEd
	 fY4dzMO8MayzZgp9zkv0Gyq9j9jfdYavbVkButsyn4h/VMWwPpnvTHMjuXGqa8R+HzW0g
	 zwFSQRvic153gSrlntm06w1BVr0/xxyxIJOdx2LKp3oGMrUnZ2jGyPm8DYAnRi40zA5Fs
	 TBtzIcmA5qbKP9cwkNcyvWrd8yP9X7L5DKmcRRIMuj+mAyeoYz8TQ8Lz4RDptNJVfS/VM
	 1wA/l39ZROdt/nxifjk8bpUh67SjAPP6scs+BzaeqLfQWef9XjrvnwT3aEb4Mx9bdTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KHnA/YKk";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F89606A327
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 07:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F89606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHnA/YKk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25768525e9.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726206; x=1795331006; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
        b=KHnA/YKklGJIxa0kJ8/uPpiypIOP1BDnfL44ExRGNmJC8MfDs8cWMEIseZMYZfK6H0
         4OjzdwBj0SLY3+gKqeWIFCqtoVeOhsjbk2WGupMtXaiSGxmVFyEPk8Z3AxppEpFGRU1s
         RkygTQGAoHek5T9RDo6mQgTWDrL0/MEPk3eCK0w7IH3868+KDzId6EAySbenPnLSX08h
         BdkPJ8aEnV5JnPPmGCocv//35onidcvdnz7en7j/y70R9KKxBrCC1cASzt6ALGEwr9MZ
         kJ8gjkymKKNGfG5NIZaSUL8JV6E1LB4IQu+GsBWD6NBx+Gg/SPov7IxR3b49wvtz36Og
         37SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726206; x=1795331006;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
        b=TORExnWCd4JfdhwR6xaCMY1wH/MwdnLW+IFgE2W/jGhnVzf6Wn6o+G2rBNoWDhNcME
         qKtd9Yr2hibWmdC+e3NTwOECPPLkwrm1hIh5VDm0YtNuAWgYG0SNCwk7v4Y5ld+HypRx
         8Ndz0SYWW53zuqS5hpha+Y7Ybbk4BrTzHtghH3cc1w9ni3IjRKu3qV5A7mFHpKShWBDk
         3yN5MVE6wS+0RdJWXemt0/PNLXq4gZuh09C+m/h5B62P4YcyTmYdAPNAmrtiBBEcvc/K
         95a8yKAx4wI/2apevwK0J6Gzj/18wlKuzjHkYeE/e1Az80gcQue/EcN42vRrZYKE8zGI
         dWag==
X-Forwarded-Encrypted: i=1; AL+hErGbuQyovEkVXsdMqt7MpulK0SQ7q16RvYXJva13SKcSpdU0eTjgDq00cuhze8ptqq6hi3g2NBCddWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+asEII2HD/Z+Ed7FeerpoCeoQt/cM/xZX9dg55URSRMcpENJsB
	gVAVd4ATcDiOWUmT/G49XViWjWrwwKXWwAZPkDWE0ZxDUMh1wZRGO9tR
X-Gm-Gg: AYBFou38bALHIgVtC1ffPM+YmaWL0DzfNSjsRxifHt1dIZi6KCTKT1wJ7hRHrFnNHGD
	33ow5Uvu+0QiSIn2KSXLSfIr/8WPdYBJAjBSt/OCg//OiuI40zjbYPLyZ1vB23zaZM+9qCUNLEj
	teo0r59Rq4PEBLBoXfNkX15cZdepMmPob5vM6u4fam944Whe7RJoWG5j54fXE9U1IPwvG/Lte5I
	IVzgDzNx/VLR1WoYI7Skkc1LV7Ts8uTWNzFfW78oo0tsZ7JsVgZlvw2Bqm2EWYUYkd0cYhHFRXQ
	zgheJSHw6XXsw+7vBKLhYzQ17h+akO84g1L7S0TaJ/9Zx94OnrUYq3ZND1dhML1J7J7hq3tHQkg
	qtSdsD0WvddYshn9ls3/JcN9jf0Kv4w4sJm8kGsXCBNRBt9i2yV4LbdjYQ8YoKPA8tCz6p2t7V6
	DD7EufkUEPOCcqOeGVwbsj8v+5BnyPmIYWXrrUW3qkeRFt2NMWaM0ZyeJgKywuq7byhUb8CnotL
	WadLXPPR0U6HvCl6HLCJeC5rS3RD/JJKET8OGRPhNEe0EWvpbdOLXkyxhV5Kj7ibvEC3xYsU8Ny
	S84xh6nq4cRPcJzzEW5HfFJMFogxsSXzSGTy8XbtHVZXu7OVqumAMrEh7pQJdykjZhevetEw+HM
	YOrnw/0m3hQJ/lceT9coMSShnjAHWtNq4tpWdqUmeOUQfgS/Az1mRIld4Yc9eVuw6+shePsVoRa
	2Drqr7YBrr+Nhzf5V/iksdoxbITljuOvlV+JmL+XvlZBp0q7oZPrdn4TEom5rxjnAETJWl36iNW
	7t9LpCAlBlEXymbe+GrHcsyfrdIWioTy+itLkYSDQvXbeg=
X-Received: by 2002:a05:600c:840c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb5599bda8mr154094045e9.0.1794726205780;
        Sat, 14 Nov 2026 23:03:25 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm25768458f8f.44.2026.11.14.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:03:25 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Ripard <mripard@kernel.org>,
 Frank Oltmanns <frank@oltmanns.dev>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject:
 Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 08:03:21 +0100
Message-ID: <TB0DvSOtTYKNXNEXzDrlwg@gmail.com>
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 1. november 2026 ob 21:33:36 Srednjeevropski standardni =C4=8D=
as je Romain TISSERAND napisal(a):
> The N-K-M rate code computes parent * n * k / m in an unsigned long,
> which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.
>=20
> On the A33, pll-mipi (parent pll-video at 297 MHz) with N =3D 14, K =3D 2,
> M =3D 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
> 4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
> picks these factors for a 288 MHz request, and clk_get_rate() reports
> 287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
> ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
> 594 Mbit/s instead of 288 and the picture broke up.
>=20
> Do the multiplications in 64 bits, saturating at ULONG_MAX, in
> ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
> rate request of the parent-adjusting search, where rate * m overflows
> the same way.
>=20
> Without the saturation, a candidate above 4.29 GHz in the search would
> be truncated again on return and could look like a valid low rate.
>=20
> 64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
> hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
> parent rate times N * K goes above 2^32.
>=20
> Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
> Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rat=
es when determining rate")
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Notes:
> - Testing: built with W=3D1 for arm (multi_v7_defconfig with the A31, A23,
>   A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=3Dy and =3Dm, no
>   warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
>   helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
>   change, without the ULONG_MAX saturation (same results for rates that
>   fit, which is the only case the hardware hits): before, pll-mipi was
>   programmed with N =3D 14, K =3D 2, M =3D 14 (594 MHz measured as a 2x l=
ane
>   rate) while clk_get_rate() returned 287216621; after, N =3D 15, K =3D 1,
>   M =3D 16, 278437500 Hz in both the register and clk_get_rate(), and the
>   panel picture is right. This version, with the saturation, then on
>   the same board on 7.3.1: pll-mipi again programmed with N =3D 15, K =3D=
 1,
>   M =3D 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
>   right. Not tested on the other SoCs.
> - Tool disclosure: this patch was prepared with Claude Opus 5.5
>   (Anthropic) as a coding assistant, in an interactive session where I
>   asked it to bring up the PocketGo S30 display. It found the mismatch
>   between the pll-mipi register and the rate the clock framework
>   reported, traced it to this overflow and drafted the fix and the
>   message. I reviewed and understand the change and tested it as
>   described above.
>=20
>  drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nk=
m.c
> index 401fbb7524..e5a8f22d50 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/math64.h>
> =20
>  #include "ccu_gate.h"
>  #include "ccu_nkm.h"
> @@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *c=
ommon, unsigned long paren
>  	return true;
>  }
> =20
> +static unsigned long ccu_nkm_calc_rate(unsigned long parent,
> +				       unsigned long n, unsigned long k,
> +				       unsigned long m)
> +{
> +	u64 rate =3D (u64)parent * n * k;
> +
> +	do_div(rate, m);
> +	return min_t(u64, rate, ULONG_MAX);
> +}
> +
> +static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
> +					      unsigned long n, unsigned long k,
> +					      unsigned long m)
> +{
> +	u64 parent =3D (u64)rate * m;
> +
> +	do_div(parent, n * k);
> +	return min_t(u64, parent, ULONG_MAX);
> +}
> +
>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common=
 *common,
>  						       struct clk_hw *parent_hw,
>  						       unsigned long *parent, unsigned long rate,
> @@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_ad=
j(struct ccu_common *common
>  			for (_m =3D nkm->min_m; _m <=3D nkm->max_m; _m++) {
>  				unsigned long tmp_rate, tmp_parent;
> =20
> -				tmp_parent =3D clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
> +				tmp_parent =3D ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
> +				tmp_parent =3D clk_hw_round_rate(parent_hw, tmp_parent);
> =20
>  				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
>  					continue;
> =20
> -				tmp_rate =3D tmp_parent * _n * _k / _m;
> +				tmp_rate =3D ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
> =20
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
>  				    (tmp_parent =3D=3D *parent && tmp_rate =3D=3D best_rate)) {
> @@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long p=
arent, unsigned long rate,
> =20
>  				unsigned long tmp_rate;
> =20
> -				tmp_rate =3D parent * _n * _k / _m;
> +				tmp_rate =3D ccu_nkm_calc_rate(parent, _n, _k, _m);
> =20
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
>  					best_rate =3D tmp_rate;
> @@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_h=
w *hw,
>  	if (!m)
>  		m++;
> =20
> -	rate =3D parent_rate * n  * k / m;
> +	rate =3D ccu_nkm_calc_rate(parent_rate, n, k, m);
> =20
>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>  		rate /=3D nkm->fixed_post_div;
>=20
> base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
>=20




