Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9B2E7F20;
	Wed, 24 Jun 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782318589; cv=none; b=bA0DtiejeezK957ITcaCoe+CRrN4Mh7Fr62LZJOpYYETiAEBFV5NX+d/LhdKK7iB1bVTW3wS8YxuVzqsCTOkukLtPl0p1+buHw9Yf8hIOIURMh0n/EXTmI5SuW/t3q3idpMNpRq73WWV/CrG/cX93HujQnlbwGmcWAXpqwnjj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782318589; c=relaxed/simple;
	bh=nB/xcDstYUVPnTa87uG6SAP6OEUqB+fH/Eywg/NIyxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDft0lkyF6pHR0ntMRYpzldbiGAFuv6toQK2EXubMCPDQ0jRrFpD/1wm4ihv2N5JEQSd5T0mOwxEqlXnZPZ7GMCtjMEhO8stgskhlcYuMrpiL/4WVi7XXvJCbYhDd0IYgoJR39nsSkaS2N6DFc/s/mJ7GypdPAtm1ZuXwC4cyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClMhLgvG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClMhLgvG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BCF1F000E9;
	Wed, 24 Jun 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318588;
	bh=nB/xcDstYUVPnTa87uG6SAP6OEUqB+fH/Eywg/NIyxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ClMhLgvGviUAT4lTmqBBg5rMovWEhMvRTKDlxuTVmxfsWg9kK4KOko4t1/hlcrHrq
	 Aoh/QxnzxJO/y5tOgkcgdjXKg0ellnq1CQ4B21wyjWk17VESPdXd8jATAN6PO3I8ld
	 rkKibTIA9J5BsbAFgXl8K/1ORDvAZBgQ51TvpfvQ1qLq6DWVlG3Usiuk1UGRXTXv8Z
	 Ypqa7iN5mM/LoAzOADt3lllBzBLrqgRpktn8cEAMnwn4tMlGh3YdZx+fJ9Mi10TNVH
	 2LjvmOi2XQaTjKsHsKUg9MTemdV27oGTFvQLzsypvPaTHw9H0MjIsmRdMsIFIh7XI0
	 EQeBRFhKmCZ/w==
Date: Wed, 24 Jun 2026 17:29:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: ast2700: add PECI clock
Message-ID: <20260624-disk-lingo-1d9fac0de659@spud>
References: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
 <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y2hWsGqtxlYAd0y4"
Content-Disposition: inline
In-Reply-To: <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>


--Y2hWsGqtxlYAd0y4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Y2hWsGqtxlYAd0y4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwF9AAKCRB4tDGHoIJi
0ilsAP96KMQ9XSh+uOlgb/NYGm4S9RbQOnUkbS1MHqeOnixC7wEA9hgVf0iPIwO4
vNCYTElGLjB+Jf2SMaWGJxn1GP0RKgk=
=L3x/
-----END PGP SIGNATURE-----

--Y2hWsGqtxlYAd0y4--
