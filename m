Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E436BCC3;
	Thu, 19 Mar 2026 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911777; cv=none; b=M9E3Cz4q4ilWKwN4YBxWvg9o/dCRhMh7iD1AB9375/kIsW77d+h1PL2xpKXN+hq3l6eBO8sSu5Bh3lXn4T6yAl8JNl2SdM0olqEXOOjoSSm5uXVPgk5zpOJwddCUpPLq3OAjgEpD33ibXn/XmQ1QpNqUChsrBWjsz/txcPOQqFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911777; c=relaxed/simple;
	bh=0UOgUzp9hlOkv+Xo/qM71+JW1xeMPhUzcVhhj+kKc5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbZ+ryjS3RUP9iLbmxvv6XydpyFeBK5p6I499Cy5qatJNOeGgbkmOSPDwMVO9ASOxq2SOxyltPbwg3cah4se7z0jP3EeucO0y5QFdNELGeB+ICdkwuMtRCvlI2LsaXjgiw+/CBFMSEkx8/sorynq7S8bQ8YlOr046xvr3Cw+Nkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfGJvYu9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfGJvYu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B7C2BCAF;
	Thu, 19 Mar 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773911777;
	bh=0UOgUzp9hlOkv+Xo/qM71+JW1xeMPhUzcVhhj+kKc5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfGJvYu9eEjNcrDhccf5MO+hi47EYzqqjV6dAEcYtw1hJPw6Ev41OLwpMCOVU81B0
	 a+GPMSTmL8fDotYMMfdxBA8QTcAZotw6v43p3JpZsQU+1wKwvKt89X4Jc4/hVwPLdy
	 qxC9qv+N0CdIJuM3W5RMFVGMjtcG+Mjcjemngenmc6JUr9zZYrs9yd+i8kiaS2r+43
	 4DA/easrmBhaFfwm66zvqe1I0HIFLjcqRUYo6M9sQJpMNoLmBqoqkzyQH57jZVW3I5
	 8k5EohN2h4cOz6y0cH7I2w+hkxazi7UjC9vTIYaj1yt5R7S5ZLwUnboYjv6OBe358h
	 ccjPpsCDNnAvA==
Date: Thu, 19 Mar 2026 10:16:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/7] clk: introduce new helper
 clk_hw_get_children_lcm() to calculate LCM of all child rates
Message-ID: <20260319-weightless-glossy-polecat-c5adf9@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-3-ce89968c5247@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ralpuzwic5ysmlha"
Content-Disposition: inline
In-Reply-To: <20260313-clk-scaling-v6-3-ce89968c5247@redhat.com>


--ralpuzwic5ysmlha
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 3/7] clk: introduce new helper
 clk_hw_get_children_lcm() to calculate LCM of all child rates
MIME-Version: 1.0

Hi,

On Fri, Mar 13, 2026 at 12:43:10PM -0400, Brian Masney wrote:
> Introduce a new helper that recursively walks through all children and
> their descendants, calculating the lowest common multiple (LCM) of their
> rates. For the requesting child, it uses the requested rate; for other
> children, it uses their current rate. This is useful for determining
> what parent rate can satisfy all children through simple integer
> dividers.
>=20
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Somewhat related: we probably want to do the same with the highest
common divider for multipliers.

Maxime

--ralpuzwic5ysmlha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabu+3gAKCRAnX84Zoj2+
duzaAX9lGt+XrE2TcW0QqVyZ++unrWl6L4theXiYbtD/OL9quYM2EyPWKzyE344Z
E1L1ueIBgJFhcwmtv1lJr1VjSb5bfEgnSMXgyhYwREbA8KkrtRmesJu9Jdxpi8f5
IEgJX5EDrw==
=qraq
-----END PGP SIGNATURE-----

--ralpuzwic5ysmlha--
