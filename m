Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010A40913D;
	Mon, 15 Jun 2026 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540567; cv=none; b=gUvo8N0jrM4uZDIF2uxvWaAkfajLYS3sp5ZyeFi8Mhlq6F4q6IdmuVmX4oWL3t/4Uts7A0+nXmKv6JR8G11dh5p5iV83GZsV2kcENfQOjAJA+1q0yry+wmJ5os6cGSyQpJ+NX1aFA+DlGPDJ0rFL68I2pxIRN5tABL0ETgrj0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540567; c=relaxed/simple;
	bh=NNMMkyuns7W3CVSK7S6dgZm53LkcD5YuxUTaUIh8hiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTVdrtbkBfTExS2eK6QovdIqZ0hi4Jy4ZMjUnBdl3c95DU+Uf/Po+K5aPKkKtsyySsgXr3eq6ZknfWdVHK4bYh8x1/EbaM6ibW42HmNeNezFg3XWrE4sYj6QTZmdk5xr8SD38bFgz4f4ZHwJAfbcd9drckxyQynblJHh9j/Mcdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Btwp8BMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Btwp8BMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADD21F000E9;
	Mon, 15 Jun 2026 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540566;
	bh=NNMMkyuns7W3CVSK7S6dgZm53LkcD5YuxUTaUIh8hiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Btwp8BMlTOkNCNl2B6fhmj7Fzd6FTFbz1ba0nYq2mFoyY5JzaghmJEn1urjWC4yJC
	 57RLnzoOM0gt7+Jcbw1y+21PB2X7wgxvPe1+2pideJVzrMcqVALybRSiLHYKGZnEve
	 noIxlBCXQfsxzeOafE6bMKkXh9wt1573eWKLCNFn0E4jglKpqloMEu2GjuSo7vFfVk
	 in9na+XueRqIOTiH4OBgxb2CuY2cMnfX/CSguZYR8UKF3Au6Xglnj/9uNlM8jlvkAD
	 MPWaJ3/2tmi+3pPeQyonqnGh3WT58AZmyaDf8XEnfN5zTXxWhDWilk7Jizom9gu0ap
	 7wQ1ZrKuOVjzA==
Date: Mon, 15 Jun 2026 17:22:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 PCLKRTC clock ID
Message-ID: <20260615-catfish-starry-189f8565f98c@spud>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73D7qR4Epe13nmtL"
Content-Disposition: inline
In-Reply-To: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--73D7qR4Epe13nmtL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--73D7qR4Epe13nmtL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAm0QAKCRB4tDGHoIJi
0hKnAQD78P2MtWziQZtQhxOmsGMny0RGEBF0soeyl/jJJJjw5QD/ZMMjOWbEA5+b
NOokepVBgvG1vYOBh3YtA8cMaO95YQ4=
=z6z3
-----END PGP SIGNATURE-----

--73D7qR4Epe13nmtL--
