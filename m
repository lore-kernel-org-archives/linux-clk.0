Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633186;
	b=Pu/Kr3i6wTKx24kl286cDXbnMKkggqi6HKr6eNIW4dK3QOQXyneMbzM5V9NQtn/1Bvbk
	 1G0fClpy7Yq8rJaQOzkU+2NiJIVdKClbHA6JTXCfn5TTSNqpe3twBAw4afPMlYs+AX6zO
	 pbivPTiDGRWhei5ZjX8iWQBD6DAc4eTexwLfhBovvjZfUL5Xg9vF3MRkJeGTRAcwDI+iZ
	 udqUfXsaSN8oILQ8OCjeyJSOzg7binZcRA1E0/iX6w/VawbuY4QwbxVRBskMgsM+jC3pm
	 OAOA5E4TZ+55SoYuiL8jV3+ci7Kcv9n+XbPrTz1laCqnVYcbhJScfWL+45AmL24gr1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633186;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vyc3SoV3rFl2e5RGKK25UjPyvMlwIT1pDlP02Ms3jb4=;
	b=oP87IaWuN+NnBPfAZeUT11cajapWRYKUsGxP5nQ7TmrfFfKmfOTixb55SyZNKplijTaf
	 AZtdg6Vvej64Zt7w0jpGOPxhoVxJgpNP4W3b0oR6bUCF1F1sC7pIl6kYP6wQVdGaX6smw
	 adYbzbAXxEdFdP0scxZ3MCh72uClNV2qhN2x8H4K2/nQhXOKYKwDa43RH/OWN+C5dY3pp
	 050KouZ/r4wIQb/05v0ntf4OuhRehFPnWDmNxluUB9OHUlENxrsf3itLTo2HTa/J6N5Ed
	 +9Dw8aYhszGmhhsZ9t0HsuTYBfRpp3psPv21OOPDt3zgy+oFL5yrJs6ODFuZuw9NH2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="axw/dLkF";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616ED606A326
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 18:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=axw/dLkF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vyc3
	SoV3rFl2e5RGKK25UjPyvMlwIT1pDlP02Ms3jb4=; b=axw/dLkFCJgBg9nIl1s5
	hDqmX6/PmhBb+8mOn4KRBnxPE0d7QvgDEBJS0ifWkveK2kCE89yY1waR0RZfeAzr
	qdARTipkz8kOIawBFQEeDPpktq30/IKwq/ME6UsQGjz4UArbxm2oqBB9GoOEe0Gf
	QSmOThmif3y+Dt5N41uinL1j0Rj9lVY6ofMgsIA85BqYXnZEZiKGb1F3/vApi6tw
	jE3WyJOz/xiCdUZEi1Y+IxMA6hw0S7CpfbgM8NRQCLNbf/yjygUkIOs0uQ5HMn+f
	ANdJMExgOoKKumcGP4GVQrJi1/i9V4MMoxPCEl1IJG0bnxJcECMOCbz0pLVDRmeZ
	JQ==
Received: (qmail 1089750 invoked from network); 25 Nov 2026 19:59:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 19:59:39 +0100
X-UD-Smtp-Session: l3s3148p1@ow3LbR5hSs5tKXAi
Date: Wed, 25 Nov 2026 19:59:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awcwFqvQIxuLqykY@shikoro>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
 <20261125-rzn1-miic-resets-v3-1-f25a4b656d71@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="ECv6qnzY90UW0343"
Content-Disposition: inline
In-Reply-To: <20261125-rzn1-miic-resets-v3-1-f25a4b656d71@reliablecontrols.com>

--ECv6qnzY90UW0343
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 07:53:43AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> Update the rzn1 system controller to indicate it can be a reset controller
> and add defines for miic resets
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ECv6qnzY90UW0343
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsHMBYACgkQFA3kzBSg
KbZylg//X2j2MASyGMVfg+7tn76Q/5PPUpBCnFXbbxE8La/RMDadmrr1NZ13yDJN
SQFt7D29hBVl0ueX5dXC3/BSH1ZFH43oO4VOc/pzeXmkvBYT506dGLIjgrSRGgLl
EQSAUxmyysDJu2szjiWiWO2LzkJh7ujN17h/ugfvHFkbJuRB8oghPgecBajJUX7n
nvopkPqpi61jRBu2OJS6MKdC+wql+aZMt/HpfkRVJfe7AjyeeY4lV/Umo3yXtWyl
M/mZQMXeK0BT/GwJJzV6ZFtmwbeiuP43eYfuwyd+m5k/U7V+IObfTbbW+dJcRbgP
+iAlLYdR7YL6lyfM8vkP7T8Ci7uLUkNA6L7Vsjnd6TpxIWyT0qLtusZWYUcRlJlh
+Hy6BFP81UcbCQouJnHxCWy/uAQG0fz3SZpaUnm2VuGP1HPUlhj0eCa7lZafgauG
EnNJRONxdarEZh5ni6GR9d6p6xqx+7f4AXKVk0p8NDm3vQ87aaZfmkYCXcIRVYbU
6guSo6tRtu310ghjB0UseRdVfyiyEQZw/aWypARA+N3i/D04hX3bUk+NnP5WyPjL
EJYtM+4Zk/g0op898qU9dElol2muMuHBVIrTjSVnYMBgYd1W1OPcsLSwPeQ0nwEV
SBmTgd+wEm2j8QHFL+Y30uvZml5Cyw2ePvaFXY8ttXFA6GPbH8Y=
=s6ed
-----END PGP SIGNATURE-----

--ECv6qnzY90UW0343--
