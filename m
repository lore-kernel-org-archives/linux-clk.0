Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025142;
	b=45yw2woBSnJFDf3UJuozgGJZssisuhMUZV4IqrDH8+lx4fW40jTQQ/L3uGjpANHvEKl1
	 M5zeqqSlFeJMPOYw3NyvkbZ3CZAEpy6JVTyg5Lm3d8zqXUoHRUTlQasse1f/juKj2RMHL
	 gqHaya9JyAgMW39NZakQCbqGZ5HDJw3iZyycvaFrxtdAXhiiuqCJq0V+mrJRPbj4/p/Rf
	 iWK3F+HucZ/X+vQ/BCW0mtukc+pRG7fvhaen0PsOGFbrgiXo3xtcxiKNvD5oo5fE0weie
	 03QDVYLlbqN+1/gaqVt9QF1J6KugpxVQHaf2rdGr7jmIpybxD+S5Mk7nVeyeJMQUPuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025142;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iy4jAwl3tdKn7xHbVstEL76bWYCBGuwge5wZFpuQUGo=;
	b=oGLxsPoYoGFUxeZy8hf6piJCBmfN3NdUq3P4yu7dHXPdS4KyB5awSFd7wfZgVVUucpC+
	 +0ZyD70JHPXKNjNlLJTZc2rvZwhyHi8K0ElF1j/nCiXdnzjT41HRLpkRg/JoUacuE34oL
	 OTB1VUgKbd/dD43+uGgPjtYaOyHjAFeIwo1kCmrmxMmMcDKUos9mkZEN4Njkif4rJlR/W
	 6DyUDO5PbxwqAW6tItHBMsuAxrjbkxdJQ/AuziHc/1t+fs/3S12JSqFkRUpqZ5lEeHQjR
	 tb57VeDQ3+OAHW2buMna0m2tehYtMziAtn9dG5IMiNND+dx6mMWPE+tqT7dG/JWYjaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxuGxQvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3F606A320;
	Wed, 18 Nov 2026 18:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxuGxQvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3DA1F000C5;
	Wed, 18 Nov 2026 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025141;
	bh=iy4jAwl3tdKn7xHbVstEL76bWYCBGuwge5wZFpuQUGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxuGxQvkRBuWaPVhzYog8gklmRmEsUM7/bbpLmEzs6KnKDpWLNarLFZohhSk7cCTK
	 MCrZEqmmc8G+CH4Xee5x9lMXiQKmyimvXbeRpGD38ZOp0Djxu9bEj7DYnD+AM7kf3T
	 frUXONl5sLhpwMdMaBEF6gUHHLxAQEXTDepgGTpUvSEg1NXRHH66/kYZa89yxB+nsy
	 Zraqd7n+lEOKlGcui0vDLw+HpGFK7B2wlRZQF1cZuyKgTcGRqcitQoKmdiBUU7BWU1
	 DzUleDQ62DOYrL1SEFZzDGig9Yl5Qt3371w578v6HMm/9uo5VBFsNehQwSwR2NeJqD
	 yyWj7lX33YFTg==
Date: Wed, 18 Nov 2026 18:05:36 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: spacemit: k1: Add RCPU2 PWM
 clocks
Message-ID: <20261118-afflicted-composed-a1fe7eb09a25@spud>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-2-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9VzPwkqfixvtSRyh"
Content-Disposition: inline
In-Reply-To: <20261117205951.140146-2-frederic.mahe@cirad.fr>

--9VzPwkqfixvtSRyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9VzPwkqfixvtSRyh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3o8AAKCRB4tDGHoIJi
0o+oAQDl1DZYSo+zVgDDQsKqmrS77/nLdUAQthq0LltDP8m6IgD/UkYdyfxwqcT/
ViWqyGCTM/EA18gs3hD2EeHm722OtA8=
=kFrt
-----END PGP SIGNATURE-----

--9VzPwkqfixvtSRyh--
