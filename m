Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250361;
	b=Cr1IFRYTKgEtnpCnXgdR+mh6B8srmRGifqntuE0ZyioGDNe72vMBUxuy+5MHa1i6Z2eI
	 egRdGAM65SpbpmpwhJlShV5vrNGdMsHtP68CrG8yai+MrZ4cWJEPijQGvbhKrth9rh9zx
	 jVY/vU2A2J07wpU24vFTdtz+DFP9kGV042Gx03gN/Ac+mvZnzOxYXMVpC+yNe607nxdZ4
	 2mfjJM+oskueQuTYxXCi66yqCGgAS0/CL7JjQMyS7v0CN4UW0ytgcyUb/GHPoCnmiGXDO
	 +ozdaddmDkYxUgM0dArWFLeEuI9pSRq/OcoHrQHs0I1nFVBaCVOtSXXLTdZa2f2PPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R4JwZ4xBL1UAJFNXAaHFlbH18MpWADe9cT+VMUYVjew=;
	b=dfWuy4EpZazGO3G2nUF7ooaY65JXVA6nEhLhum86VSTNYk48ZGRVNYrG24arVJIOvseZ
	 oYu2saZCvWq3mQ2qq3XJGvu835bjD/Aa2MclWGTvwNHHmLTl9Rnq/fuFisEQkc/t5IjQ7
	 VhQjBkcELKsTucd5b+ZtH7GL90EQVjVF0YT9CdvqJsvagT6oMir3/wG0JL+u8D6NocIXG
	 8p9tZKau4z0Yz11ucANWgwU0d3gSqT2axTeJZYlG278YlWhqK5b2OSfND6FARPt+yRCzy
	 +QZpNjAw2uGKzNdRFCvODdzqyROSJT+G8woY7I3VKTqnUC91UTB5lngtvMCbEUFprpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETCMs8ox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB1606A31C;
	Mon,  9 Nov 2026 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETCMs8ox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77BF1F0089F;
	Mon,  9 Nov 2026 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250361;
	bh=R4JwZ4xBL1UAJFNXAaHFlbH18MpWADe9cT+VMUYVjew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETCMs8oxIUeCb/SaZhVdN8FDrxkNl5zjs491MHag/tLAoL0jDahc5T6/m84s+Gcce
	 Hb1l7I5UjGE/EkNzCYuH3M0yaobD8Wm+6SvcApFU4TOqLlhaw9NFX5y8x7c2ELHqJF
	 Q4tbKZ67p696DXUBwmB9NTBo9BaaLd86JR1AhTlN5WR1Jj3LLm0enMKxhpGTBLTfxg
	 a1RqEeboJgtl6+TY9gIz88QBZGdC8o0P8YtsX7iOAfnFjR4otyp4aWoJ3FoRqRt5TE
	 gB+xM8vHmr5IppcFV0KNtmL6F/Uzy6vxFO0Op+wAHeCfPFDbjttUx+9ch5QxGJ2q4K
	 8Ds3GeazRCeeQ==
Message-ID: <sashiko-outbox-205445@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Convert hisilicon,hi3519-crg to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109184453.449141-1-robh@kernel.org>
References: <20261109184453.449141-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:52:40 +0000
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
- [Low] dt-bindings: clock: missing SPDX license tag in
  hisilicon,hi3519-crg.yaml
--

commit 8c68b5566e3d58eaa450c64590a34c88cc578c96
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: clock: Convert hisilicon,hi3519-crg to DT schema

This commit converts the HiSilicon CRG binding from plain text to DT
schema YAML format and updates the allowed compatible strings.

> diff --git a/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg=
.yaml b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
> new file mode 100644
> index 0000000000000..c0b7a5521fe3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
> @@ -0,0 +1,61 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/hisilicon,hi3519-crg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[Severity: Low]
This schema file is missing an SPDX-License-Identifier header on the first
line, such as:

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Without it, dt-doc-validate (via make dt_binding_check) and checkpatch.pl
report a validation error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109184453.4491=
41-1-robh@kernel.org?part=3D1
