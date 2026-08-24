Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAAA2773E5;
	Mon, 24 Aug 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573473; cv=none; b=NWyLpzkpwvCRDygR6vHRiDtXYWMw5Obp/tUVYuTZ0TWfqAhjpMZpYt2hUJz8zbXEyIeQJ/wlagVzRO1a28MaqxGbbBP0XZrM+67+Z368mL+vSRWfNX3FEJGN/Zt57CHy21MZCPs+QTJneFrYW7pyhBt7BpEYdJWT+rCIpQ4Zk0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573473; c=relaxed/simple;
	bh=HBqBtx03DyS77P0Lr8Iq1mt0MoblCio5RyNkRJ9lzA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sjqd45dguaIlmFAB3i9xaHpRf6o6pPQRQ+ODg2UWQMu8kwTDtXcge9pGDK+sVmQ3fk7MtKxFqmRvrluRJ+BXAtQPR3v8R8k5xLjwsJqrnfJP2Tlwr/a6isd60x1l0BZRq/AZ3djL5HdPqtUiGZyzIPD+ABemZ/z5GkBCTtWN5ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKNKn0/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKNKn0/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2EC1F000E9;
	Mon, 24 Aug 2026 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573471;
	bh=nD+z/tCnIL5W02NVDJ+ly6WhRtArbHfV8KeHRdioBjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QKNKn0/YJKeS5YuEwp6zWlbLZIhb/P0OlIIHONcVnJvcVGqGkOgSuM4W0KWdmNm8Z
	 QB32vIotEX71o85McV8XjrsUeplJU3qWu0aOPi2s9ruU/AmN8jOJ3bJ+r1nHQUr6U0
	 ZowWR+dYj7bDnBqvaWD3Z/S7hBq+86qIJwh7KVC/BtHh1LtRtYZaTupz4j7t3diVvk
	 u6vgAbm/wdkkRQh0yY2/9Cabi9IRX1sA7pVyATVwfXaAUVe0TdYmzM9T+2Rtp6QWzF
	 CjkpGlT0ny1vPK7nEStqZ+AUR8GvvUZKdg8QWk2deJAG86CH+MNOlqNJqrQoe+Ewu8
	 UJjEWgOa95+Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/47] dt-bindings: clock: qcom: gcc-sm8350: Add CX
 power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-4-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-4-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:11:10 +0000
Message-Id: <20260824121111.2D2EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DT binding example includes the legacy `qcom-rpmpd.h` header in=
stead of the correct `qcom,rpmhpd.h` for resolving RPMh power domain macros.
--

--- Patch [4]: [PATCH v3 04/47] dt-bindings: clock: qcom: gcc-sm8350: Add C=
X power domain ---
commit da9ae2ea7784410b1afc05b6fc669ae089286661
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain

The GDSCs provided by the SM8350 GCC are supplied by the RPMh CX power
domain. This commit models that parent domain in the GCC binding and
makes the CX power-domain entry required.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> index 97ffae3b55227..d249b1574e0f6 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml

[ ... ]

> @@ -65,12 +71,14 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>

[Severity: Low]
This isn't a bug, but should this example include the RPMh specific header
dt-bindings/power/qcom,rpmhpd.h instead of the legacy
dt-bindings/power/qcom-rpmpd.h to resolve the RPMHPD_CX macro?

While dt-bindings/power/qcom-rpmpd.h transitively includes the correct
header, relying on the legacy RPM power domain header for an RPMh SoC might
provide misleading documentation for developers referencing the example.

>      clock-controller@100000 {
>        compatible =3D "qcom,gcc-sm8350";
>        reg =3D <0x00100000 0x1f0000>;
>        clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>                 <&sleep_clk>;
>        clock-names =3D "bi_tcxo", "sleep_clk";
> +      power-domains =3D <&rpmhpd RPMHPD_CX>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D4
