Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1F2CCC5;
	Wed, 22 Jul 2026 06:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700793; cv=none; b=d5n+3UbgR1zSJzRu5KwrSNXGB44fUnh+tygjSgDPwg6HFcLW/dtV9IYJ7J5mHSpFOWYGEgHHjQJDru/BsCBdgH5l2Gus4h94tjEFZB+JbG4FVI54JDopCOHaoRZ8fXE7LJ1wjSAAvfJJ9T77CqgJM5QGHjT0fCutyW2IYNu4kWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700793; c=relaxed/simple;
	bh=Ug4T2uoLqHNHdXUQQzhAnOc8fa3my8JhfBBgqQcfeKw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MInWFJUL3Uu3lySV/WcQWWdbCrzS/81/DXQn6OHdTCFajrGqyvvuAkRRJzr29zeqrnpJxt3WaNwmsEy3sazlIYuTn39Rp3oVR6nVVymdwx7UVQFIlTM7wG0tIa7uZK41aW96/9Mydy9DbkrtPxIA7rK1AdR5MAM+Y/5rLDFYNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=gqxYy5kD; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="gqxYy5kD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784700789;
	bh=Ug4T2uoLqHNHdXUQQzhAnOc8fa3my8JhfBBgqQcfeKw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gqxYy5kDnmCPIsNsjxIuVC58gepqjtBpUsZ5sEUP2pRwXreMJeMP/eHfwjD9Qe2wD
	 Gc4xCdDnheBh3T34CZxkyBA5OZbc89RrYALc8P2JBKDOkICQbcylsUnHb86a6aIL5x
	 MGaAk7Jm4eeaQEafALhnh1cCSTFuBbDl3pTcp0O+5TvmDRnKcb5lgWq9Lo+2yJqdF3
	 q64EdjWmaZqXGj8ZnIYInpBqMqAovAew0aE2teTw8D5XJCdXvaY0srzLY0p1tHPBJb
	 uXvx1hChv3KnoL10l7L4R/B3hnz//9yGR85x3jIydXhIIgKoKivna+aSctOynS80kw
	 50Hm87myUVTnA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB2FD65B37;
	Wed, 22 Jul 2026 14:13:07 +0800 (AWST)
Message-ID: <92837fb6c6dc9d25de5cb91d338cb8de9544c0ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karl Mehltretter <kmehltretter@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 15:43:07 +0930
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-12 at 18:03 +0200, Karl Mehltretter wrote:
> The AST2700 clock driver also exposes the SoC reset controller: it hands
> its register base to a reset auxiliary device via
> devm_auxiliary_device_create(), which the separate ASPEED reset driver
> (RESET_ASPEED) then binds to. That create call needs the auxiliary bus
> core (AUXILIARY_BUS), not the reset driver itself, but COMMON_CLK_AST2700
> does not select AUXILIARY_BUS.
>=20
> It builds today only because RESET_ASPEED selects AUXILIARY_BUS and is
> normally enabled alongside the clock driver. On a randconfig with
> COMMON_CLK_AST2700=3Dy and RESET_ASPEED=3Dn, nothing pulls the auxiliary =
bus
> in and the kernel fails to link:
>=20
> =C2=A0 ld: drivers/clk/aspeed/clk-ast2700.o: in function `ast2700_soc_clk=
_probe':
> =C2=A0 clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxil=
iary_device_create'
>=20
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.
>=20
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
