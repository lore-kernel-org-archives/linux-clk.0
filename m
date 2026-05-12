Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B623EA89;
	Tue, 12 May 2026 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606216; cv=none; b=I+tohQ6jghNigBO7Tv/LI57sDmcUZ7EB1Zg6xDcZpcVDMvOUZEaOWTKd6AwjooOJHaBN/rlz1/aXGbRFRZgtcPKEcQLhv+nCiPiwgXHuWZ3p4LLRRXikFChly2o1TlmYqt4jLlddY0LVwVAhRqUd9lzGYnzS0LoVBGzrdzE0YhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606216; c=relaxed/simple;
	bh=h3+saH40V9raQPbgS02i6cj9jJJtT0EIO7Z4vePam+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDAaYq91ibZouKgJS7FmWXMICipUT6b2ZcMsPvYEp6vVKeD+f0jHCyulA3ou+jM9itl3eu03qFGGxHhD2ykJ+Gn+ddFfZQGhhSgnC8gix8rESKx40McAP/KZ69eVuBCxyKgJaa4r53fSYQ5iIojkXP2QJ3BOMsb4ufIFfH/LIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af5siimK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af5siimK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6224C2BCB0;
	Tue, 12 May 2026 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778606215;
	bh=h3+saH40V9raQPbgS02i6cj9jJJtT0EIO7Z4vePam+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=af5siimKkJ7xOf34VllZYZVmxcieNj4EdZZhOB3WmOMD2CrnCpkSBXmwvNzb3Khxf
	 VG/I+t9VxWsoJlcMZEhY76sdDA1noxUulE8vHwtQ2hvZOgCW2SWXvXBNZ8qvbpB7c+
	 zBihCg10d2vb4FLlok1Q4t4FJdlV/9lptOAWRtYiZFuQIbm3GFvz/eTEjD9MTapbi+
	 VUlFqA8t9neM8sXDXgT1mPv1RCxQOZ504QJUJ1CuNM/wSILfqEMdpQbychm67bR9Qc
	 581vrOS1keL1geuPTpEqUHQxSb8vnn7TGDVb2ANjads3S30DE6K5IF9n1a4ELHxk7P
	 W3vk+q+Bq3fkQ==
Date: Tue, 12 May 2026 18:16:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
Message-ID: <20260512-unstopped-countdown-313d50b5d3b7@spud>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oZWL2xFTBxMYOVW0"
Content-Disposition: inline
In-Reply-To: <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--oZWL2xFTBxMYOVW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oZWL2xFTBxMYOVW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNgggAKCRB4tDGHoIJi
0tOFAP9AzUh9sfcOd/Lnrb8OvCvUbHimfl3KM4W1Yia8iCCYywEAmBz2TZ9KqqsE
y3q0+446hukaJ5bzdWrQMr6WnfgKyAM=
=rwFc
-----END PGP SIGNATURE-----

--oZWL2xFTBxMYOVW0--
