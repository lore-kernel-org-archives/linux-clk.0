Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808162;
	b=a3QcsX3BB3l6RxfoRKr2YunWM47bF2JGtAjVZEZQsIo22hkFBxy9lrtKjhCw0QZ7Y2m4
	 k7OQapttNdr3csMFo0QqgAlouzlO6eHLV43VG9rZx2BEFko8v17II/j2qd+jH31HSAmko
	 qMYIWiQj/l14LR8a5GmzsRuPSaz0WniKH7SpqvyllED/OcY6zPT1ZSoMH9XR/3hl09dIz
	 OLYV8xpwtzON6hop2yCRQzlXJVN6mW08dd8PLUmvYLNBYjcyhczmchoML2Uc74kKlG/Dy
	 i2/SmLATIP8wPudZMgxnumTyFrGn0NmXUA6g4NA1lT99KuhGenpLTUIX6sh3RFwzCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808162;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/7hscLgKi1mPxYjjrqEJPT9Osiu8BcDjhThp54Zr9Ng=;
	b=IEFSdN+sb2TMHzO2I0f4sOPQI/KbxaY6dVE8z2LxT29mwXodRhMDiR2ZwCBnSuhD4I60
	 6QwarnSjcb0b1B3CjDDHTBkk62kJ5A1Lh8j3C3VNrgqhyVPM/fq6RiLMUTY7MCw2YQ0YE
	 o+N+3u8InWIaIznkPPNS4zFWhXtuEW3xCTZy4i/SXwtydPsMIVSY/a9o3n/LWclw2umVr
	 Xn0JALRab4IOHzYY5T64epKwv1EbCxWAWC2Z0ml3h84SvDYBK6xzTkXACCWnieYcw5qhS
	 Fv7M/r6U9+qbkHCCHqlKAxrMgOL5s5Ffoiw06XuvSByTZN/hRwb99kbMJPPRSHLIGsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL0qMpKa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B26606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 19:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL0qMpKa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEC01F00893;
	Fri, 27 Nov 2026 19:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795808161;
	bh=/7hscLgKi1mPxYjjrqEJPT9Osiu8BcDjhThp54Zr9Ng=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PL0qMpKa1I8j+/0uFFQ4BTRRONE7mUJIygVeEx27e9VbGfii6QbRIUiktjQrlHHzL
	 trtYyIOyOBemas8Gbqav/sms2zeFSgKMPJCKmQgq5DjeR70RubbQ0WclbuK0tYhlDe
	 Wd4rl+GjT2I2KRRcJY1A7akXxOO63s/rduPoGyCYN0v43S1ZanKA6ScawFAhkdAzlt
	 oapS6bkIq/gz6PRi6AquDUlUKrmiG9OWuSUFnBCmfOT0ZjP2rUd8HfhWak1DDPGZSQ
	 ndE1zTWPhvoYkR8uZtt9HKGzH2WRG9e3h8Jj5Mt5SwN8IQjZ/q3eQmJHkPhoTHWjs7
	 yJmmNjkVe5t3g==
Message-ID: <sashiko-outbox-238168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] clk: ti: fapll: Fix output clock array allocation
 and bounds check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-clk@vger.kernel.org
In-Reply-To: <20261127192620.3443537-2-lee@kernel.org>
References: <20261127192620.3443537-1-lee@kernel.org>
 <20261127192620.3443537-2-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 19:36:00 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: ti: fapll: missing lower-bound check for index 0 in
  ti_fapll_setup()
--

commit a8867d96413dfd436f2d0dca33e4c637a2d0da77
Author: Lee Jones <lee@kernel.org>

clk: ti: fapll: Fix output clock array allocation and bounds check

This commit allocates MAX_FAPLL_OUTPUTS + 1 pointer slots for
fd->outputs.clks and bounds-checks output_instance against
MAX_FAPLL_OUTPUTS.

> diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
> index 7d6a4dd4fc8ce..d5e95e6489cda 100644
> --- a/drivers/clk/ti/fapll.c
> +++ b/drivers/clk/ti/fapll.c
[ ... ]
> @@ -625,6 +624,12 @@ static void __init ti_fapll_setup(struct device_node=
 *node)
>  					       &output_instance))
>  			output_instance =3D i;
> =20
> +		if (output_instance > MAX_FAPLL_OUTPUTS) {
> +			pr_err("%pOFn invalid output_instance %u\n",
> +			       node, output_instance);
> +			continue;
> +		}
> +
>  		freq =3D fd->base + (output_instance * 8);
>  		div =3D freq + 4;

[Severity: Medium]
Should this check also reject output_instance =3D=3D 0?

Child synthesizers are 1-based, while slot 0 of fd->outputs.clks is
populated with the parent pll_clk before this loop and register offsets 0
and 4 are the main PLL control and powerdown registers.  If clock-indices
contains 0 or of_property_read_u32_index() fails on i =3D=3D 0 and falls ba=
ck
to output_instance =3D i, synth_clk aliases the main PLL registers and
overwrites fd->outputs.clks[0].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127192620.3443=
537-1-lee@kernel.org?part=3D1
