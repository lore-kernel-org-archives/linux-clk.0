Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547787;
	b=SoCCkkkX/ebrWuGxZPcqVgKlP0iB6w7omiUrwGiup5fCYImjbMsAQf9mvNPDYlw5rVYr
	 8wlbTfCgJV9Zt2M1i9GenWjY93+Jej+FyG1gPeKZFXCojD1vihjL/o684ITWNRkycRYYY
	 P6LaAi2kBY6qaoTAWPCpdeDIQFo+Xo18vzi/ii0DNaeDSVUXTOLV5/EIg+Z3rydFRKkrl
	 9AoaCrhCLPXsyxcJBf5i+L/maQYZVJCt6l3FFhTcHJvzDicNUdW71ZIg1MhWFvMRhZ38K
	 WQeVlolGbZ+nYcLqp0WGmvt26hDxz5uQ1uYTgMU0d2at4XK61TtPvY7eq9y9LeG57Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547787;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lXwLpfc4aS4+J/jJs2iTIAGiSEtFcclowGK9/tjyUGk=;
	b=O+T0pJJXU1PcQbBM1BtCIsz0Jm/snJDXTSLff11Z2yWJ3B6ustCQYdg+I7mGveo0Bg8D
	 tN2qeFEkeSx8BN5gvCtE2gCiXOTLOivyK2lkwfNEdEOSHHbCtmbldttBm7s7VPFUWSuFt
	 mjyweaLrFnzjnmK96y0tGWGFSqKKGQRRzYXBpblm7OYzaQM5FZZjFKz6GJups6ibeB+gS
	 0AT3P1Ey7too5hnbw0WuxmPGSeBDv/38CtKIP3AVG0qu1L7wYyAFypcd5YOaGxTeYZE7z
	 OrThPBKI/ZfB+e4Zo1Ko4JNWXkoq2Fv/dkdGIrWw4NIk4AM99NklmzVa8v4VQFTKr6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8xOoZm1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8186606A31E;
	Tue, 24 Nov 2026 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8xOoZm1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333321F000C6;
	Tue, 24 Nov 2026 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795547786;
	bh=lXwLpfc4aS4+J/jJs2iTIAGiSEtFcclowGK9/tjyUGk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=E8xOoZm1tkyvMNjNixCEnPcZxqSvm7nQHecKeztfjP56GWSvZjYReB7gYKUMnv/w0
	 Sm3JsLa7BScRVmvAS4iQD2/oBRunDKNEBcW7/bWITGa+2n8302BouwuRDbV60VPuZg
	 oZD4mrDpCZ1837ckijBp0VEFr+jUN1AjhTzGkgLhtEEqiV2h/rj9UlQWbhuUhiftc3
	 hJCM24QqfT+wOyzl0fIt8DCweVrvK0lJJ5CWDml25DFhXcZc4D2vJUPPWYy6DpgpaN
	 JsVYyoyZsZchDF+71Dwm6d7BrOJ9Mko0WLASP4tj/CWY13bXLducdhFzpeREsi4KOj
	 iyQDhLG7PwCJw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/5] soc: st: stm32mp2-syscfg: register the clock
 device
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124-ups_mp25_clk_syscfg-v4-3-894d95dffec4@foss.st.com>
References: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
 <20261124-ups_mp25_clk_syscfg-v4-3-894d95dffec4@foss.st.com>
Date: Tue, 24 Nov 2026 14:16:18 -0500
Message-Id: <179554777875.338124.2443153902372697503.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=F1WVQywTa9F2r7TDaCAJztvWfqC8Q7gfotXdlbvqROs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZH7W0Czi4fuJvs6oPT7shs7bSP1zXa3Km+xF5bf0jV
 WcZTao7SlkYxLgYZMUUWZbkGhVEpK6yvXdHkwVmDisTyBAGLk4BmIjUKUaGnbHpPgx+ZmUPVnA3
 zjwxl7/CLpDp4EoWvXb912Enmq8kMTI0tLaL5vuELPvwdL0ES9a6wooZclMLAliN9nutq72Wxcs
 PAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Gabriel,

> The STM32MP23x and STM32MP25x SYSCFG provides the LTDC pixel clock mux,
> whose driver is an auxiliary driver since the SYSCFG node is bound to
> this driver.
> 
> Create the auxiliary device for the clock driver.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> [gabriel.fernandez@foss.st.com: create the device on STM32MP23x too]
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/soc/st/Kconfig           |  1 +
>  drivers/soc/st/stm32mp2-syscfg.c | 14 +++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
> index 2a9d6a77be45..62bbe8c63238 100644
> --- a/drivers/soc/st/Kconfig
> +++ b/drivers/soc/st/Kconfig
> @@ -5,6 +5,7 @@ config SOC_STM32MP2
>  	tristate "STM32MP2 SoC family support"
>  	depends on ARCH_STM32 || COMPILE_TEST
>  	default ARCH_STM32 && ARM64
> +	select AUXILIARY_BUS
>  	select SOC_BUS
>  	help
>  	  If you say yes here, you get support for the ST STM32MP2 family
> diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
> index 770321a4a6f7..1160b65d3dde 100644
> --- a/drivers/soc/st/stm32mp2-syscfg.c
> +++ b/drivers/soc/st/stm32mp2-syscfg.c
> @@ -3,13 +3,25 @@
>   * Copyright 2026 Marek Vasut
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  
>  static int stm32mp2_syscfg_probe(struct platform_device *pdev)
>  {
> -	return devm_of_platform_populate(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return ret;
> +

Looking at the dt binding, I see that the clocks property is optional.
Should this have the following check?

    if (!of_property_present(dev->of_node, "clocks"))
        return 0;

Brian

-- 
Brian Masney <masneyb@kernel.org>
