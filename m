Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540116;
	b=iPXB4rQ0FkoAQb7achND4a5K446A9oa3okUGdKuafvsgVCLxx4QD5F2+ykIbRQK7RgY4
	 GdoJl2qLBxBxwhV5NFHBUAjnjT6aAuEXHDrLZBc3LmqWSY9ZpRvE/uC5W5YILBt1/Y93J
	 yiEFTk8bWhwCyqxjCHuqX5olDVxdsjcoRT5Ky4PlGRFxLNKsttr/P5jbtnL1uRyfzeyEp
	 isD3VldzRxoNJHU96O/vaK/p2rtTtu3htTuw57+2D8TYm6qU2eJ7AYWU+Spqfqi42RdYp
	 R0zjrGfyt1Qhc4KhkLSPsjisHdqN/tLjmcyQ1CNUx+4NkJruksOHCIIAhFHDQScraVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P6ERruK60+a071hjwGqPn8IJiHuFwqJBAhH3emNNRjs=;
	b=uJcitJR7rTyLwlkre9xs8DfT69KN+QdPk5xbNAxDzQRx3Y8PQDNyLmivkGBWRmu1r6RI
	 BhvcQEK2vCATFkcUmV/12TXJLmCLn32S9QL26cNPivdmMHuIDtxZD2BxsZzUCZur06f3C
	 Pn5FvBSMz8+QoQmc7xk/gv9P9yjz3PkTsqTthI9q7hCSGJ6jag7e4SfaAcLpqNve5ZO/Z
	 8n8W+mSCJRjIffYHXcOW6Q3e5OQ3EvMDLjiVzMRtXhZVlCr2uu0GQaLfEOhaX0YN1+vvh
	 6iJe1uQSm7TLrmDqk8YP8t02K9/Q/Hp7h2htcbnvyCdM5r4FfkRYnhnOF/2vlpciCsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+EE4WW1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E660A2611;
	Tue, 24 Nov 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+EE4WW1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6C41F00A3C;
	Tue, 24 Nov 2026 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540116;
	bh=P6ERruK60+a071hjwGqPn8IJiHuFwqJBAhH3emNNRjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+EE4WW1Yt7rxekvdU8UcjQL0Oi+SluelfNIcaZ9kWNmxHfViccTVVzynvxazGia3
	 zIPzWPGpPVARY8Y3pd1+Yv0dpEsj62EEWyUKrRMbjQozWFf6pSUzT55+r8uSTXer0Q
	 M4MUwYWueQV3QRXA2L8uofuprgq8fnXj+CHaESqmKXpTOxEoZS2IZCXXX3afijRJ+N
	 Og+0jsaohJSfKdrJidq+mHh/CNH22ChWM0cxOgGopvRf9whWlVKpyj/hB99HGMuN5k
	 Ifk8CrUSYvBjiWvtEByN974l3mMc/1wJH+uYcZWC+M3qpw07QYJe3RIVl5htn7U/Uf
	 3NJOSY4ORMXrw==
Message-ID: <sashiko-outbox-231657@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: add SM8650 LPASS core
 & audio clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-clks-v2-1-8086440e2c09@linaro.org>
References: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
 <20261124-topic-sm8650-el2-clks-v2-1-8086440e2c09@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:08:34 +0000
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
- [Low] dt-bindings: clock: qcom: unwieldy per-compatible conditionals
  in schema
--

commit 297b8c34e5283dd199c1d471466b7d1c33ecdd81
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers

This commit adds the DT binding schema and clock and power domain header
definitions for the SM8650 LPASS HM, core, audio, and AON clock
controllers.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscor=
ecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.=
yaml
> new file mode 100644
> index 0000000000000..c26d16b4ea3ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
> @@ -0,0 +1,178 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8650-lpassaoncc
> +      - qcom,sm8650-lpassaudiocc
> +      - qcom,sm8650-lpasscorecc
> +      - qcom,sm8650-lpasshm

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpasshm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +      required:
> +        - power-domains
> +        - '#power-domain-cells'
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpasscorecc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +        required-opps: false
> +      required:
> +        - power-domains
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpassaoncc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: LPASS_CORE_CC_CORE_CLK
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: iface
> +        power-domains: false
> +        required-opps: false
> +      required:
> +        - '#power-domain-cells'
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8650-lpassaudiocc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: iface
> +        required-opps: false
> +      required:
> +        - power-domains

[Severity: Low]
Could this schema be split into separate binding documents rather than
combining all four LPASS clock controllers into one file?

Each of the four compatibles has different clocks, clock-names,
power-domains, required-opps, and #power-domain-cells requirements, so
every compatible needs its own if/then block under allOf (and
#power-domain-cells is left allowed on qcom,sm8650-lpasscorecc and
qcom,sm8650-lpassaudiocc).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-clks-v2-0-8086440e2c09@linaro.org?part=3D1
