Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587158;
	b=HHTI7UiIoPehXJFyMIzXob82YTJ64iudVW65sZDA+Jlvap8Cu10eGzf4BR+3iKzp8l0C
	 1PexbV/TZIwsTjaXWt5EY/rb7uj0IgQ8ua4mNHpWZccETkPXjPm2T3rmHrESdha/0ZztE
	 eH6YyKfYHcPK1UbmCd1MMsdeqo8ufMNuqj23YBPjRnjynsgqos4pu4qRCAEA0kpef+rH5
	 n2Ch6Wu9V8eT53e1AlhFSKERbYeX8jgLR+XQY1owYStSCaNRi4n3BkeCwLukTIaMSMYKH
	 Am0RNcBckGY2QAoX91bjPpyAZ+BJoACXi18ftZVAq+iv7n+h3PBidDhd+PXHPJpUZEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9tMJRQ0V+/nX+sngPqAHE04ZBwyFADFW5sgm/GCP688=;
	b=muhR5U4MIxtD6mE7dl9hKZ9MPKlNXP54idW/ZhG4He4urUvdgbRMHhSkoQJ/tp3di/ln
	 +EQ+qfYUVSNnt7N+UydH3VId74A9BSBAqRjKsykCZFKy/IcbpyG70mB9GScYojgOXe2of
	 vOLL/nVTi8PeRkIzDcEQ0nnUfRH7xs++iA4rOvMO1GK/Ydt9DqoPoazL2D0C3JgMynlv0
	 QFUni49u5jo7YlVOPtJr2SZlcomFowB9UxWv05xmf6EIAd44x7Sdjm+q6IF8Cy9J4c7/5
	 ydC36ODRpGo8BBVN7BDtgsHN3vkTLcJ9f9T1CBYS3kTaoYy7wq9KcAWIMV7zci2BluA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0orIoaH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48855606A31E;
	Wed, 25 Nov 2026 06:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0orIoaH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2F11F000C4;
	Wed, 25 Nov 2026 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587157;
	bh=9tMJRQ0V+/nX+sngPqAHE04ZBwyFADFW5sgm/GCP688=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T0orIoaHM8G6g6EZr2AE/hqLDA2PM3icumlIDBqWwqimmp7KSu/x1NCgrROsqAFQg
	 agsT9JkyOeAy/n17wxEQDdqQfgeK2xM1dvp7nzXxcpTW5c60+6ob2ocfKRWnfgqW3T
	 sLhEPNoqij6LHh7agwMFT986JPPiSwS/qEd1RPwa3NSJ8SKg/U0ZWRCYGw3XpKSaMk
	 9o6usLqWsmkNyrFJXOPwAcN0eNNgVTKJFdfeISela7qk0vP/ejWKc3e6Nhk3nRF2Il
	 120jifJBd0z+AaLEHzvM+1g6RzilpdqVPNle6sfP4ZghyK7SkJnwejKnFamY6x4J1t
	 KXdHTtfmNNz2w==
Message-ID: <sashiko-outbox-232650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Echo Zhang" <echo.zhang@mediatek.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125060037.649659-3-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-3-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:12:37 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Low] dt-bindings: soc: mediatek: fixed-length mux-opp-tables lacks
  items list
- [Low] dt-bindings: soc: mediatek: redundant word binding in commit
  subject
- [Low] dt-bindings: soc: mediatek: undocumented provider nodes in
  example
- [Low] dt-bindings: soc: mediatek: #clock-cells ordered after vendor
  properties
- [Low] dt-bindings: soc: mediatek: redundant select block and mailing
  list maintainer
--

commit 6ff5784de956cad70abff1bec7106c11df1f2345
Author: Echo Zhang <echo.zhang@mediatek.com>

dt-bindings: soc: mediatek: add MMDVFS binding

This commit adds the common MediaTek MMDVFS DT binding schema along with
the MT8196-specific MMDVFS binding for the HWCCF syscon and mux OPP
tables.

> dt-bindings: soc: mediatek: add MMDVFS binding

[Severity: Low]
The "dt-bindings:" prefix already indicates that this patch adds a binding,
so the trailing word "binding" in the subject line is redundant and can be
dropped.

> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdv=
fs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.ya=
ml
> new file mode 100644
> index 0000000000000..d65f4c9084cc0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mmdvfs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Multimedia Dynamic Voltage and Frequency Scaling (MMDVFS)
> +
> +maintainers:
> +  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>

[ ... ]

> +  "#clock-cells":
> +    const: 1
> +    description:
> +      MMDVFS clock specifier. Consumers pass an SoC-specific MMDVFS clock
> +      index.
> +
> +required:
> +  - mediatek,vcp
> +  - "#clock-cells"

[Severity: Low]
Standard properties without vendor prefixes such as "#clock-cells" should
be listed before vendor-specific "mediatek,*" properties in both
properties: and required: (and in the example node in
mediatek,mt8196-mmdvfs.yaml).

> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt81=
96-mmdvfs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt=
8196-mmdvfs.yaml
> new file mode 100644
> index 0000000000000..13381c78dbd19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdv=
fs.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-mmdvfs.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Multimedia Dynamic Voltage and Frequency Scaling
> +
> +maintainers:
> +  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>
> +
> +allOf:
> +  - $ref: mediatek,mmdvfs.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt8196-mmdvfs
> +  required:
> +    - compatible

[Severity: Low]
Is this explicit select: block needed?  dtschema automatically generates an
identical select rule from the compatible property below.

Also, maintainers: in both mediatek,mt8196-mmdvfs.yaml and
mediatek,mmdvfs.yaml lists a mailing list rather than the individual
maintainer(s) responsible for the binding.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-mmdvfs
> +
> +  mediatek,hwccf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the MT8196 multimedia hardware clock control fabric sys=
con
> +      used for AP-side hardware votes.
> +
> +  mediatek,mux-opp-tables:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 7
> +    maxItems: 7
> +    description: |
> +      OPP tables for the seven MT8196 MMDVFS muxes, in this order:
> +      display, MDP, SMI, VENC, VDEC, IMG, CAM. MDP and MML share
> +      the MDP mux. Each OPP entry must have opp-hz and opp-level.

[Severity: Low]
Since mediatek,mux-opp-tables has a fixed set of seven ordered entries,
could it define an items: list with a per-entry description for each mux
instead of using minItems/maxItems and enumerating the entries and count in
the description text?

> +
> +required:
> +  - compatible
> +  - mediatek,hwccf
> +  - mediatek,mux-opp-tables
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-mmdvfs.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        vcp: remoteproc@31800000 {
> +            compatible =3D "mediatek,mt8196-vcp";
> +            reg =3D <0 0x31800000 0 0x100000>;
> +        };
> +
> +        mm_hwv: syscon@31b00000 {
> +            compatible =3D "mediatek,mt8196-mm-hwv", "syscon";
> +            reg =3D <0 0x31b00000 0 0x6000>;
> +        };
> +
> +        mmdvfs_opp: opp-table {
> +            compatible =3D "operating-points-v2";
> +            opp-0 {
> +                opp-hz =3D /bits/ 64 <100000000>;
> +                opp-level =3D <0>;
> +            };
> +        };
> +
> +        mmdvfs: mmdvfs-mux {
> +            compatible =3D "mediatek,mt8196-mmdvfs";
> +            mediatek,vcp =3D <&vcp>;
> +            mediatek,hwccf =3D <&mm_hwv>;
> +            mediatek,mux-opp-tables =3D <&mmdvfs_opp>, <&mmdvfs_opp>,
> +                                      <&mmdvfs_opp>, <&mmdvfs_opp>,
> +                                      <&mmdvfs_opp>, <&mmdvfs_opp>,
> +                                      <&mmdvfs_opp>;
> +            #clock-cells =3D <1>;
> +        };
> +    };

[Severity: Low]
Does this example pass make dt_binding_check?

The remoteproc@31800000 and syscon@31b00000 provider nodes use undocumented
compatibles ("mediatek,mt8196-vcp" and "mediatek,mt8196-mm-hwv"), causing
syscon.yaml validation to fail on syscon@31b00000.  Phandles in examples do
not need to be resolvable, so those unrelated provider nodes (and the outer
soc wrapper) can be dropped.

In addition, <dt-bindings/clock/mediatek,mt8196-mmdvfs.h> and the "mmdvfs:"
label on mmdvfs-mux are unused, and DTS coding style requires a blank line
before the opp-0 child node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125060037.6496=
59-1-echo.zhang@mediatek.com?part=3D2
