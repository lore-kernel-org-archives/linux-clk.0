Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C22E4257;
	Tue,  5 May 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998268; cv=none; b=s/8mMvfU2rohnatsVwuEMv2K3NOeWJYPsp1G/1dpleFFQ2tv4tJqxHgI9yTBpvlM5aT6K57Cz1eBwRiO+DVBTzGUNJOuWQIDbVxZZ5AGopG7Qd1unAMnKMbJy9DlkaEkCzIW6ytWlbRaLLXVR5iJll65qzC3K8Z/BxKfHl/wRsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998268; c=relaxed/simple;
	bh=/UB6MuZVu1wH16AzcLmdudUfOsdVTK2ldP8gyOgjFPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2AeWCii3tFVdULl87sOr9iDQqV76VJQWld7/MTw+1G41NFNCXJeMhVxEaAQ4F50DM0wWPj3qbeprEEg4F0movHYYxcl7ncZYkok/ZtHqCBo8FeFMO8o6akOus8dYYBQ7uW8+0t/qcnF/lHqw8ZEIMN2JmeE3n8c9p1lZq6T4bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DymjIbDB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DymjIbDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE04C2BCB4;
	Tue,  5 May 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998268;
	bh=/UB6MuZVu1wH16AzcLmdudUfOsdVTK2ldP8gyOgjFPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DymjIbDBQ7v6YinmHZT129hxnR1yEV9gg47ge9IsQCkBSYyRCpSnwcOrTtIeDZDRh
	 0lMbiFmww7nZ0Vc30/FxtzNNXkIt1sqUU9YhfUVbedlc+fBHvZhMyf+N4wa1sPF4AH
	 Yvq99bP9c9LrJoFISFgD+7ySYNdysewK9HCAdvPWIpXHbd2OV769hoK0xYjUGqDshr
	 mTvvF2tbXoWHqTJVd/EBKql9FqCBn0mhCYk24ReAK0GGiTr4bnwomSLpBF1HuHn3lQ
	 /CJAuDuf+GPU4TTIxhJbEHibX5pN2ELu+nKCiyruCzepomKKL7fQGGGi9l/5LlWvV+
	 /+TuUeEJv3YPg==
Date: Tue, 5 May 2026 17:24:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
	Ryan.Wanner@microchip.com, tytso@mit.edu,
	romain.sioen@microchip.com, aubin.constans@microchip.com,
	cristian.birsan@microchip.com, adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com, npitre@baylibre.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <20260505-prewar-disarm-04392f03d61e@spud>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
 <20260505071327.125787-2-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0l+HBF2vu6FcRNjE"
Content-Disposition: inline
In-Reply-To: <20260505071327.125787-2-manikandan.m@microchip.com>


--0l+HBF2vu6FcRNjE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 12:43:23PM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--0l+HBF2vu6FcRNjE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoZtQAKCRB4tDGHoIJi
0t5tAP9j1Ts8TV5Nm9gBaXbBndqBbbHst/jK10FipNvviPDt+wD/T1eaRHjorVh5
jpi/+IbbVA5d+oR7IgRe2HlgNZMqRQU=
=SHjI
-----END PGP SIGNATURE-----

--0l+HBF2vu6FcRNjE--
