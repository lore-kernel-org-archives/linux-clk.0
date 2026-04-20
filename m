Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB57333727;
	Mon, 20 Apr 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701191; cv=none; b=ApF1SVIn5pPB+GaoxdjWDGKlT402M+NM5txIBGzzz0YaT5LxvWj8iwecwD0ze+w6nQWN3uSNmomDagZ2oCg6NWHmV0/lbVUopPHlUSMGpn/DqWyLjVnHgNv1nQwnjuGO+fvT9/Fb/CwpFUm9/3l3jIEm0r7sRppSDsIgIdSnm5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701191; c=relaxed/simple;
	bh=SExUp72KWp4ghJRvUUbyo4a5hgHiXPgAuNmp2V1dWw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqvBESoe8cGSdtXBmzFqtDSFzpesi5znwAIBj47/jX4iAtDOe8PilT6JgOItP9IZay18fCdAfKb9i9RpV3qaggmYKD94mf4j1apB/iF59XDIC33VoeIMToI1IsGozLfZ+38KzRw+j4fR+mp6tQUWzmv5w3lvYNvi1kCHqSLxVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQj+BYXy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQj+BYXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A39C19425;
	Mon, 20 Apr 2026 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701191;
	bh=SExUp72KWp4ghJRvUUbyo4a5hgHiXPgAuNmp2V1dWw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQj+BYXyTmT3cUhiyzlAJOe7bK01f+vjGmrQpfi/roNZYHOaUA2y8t9d03rQ1IkrJ
	 eKoAyqjWGQ0WVptDew84QuhAf+82AZ7UYG5KApv/XX9EMHKkgcjFRXAOwoAxIMK5Pg
	 /NykNjCY73QnxMm4iWKnNxaoKJMK7poiO2LmF2pP+stMQ8tbN0hZO9PEKMqWmmMsth
	 FdV9aXVbC3/5MJt64Ac7vHI8D/95v+C1Q/mm69iwMEaLargQPTo1DbayrWZEx8NzSP
	 +8zRyFNadCCdmCktHHGdiIWcbk4taIBq8RA973NlxuDPxoucA+Ghx60y99bhyS0/Ha
	 FkEyg8rpGq/tA==
Date: Mon, 20 Apr 2026 17:06:26 +0100
From: Conor Dooley <conor@kernel.org>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, bmasney@redhat.com,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock
 and reset generator
Message-ID: <20260420-scrunch-riverside-793c1941f0c0@spud>
References: <20260420093929.1895-1-dongxuyang@eswincomputing.com>
 <20260420094014.1955-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tRgC3W+SQOoh/Pbz"
Content-Disposition: inline
In-Reply-To: <20260420094014.1955-1-dongxuyang@eswincomputing.com>


--tRgC3W+SQOoh/Pbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 05:40:14PM +0800, dongxuyang@eswincomputing.com wro=
te:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add bindings for the high-speed peripherals clock and reset generator
> on the ESWIN EIC7700 HSP.
>=20
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--tRgC3W+SQOoh/Pbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZPAQAKCRB4tDGHoIJi
0ggyAQC10zsYjpvDkcf0qRefoW5kHZ83abGSMPxosi9Nkg+icAEAkf6y54LxfCJt
avFHjuN8pTem8k7punrYldW8vPoPnQE=
=aHwQ
-----END PGP SIGNATURE-----

--tRgC3W+SQOoh/Pbz--
