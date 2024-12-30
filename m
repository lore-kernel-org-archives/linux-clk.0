Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC4156C6F;
	Mon, 30 Dec 2024 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545280; cv=none; b=pFKn9xZKfVZtSE8Rju1ryb5HqQ6nA+Sz2DA2l8ZJgk+FNqCXrqFqm/s3+w1ZaxB8PMP7BcsGfnnhuGmDbDcdSeuRzqN/cD3A/MRZfdEaUGL6LgGyxaD6Ctzvc0qcIBQ9QpFqHC9N4ikf6Z/Fw6QwHrpzMaqkwHnEJpp02C+FURA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545280; c=relaxed/simple;
	bh=183EA7MfCyWxhhzwpT8mT9bghaFpDjOqGIviGpm0Xd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+pUuwzKVRKaxTVZRrdQxpBtaQ/NpKL/Bf4xdix9N/0cHNj5wGC11q3jF21o8go6nfFVFnE8MZuG/FHVjpVVuL0qc8s/nCkDVquCy1t9STs2gsQOP+sjntpJ7NK3Nly9GJtnvg2Vq5hK8YgxLtC0cLx9zdcEmQEqtI5alCGvE+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvlVmJTP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvlVmJTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAD2C4CED0;
	Mon, 30 Dec 2024 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735545279;
	bh=183EA7MfCyWxhhzwpT8mT9bghaFpDjOqGIviGpm0Xd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvlVmJTPsEilkeHz2NgEIfo56yDGjFOw+rqKFtEMD86H+dR/pquZbRjNMjMNwmywS
	 K9yF5bxbhXPdF4q4tY0T7Lt6JQWpjiaw6Yp1tAbTrfOgdQjoLgnbRWe1RgFXk1pDm5
	 hRx3n0d+bs6BTXkYSQ/eRZcfT50IbBnazT9lXA5XgqL7Y3QM03LIypZlTa4HA39glp
	 e82iS08bcaoD35Jg5mnILgrJzD+knjtIecoJ3E3huzy/BE03zeou3jhBfFGpS4U+iE
	 ZljgEhmXkp18UNHAvrFiF2h/fj9tSvzRFWu0bEY/Zn0vKaPrYpqZGV4U63YeoLnR1S
	 lk3MYOa9OLJuQ==
Date: Mon, 30 Dec 2024 08:54:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>

On Sun, Dec 29, 2024 at 09:21:08PM +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+)

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffd4e0b052455bf3dcedd9355d93764119df3d68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  clocks: 
> +    const: 1
> +
> +  reg:
> +    maxItems: 2
> +    minItems: 1

List and describe the items instead.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x1000>, <0x91100000 0x1000>;
> +        #clock-cells = <1>;
> +        clocks = <&osc24m>;
> +    };
> diff --git a/include/dt-bindings/clock/k230-clk.h b/include/dt-bindings/clock/k230-clk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..31d1f82fbcff654072ef1a8985a884377d801e72
> --- /dev/null
> +++ b/include/dt-bindings/clock/k230-clk.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + */
> +
> +#ifndef CLOCK_K230_CLK_H
> +#define CLOCK_K230_CLK_H
> +
> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
> +#define	K230_CPU0_SRC			0


Drop the indentation after '#define'

Best regards,
Krzysztof

