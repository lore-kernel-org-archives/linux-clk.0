Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094029;
	b=OoYmD0CW1Qpm2slvQVMlPe1wk5+W25Cut7nd+u/i0RL7jo+PbVTGzb9hP2xT6GjFG1is
	 Q9GF0jxH7cPzLm/jK9o3ZfbVXEv5pR3oQMUsyq1T7JzOD0uUITwzrNIxSNF0ceRSQy8zz
	 ZbTONsE0qq76r2g545PmyWbk3xH0cC5900cQQ99l65q0NldDwE9wKOSGhXl3eGCdafn1j
	 YVphg5/z27kxRd0rex9Ty9wE5na96UCV10zqTkv3zf+7mK9WgfdSAvcL9DO8pP0LgpYsC
	 jBKWXLn2LnJvegjrYGNUnPkXKKbGHoCU1OtrphmIC+AgwGQclx91nGQW9iH4hQDpvww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094029;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ym7ZIQqtoG4e+CQqKSyynH5jiOK9eEJXm56IzwNu0EM=;
	b=g8YnESLM8nZnhAkooLwD964sxir1OqnDss8V3EZZDeeZ9HTCq4gVSJoMSuuiDZYzsv1/
	 3YtAGaqSXMub8pH3uw8hY4hgvZffPr6HdsfjvfkuzGVWpDRU8XjmZbYLisfd6+xUPHbDW
	 SdEWRyhPJ3a58czjqDuPUMd/FXp7NulB6airJMoO+pgJUkV9wS/IEsk2aHX/OGqz1wUqC
	 BJwGnqMuUKvY4qtdxWTPVvFWSORaBEUYsLkW4PvttAPezNcHl2yIVhEVD3CCB0nyQfBCZ
	 OgvE3HTYpq+92ubnWEWskx61tXS7wj//pQNORu9XCbd6mnphJPpceh3oV9nP0CAOKYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niylCJHV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F85606A31A;
	Tue, 27 Oct 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niylCJHV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869B31F01829;
	Tue, 27 Oct 2026 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094028;
	bh=ym7ZIQqtoG4e+CQqKSyynH5jiOK9eEJXm56IzwNu0EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niylCJHV2ZImXnkjYlAJxdDnlpnsoxyiyXvvFTcuTukzjwbi6++qUCJ0vIgqTAjnX
	 iXOC/6UMZoKUfsATd0m+ZEuLBvjXA3geQ/g+tTh/hMxAkd+DxEpRLkxQBVh6HcNnTe
	 C5x1i4411+4Z/M6uldP2CmSkOedf2ML0MMV2WSsFkp75LXXm8kOZF+SHwvQqXtoswd
	 syo7vsImSV9MUeCncdCJuOy3r5v9XVsphFndCP4JTpXjP0KF9UZbwvdgOfH+KM0X+y
	 /iBSvRqRrLaPizPQMyMx+iVQBHtVFl3JFMh6OvhGtdfMlybkYHMMLX5vE+heRJtdhB
	 MdPFa183wn2gg==
Date: Tue, 27 Oct 2026 10:40:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jiebing Chen <jiebing.chen@amlogic.com>, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261027-aloof-lush-hog-c7beeb@quoll>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:23:58PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Jiebing Chen <jiebing.chen@amlogic.com>
>=20
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
>=20
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-cl=
kc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.ya=
ml
> index fd7982dd4cea..1cd9a99e5ff3 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
> =20
>    '#clock-cells':
> @@ -99,7 +100,8 @@ properties:
> =20
>    resets:
>      description: internal reset line
> -

Why removing this blank line?

> +  power-domains:
> +    maxItems: 1

Best regards,
Krzysztof

