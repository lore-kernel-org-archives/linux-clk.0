Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247056;
	b=GAQff7d0wbhVoPBX374w07ttikrhBwlSFzwr+2nKs4lh/5AkmwEyK8wslz+dX210HprE
	 xCrm0afrui6iLXiXuN2IPxZrQERBOgIt8weyiyMkbaMDqa65InYXGGQ/IthOs7R22p+SU
	 IX9V7dZWhP1l80htf0fSMIfVoYA5fHJWjlmLeTFwcJPOw6/q+CSVjlU4t/MuEakro5iKC
	 TlKywqm1kyYNr1gD8B/f/pXLhVC8MBP8bV3PJHY8xGjbj9QUqSyJgBcgDCAW7A7FKE30F
	 rD6hXjj/SNA/1uej07k3OH/sgd+p/clDDRCh6xn8Ps80YzKnaK/kvyjmkcfahbaabig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247056;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3LF0iozCK3be5qNzdN7kLidOplRMQaHvoxhaWrqnzAI=;
	b=H7m9pafpYKFdL/6JvPmTT180jE+a7x4gy+KYsVBjhcVsS1d5g7zhXe1X0IS8o1TD9bTY
	 2cLWUD8lC8FRUWCdPh2yXiI8BkbklpMqLTho56j91QOcZhlFDnniiwGtOJ6hHTfrK/eL1
	 6/npPzXGUuNf8Vaagw2swPSuFhy4bNLJwUq6VJWH7fYkXTJGxmkj3ZnbyV0jN07KqN6uX
	 6BsLzqHGf8ayE2HH2o3M/2JisRysIUJTnc81seTi7t/6TsWlI7DExb5wV6eLHTKwo2vIJ
	 dSbPl5kttq+8oXhnDhUeJMgbUjAhtn5C1Pgc0FwHQhawhCEka386jgiynjBjVXDN1Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmduxRyR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862E606A320;
	Sat, 21 Nov 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmduxRyR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B101F000C6;
	Sat, 21 Nov 2026 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795247056;
	bh=3LF0iozCK3be5qNzdN7kLidOplRMQaHvoxhaWrqnzAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YmduxRyRHHMU4wilmiUFb7isWnCLOvZCruN73/lYgyJt8FQqqHl3t+Umft53F4czP
	 SumCCjfuZosaF+sd37vxCJvyXMtoY1w2UC/swHhxny8Ah5XhrPNN5/MongFecKgwF0
	 M77dafo8ii0RR0oYFozc1SlYyDjd/SyJ5hTdvaPRKT6XihqDUiB6KinIeXiv3Quqat
	 3gpdPL0o6zQhw1crSbReraxhRItX34hsO5mC8JIccEj14tLfYGD5Au90Ru9do67dtX
	 Bt6g3sTv8s1tHWWETx1n5uYphwJGM/llO1PmMxBYk0eCTbf4Wj5rdr5hMRdvjMGB9g
	 ZTer37M8kxqEw==
Message-ID: <sashiko-outbox-226790@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/17] dt-bindings: display: spacemit: add K3 Saturn
 DPU controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261121-k3-display-v3-1-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-1-ec419e8e96b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 07:44:15 +0000
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
- [Low] dt-bindings: display: spacemit: interrupts ordered before clocks
  in K3 DPU
--

commit 5cacd6c3de4c42a0a1e84fc0f0f6938c6990b78e
Author: Cody Kang <codykang@vsit.ai>

dt-bindings: display: spacemit: add K3 Saturn DPU controller

This commit adds the Device Tree binding schema for the Saturn display
processing unit found on the SpacemiT K3 SoC.

> diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,=
k3-saturn-dpu.yaml b/Documentation/devicetree/bindings/display/spacemit/spa=
cemit,k3-saturn-dpu.yaml
> new file mode 100644
> index 0000000000000..97ea9da4b68e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-satu=
rn-dpu.yaml
> @@ -0,0 +1,132 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: spacemit,k3-saturn-dpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Online (live display) compose path.
> +      - description: Offline (writeback) compose path.
> +
> +  interrupt-names:
> +    items:
> +      - const: online
> +      - const: offline
> +
> +  clocks:
> +    items:
> +      - description: Pixel clock.
> +      - description: Memory clock for the compose pipeline.
> +      - description: AXI bus clock.
> +      - description: DSI escape clock.
> +      - description: DSC clock.
> +
> +  clock-names:
> +    items:
> +      - const: pxclk
> +      - const: mclk
> +      - const: aclk
> +      - const: escclk
> +      - const: dscclk

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - ports

[ ... ]

> +        dpu@c0340000 {
> +            compatible =3D "spacemit,k3-saturn-dpu";
> +            reg =3D <0x0 0xc0340000 0x0 0x54000>;
> +            interrupts =3D <90 IRQ_TYPE_LEVEL_HIGH>,
> +                         <89 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "online", "offline";
> +            clocks =3D <&syscon_apmu CLK_APMU_LCD_PXCLK>,
> +                     <&syscon_apmu CLK_APMU_LCD_MCLK>,
> +                     <&syscon_apmu CLK_APMU_DPU_ACLK>,
> +                     <&syscon_apmu CLK_APMU_DSI_ESC>,
> +                     <&syscon_apmu CLK_APMU_LCD_DSC>;
> +            clock-names =3D "pxclk", "mclk", "aclk", "escclk", "dscclk";

[Severity: Low]
This isn't a bug, but in Device Tree binding schemas, clocks and clock-names
should be listed before interrupts and interrupt-names in the properties,
required, and examples sections to follow the canonical property order
(compatible, reg, clocks, clock-names, interrupts, interrupt-names).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-k3-display=
-v3-0-ec419e8e96b8@gmail.com?part=3D1
