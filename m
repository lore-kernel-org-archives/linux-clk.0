Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7A214A6D;
	Thu,  9 Jan 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413794; cv=none; b=YyX+slW8rLQHDBmWY8GxI+N3M1/tWDyG9Inbe0ex2OkrdUP1WdKWjmSMvo6EDYOqkTkjyHUTGK0v5ZJJiq25xqpLn6MbCbDbsATz2nB/FAl5Zk1PSYjxs/J8E1Cih/nMj7qEINSfdRGqKkrdPirYsexUmkm/+j6exIbvInsq7Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413794; c=relaxed/simple;
	bh=KL2iAg/uEyClQDiAdgHhgwp3Z+anv1P0HGVi20lgT+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rH6ibJfF0zcXpIhfvU157w3YiVBQy07qZqC0ZsuwGiNiqdBmFsDTeF9nkLTkMSFhTtt1NyiokIuBSbCGM0bVZynpGwybqITyzs6gLMrMsw8qBxpnHKP624/q0xU21pYro0v7fzQIDwUbM1DRBoh+j5Eaevpu1xSzMeqEhcocsh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WflDN4Nq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WflDN4Nq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85008C4CEE3;
	Thu,  9 Jan 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413794;
	bh=KL2iAg/uEyClQDiAdgHhgwp3Z+anv1P0HGVi20lgT+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WflDN4Nq4cXrmp4uPAoYzqk4UXbJses9w4LuKM1Deqf0GGuXoCtpgreOBXaFzbjQh
	 vBX4cz18tPfO3ViwBQLWF2Dv9QxtcabcAE5gpCVKpyAuolLKdYPBcY20ARunEXYiBc
	 KpvGpu/GBgy0Fz8Hy4JPYxL3o9iAf3YAHFUhGZtlk8qEd6Ygg0yNJFjnL59pM0sKsL
	 BAI6WYiFmSlygmfklrsFkl4dMaE1z1373Z32ACEaFoD+QsjuHQHkPXB6Y9ZWK//v8/
	 amJikE0EN7K3FYkeT/UJei94Z6j6NIgTia0LfLAeq5eLFgFpwqIONhSdalDYzXFY6g
	 JbtJzLLaCXpWg==
Date: Thu, 9 Jan 2025 10:09:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: canaan: Add clock initial support for
 K230
Message-ID: <ebj26gfkaypgtvi7o2ab3mfvcgc7yk4scdoxroftlp7lnx3xix@p3nnfiva3hdm>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>

On Wed, Jan 08, 2025 at 07:53:09PM +0800, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
> 
> The clock tree of the K230 SoC consists of OSC24M,
> PLLs and sysclk.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  arch/riscv/boot/dts/canaan/k230.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
> index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..c407471af3daac154e0fbdd377d57ea3ff4698e1 100644
> --- a/arch/riscv/boot/dts/canaan/k230.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k230.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>   */
>  
> +#include <dt-bindings/clock/k230-clk.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  /dts-v1/;
> @@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
>  		#clock-cells = <0>;
>  	};
>  
> +	osc24m: clock-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc24m";
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -138,5 +146,24 @@ uart4: serial@91404000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		sysclk: clock-controller@91100000 {

Does not look like placed in correct order.

> +			compatible = "canaan,k230-clk";
> +			reg = <0x0 0x91102000 0x0 0x1000>, <0x0 0x91100000 0x0 0x1000>;
> +			clocks = <&osc24m>;
> +			#clock-cells = <1>;
> +			clock-output-names =

Unnecessary blank line

> +			"CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4", "CPU0_PCLK",

Messed indentation/alignment. See DTS coding style.

Best regards,
Krzysztof

