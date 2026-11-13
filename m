Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558296;
	b=dyiEO8VzP0anhJzau7ZOar9OqkR9NPuwyweynsuC4pWJSdaqjLCngMVonYlptqnwpQID
	 +NqfXVPlTUW2XB2hEMHZHoILXZn1zPlyNy9sdtlHM21PnHop144XKACnay+sE3wYnLvWo
	 2lHlHQn0Ja7QgNPwvvmZy0cXBSvjIXwNwfrB/r5ATpAhYb/zZHXSQw7qhc+c8gm6KaCpY
	 uy51MLSV8wf3/mf8NeBwrO2x/kUC7VToO+sLdzTupIQSf9Qtl7bJCRL/S6x79+K6GbzID
	 +t4Y9KKxGR0Z8LiutJctz8YUHlFFYf9lroo3Q61evkPL30gkVscHR33S1ejVRIvZ5cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dUJYjdN1mbViyPCa9Ii5oLF+ArhVXAoKywBoKaNLkG8=;
	b=T5andkQD5jPRnMQbYqgGLPVGUuq+DD8UHkFtXJyuiuaZAfF001KWUv0MIGo9+Rc/G9iK
	 gVbsMuM4DOMnQx+DZWqnsfPl4UMCGXKz/J+oarGJeel4exYBZCi27z8+Xsqy57dUJqUVb
	 sBT8hrj534D5LJlLO9u9byTdkJQzNN6Zq331laI/wyBghxws9hBG/t3jipvMx38XOqhE7
	 SVm3cSyLyok/ntb9OpakmCVH6OI9VPfjmGIAeAcbLJCLb8vonO4tmlKoph489CiLWwB+w
	 XiA8i/eV9pnl6zstKufl4n9KiFOO9lofRow746fSqFaS486TkoqkWa3sHxBo5wNYUCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpi3rK7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D5606A327;
	Fri, 13 Nov 2026 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpi3rK7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095351F000C5;
	Fri, 13 Nov 2026 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558295;
	bh=dUJYjdN1mbViyPCa9Ii5oLF+ArhVXAoKywBoKaNLkG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpi3rK7vqXLZnf+x3lbCmQPmVELMx4JG82zA5/Hdy2qRkz7G25g8TetmxTnp0J+g5
	 J5fggYQBkJ2J7YtpJD+0slSLVc9jhp/3f5+3W0L/kfnG1EsCd//PkUDNV+rrDmv8fV
	 dMVHLqwNS6LVC/h/eKhTtcAFRbI2XzA3IXVB4PDlsAf5LZ+L5EqPiF40ZGLQb6VGVA
	 TNjm5lmBTBZih6Mjqj2GOjBWolMOfqQYW07yEGIxHnLuG6O9ekezESLSQ7vtWW6lju
	 QX5U4BZVKKdi2+zo3BDtXXPjjP4MRGr+M1BYI+BNDg2ces8+9/eyPhRECki3AQswUx
	 d660E13XTDiZw==
Date: Fri, 13 Nov 2026 09:24:52 +0100
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
Subject: Re: [PATCH v2 4/5] arm64: dts: st: add LTDC pixel clock controller
 on stm32mp23
Message-ID: <20261113-ape-of-inevitable-research-df4777@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-4-624559bb8ec7@foss.st.com>
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
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-4-624559bb8ec7@foss.st.com>

On Tue, Nov 10, 2026 at 02:10:24PM +0100, Gabriel Fernandez wrote:
> Describe the LTDC pixel clock multiplexer of the SYSCFG as a
> clock-controller sub-node and use it as the LTDC "ref" clock instead of
> the SYSCFG node itself, whose deprecated "#clock-cells" property is
> removed.
> 
> Only the LTDC kernel clock is available as parent on STM32MP231; the
> LVDS and DSI clocks are added on STM32MP235.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++++++-
>  arch/arm64/boot/dts/st/stm32mp235.dtsi | 8 +++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index fefbf6f4f153..df446f0c1539 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -4,6 +4,7 @@
>   * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>   */
>  #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> @@ -1121,10 +1122,16 @@ exti1: interrupt-controller@44220000 {
>  		syscfg: syscon@44230000 {
>  			compatible = "st,stm32mp23-syscfg", "syscon";
>  			reg = <0x44230000 0x10000>;
> -			#clock-cells = <0>;

This breaks users.

Best regards,
Krzysztof

