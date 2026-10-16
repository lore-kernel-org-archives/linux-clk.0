Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF2296BB5;
	Fri, 16 Oct 2026 04:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125684; cv=none; b=GUX2q1sVvrFpDDzGLFWQS0xVF1Goh1FXj5afnKaam8X6wgSnh+5ZxrkGboDkmIM3KvR75j1FIy8F1Xi74Pzg+9wHe0RMAatKkQnkgkEkZTXsXfxHt2h8sT7JnXdj8VOrUTWmMzzaX9gxKJ5GeJcGQdVQeXBhYgRL1KlW/fGrry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125684; c=relaxed/simple;
	bh=0z/QdXawNlH9DT5d/D4IghSeQI6vOPtpKASdEs13pJ0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Nj1LBur/74LyfVR0ZhgevBxniMmXmJ/LMsVenJ9h/nY0KTemGbK3LzqkDQ9qp3DyzD2keCdTWm1LjxRCdP4SSmNsNFfGp24FcjW2Miz6dJHAEdcAS7wUTe8AG6YwE58uOOfyBPwSA6wNy9Pvi8Wh267xB2u1/j2g+E5laW4rnRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTSu2tQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTSu2tQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81F71F000C4;
	Fri, 16 Oct 2026 04:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792125683;
	bh=LfE6TOFt3U1+7FuQQ1jaXHSENYMyWiT94IvJWMio9dU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FTSu2tQ0ZK5Lg2p3/LkgKST1CiTCehMVE6/tEtPwweGJ7DoUAk9FkAM6A2FYhdxV1
	 czvxLDQ9Ni+Y7lx5n6MjdVsJyQgUQ0X8hOLponxmTDVqyaDea5bPnUnpMiiQM+zs/t
	 l0P0BtRyghtPTNI1caerEdeH+N45bKTeOxY5fx6CClnhuDu9/WPE84fbp727e9LKm6
	 1rxrce7XAnViVRImQxXG7N0nwezEEwTJOcHYmtTqyBi3tPkiU3pzYC3j+TSLay5Hxb
	 F6EGPrzGXSerWekvp0Om1vEXs6Qz7DAHiyL9WOr+Ocf+ycjbbJuEc3zGOR5z6mGAG2
	 8tIocm4k9R0Lg==
Message-ID: <sashiko-outbox-173796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/5] arm64: dts: qcom: Add SM7250 devicetree file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016042432.824-6-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
 <20261016042432.824-6-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:41:22 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: incorrect cpu-map topology for DynamIQ
- [Low] dts: unused qcom-rpmpd.h header inclusion
- [Low] dts: empty ranges property with mismatched cell counts triggers dtc=
 warning
- [Low] dts: cpu-map core nodes incorrectly numbered across clusters
--

commit 44af3970816d0373bee16d99b2e8e2afd4954505
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 devicetree file

This commit adds the base devicetree file for the Qualcomm SM7250 SoC.
It includes basic nodes like cpu, psci, and other required configuration
for booting up to the serial console.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> index 0000000000000..48480e6855f0c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,771 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm7250-gcc.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>

[Severity: Low]
Is it necessary to include qcom-rpmpd.h here? It appears to be unused.

The SM7250 SoC relies on the newer RPMh framework, so only the definitions =
from
<dt-bindings/power/qcom,rpmhpd.h> are used (e.g., RPMHPD_CX). Does this code
rely on any definitions from qcom-rpmpd.h, or can it be removed as dead cod=
e?

[ ... ]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +
[ ... ]
> +
> +				core5 {
> +					cpu =3D <&cpu5>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core6 {
> +					cpu =3D <&cpu6>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core7 {
> +					cpu =3D <&cpu7>;
> +				};
> +			};
> +		};

[Severity: Medium]
Does splitting the cores across cluster0, cluster1, and cluster2 accurately
reflect the SM7250 topology?

The SM7250 uses a single DynamIQ cluster where all 8 cores share the L3 cac=
he.
By placing the cores into three separate clusters in the cpu-map, the Linux
scheduler is told that migrating tasks between them crosses a socket/package
boundary, which artificially penalizes cross-core migration and prevents
optimal load-balancing.

Should all 8 cores be placed under cluster0 to correctly represent the sing=
le
shared DynamIQ cluster, similar to other SoCs like SC7180 or SM8250?


[Severity: Low]
Additionally, for the secondary clusters defined here, should the core nodes
restart their index at core0?

Devicetree schema (cpus.yaml) requires that core nodes within a cluster be
named coreN where N is the local index within that cluster. Continuing the
global index (core6 and core7) instead of starting at core0 will trigger
schema validation errors when running make dtbs_check.

[ ... ]

> +		timer@17c20000 {
> +			compatible =3D "arm,armv7-timer-mem";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;

[Severity: Low]
Will this empty ranges property trigger a DeviceTree compiler warning?

The parent soc@0 node uses #address-cells =3D <2> and #size-cells =3D <2>, =
while
timer@17c20000 overrides them to <1> and <1>. The DeviceTree compiler (dtc)
enforces that an empty ranges property can only be used when the child node=
's
cell counts strictly match the parent's.

While Linux's __of_translate_address handles this gracefully at runtime by
zero-extending, this mismatch violates the Devicetree specification and
triggers a ranges_format warning during make dtbs. Could an explicit ranges
translation be provided here (e.g., ranges =3D <0x0 0x0 0x0 0xffffffff>;) to
fix the warning?

> +			reg =3D <0x0 0x17c20000 0x0 0x1000>;
> +
> +			frame@17c21000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016042432.824-=
1-sreeshankar0910@gmail.com?part=3D5
