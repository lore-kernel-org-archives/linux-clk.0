Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751902;
	b=OGlZJ+XMnTd3FWgScBJnU2q0RBjHIo55+Sh4CLq4f3JNKVSp2smme6wo8C568OdO4Rs0
	 CKWpRjxCUzc0Ps63pdrPB+Oj3JwnEvnFeABo6zrq5+iKBFGj+ZT8sS9Ka4Wj/WW7h5IL6
	 u/MpanFiZZPCX40YhrwCYGbnvSPkXbYnJzQ8RHO6/UsnPHjEWh8CPwLo3PKC52geuFN1W
	 dHDdPXYfhVwxgdv2P6eneH46E97bJj9IV+MdaoiZRgPFAhGgjxQeKMWZ6aAm9DilK9ROV
	 1+NqqPpP5uJPdx2MmazQe2/NzsokeFFTBxYK4wlBTCkPevEYQ4kg0donjqN8QiSZGWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751902;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KFQUt0v3gEVvXvqowfSOoEfmhjQe6voR9s1T4EXAb7I=;
	b=AnbvBNcUgjNxJDxW7WMNzIpLp7evDz3oXl60uHszNJIJBnCXwuksVezxs9GVuWqmllYm
	 b7XgaOCpha4w48+Mpvj9vbXQcB/KC5VFDVnRK2n0h0MiYoVYpZyyGfcv1yj75GwDBEcFF
	 DbJpqqn2Swk0QdtMfyykp+xRh+W0/wE8nTSXvAC5+gALmJbu76bZRUmxMSBQ+PS7tTxnJ
	 tuvN5XFPj44UJtNbHjs3R+cdByosZT8eWgD65iWf1DlusyhO5okMxz5q5Knfb3pXKdtay
	 zsIQTcWnbbQGxtam2XIbJU2hzLMEbY9piYJ3j9/goFMpMOitZK3MvIlxHh+53IpwzuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eD7szKvZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC72606A31A;
	Fri, 23 Oct 2026 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eD7szKvZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D661F01825;
	Fri, 23 Oct 2026 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792751901;
	bh=KFQUt0v3gEVvXvqowfSOoEfmhjQe6voR9s1T4EXAb7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eD7szKvZy5uB3mY+Am+IpljFH4qlqEbIyngoviSS/o4NuTVF5hVmIGinvzWOTmcQB
	 yACZvB5s7IlPVAC46eQeg+ZHnfTT4TzgYvoD8pD1UBg9oJ+QGkVzuAolEdHlgK7mJU
	 HXqxG726EaMVNH8/RG7k4liKrdL53YwTda43iBMt+U+PKjPu/ueaT7iDRZk8F0f688
	 Nx3HjlgjtLLFywe8ljQHaov2nr70Zo8VppjuD59XU1AD4XcTlGAaw2FHKPPYfbMZAl
	 PpYzre+IdJuBMesEgmCm8z2LTHf5GYiClevNv1gTPUfmsj9u4pIYn74GJmWSEzoMRC
	 zofPi2NqMg+Gw==
Message-ID: <sashiko-outbox-182697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Document the SM7250
 display clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-dispcc-sm7250-v1-1-07bdefb99801@brar.si>
References: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
 <20261023-dispcc-sm7250-v1-1-07bdefb99801@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:38:20 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: clock: qcom: duplicate SM7150 DISPCC schema and hea=
der for SM7250
- [Medium] dt-bindings: clock: qcom: missing #power-domain-cells in sm7250-=
dispcc required
--

commit 38f912b989d9f04661892eb5bd0bbd2206b4f767
Author: Ishu Brar <patches@brar.si>

dt-bindings: clock: qcom: Document the SM7250 display clock controller

This commit adds the Device Tree binding schema and dt-bindings header for
the Qualcomm SM7250 display clock controller (DISPCC).

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.y=
aml b/Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.yaml
> new file mode 100644
> index 0000000000000..684aaf7bb6b48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.yaml
> @@ -0,0 +1,73 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: qcom,sm7250-dispcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board Always On XO source
> +      - description: GPLL0 source from GCC
> +      - description: Sleep clock source
> +      - description: Byte clock from MDSS DSI PHY0
> +      - description: Pixel clock from MDSS DSI PHY0
> +      - description: Byte clock from MDSS DSI PHY1
> +      - description: Pixel clock from MDSS DSI PHY1
> +      - description: Link clock from DP PHY
> +      - description: VCO DIV clock from DP PHY
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      CX power domain.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#

[Severity: Medium]
Should #power-domain-cells also be listed under required in
Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.yaml?

The SM7250 DISPCC provides the MDSS_GDSC power domain, and the example node
includes #power-domain-cells =3D <1>.

However, since commit b0ef3434da07 ("dt-bindings: clock: qcom,gcc: sort out
power-domains support"), Documentation/devicetree/bindings/clock/qcom,gcc.y=
aml
only lists reg, #clock-cells, and #reset-cells under required:

  required:
    - reg
    - '#clock-cells'
    - '#reset-cells'

Without '#power-domain-cells' in required here, a qcom,sm7250-dispcc device
tree node that omits #power-domain-cells will pass dt_binding_check
validation and fail at runtime when consumers reference MDSS_GDSC.

[ ... ]
> diff --git a/include/dt-bindings/clock/qcom,sm7250-dispcc.h b/include/dt-=
bindings/clock/qcom,sm7250-dispcc.h
> new file mode 100644
> index 0000000000000..907f4122cb19b
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm7250-dispcc.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
> + * Copyright (c) 2024, David Wronek <david@mainlining.org>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DISPCC_SM7250_H
> +#define _DT_BINDINGS_CLK_QCOM_DISPCC_SM7250_H
> +
> +/* DISPCC clock registers */
> +#define DISPCC_PLL0				0
> +#define DISPCC_MDSS_AHB_CLK			1

[Severity: Medium]
Could qcom,sm7250-dispcc be added to the existing
Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml schema and
share include/dt-bindings/clock/qcom,sm7150-dispcc.h instead of duplicating
both files?

The commit message notes:

  The header and the binding are derived from the SM7150 ones: the register
  layout is the same, but the controller takes GPLL0 from the GCC as an
  extra parent and has its own PLL.

However, Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml
already defines the exact same properties, including "GPLL0 source from GCC"
(<&gcc GCC_DISP_GPLL0_CLK_SRC>) as the third clock item, the same 10 input
clocks in the same order, and the same CX power domain:

  properties:
    compatible:
      const: qcom,sm7150-dispcc

    clocks:
      items:
        - description: Board XO source
        - description: Board Always On XO source
        - description: GPLL0 source from GCC
        - description: Sleep clock source
        - description: Byte clock from MDSS DSI PHY0
        - description: Pixel clock from MDSS DSI PHY0
        - description: Byte clock from MDSS DSI PHY1
        - description: Pixel clock from MDSS DSI PHY1
        - description: Link clock from DP PHY
        - description: VCO DIV clock from DP PHY

Likewise, include/dt-bindings/clock/qcom,sm7150-dispcc.h already defines
DISPCC_PLL0 as 0 along with the exact same 43 clock indices,
DISPCC_MDSS_CORE_BCR, and MDSS_GDSC, making
include/dt-bindings/clock/qcom,sm7250-dispcc.h a verbatim copy apart from
the header guard.

Similar Qualcomm clock bindings have been consolidated into existing schemas
(for example, commits 0e094dd19e04 and 67044b2df840 merging SM7150 and
SM7250 GCC into qcom,sm6375-gcc.yaml, and commit c984dde8f3f8 dropping the
duplicate SM8650 DISPCC schema in favor of qcom,sm8550-dispcc.yaml).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-dispcc-sm7=
250-v1-0-07bdefb99801@brar.si?part=3D1
