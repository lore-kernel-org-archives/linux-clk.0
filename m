Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558358;
	b=C9SXfwpQ8M5DA3icNb1Rp+qsPdaIWI9VzyRyeURiFR7WD3syff7T8TJi1ddX59ERePo6
	 Mt3WAkgZHG2j3Z1/uldP44cMZIi5i7rErJ7/9bSJxIJfMFVB/BySlWYbcQ3Q3N0qA66ld
	 RX0Ptdfc6AWOrvPb/JSylUTQ3UHzoBiiAT9lqC6AGViWz5H0gBML4l7oZVMLR/S7kLs9n
	 ShDqjatKV63Qu20tY3rixeXy/IyKR9X6Vl5ROvaAkzHY/7rZrQ7sjvng7AA853E5qZapm
	 DKQ36+Un9mRGbROk9uO7ADYjJW9/ReW9jvZvNRCWFSkmF5waQ2wbg6nIR0MO5c2scdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558358;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FGbd/iu2bJV8eXi7tvqHXFX25ugqVjT7gk/mtRxAUdY=;
	b=dAvAw2kLCl8LMWPBiFT8rdWBen1YJleGEWOqc3XhEYm71u95uybVUcdsEv86RCazab2/
	 zt15B2MghdX1gPzZrymSdAL5rfVzm6iJaHLJNmhCVn+NFrGxouYO8h6XirLQPodi2oVRf
	 Ik6bUYRJ3+uE1ZlBMvyIGDg8ZSl+khZt0XgSdk1KC2WZL/gxu3vj5Cbc9Ew3RUmWcxrlH
	 NQYjfpCAWdBYXNYUT2gJNH++h0q0QerMqnXW62As5nJ+5kc4sTfc0C6s48wcI3LdymjOm
	 uf93JEuLsOSy5DbPxoevAKCVoT0NFVwQms85jidLBMLDV0MYnEogRN8y3Iy/ypCGzhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S35aIuAu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82E606A31C;
	Fri, 13 Nov 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S35aIuAu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BB61F000C4;
	Fri, 13 Nov 2026 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558358;
	bh=FGbd/iu2bJV8eXi7tvqHXFX25ugqVjT7gk/mtRxAUdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S35aIuAu1fbIotDQ7NLNQELFhwzIYjYRBbiXmfpAugW8LbxOBgrJhraxGTYQ3EJLk
	 15yXnxv0eNYTfOQnQW1TARXkZrEpSMMuBD4wSNc/0NddaTsDWuvh0oAMb7P0FNS+Pr
	 kVGFwIrmxWiECrg5SLBCYSifL0rkmM7egttM5X9jCAgvWcoJ11rVKovC3CtX+t2JsI
	 msf/5IWKsQeW6MtoSa1q4BFK0lgJHeX6ubLx2KdZLQAeb7vxWyAq82HTfKla10YZ3m
	 XJaWJAOlScUKZinJuR7P4lj6yyD9EU4kwnFAhMs8nuXpTtKeNK+ARSknELYXztMnB5
	 /NMA0Y2N+kAOQ==
Date: Fri, 13 Nov 2026 09:25:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: st: add LTDC pixel clock controller
 on stm32mp25
Message-ID: <20261113-mottled-maroon-marmot-b45b14@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-5-624559bb8ec7@foss.st.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-5-624559bb8ec7@foss.st.com>

On Tue, Nov 10, 2026 at 02:10:25PM +0100, Gabriel Fernandez wrote:
> Describe the LTDC pixel clock multiplexer of the SYSCFG as a
> clock-controller sub-node and use it as the LTDC "ref" clock instead of
> the SYSCFG node itself, whose deprecated "#clock-cells" property is
> removed.
> 
> Only the LTDC kernel clock is available as parent on STM32MP251; the
> LVDS and DSI clocks are added on STM32MP255.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++++++-
>  arch/arm64/boot/dts/st/stm32mp255.dtsi | 8 +++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index dac3d2d23ff0..8d644153dbcb 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -4,6 +4,7 @@
>   * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>   */
>  #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>  #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
> @@ -2076,10 +2077,16 @@ exti1: interrupt-controller@44220000 {
>  		syscfg: syscon@44230000 {
>  			compatible = "st,stm32mp25-syscfg", "syscon";
>  			reg = <0x44230000 0x10000>;
> -			#clock-cells = <0>;

DTS with this was already released for a year, so you really should not
break its users for no reason.

Best regards,
Krzysztof

