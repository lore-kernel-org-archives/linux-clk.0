Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132969;
	b=qlI4gon2GJ6PlKw7bDHzDPKD2wSQhn8WNLPL/G2ITklsH8umcZt3pOKjGoK5uiBJtLkD
	 mKhehhycNeQj9Nk0EH7OurofF1PHqJNJV+pwBb5yod2bWCQr4s8DNO5T45zFWobmkWlx0
	 3C5ParEzujetmA8lMmNyQ/e9Fl1TCSOmmghX7BFcLaVvEFpF/rftY1ucnS5KcEqmRpYNo
	 2QPk9rnVY+Mcc45IugFa1UvRrBvO0FBwzLpOCH7EG4ut/w7quS9GcMgdv+HhcS8nBZSDv
	 KZ9A3fSGfot5QaHIEvS+oLkEvO3zqvoJMv3BcnLIdr9ftmzNS8YnmiIMbheGmGRMM3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132969;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=l1rVD90iUwdYnP+P50y14163+c5Qwwe5OEm0CK39fM4=;
	b=XNMicTRzmqAEJbLLMsGWy4xhj2B1BHu71Gw3Kee50Q2HwNysta3aXM5t5bp7IebZhxU+
	 Wzd+aaDoTur81NFP0UhQFWvQ8DEw2HnZ1vd5oUdItRak3P/0bSY/5t/0wvqJAdbg1znDm
	 I6r2zxNU6EEV3ofC46njUsCnsx/LTX3Umyov0+pGbBO65doyKsLpE4XKZb/tIlbBm4Pii
	 xsDb6fAH8cS+16N3TZTBydfPAzDKaFm7J9qBGRFyuVJEWp4WW2Jd0TnI26rtihh/COIG1
	 SUwQl/hXyeO6Ovs2zM4jitxwyrZvRK78Wo+Jc/F6orGaHZYSi/jVQ5MqqiM8CVmlSfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVn7PJTY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF88606A332;
	Fri, 20 Nov 2026 00:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVn7PJTY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632571F000D2;
	Fri, 20 Nov 2026 00:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132969;
	bh=l1rVD90iUwdYnP+P50y14163+c5Qwwe5OEm0CK39fM4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=aVn7PJTYMlFhqgU3JDGl5lsuV7yqVPU4ZouNJy28WZTjxok6mxGnwJB4zvW3e12KA
	 PUE3hBfPk9uY1EQdyHSPFzWiGKNUt6Ys3rT6euacpaK8b6JVrIg3Dt0tdvlT2ucFEW
	 HIXzbbbYLQYo/DLA2iLt1UrlDdmWANJ98ydylERGyNAL0PR8c1vm89CifJTuaPPHjq
	 Y/d5Gd9pREUGkhi4oaws1zXtaFepIp0nk+PcI9fuPE8oDVY3tv/wJz1r2sfT0nx2Z9
	 Vj/4K72f7hknULhU3POzGZZrHzta6//Xvuy5OWjraoD0Ga9MjXsz8WxdJCLnOA6aMS
	 pf6wPtOg/hUrg==
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
Subject: Re: [PATCH v13 1/5] dt-bindings: clock: airoha: Document support
 for AN7583 clock
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117182444.103123-2-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-2-ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 19:02:30 -0500
Message-Id: <179513295003.301584.6678847701926278246.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=/SPFxDVuCW39gC1MQNp85lpHe1YZtsr5EuJw9s5QaOc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+98kkdszgvF19XvDAf331B4127pXOb5QPexxjjXZOm
 2faYLeuo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkoSDEyrGBgSYnmKD+vebHk
 8a8m3nbdunZ/+a02SXqRAow8fHqKDP9sTYXe/Jrzwfrf7/3ejl4/9jv6LQj5M31N6uuwwiDRyM8
 cAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> Document support for Airoha AN7583 clock. This is based on the EN7523
> clock schema with the new requirement of the "airoha,chip-scu".
> 
> The register for clock and reset for normal system and PCIe are scattered
> between the "SCU" and "chip SCU" registers (they are 2 different register
> block, the name is taken from the programming guide)
> 
> - Chip SCU provide register access to some clk gate and clk rate
> - SCU provide register for reset, PCIe clock, other clock gate and PHY
>   SERDES.
> 
> Upcoming and current airoha clock driver all follow this pattern of
> declaring one of the 2 register and use a sysconf for the other as the 2
> register block are tighlty coupled.
> 
> EN7581 internally handle the syscon with a direct reference by the use of
> syscon_regmap_lookup_by_compatible while AN7583 wants to make this
> explicit in DT with the new "airoha,chip-scu" phandle.
> 
> Similar to EN7581, also AN7583 permit the selection of the serdes line.
> 
> Add additional binding for additional clock and reset lines.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 25 +++++++
>  include/dt-bindings/clock/en7523-clk.h        |  3 +
>  .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
>  3 files changed, 93 insertions(+)
>  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
>
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fc37786ac7ed..05cd20ce3ab9 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -31,6 +31,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - airoha,an7583-scu
>            - airoha,en7523-scu
>            - airoha,en7581-scu
>            - econet,en751221-scu
> @@ -57,12 +58,36 @@ properties:
>        available serdes port.
>      const: 1
>  
> +  airoha,chip-scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Chip SCU providing the registers required
> +      for configuring the PCIe related clocks and resets.

My question from an earlier version appears to be unanswered, and
Sashiko flagged it.

Brian

-- 
Brian Masney <masneyb@kernel.org>
