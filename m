Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D553E1234;
	Mon, 23 Mar 2026 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296865; cv=none; b=HyxLWzxg8NBk/N9AUuh0OSaovYeFqPUnyNTzvDh6hjXVTz65GdS9n2vrsw87KqSqA1l3SHj51ovzpXtcjjX81HXbwdRWOPHpPjmGxvYjCxIUqZRobGKkMQtjAN89y1ZQAX+tFsMG7B8Jr8SwXdXbBuRvr13jnY2Ey1EPrsyUkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296865; c=relaxed/simple;
	bh=30lkpe7Em1d9BrFZcpOAhzkzQ/gf+EsNMKAD9ZDa18E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZJW/EYufAz948VIrBuAFaBJ4eVQxF09PgmgzyS8cUjJKMg7uHjuxVFZkhOalnRwwJpvID3roJixhhQ1YJajZuqGOsZez2TeC7lSyIUKLAH0An6or/Z5WqG7cGqJyx8e1spR4YjBvItcP9wLb0iHgAIV3d6WYzNsEUMq2dvKOIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak/BriXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ak/BriXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C61BC4CEF7;
	Mon, 23 Mar 2026 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774296865;
	bh=30lkpe7Em1d9BrFZcpOAhzkzQ/gf+EsNMKAD9ZDa18E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ak/BriXM7n+javkcwrsdcG1KGgineenNzKCiFAOK/1UQv/ouPyXRlN2DpmvAU2gM+
	 lAH5K0PBtV8659H/T+9/2Kuo9BgUMYx7AwLhxXXh6orZTFeNhTP87nj4VIEJ4UesO3
	 dmkUt50LBo04aetecHtj47scq7bFWz/ebMKlIFu1qttSTtMymX1LlY3xC4LY5qfjAt
	 opOV40AsIvrmNIhProTaSrbJAPkIQra6DgsMqwO6Sj3pZbYOK+CPhpwtRmTVhPTLQu
	 FCODBiYGpZZ0fYgueOW9wDjZwoegK6YtaguX945QiNfdFE2kWgCqJHY/4PWlTVy/02
	 GHu7u9znqvo4Q==
Date: Mon, 23 Mar 2026 20:14:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260323-sanctuary-semantic-432089feb1c7@spud>
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2e3uU01NeNC32Fhi"
Content-Disposition: inline
In-Reply-To: <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>


--2e3uU01NeNC32Fhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 02:52:21PM +0100, Vyacheslav Yurkov wrote:
> On 19.03.2026 17:50, Conor Dooley wrote:
>=20
> > > I described a use case in my cover letter (PATCH 0). Perhaps our appr=
oach to
> > > tackle the issue is not correct in the first place. The term "virtual=
 clock
> > > controller guard" is something we named it, but it's literally just a=
 clock
> > > provider which combines several other clocks and input GPIO signals i=
n order
> > > for the consumers to check whether they are allowed to probe already =
or have
> > > to wait until the input clocks are enabled.
> >=20
> > Can you explain how this is different to gpio-gate-clock? AFAICT, you're
> > trying to support clocks that are enabled by a gpio, and that's what it
> > is for.
> >=20
> It partially covers the similar use case, but differs in the sense that
> gpio-gate-clock controls the clock via GPIO (enable/disable), the
> clock-controller-guard gets the GPIO status signals whether the clock _wa=
s_
> enabled externally because a CPU has no direct access to the clock. So
> perhaps the terminology I came up with is not so self-explanatory, that's
> why I posted it for review and other opinions.

The binding you've got says "GPIOs used to control or guard the clocks",
which is not what you're saying that is going on in this mail. A more
suitable description would be "GPIOs used to check the status of the
clocks".

I want to see an example dts user for this please.

TBH, I don't understand your driver implementation either and why it has

+static const struct clk_ops clkctrl_guard_ops =3D {

+	.enable =3D	clkctrl_guard_enable,
+	.disable =3D	clkctrl_guard_disable,
+	.prepare =3D	clkctrl_guard_prepare,
+	.unprepare =3D	clkctrl_guard_unprepare,
+	.is_prepared =3D	clkctrl_guard_is_prepared,

any of these 4 implemented when you have no control over the clock.
I didn't think it was required to call your parent clocks enables in
your own enable either, thought that was handled by the core recursively
calling clk_enable() on clk->parent. The one thing I would expect you to
have implemented ops wise is is_enabled, which you don't have.
Also no sign of any rate acquisition functions, which I thought were
mandatory.

+	.get_parent =3D	clkctrl_guard_get_parent,
+};

--2e3uU01NeNC32Fhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGfHQAKCRB4tDGHoIJi
0uulAP9Kwj/TOxWgbvD656o/BkoFfFz9m8NlXubWUZNI4ykiBgEAxZWNnovre/z+
wJi4TxJ6EmXK8g05KgKQ87Fp/HAYEQw=
=CSez
-----END PGP SIGNATURE-----

--2e3uU01NeNC32Fhi--
