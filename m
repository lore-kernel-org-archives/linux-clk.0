Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E29D3B47E3;
	Mon, 12 Oct 2026 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831843; cv=none; b=rm9S4YNhQAvSjkaTuNN6Veys2yjLMDyi/2hxoj+4quwJvUjRaa0lF0kXLRZdNtxK5rY9dkunSU/ccHolpG3BGcX/aYUq/phTTIKq+T96QGdKH6Riqdfaryjm3lEext3nHGwrxznBMqnhNx+/4atWn69NswNZJTRcGGHhn4riZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831843; c=relaxed/simple;
	bh=1OMZvB79RqI+kzQxp/CVoXY+jNcNnaUcK+X647D0SSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juOGH+tf8BzH/M1Ek8ShU+60Vqb9AqnO4jXA+D0RAJIxktz/l2MBKwleNR7ub37vK3gIeqc8ipF+76Sqg0oQV/T2jnMfgFJ3AOHRslbiuW0fnzLdPTN5rcKD97IzPLPK4s4Sb4swIC7cWZygAnPgWJk8HqBkCrP2po1WYFYnC8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHkPhq8M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHkPhq8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20BF1F0089B;
	Mon, 12 Oct 2026 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831842;
	bh=1OMZvB79RqI+kzQxp/CVoXY+jNcNnaUcK+X647D0SSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lHkPhq8MYEERkEq61elsdCcJ00F8yBEv+2n0x3NF8LgWBeBWKlKNTs0hsVVf3QO7m
	 6SynsFOO7uH3D2RLbB/7j8QQlob5Wpccl00XMbwo2aXB2fJvevukvTGeKTjOGn1J1Q
	 Gllz52hPXWC5xqJEx2/6dBXha6gHk1W809B4Fej2BWII5I75efTtlHjaxvaSj4v9iQ
	 tgelNi1PS7xPVjNfFS7KNmGoGKxqFrjuDpJhLOes7MkGG9K4jsaBhWuLcJvae9J1L/
	 j1bZ1h5WtwmHBMKPkY9hE73MrpDspCp5/X2Dqh7/W+VYcC7HB5oRF5kZTtlyA6ml7+
	 hXuGZJ1U/IW1A==
Date: Mon, 12 Oct 2026 20:03:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
Message-ID: <20261012-grass-guru-1ba876eda895@spud>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <179180050741.66744.3459927533880490879.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FFX0NmdIYzkgk4y3"
Content-Disposition: inline
In-Reply-To: <179180050741.66744.3459927533880490879.b4-review@b4>

--FFX0NmdIYzkgk4y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:21:47PM +0200, Jerome Brunet wrote:
> > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > subsystems:
>=20
> Nothing really forces you to send them all together.
>=20
> In the future, could you try to send one CRG driver at a time ?
>=20
> It is fine to send big RFC to give context but after that, if you
> can make you series smaller, it is generally a good idea to do so.
>=20
> This helps us iterate on the series faster and then you can fold our
> feedback in following series (instead of repeating the same comments
> on multiple instances of the same thing) Thanks.
>=20

> Also your series does not apply on clk-next or -rc1 and no pre-requisite
> are mentioned in this cover letter. Consider using b4 to point out
> your pre-requisite if any

The dep should be the PR I sent to Brian, but I suspect what's happened
here is that the MAINTAINERS parts of those patches (which I had dropped
because they were all conflicting with my tree) didn't get reabsorbed
into this series. Very annoying for review of course, even if it's a
non-functional conflict. Of course rebase on top of clk-next would've
highlighted that to the submitter!

--FFX0NmdIYzkgk4y3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0vHQAKCRB4tDGHoIJi
0p4KAQC1kQ1+cKFzcpOgn95+wlYJze0mqmVjCR0pb2B6IOdvqQD9HAk4N9AhWxVZ
V/yO2UvmUb9rqNSOqVsZ1VhZkGmMAAA=
=v6ol
-----END PGP SIGNATURE-----

--FFX0NmdIYzkgk4y3--
