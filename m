Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579813;
	b=FPXFk5tNDSgI7tKvma2eT6CHGdsy8wb/TuiGwJebhREGnhRCzXPnHiUIJr+YHfASjLl0
	 LYHHixF9itrDRY1EuGRQyKbeSnlmvrDA1xeBx81URyAqpRCvrkwqhgr03vrxfHpM9cA6c
	 b873jG0uQmfNpeoUTR/e2e0pvSOw6+eNYNA/Fh4r8ger8IYn1eD26YA4NOLaV7rrOulY6
	 gxgJHUlbqDFQ27Adk26aPMJQSJvnrc9FS44CvR8pVM2G1MudchwOWgREwMwi1BWgQoot/
	 bSXlUBxQfkzG61YoCS4LJvBmO8wb+y10j02iLznRdNCvS11yrty5H7HcTQD0zQbxT1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579813;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vyN+S89dABkbEJ7mc1sd16diNMnG4dcnsXd9z2tyODQ=;
	b=GEAwDox1ok9dRoopC/9ZWOxV3xi8J+AiK7PM0tD8lz3t1+x9B+u+Y0puKgB5LjxjMV4V
	 XHrrHDSgnjFlz/n5xgUK03aUcQfweF9DnPQ4VZDCjGfJD2Mcjv8Yyap2/22OWbrIWwJ/l
	 uOa2okUsCQKDVO97hn9YQeu0CmDytK/exi0uZuTCt33qP6amwhNPoIMoAdr9dAEn5ZrFO
	 Ffr0VgeiihHekms5wfEC++1RE6aClSiF/reNCUgge1fEuExUCHgBZdXSH5ftSGqXFeDGA
	 U67giq7ggu/L9cwfDO4x7UyGYJET3RuyiFuFMGofBnQMnm1djG2SoUUkspKZTbzrhHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvEFcFH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC29606A31E;
	Wed, 25 Nov 2026 04:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvEFcFH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3F11F000CA;
	Wed, 25 Nov 2026 04:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795579812;
	bh=vyN+S89dABkbEJ7mc1sd16diNMnG4dcnsXd9z2tyODQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gvEFcFH6si0NiS8W2GZkln6pZyl5w1r1I/QHDHwDfqIKWUNoIGKo4gqCpClvP7U0F
	 CQjLnf3C4kbsXPhYR1hfKmyuFO7gPh822MN74u5wH4fRv+y0O3CbTni0p8eHg3JZFs
	 CDsROgq2s4dAXL9zx3hMQNf4bbV15A87ISNcZjKKNhNy+4CR/Vz3FSQnEo35WGqSGZ
	 YZp6PauZZU7u0o4QFtrI32Uqq1o1iBEyY6bL8ZtQpy7+ZY+azwQxMaiTS5v4il85iR
	 pe8LWMxkB3R3tnjQRTIhGouPEUS0XNDYakOnH/GKtD8c+YLoB1TOQ2ywBfDzqPcTFY
	 S7cMNVy77Qgkg==
Message-ID: <sashiko-outbox-232559@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Add Netrani RPMh clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-netrani-clock-v1-v2-3-9ef014e71737@krgm.moe>
References: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
 <20261125-netrani-clock-v1-v2-3-9ef014e71737@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 04:10:11 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: clock: qcom,rpmhcc: unnecessary netrani-only
  required block
--

commit b3574101c65f043362d9641e881d3932e0269507
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: clock: Add Netrani RPMh clocks

This commit documents the qcom,netrani-rpmh-clk compatible string for the
Netrani RPMh clock controller and adds a conditional block requiring
clocks and clock-names for it.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/D=
ocumentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 5c9b653bc2aa5..6ab049ba4b6f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml

[ ... ]

> @@ -68,6 +69,16 @@ required:
>    - compatible
>    - '#clock-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,netrani-rpmh-clk
> +    then:
> +      required:
> +        - clocks
> +        - clock-names

[Severity: Low]
Why require clocks and clock-names only for qcom,netrani-rpmh-clk?

Every RPMh clock controller in drivers/clk/qcom/clk-rpmh.c uses
__DEFINE_CLK_RPMH, which parents all non-BCM resource clocks to the xo
input clock, and every existing in-tree DTSI matching qcom,*-rpmh-clk
specifies clocks and clock-names =3D "xo".  This allOf block can either be
dropped to match the rest of the SoCs in this binding, or clocks and
clock-names can be moved to the top-level required list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-netrani-cl=
ock-v1-v2-0-9ef014e71737@krgm.moe?part=3D3
