Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D11990D3;
	Thu,  2 Jan 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735811952; cv=none; b=V9EF6LWR6cRpBuR9BF+Ar54fEOqiCBKnaNt9xFvIoxaReOO1DsN44IEUPH2S+temFtZpSw3hd4v/bdoBP8cqnqU4U5acW40w3wAkNjW7ooPRgfVWU+MLsqk2iRHFIIf44W1zfRZqilGCv78wn9FK+dxDFSYCaRWZ8demrKVw2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735811952; c=relaxed/simple;
	bh=IivYDPdicfaKRVo7J3ZVJwfULyTbH2RX6seTNNOcqrM=;
	h=Content-Type:Date:Message-Id:To:Subject:Cc:From:References:
	 In-Reply-To; b=mn4isgC3FdQhvF2J7o40/5HxucARo94Z/VLe7TkHQv8FqzmBTOW0ApOXn6k+jHi1SGNZ6GKdFUr7Tk037W43/NC6I/qQ7e+pVAzzedZcHdxcPt+c2MmxRE5UP9a/KKrqLhRvrhBWNJ3EonqB1alDUGh1aKJOZBirEgYNVPuEEK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc; spf=pass smtp.mailfrom=walle.cc; dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b=c9lHpwrL; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b="c9lHpwrL"
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 712973E6;
	Thu,  2 Jan 2025 10:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1735811941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=IivYDPdicfaKRVo7J3ZVJwfULyTbH2RX6seTNNOcqrM=;
	b=c9lHpwrLGUSMvMi5tJpjhp0zB0aQvZp1Vrkjdxu1yi9FeA+j1OLqPipUg1E3l4i6E1uW6P
	uD/w/i8eD8pTJ0EamlyLplk0G9Lbv3Fzw25hZlMeCMKMscli/CA1dznkIIg8rlxn6LAgUA
	f1R36jLloAs/jejZHYwz12EOvgUrURjfK1AcZR9zOEA6fQDpfMKI55UcV2qfkIuglbMq/G
	yLtuoHLrd3qZMrW6GpwrbbOZ1Kn8JtR9x2q0QcDnFJz5hyBpFWceWEyS75zntfhtBpQaZT
	9pMGmhddqRmzUr6vywl2UH5lyaMrQ1y4iA430YRfskOEP5kyJaQ7Pib2M7tn6g==
Content-Type: multipart/signed;
 boundary=f82733b877a73b53aabc89efe3ab17e9dfaae230434847c070ab5a5a9016;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 02 Jan 2025 10:58:59 +0100
Message-Id: <D6RHZ8B051X5.3NA8EAPRI62XS@walle.cc>
To: "Marek Vasut" <marex@denx.de>, <linux-clk@vger.kernel.org>
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
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de>
 <D6OVE2W07NDX.2Q4AFF46TWCWJ@walle.cc>
 <36665ab9-16de-4f77-a55f-b7942dc0c1bf@denx.de>
In-Reply-To: <36665ab9-16de-4f77-a55f-b7942dc0c1bf@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

--f82733b877a73b53aabc89efe3ab17e9dfaae230434847c070ab5a5a9016
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > ..Which is the
> > normal use case for this pin. This driver was created because the
> > LS1028A doesn't have a MCLK pin, so we've "misused" the BCLK pin,
> > with the restriction that only integer dividers are possible.
>
> I have a system that is wired a bit unfortunately, I need to source=20
> codec clock, where the codec is the clock consumer and needs to be able=
=20
> to control the clock (SGTL5000). SAI MCLK is the only way I can get them=
=20
> out of the pin I need, hence this patch.

Which is also the default case, no?

> > Also I'd expect that the imx
> > SoCs already supports the MCLK for audio applications. Isn't that
> > the case?
>
> That does not work if the MCLK has to be enabled/disabled by the MCLK=20
> clock consumer .

Why's that?

Don't get me wrong. I don't have anything against this patch, I'm
just confused, why that isn't already working with the current MCLK
driver as this seems to be the usual requirements.

-michael

--f82733b877a73b53aabc89efe3ab17e9dfaae230434847c070ab5a5a9016
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ3ZjYxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+IJzAX0cVtRiMI9KcfO1uBCHahaFh/HBju/eiM9m
9UkD3sdSoBW4Ym0Vv1tEqq7LtR90D0gBf0719K8fLM6/DKMC2U391dhtHS/F/VWw
A0hG9LTODgliw1Z/nIATJDQru9ope4B5ow==
=DErg
-----END PGP SIGNATURE-----

--f82733b877a73b53aabc89efe3ab17e9dfaae230434847c070ab5a5a9016--
