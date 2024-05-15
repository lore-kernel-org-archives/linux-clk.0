Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0715625D;
	Wed, 15 May 2024 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715790226; cv=none; b=rUxCCQ+Sc0rWNKWBApg/Sfj9CuYWmli7VntxQHJ3i6jxef0KNA+P3Hbvm2XYEf5xfWVWUbQEin87MbLj4KEUG8f6I19kIgRMsRhEaFiVEkk1dqksMKt70W0h3PH6RTjv+XqSDNIe/f+1SPm3q3i1hooQb3d/e7D4rc/UzH0y+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715790226; c=relaxed/simple;
	bh=YjDMjOj3t7nlqXXWdUrOCaRvlCnaAXkwCVDnWuIs0lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzebL0HBifVbcM4SqGIG61KIJX/QpCoMhcEfgoi9zGlh4XUAXRkmAFc2PgoM0M0sEk1LJRTKFlnCFd27vMuBjqITavzyN8t7U25DlavH00SvzSjeeoe1oijsKC7ZQQx8/ahf7aarOoSsPjHIOeqecVFlDXeEcMtjsrACS1EhKc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+aEZCGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+aEZCGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BB9C116B1;
	Wed, 15 May 2024 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715790225;
	bh=YjDMjOj3t7nlqXXWdUrOCaRvlCnaAXkwCVDnWuIs0lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+aEZCGEd0sNnwNCNE3ADWqTtrugwLCBRnpvJwLHPwu5hNEMa/bNbnZUa3yAaIih6
	 AqeykLP8/sm7Va9Z2o1psLTCWGtBjytq2LVqdzF51Vep+J+cv+2U2cqFp5nHT02JRJ
	 qWjQN8vWMmTd+zg1JSM0gSwwIoMIQw/iRET3DeHe9IlFElY8Z1Rue88FoqZMy6MJSO
	 sW4oqsWRY1D33GFaQ6wiktVIiufVaG2wq39pkmez3rfqGUT5ZZVES7jUW687Thp0Nd
	 4Ts0KecCsLnP6O6D9B/vC64FTF7xN2VgcdlwGSuWWLfDYsTKw2W6JCgvhDT/ijZ23d
	 55kFS7yKPcdnw==
Date: Wed, 15 May 2024 17:23:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-clk@vger.kernel.org, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name,
	john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com,
	will@kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 1/5] dt-bindings: clock: airoha: Add reset support to
 EN7581 clock binding
Message-ID: <20240515-delegate-glancing-188fd99a95ff@spud>
References: <cover.1715777643.git.lorenzo@kernel.org>
 <faaa220be22abcedecb0a63d5734f821167eb8b7.1715777643.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sr0wYddpRpyzyAXT"
Content-Disposition: inline
In-Reply-To: <faaa220be22abcedecb0a63d5734f821167eb8b7.1715777643.git.lorenzo@kernel.org>


--sr0wYddpRpyzyAXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 02:58:47PM +0200, Lorenzo Bianconi wrote:
> Introduce reset capability to EN7581 device-tree clock binding
> documentation.
>=20
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--sr0wYddpRpyzyAXT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkThjAAKCRB4tDGHoIJi
0gLAAP98WPbIRNY0Yr+8X4xU8mgV5mIZNfpP+CfJJ7StNTt5ngD+INgo4mec3PYr
f2P9Lvt1uJxdGokiRGfff08q/TzxFwM=
=r6gg
-----END PGP SIGNATURE-----

--sr0wYddpRpyzyAXT--
