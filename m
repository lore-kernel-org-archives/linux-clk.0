Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5E4367F3D;
	Thu, 11 Jun 2026 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163744; cv=none; b=lRRrNo6Opea/V2z7jiyTc1plkk6eLOO0QJNytItNbb+R+X5Ad/N6gdKUpgUJKreBFCWt5Aeb+pI9y6PJk5vdhROfZsxn4iwQoUBpCCDWyymqM6/1YxoqqIQN2eV8Zavso1JksGvlu40X/bmC7YwYeT3ne4HxWge3B5Q4YOBQpv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163744; c=relaxed/simple;
	bh=Y7KBfZD5DQHBGMMzc6u2sq3+VfCL6Fo7fCWIEQYW7ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lG0rbHVWstrSz/Tvf6K9xLXcKKLsTiPJs9OaLhIWT7STyqabsKOLGr6J/Nxcv16s44d15sufPFu15gpy0D+fryhY8Xp8299rfqheldr0KgZ02z514DM6BSVXJwH+hieOr31YdigUzdzm8rudjIWTJgBGpSFZHS9cqC0cJVJwPGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCp2cWJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCp2cWJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267111F00893;
	Thu, 11 Jun 2026 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781163742;
	bh=GfHjmALeSuAk8b8lLGyqi6fhpxEvnN4bOx0UqElVopI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCp2cWJiqRWgpB/BNvv79HOpoVV4VIpHSU6U7tGRxtVlSVxeckYlbOag//8OLoChE
	 3q8Fqlx4Jr9E5wtUgb7aChD49Uz9Rsq7xxyKfJcZyogIyMjJ04w7zJsA0kJBIewTZl
	 pU2lrXflp414X/EzBFAp9skrggETc2wzK7Ttx94XQBi5H+e9lZERPELsQH4kPqsurZ
	 CkakpoFvSGdg8J5e08ep3IpQqW6KcUewwJlwZ05ipwk9o/7u59XgQNg41LNaINc74i
	 COvSRxZHjiEW+OwWyh9uEpBoxBvV6ms1zGv/cr7mXSTOM0+RtSNt+Ew/lDCJP9n8kW
	 AK62cURfu4lcA==
Date: Thu, 11 Jun 2026 09:42:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Message-ID: <20260611-numbat-of-unmistakable-excitement-f6cfed@quoll>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
 <20260610075645.3581145-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610075645.3581145-4-joakim.zhang@cixtech.com>

On Wed, Jun 10, 2026 at 03:56:43PM +0800, joakim.zhang@cixtech.com wrote:
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss.h.
> +
> +  clocks:
> +    items:
> +      - description: I2S parent clock for sampling rates multiple of 8kHz.
> +      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
> +      - description: clock feeding most devices in audss (NOC, DSP, SRAM, HDA, DMAC, I2S, and Mailbox).
> +      - description: clock feeding for HDA, Timer and Watchdog, which is a delicated 48MHz clock.
> +
> +  clock-names:
> +    items:
> +      - const: x8k
> +      - const: x11k
> +      - const: sys
> +      - const: 48m
> +
> +  resets:
> +    maxItems: 1
> +    description: Audio subsystem NoC (or bus) reset line.
> +
> +  power-domains:
> +    maxItems: 1
> +    description: Audio subsystem power domain.

Same comments as last time, but let's keep discussion in previous patch.

> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +  - resets
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +
> +    clock-controller {
> +        compatible = "cix,sky1-audss-clock";
> +        power-domains = <&smc_devpd 0>;
> +        #clock-cells = <1>;
> +        clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK2>,
> +                 <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
> +        clock-names = "x8k", "x11k", "sys", "48m";
> +        resets = <&s5_syscon 31>;
> +    };
> diff --git a/include/dt-bindings/clock/cix,sky1-audss.h b/include/dt-bindings/clock/cix,sky1-audss.h
> new file mode 100644
> index 000000000000..033046407dee
> --- /dev/null
> +++ b/include/dt-bindings/clock/cix,sky1-audss.h

Filename must match the compatible.

Best regards,
Krzysztof

