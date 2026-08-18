Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1A3C0A00;
	Tue, 18 Aug 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049418; cv=none; b=HUjY9nnR0hy8vDvwH6uWxmPj6GmQ1ghXloLIM+1RAkDSYux8gEDJKVFN7Wd+DDu2a2ihM7pC/jOOs7D26T1GCgMGqea1AoWQ+ZRGqHwJu2xLagwWCHMJbBc+mF9zgn/FTFUq8coPc4w5j+HzYdxxLMtq0g1UVq0vy3jiCUfrgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049418; c=relaxed/simple;
	bh=WqGUzcxwBevyP550/rU1RllWg6pDgMR/P5bygynUXeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rld8QhEFw3eoe3SX3ZUTAjZ06BvG6wIori5yKjkhaKu+WkXSkcURV1MRVPoeihfWS/YqrrBgUzmhfFOGoEd/vTdI+Q6wm4ILOz3w0J7dD+fV49YapjyEidA1f01Uz+O+ZqoIecj9aegX4Y9hWj1LCBgL9kdVcwBhiydlTbszifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzmpfKhq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzmpfKhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE76C1F000E9;
	Tue, 18 Aug 2026 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049417;
	bh=yYgFbISfvXT2AitiMM/8Qn1omp6j78sPt7NLmvhriU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzmpfKhqpkbpMHaHN6QKRq6XkwO5zEf4igjU+ZWC/pAifdvW8o+PtAuadCeHEswS7
	 l1m4EvQftirsvktbT0d/30r+2/S87W8mACjbJmCGaqvxZnxzxiwZ6M4s6hWkk/6Sos
	 MB2bEed6Av38gpmvuiY6I172JgR0vdTtU5Hd6JOeZxzxjj6dr5J0ysmiICsah+rta6
	 BzzdtHon364kH6G8ayYNXQOZKnN/28OGebLJpY1O4GPrs4rwJCnpC/i0JidUonXhPG
	 hJHLz1w4GtV2Ptze6s+rkVasCSM5n+SajwsQojBP40tN1WjoFZ0raOJ7POthYskseu
	 Aa1shAqAaMtDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/12] dt-bindings: clock: add Ambarella CV75 RCT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260818-cv75-v5-v5-3-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-3-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:36:56 +0000
Message-Id: <20260818103656.EE76C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Device Tree binding intentionally omits `#reset-cells` for a=
 hardware block that acts as a reset provider, violating the core DT princi=
ple that bindings must describe hardware rather than software/driver suppor=
t.
--

--- Patch [3]: [PATCH v5 03/12] dt-bindings: clock: add Ambarella CV75 RCT =
---
commit 74b3b598f48fd3b6837b5a870e3274a514495c94
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: clock: add Ambarella CV75 RCT

This commit introduces the Device Tree binding and clock ID header for the
Ambarella CV75 RCT block. It currently describes only the clock-provider
functionality, intentionally omitting reset properties.

> This initial binding describes only the clock-provider functionality.
> Reset-controller support is outside scope of this series, so #reset-cells
> property is intentionally omitted.

[Severity: Medium]
Device tree bindings are expected to describe hardware rather than software
driver support. Because this hardware block acts as a reset provider, should
#reset-cells be documented and allowed in the schema now?

> diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.y=
aml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> new file mode 100644
> index 0000000000000..eb5956fc32bc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false

[Severity: Medium]
Because additionalProperties is set to false without defining #reset-cells
in the schema, any complete device tree node that accurately models the
hardware's reset capabilities will fail schema validation.

If #reset-cells is later added as a required property when reset support is
implemented, won't it break backward compatibility with device trees created
against this initial schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D3
