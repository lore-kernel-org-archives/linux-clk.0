Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E71A9F85;
	Mon,  1 Jun 2026 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315091; cv=none; b=I+SyuMHOD9YnUPearh6OQJTyOQOnX/8neQ9zO5XrOUCLWqcIQFIkMi6B639xl1VRjvaBMiiU7+0lt+p4ntzISmRnszJ3EGshuCy9teG2ZZ8jZ6VZgjNjNQUluS1X4cWQzRmYovBeRQFJcVIthmeGJeMGwIUpBysLT5bfis7IljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315091; c=relaxed/simple;
	bh=gV80S2Prpyh3JVlmesAo80VwX/qBGpVerSUaZhFwKr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR0uBeGWYmVpibQ3cuzYTz/ZcdAwOz46pdkxi/4ggTHyIcSCJ8oqBghjHhM4jlWDz7HU2JJ/QSAsSNNAM4EGuQl/TVdAPcx5fHUTMzpjVfTZmX33lK6Rw3CBURM9uoOk/x9qY2m65VmXfLQ1nHcGUb0Vh8Y5K6frNThRaAW/8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axP2IBgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axP2IBgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55491F00893;
	Mon,  1 Jun 2026 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780315089;
	bh=gV80S2Prpyh3JVlmesAo80VwX/qBGpVerSUaZhFwKr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axP2IBgMMTMyGMBeGAiVLHUo4Wz5ifiaj9GgFRUZxcdu3oSILLQOyNkng9O/0sCSr
	 AJztpZPXtwW6+u4al/T8VTY7GkOKTVm4cohoEa96tiG/onjH/+KHKe9WyCiqW+9XiJ
	 z0i4ja5EyU5x0DZjKu7O0KkmuIQ7VJHNEOF6cKOPkCcCeApjzeQYUZ1taglGyPGmhV
	 HcSgjkpkxWtvuSUGei/kB7XWlmvc39lAOdmQhznAqB/Z5S8TSOFLPoBqCjpNvShfLl
	 WNpVH75sY8BL2UO1PI2DfMk08t7vU37tomaACM5WVVfHpd8b1nHLUTOlvrB1umwPCz
	 8jAIBBwxnaolA==
Date: Mon, 1 Jun 2026 12:58:05 +0100
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	lgirdwood@gmail.com, cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 6/7] dt-bindings: sound: cix,sky1-ipbloq-hda: add hda
 dma memory-region
Message-ID: <413c7fa5-0a48-477f-b256-1b6eb5c1fcab@sirena.org.uk>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-7-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LoJCld3jqIwa58iJ"
Content-Disposition: inline
In-Reply-To: <20260530021642.64059-7-joakim.zhang@cixtech.com>
X-Cookie: Have a nice day!


--LoJCld3jqIwa58iJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 10:16:41AM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Document the reserved memory region used for IPBLOQ HDA DMA buffers and
> require it in board DTS.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--LoJCld3jqIwa58iJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodc8wACgkQJNaLcl1U
h9CIDwgAgPIwpt2jYN5quv+o4VXlicNz49mjzlODDmJ2ktyn4ak5XdjwIsXbED6w
Ze0X2iNNEmD+sezpmRJvwnPRf/oqr/KUCPKHUlee/1kG+v6VB34D+Zzw0ZNk858y
hGp18H70jBrbuvQ0O5Ga/rd/OV6wFAweIhxDlaFkXCLcqC96tpg9kIa32Q0Lqwc4
u7O0j2AHFEm2rE6x/w9ho4ZDBK8fHNSzgtvZfhhN9UUCRy+YXfVs8fVMwwfIYqHi
xqBx9rzak+DXQ4RsalQXMNVXdgpi6T0nbPfhxxBfKKm0zKdssPwDxi3OpOdh9pYZ
P/oaN6Er/pjkxJr0dWF7vwE8qpL8JQ==
=vnSs
-----END PGP SIGNATURE-----

--LoJCld3jqIwa58iJ--
