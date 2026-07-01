Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A6382398;
	Wed,  1 Jul 2026 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925241; cv=none; b=jz9j0H1QB2+kaZtkBbcZjAW3EbVQS+UQFoP7DNrEF/oKQfpWIZOemWXVn99Xzyf5CNcY3pFAjRzd8c39Jtm1m7WdSXPjg1nvkhQwU6jEe8Ere2BVWoz9EDY2fEzZ39FKOLbCAgs7yLZdNGAoVvfFV8dFHTjdYabz4AZ7tYyPj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925241; c=relaxed/simple;
	bh=JC+/j6ZBXlnny43omE7BkbuuCLynHs52FvQW1HQv6Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKgFxKsWV7Ej9KaSnhvYpKX+cfVAcMcgkf2czg8nsCW2gnzoIj/5LOA39ZqotdJRvfw6cP9qJ8a0pUXc7g+Mp5EZn1N+JAYN2ZNBEPM3KqtvQ6ecjt0g/SWY3eSeFZsBi3leLR16D+B3FSRy1YAcxh7K9pOZNyOgzwCqPQFSark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGLO5Spk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGLO5Spk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9482E1F00A3F;
	Wed,  1 Jul 2026 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925240;
	bh=JC+/j6ZBXlnny43omE7BkbuuCLynHs52FvQW1HQv6Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YGLO5SpkqhPRHG4Z61VB0g3UC/eW0ecHies6ziWVHdu+FkZqSIorOwcucHGLyU/9k
	 ukMHe+2MLiwARRI6jC8E9bA/xCNiLx1nVDHnTcYu/A8h0cboQVzvKJ9ntpmjtE55Nu
	 Iz0YTxuRiGtRP0WJDzZ9qg94J9CF8AU2FHetBOlm67nlD1ks91lT1gHueS/V5/i+yT
	 Fz/vg2WDQiaabVK05Tpz4SptL3r45aK+y7LhAJZf0Pnie60zQWjN4dw5bWZTi96fzO
	 mLZ26J5knSO/PoH4RQ86DKxinAEriC5ttpvmCJzmPdwJIy/dDu15AuaOOnidkj18uX
	 JdVN7vMt80oQg==
Date: Wed, 1 Jul 2026 18:00:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: si544: add si549 compatible
Message-ID: <20260701-product-tacking-f1ee934a1443@spud>
References: <20260701145101.3932655-1-pavel@loebl.cz>
 <20260701145101.3932655-2-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ykzQNNb1f1Mze1L"
Content-Disposition: inline
In-Reply-To: <20260701145101.3932655-2-pavel@loebl.cz>

--9ykzQNNb1f1Mze1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9ykzQNNb1f1Mze1L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHtAAKCRB4tDGHoIJi
0iiMAQDSJKDxiEpXTxPkH6YomBKKSg07mIo7tRcfr6ftWmUowwEAl3j5EQrKaWKu
kiZaP7YLXhB0+r7rDlLVYolpACjFTgU=
=yGlr
-----END PGP SIGNATURE-----

--9ykzQNNb1f1Mze1L--
