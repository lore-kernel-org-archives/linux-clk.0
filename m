Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CEC488231
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394507; cv=none; b=PbXAER6ZZn1qmiHFANydwjuIUZ+ecsNLv+G+ISswFFmgP1jas/FF3JAcmN/u03zRLTnJvuEQjUAQH/3aWMJT4UYVSNCTRHXbGM39hH2+VPPHz2rcHCb1nn15CUx+s7Nik2Wq3GqM6Y1U1AQ1PXqrkpWh8kcD6CXxLKcpWmwABVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394507; c=relaxed/simple;
	bh=E2h75DB3pAtNvfZ77M5SB2PqcwQQ4IweRxTJ+uOzvWU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g/zRStxC6e/Yp6JZAXAxcHp50cDl055iTxbBckCfAonaRAnmgWGkIDE79TLydESK3cMyk/wqWfk8G+OZh2AHbeYsqhaLGdgwuLsssruWgKRUNc6sx72sC2XRBsrob6yaeXjM0UDq7TaDBxuXaJQatHkQRDiSyNOikz6ayIDQMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfFY4nHF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfFY4nHF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA661F000C4;
	Mon, 19 Oct 2026 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394505;
	bh=ix4vnQhX/mJhmZTSSR0zd4Mgin74jKKTqY0wbl6SnHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XfFY4nHF/oNf3d+7PmbH71CcozaVPl099m6rm++gRPWZLsjy2IhxdYp0ejJxA2uUE
	 h47ukxHDmTvtuRrFBHaY00J9zjenEGUVrea0cJSRPhUXNCXhLHvvQ4l4raONGcUjst
	 p8Im7yYrm9dvVaB4x/7QwU4xYh0XB+In5oAPXWpJIHHsYYcqmhyy7sEY+cdZARzZmQ
	 HQGzkaGPGQnsJVzPSCi0tbJbyxV37jl73jOdbD4OBR92UF9GTQXG/1a5EbikXM6BhF
	 pOh8kGnEb5lzvBjZE4/ywAvsMuNJ4dqV3jP+U5tyrCYcuJYpfhyeVkDuKx+GZe4Vcf
	 N3QYqhm8m2AZw==
Message-ID: <sashiko-outbox-176742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] coccinelle: Detect clk_register() anti-pattern
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guru Das Srinagesh" <linux@gurudas.dev>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261018-cocci-clk-register-v4-1-ed611b1c0da6@gurudas.dev>
References: <20261018-cocci-clk-register-v4-1-ed611b1c0da6@gurudas.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 07:21:45 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] coccinelle: clk_register: missing when !=3D n constraints in bin=
d_loop
--

commit 5a7f966954ec0e1e638d5df96a25b50558993fc6
Author: Guru Das Srinagesh <linux@gurudas.dev>

coccinelle: Detect clk_register() anti-pattern

This commit adds a Coccinelle semantic patch to detect and remove redundant
error messages logged after clk_register(), clk_hw_register(), and their
devm_/of_ variants fail.

> diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinel=
le/api/clk_register.cocci
> new file mode 100644
> index 0000000000000..01d272e2d96f7
> --- /dev/null
> +++ b/scripts/coccinelle/api/clk_register.cocci
> @@ -0,0 +1,262 @@

[ ... ]

> +@bind_loop depends on patch@
> +expression x, E;
> +identifier voidfn, n;
> +constant char[] c;
> +type T;
> +statement S, S_else;
> +@@
> +
> +  for (...;...;...) {
> +  ... when !=3D n
> +- T n;
> +  ...
> +- n =3D E;
> +  ...
> +  x =3D \(clk_register\|devm_clk_register\|clk_hw_register\|devm_clk_hw_=
register\|of_clk_hw_register\)(...);
> +  if ( \( IS_ERR(x) \| x \| x < 0 \) )
> +(
> +-{
> +-voidfn(...,c,...,n,...);
> +S
> +-}
> +|
> +{
> +...
> +-voidfn(...,c,...,n,...);
> +...
> +}
> +)
> +  else S_else
> +  ... when !=3D n
> +  }

[Severity: Medium]
Can the bind_loop rule delete the declaration and assignment of n when n is
still referenced elsewhere in the loop?

In SmPL, when !=3D n only constrains the specific ellipsis to which it is
attached. Here, when !=3D n is only placed before T n; (before n is in scop=
e)
and after else S_else. The intermediate ellipses around n =3D E; and
voidfn(...), the registration call arguments, and the statements S and
S_else are not constrained.

If a loop uses n between n =3D E; and the end of the if/else block (for
example, passing n to the registration call or using it in S or S_else),
won't running this script in patch mode still remove T n; and n =3D E;,
leaving behind an undeclared identifier?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-cocci-clk-=
register-v4-1-ed611b1c0da6@gurudas.dev?part=3D1
