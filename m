Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69F4F30E7;
	Thu, 17 Sep 2026 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646996; cv=none; b=rHO7C84hkIZ5A627I9qzzdiI5AeCNByNhSWL0UhiSk+skT1aO0AR1go+ezJfpGjVvck4fDNEV1jlPSzVDU43r387wt1Asdgd+gmQd7vALhB8Nf+KeRAbZX5qAl/3mz6RbNqtWnOF0sUX2lAl4RLbllnjtuuQF6oFjxLvAnQyJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646996; c=relaxed/simple;
	bh=xxcKJzYz5MpYK9rfWWf8FbKol96Y5doUsvapmT1K2Kg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5aKsxVD+cTFxwK0851aJIECIQ91cCfp0r/HwRcMf8h6Xc7SQoxhJwNNIAOviTggWG9iW1wZ7tEemVl+CkVfSFJmPfkckBmCUzQWNZi5QbqQl3WnDxCS8OBQxUbkQlKipUj0QZYK2vKp7hntH2fbTFrMIzIZUGO+FXtW3KPh/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hp3hih1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hp3hih1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751AA1F000FF;
	Thu, 17 Sep 2026 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646978;
	bh=NuMmjUtH8MeD0UBjqSroVWr+MLxiJrOvGL2rz6HOf+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hp3hih1h7WJd03ZNi1SwC3dfvp2GgQL+aK5bW4uVWUMbLUjYyGFH4PcR7OcvicJCh
	 DP5v7EgfcWoiT5/2ObKJdEnJ8x64SN1xLsxZbDOLE9jAYlwTPpoEBMksGb/n4qk+u+
	 rcuQ9IUKqOR62s4Qn0N6eXkTIt/o6TIXN6axbstU/Rwsnbnd49MKT7q7wbv12gP1yQ
	 e1WfyjTJVbCzyvWKPK5zBL3UC1bu1j6Q1SCmD/jPfnovHyqhvnNzfXHOcZCrOahF8M
	 E0QHBzQMr4Gzav7XOYuGk82tLKT+BqfHfRuWiHBv5DOHnquRUHDX/aSCGerKpUPJs9
	 1c6QFF7e45v6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 CPG_SGD4_VIO_DP_{TX,OTHER}
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-1-4c72d4e086dd@ideasonboard.com>
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-1-4c72d4e086dd@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:09:38 +0000
Message-Id: <20260917120938.751AA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] abi: preliminary dt-bindings cause future ABI instability
--

commit db1a73966fe6909e57fbbac33c8b7f551e07a1fb
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

dt-bindings: clock: renesas,r8a78000-cpg: Add CPG_SGD4_VIO_DP_{TX,OTHER}

This commit adds preliminary clock definitions for CPG_SGD4_VIO_DP_TX and
CPG_SGD4_VIO_DP_OTHER to the r8a78000-cpg device tree bindings for testing
purposes.

> diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/d=
t-bindings/clock/renesas,r8a78000-cpg.h
> index 5851a29847f96..8c1a01e28ddbb 100644
> --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> @@ -12,5 +12,7 @@
>  #define R8A78000_CPG_SGASYNCD16_PERW_BUS	2
>  #define R8A78000_CPG_S0D4_PERE_MAIN		3	// FIXME Preliminary
>  #define R8A78000_CPG_MSOCK_PERW_BUS		4	// FIXME Preliminary
> +#define R8A78000_CPG_SGD4_VIO_DP_TX		5	// FIXME Preliminary
> +#define R8A78000_CPG_SGD4_VIO_DP_OTHER		6	// FIXME Preliminary

[Severity: Medium]
Does introducing these explicitly preliminary clock indices into the device
tree bindings header create a risk for future ABI breakage?

Device tree bindings typically define a stable ABI between the hardware
description and the operating system kernel. If R8A78000_CPG_SGD4_VIO_DP_TX
or R8A78000_CPG_SGD4_VIO_DP_OTHER are changed, reordered, or removed when
the hardware documentation is finalized, it could break backward
compatibility with device trees created using these preliminary bindings.

Since follow-up patches in this series use these preliminary IDs, is there a
plan to stabilize these definitions before merging to avoid long-term
maintenance hazards?

> =20
>  #endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-epaul-v7-3=
-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com?part=3D1
