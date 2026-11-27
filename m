Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771217;
	b=sNmwiE3LDg8/I0W3bRSU9jtitgjoJuYjzQi6gC/LrC8FXRJ1CEeDpKoC1miERd2oX+y3
	 pJyF0kxrOHlctpHDw3CwtMrIlWiB9xtYL944hnSM9QUdFMFmxMRUq3SnVVrFGvrlk6Amb
	 KZTwLo0px345HBsdk/GnI0I+NMUf2DVqfKn7kMEFgBSReWAF6DHfdGFumPaxoshcmTBOo
	 1rU8rudBRJF9xgc87DJ6GqRzNVJGTKxNnqzeL/ywZV5LK3VIWXAXfQ0B9ztr0hdy84gaz
	 rBMk3TFgcaglQ1bxCcOn0jcYCutaZWYvwxtQzTOyYnYPiNTSUnKo+VyuJ3p2fI5rESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771217;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y/NG1FSwHBbc0nUUF5aO57OLyJ1BvD+9ME8Dae08+30=;
	b=inan0RURoKYB7mHZm6YB9D9eh+Mvm7Md33frDUEvWBJxXkvr2I0lJKU0Otve7OwEryZX
	 oxgdZAQ/Kirbq3xxDrBUEma34a6SrgtlnQRqSXrvvP/n4Ldujy/XuI+qpOWYtUezIB9+u
	 TyYYGQxFORCijge7o8UUJl/Kwe4ZEz3tdU3PLGQmj8PCxXkzKZbrZ130ALMT4zWMwb0zS
	 gB/BaJViyAO9gTtASCTspu9PCHKIJ06tK076IjabbqT7gL7eHTJVG2CSVpMN7tBnx4NEo
	 RkL5AOgJ6/Rxc7FSahk95X4BPgLGOxBYBVfUjylU7rRfYJ8/XJEEUUAK6GokDJ+l6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7XR97pU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B64606A31C;
	Fri, 27 Nov 2026 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7XR97pU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C871F00893;
	Fri, 27 Nov 2026 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771217;
	bh=y/NG1FSwHBbc0nUUF5aO57OLyJ1BvD+9ME8Dae08+30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7XR97pUple7qnioazrI/KqFukqaqENgbTLazJ4JihS+pbhzBiogSQ/u0D8pklUcU
	 jE+1l0h1GfFtpjB9aLyaqoadZuw9aIRkPDCZgg2p4nARQMoeuCZ7GCLyktxlUe/iqx
	 hnHtSvXat9NDrhOjUIpdOcvw9XK2AXqJCFfsXFk6WDl57km7WloXHoTG6yI1V0akHU
	 n/iPrwcCuWwFPhRJzJVmFOOenxVO/xcDxCcFyG1QMn+Sox1ECV9D4mxNpd2qKufN1B
	 psIZk+Cz9vjzg54+Nl0Ii0n2PZyfR6xj6vwpfSqU6x7wBFvFiexlfF/r0klfmgjW8Z
	 BMMX/6q+/H3hQ==
Message-ID: <sashiko-outbox-236963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC:dt-bindings:clock: Add audio power domain for
 S4 soc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261127-clock_audio-v1-2-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
 <20261127-clock_audio-v1-2-cf3ccf6b2bf0@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:20:16 +0000
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
- [Low] dt-bindings: clock: axg-audio-clkc: commit message omits new S4
  compatible
--

commit 62315ecd63c9b45b3693effbf5ae0227a2b31af3
Author: Jiebing Chen <jiebing.chen@amlogic.com>

> ASoC:dt-bindings:clock: Add audio power domain for S4 soc
>
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>

> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-cl=
kc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.ya=
ml
> index fd7982dd4ceab..75ddaf8d80917 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc

[ ... ]

> @@ -115,6 +119,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,g12a-audio-clkc
> +              - amlogic,s4-audio-clkc
>                - amlogic,sm1-audio-clkc
>      then:
>        required:

[Severity: Low]
In addition to adding power-domains, this patch introduces the
amlogic,s4-audio-clkc compatible string and adds it to the #reset-cells
requirement, which the commit title and message do not mention.  Also,
the subject prefix "ASoC:dt-bindings:clock:" prepends "ASoC:" to a clock
binding and omits spaces after the colons instead of using
"dt-bindings: clock:".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-clock_audi=
o-v1-0-cf3ccf6b2bf0@amlogic.com?part=3D2
