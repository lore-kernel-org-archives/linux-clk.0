Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499DD1DED45;
	Tue,  7 Jan 2025 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239984; cv=none; b=DmrReNwE98bwnsqpiuB1Sbjj1eh8c9RlpVgJa9Mxqq+/Z/ap2dWst/l82yhBdwu8cvvoRN0Ei4LYHUD8BRNMW+mv/m60O03E2Hyg3+a3X442w7cJi/zjd7yerAvHuvg1d2YBfC5MnHL8DSPC6MX5ZlTYvFyXG1IBmyWocfkx5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239984; c=relaxed/simple;
	bh=01xTrWdA2Ra774BNmcbW6I0L7KA7rprIQ4jaPnbAI/A=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=KVbpdkhNdc8Cdj3PJy6lpj/tkviw8SNtKegQ2DWwx3Gdca4VYejHNkm8VajHSExJk3aEUjpmcZAX15B4lZDXQzgakW4BwZ+bo3uqrHTv1wy0qM0CFbEI3voiyYpGm7RH7z3zzZh2PeUKqkLxNvP9l/sYxFtGvkSqdrFHVm2WxBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6HguPPB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6HguPPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA39C4CEDD;
	Tue,  7 Jan 2025 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736239983;
	bh=01xTrWdA2Ra774BNmcbW6I0L7KA7rprIQ4jaPnbAI/A=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=k6HguPPBzt4nxG0k2sYivWVxQSuI5DBuP9LLof+Q5gEW0o0skCgV3ARsGwJ6GpS7k
	 Wxc0Ta1itxg9nuEt60vOLFhUu+VZ2LxEAnxEduSGsshO7JhszNya82NgIrZU5G6I/t
	 tuFCuaU9v0YjOAvSR21T4t/gm3fRJOijZ8pWG6PzcJu8YbewFi8vcejUNXlYbnFgfu
	 N994EPkLjAMDOFSaJNLjgquvBHxYlXQ/idQTkllU5ufM/KcrOZGFhk3aSydXhCYFov
	 FcPFNx9TSuTu9oXuzG/26nR9VeSqT0FRQAVZd+xzhGQ7rsC18SttT+/Wm2qzaDbMmv
	 4E2M82ggIT8kA==
Content-Type: multipart/signed;
 boundary=60e47edfe38543925c72c751d549eb1c55a15e2be67c797b85027bd80743;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 07 Jan 2025 09:52:59 +0100
Message-Id: <D6VPPFGFM884.1OUPHTCOA7HG3@kernel.org>
Subject: Re: [PATCH v2 4/4] clk: fsl-sai: Add MCLK generation support
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Fabio Estevam"
 <festevam@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Nicolin Chen" <nicoleotsuka@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Takashi Iwai" <tiwai@suse.com>, "Xiubo
 Li" <Xiubo.Lee@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marex@denx.de>, <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de>
 <D6OVE2W07NDX.2Q4AFF46TWCWJ@walle.cc>
 <36665ab9-16de-4f77-a55f-b7942dc0c1bf@denx.de>
 <D6RHZ8B051X5.3NA8EAPRI62XS@walle.cc>
 <72d4c42a-7ebf-484f-839b-631d61ac950f@denx.de>
In-Reply-To: <72d4c42a-7ebf-484f-839b-631d61ac950f@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

--60e47edfe38543925c72c751d549eb1c55a15e2be67c797b85027bd80743
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jan 2, 2025 at 2:34 PM CET, Marek Vasut wrote:
> On 1/2/25 10:58 AM, Michael Walle wrote:
> > Hi,
>
> Hi,
>
> >>> ..Which is the
> >>> normal use case for this pin. This driver was created because the
> >>> LS1028A doesn't have a MCLK pin, so we've "misused" the BCLK pin,
> >>> with the restriction that only integer dividers are possible.
> >>
> >> I have a system that is wired a bit unfortunately, I need to source
> >> codec clock, where the codec is the clock consumer and needs to be abl=
e
> >> to control the clock (SGTL5000). SAI MCLK is the only way I can get th=
em
> >> out of the pin I need, hence this patch.
> >=20
> > Which is also the default case, no?
>
> Not quite, there is a difference.
>
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK=
=20
> clock is not always enabled, and it is not necessarily enabled when the=
=20
> codec may need the clock to be enabled. There is also no way for the=20
> codec node to specify phandle to clock provider in DT, because the SAI=20
> (audio driver) is not clock provider.
>
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK=
=20
> clock is enabled when the codec needs the clock enabled, because the=20
> codec is the clock consumer and the SAI (clock driver) is the clock=20
> provider, and the codec driver can request the clock to be enabled when=
=20
> needed. There is also the usual phandle to clock provider in DT, because=
=20
> the SAI (clock driver) is clock provider.
>
> >>> Also I'd expect that the imx
> >>> SoCs already supports the MCLK for audio applications. Isn't that
> >>> the case?
> >>
> >> That does not work if the MCLK has to be enabled/disabled by the MCLK
> >> clock consumer .
> >=20
> > Why's that?
> >=20
> > Don't get me wrong. I don't have anything against this patch, I'm
> > just confused, why that isn't already working with the current MCLK
> > driver as this seems to be the usual requirements.
> Which current MCLK driver, the SAI in audio driver role ?

Yes.

> Does the paragraph in the middle of this email possibly answer this=20
> question ?

Yes thanks!

For reference, IMHO the correct way to do it would be to add clock
provider support to the original SAI, esp. because both drivers are
mutually exclusive. But I'm fine to add MCLK support for this driver
for hardware which has a spare SAI and to just use that as a MCLK
source.

Acked-by: Michael Walle <mwalle@kernel.org>

-michael

--60e47edfe38543925c72c751d549eb1c55a15e2be67c797b85027bd80743
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ3zrbBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jGLwF/ZWmiJ2eGuY9CJRdtQ2c0YfLp47Jb92k9
CLXIBvMSzZTWf1jTWoFprdUXFNI87QfbAYC7BgXfJeZcipGW+Gn8xnIhA9exkNMh
eifER4VvKwpBdztoNKobUEO9e6Uya+wFtgg=
=oTca
-----END PGP SIGNATURE-----

--60e47edfe38543925c72c751d549eb1c55a15e2be67c797b85027bd80743--
