Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D3156C6F;
	Mon, 30 Dec 2024 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545563; cv=none; b=MKr0kN0LKO+BtTuW3tGTePKK2PylYj5iRngNOZph0jL5j3xkIzgIw/l249agbrnZ4chSmhEbc7hX1t4BfBHcvDOyMkzYcleHNNAvg8WqYeIMB8Z8d71k4w7ThziqcLF5x5ydVvIDvrenUIaujwZketNvdofsL6/pwldNnsXu0X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545563; c=relaxed/simple;
	bh=OuYgsSL35Udp34Pc5fAJC7qX8GCX3Q3Y5rM35JSX01Y=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=SwSKSAtaSQuvqK+PNRQdXUtFuBtDl0eLG3a+gvD0Q5EqGzElx3ziA0T43ClRB0x3YA5zvE6wxD4HMqZO9vVRyk9C/5Ph0EdUvQfiS+41P8EmkXeteJuEBbviALveEYYdjFo9iyq1SFxvBuQBlQK7McZKyM/rO5ucKH8bb2ERzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc; spf=pass smtp.mailfrom=walle.cc; dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b=ZzkpSkBX; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b="ZzkpSkBX"
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F1B0B3E6;
	Mon, 30 Dec 2024 08:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1735545100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=OuYgsSL35Udp34Pc5fAJC7qX8GCX3Q3Y5rM35JSX01Y=;
	b=ZzkpSkBX3l+SAbCY5zq3NbNmqFsu4PlOumRsJDMAej6xCm15liKWIzIfT2iyPoDcRIXWHi
	GIIGUU/Dnn4qkGZzukGdwy3mWyZAo3U6CIX8QzGodPl+gzKsYZPsHjpgkeh7LhUsJ34gvI
	XoLnuaOrFITMdNF1BOMmG1K3OvhV14MFvd9e7JnrgUx3MuV5Mj4baMEav3ImoHxGj6Q1Hm
	VR45b5cmBrrqIxf22oZ3CQqKnPjzVAyPCIS0bw5wNUsfzoytm+CXKqLyos/FvRMUFcUFZH
	HLJP/bZYZhvazFRzenUGx778qVjeecsYTqx7Lzxmqs8k96K/o5hCBmYrbg9SwA==
Content-Type: multipart/signed;
 boundary=afee295fd341416c93036e9c1ed652d75b323dcb92731ad9ab1fd3e09588;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 30 Dec 2024 08:51:37 +0100
Message-Id: <D6OVE2W07NDX.2Q4AFF46TWCWJ@walle.cc>
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
To: "Marek Vasut" <marex@denx.de>, <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de>
In-Reply-To: <20241226162234.40141-4-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

--afee295fd341416c93036e9c1ed652d75b323dcb92731ad9ab1fd3e09588
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Marek,

On Thu Dec 26, 2024 at 5:22 PM CET, Marek Vasut wrote:
> The driver currently supports generating BCLK.

I'd say the driver supports generating *any* clock on the BCLK pin.
It's not necessarily the BCLK clock. I.e. on the board where this is
used, this is the clock with a given frequency sourcing the PLL in
the audio codec.

> There are systems which require generation of MCLK instead.

You mean systems that use the MCLK pin instead? ..Which is the
normal use case for this pin. This driver was created because the
LS1028A doesn't have a MCLK pin, so we've "misused" the BCLK pin,
with the restriction that only integer dividers are possible. I
haven't looked at the datasheet, but doesn't the MCLK has a PLL
which could generate any frequency? Also I'd expect that the imx
SoCs already supports the MCLK for audio applications. Isn't that
the case?

> Register new MCLK clock and handle
> clock-cells =3D <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells =3D <0>, the driver behaves as before, i.e=
.
> always returns BCLK.

-michael

--afee295fd341416c93036e9c1ed652d75b323dcb92731ad9ab1fd3e09588
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ3JRCREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+FlWAYCxmDmi0Em3lKwqzoD+898QBK8+aQcL+HXd
GisHnGsjdylh9oz8KiejTt5WaQQRIs0BgOT4Rt6/o3ToJ/WQlR9+KxF2q7mES/o9
YPYWc/QV0i9pxm9hzNbDZv6tlm2JcJB1hw==
=/zRw
-----END PGP SIGNATURE-----

--afee295fd341416c93036e9c1ed652d75b323dcb92731ad9ab1fd3e09588--
