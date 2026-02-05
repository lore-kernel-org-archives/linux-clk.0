Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AEC394487;
	Thu,  5 Feb 2026 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283423; cv=none; b=mt6GnC+E4bJxB5PiNUVY4gB5VRqpEf1QxEb2oyhhXRBqTqv3WXOxzbGDHBGB/5o/RWc+PfNmCuBrBws3r5RzTUWVRgCQkmlcBax5tOR38CGzKi5Gqvbnp1BP8B2j8b2IoaaC39lU10vivYYvlfyl8eWt8lyL9Cifdo7l8DpWThE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283423; c=relaxed/simple;
	bh=E/fTeLbfqctiMfvtIIsD2A13p3FJxkamI/aB67QXm90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhSklFQWF41MjQYilhjR6Bx4pRnKphG5wrC+sqRncR+Gp0hbrq3rPWr/NyczFczSSVTYq5PT74Oo4EBSCkrcddTeMsKvR+/fNcUZ9PlLQma3BVAkLOO1ENfcw2lECuZo1ULK8/pV6SQiXLDo4oQNq3KsQHDQebQmMc4uk+rcCy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZY0VV/Ym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZY0VV/Ym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1135C19424;
	Thu,  5 Feb 2026 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283423;
	bh=E/fTeLbfqctiMfvtIIsD2A13p3FJxkamI/aB67QXm90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZY0VV/YmQw9o3HykKI5oDkB8+0FGY59+TgUOhOg3fTxPl2mWD82zfitDPj8fnTgGe
	 iXePQbf1JmtXQyVZoEh18wv+dLiyc7Gwnlfw5BmrncDORENE68PpFIJ+s/qhDazbBC
	 z38/+ZW7yEEDn7kPx/vJ32EkCZF+NiK0Qz8dnRh4TnWBtZrZIKO7fc2ToqCR+bnVyz
	 H2DnFQMM9d1R9DKoJDzv+j0O3wynB4L+m231TkYQt0lzQlb/sVAXDHw3TtN1P8RU3l
	 y+Q/IyvvrWsFpC+AA3Ip2IIhnQWNzU1vFAfaODaK+2qbFp4pLGUZCzghYUxya2734M
	 tsUIKe8Vbjrrw==
Date: Thu, 5 Feb 2026 10:23:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>

On Mon, Feb 02, 2026 at 01:46:49PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated multiple times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 +++++++++++
>  MAINTAINERS                                        |   2 +
>  .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
> new file mode 100644
> index 000000000000..0f3e18f5ea1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml

Still wrong name. Look how is your compatible called.

> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tenstorrent Atlantis PRCM (Power, Reset, Clock Management) Module
> +
> +maintainers:
> +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +
> +description:
> +  Multifunctional register block found in Tenstorrent Atlantis SoC whose main
> +  function is to control clocks and resets. This block is instantiated multiple
> +  times in the SoC, each block controls clock and resets for a different
> +  subsystem. RCPU prcm serves low speed IO interfaces.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tenstorrent,atlantis-prcm-rcpu

Nothing in the changelog explained why 2 other compatibles were dropped.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/tenstorrent,atlantis-prcm.h> for valid indices.
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@a8000000 {
> +      compatible = "tenstorrent,atlantis-prcm-rcpu";
> +      reg = <0xa8000000 0x10000>;
> +      clocks = <&osc_24m>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8fe..0fc7bc6d0458 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22534,8 +22534,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/tenstorrent/linux.git
> +F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> +F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
>  
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> new file mode 100644
> index 000000000000..3820781127c3
> --- /dev/null
> +++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h

Still wrong name... Look at your compatible.

Please read writing bindings doc in DT dir.

Best regards,
Krzysztof

