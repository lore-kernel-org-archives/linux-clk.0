Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048561;
	b=43KT8jJZFpblDXBYdRlRD6A9lnkn3i5otsvJPGTTo6OgOD1fiYlpaOQjedUtMcQFx8+3
	 2ohqN8SNmfVV75PHzrJMiZh5wNI2xJ6Q1VVVhi1+WI14yU7Kne59f4aMgPVZS0R3SH8Zj
	 hF7gKOECkuLGwtwrVJADNpLC5Wsnj0LwxY2wng/NN5aeMo/CdIpIOmaAkCWmz9s4GCByP
	 9C8mYYe+sI1h0dr9469GsBZ3SiiAK3TazvWMWCNypY/RC4pX8nsWdGIWxqUQ5e6HRcc0e
	 1a2p/V38sYb3x+7EVCUrA0l4t63FhNVCnZtNr5WVgIs9g/X4AE3GZThKtME4MC6DaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048561;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=v358HEhOlmBDuVPDB7wDI9WRAFH4nBpagPV3eCkU2/U=;
	b=h1ZUm5ztXsSOF7/xZpJo4qQ6nafUxE6n7fqTKYxa0dREZSMeK9kKt97U7z+i05be+oEY
	 VuAiOZFeJAAK9z2LU8Hix0hRAkFDxDcJvBb3dCY+a/t0lTqY0pTiOMEeCwL5iN6QnxsBX
	 ndPyBOBFyOM4aj7vtX139GIGI9z54uQ8oI8WxkijFrBN+kN41YKftdWulr1C8FC7uiYuq
	 cRFuXZGfDDnFvY855UI3stFFg3n6+CDpyRWXhUCOszzjqZWQRUFWGa6F6ORZfMI5e+o9k
	 JhGJz5EplpSSLqctNJLys3pIFHi2t+hTKE1hDHaKG9b39Nf4aZlqOZ/SzlpfPoxKupQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUw4tJON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D996606A31A;
	Mon, 26 Oct 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUw4tJON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6791F01825;
	Mon, 26 Oct 2026 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793048560;
	bh=v358HEhOlmBDuVPDB7wDI9WRAFH4nBpagPV3eCkU2/U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XUw4tJONe4g8PLwoFuRLxJoUZxFxGq6F2n/k53iHgcdPwP5Z+JgqVNJb+6EqhZngi
	 EiBaSMmzjYf5ndm8Nj8sIZzjNHqiPFI35g2RTZVerwjo4lb+SzY1fs0rZOOD3ortey
	 ctdtcaK6FTozfHodP4mje2y9Juj87pDeC2a2wZZCTeG0Be+1g/jKG4BgyarHi1aAln
	 y9ECIly7XIyzOMeqfShcMAy/QF82oADXSJ4wVufvqJDnzzojBpqTrFLbaNb9awHiur
	 hZukemHAVM21Z7Zszt+kadQcDVhuPTvxK8bXfBy3KumFcl6QjBz8mTaZggVUCW/Xb+
	 jB3snI5IW5gyw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9AE551F289D4;
	Mon, 26 Oct 2026 21:02:27 +0000 (GMT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
From: Mark Brown <broonie@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Date: Mon, 26 Oct 2026 21:02:26 +0000
Message-Id: <179304854619.199157.2693374514232344592.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=591; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cqCG7i2KkY1qhKb0vz9axhgwtlpKCIFLBV1xu14ZY0E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLu73/cV3RV+ql6TtKlM74fWNw4a7yu3fp9YULKho+Sx
 4MWPvsm3FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJZOUx/M+M3cEpf3dK1fOf
 pQanquU+LKr+62m4denzvSpFjw51JX9k+O8ucfR+blMf79cnVwuidzXvteqaHP6rRjMvYdN2P9k
 p8cwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.

> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29

Should these have a _S4 suffix?

>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),

Should this have a custom mux for S4, it looks like the register bits
are different, a shift of 19 for S4.

-- 
Mark Brown <broonie@kernel.org>
