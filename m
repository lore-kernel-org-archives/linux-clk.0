Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B867080D;
	Fri, 27 Dec 2024 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321896; cv=none; b=tzUftmS3masqkBFaUddEk7XSEO/Jx0mswmuVHzy3yPmS+z8zlnHn6RXKZvIRXaVqBJGw1DVItYPHOdroFCWZ5IadOAe7PjUBCk7fZj2m54EplQC5wTh/z/UufJWNN7E5S4S9bcmn/+ylYve1H4Dl48mMulgguZ8hEQGO07JK1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321896; c=relaxed/simple;
	bh=gy5ZdBxk4u7cE2uTpCmXOUIxZdto54lSW4aimO2HLj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcO+1mxW6sbFxbDMsjg4+fMShngxAoOwJ95GzwhcQE2Zk2ds7pY92IumfqD+cra7rM6PpG4msNTuObUJf23wMFyQspmTrM4maEy818oZ2PlDRZpmWkHbnXpPRk/FAJmEATzf5HfQsArBzVBZYTpwR6HP9IdFwjZ/atgKqNg81m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liODv0Fs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liODv0Fs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB202C4CED0;
	Fri, 27 Dec 2024 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321895;
	bh=gy5ZdBxk4u7cE2uTpCmXOUIxZdto54lSW4aimO2HLj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liODv0FsCEDlmkiLoaXLMHkmtxz+Kw+mObzMezbMcUk/UsoOgUSySP0NStnlpH2ao
	 rUJJLGlekQNTNJ3+Zm2zTD7X1BSds5he0jyBIBYfBLBGeZJA9DqFBnjee+E1vT4hEH
	 kdItoTfPikl2UAByoMQn52aNmlyZWZK94ThspatGEs/MyEvesPaw7vaoRWIGKVJg46
	 09MT4Ewjs3kAvVVn6U5mZUf+Mx0VDr95d5wvYhDKxtqYjqLm3IH4awJLItr5eQZhO/
	 iwRHcUCgd0rPdk0mM9bdAyC1CL8W1NAPKZtjzXfdeJKv0OqOrQN3I6UHpdTk+bn/qc
	 d+2eAj4MfQPMQ==
Date: Fri, 27 Dec 2024 17:51:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: fsl-sai: Document i.MX8M
 support
Message-ID: <20241227-seltzer-said-375174ccaec1@spud>
References: <20241226162234.40141-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjV7JaTg26IWQoqY"
Content-Disposition: inline
In-Reply-To: <20241226162234.40141-1-marex@denx.de>


--zjV7JaTg26IWQoqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 05:22:21PM +0100, Marek Vasut wrote:
> The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
> shifted by +8 bytes and requires additional bus clock. Document support
> for the i.MX8M variant of the IP with this register shift and additional
> clock. Update the description slightly.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zjV7JaTg26IWQoqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27pIgAKCRB4tDGHoIJi
0oWWAPsGp14Zued/wyEn9DLlGMF0z7vQAae+bQ+/c9iqDVP2CwD+PhjqMuXnGdaS
9ovs8KB6qb+uTyrB/4GYWGuRiBwfnQ0=
=tb7A
-----END PGP SIGNATURE-----

--zjV7JaTg26IWQoqY--
