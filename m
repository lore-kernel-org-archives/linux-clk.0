Return-Path: <patrice.chotard@st.com>
Subject: Re: [PATCH v3 12/14] ARM: DT: STiH418: Enable synchronous clock mode
 for video clocks
To: <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar
 Gala <galak@codeaurora.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>,
        Olivier Bideau <olivier.bideau@st.com>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>,
        Dinh Nguyen <dinguyen@opensource.altera.com>,
        Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
 <1472473626-15398-13-git-send-email-gabriel.fernandez@st.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@stlinux.com>,
        <linux-clk@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Peter Griffin
	<peter.griffin@linaro.org>, <arnaud.pouliquen@st.com>,
        <benjamin.gaignard@st.com>, <vincent.abriou@st.com>,
        Gabriel Fernandez
	<gabriel.fernandez@linaro.org>
From: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <2917efee-b443-06e4-412e-b8c89abd5c25@st.com>
Date: Thu, 15 Sep 2016 09:47:46 +0200
MIME-Version: 1.0
In-Reply-To: <1472473626-15398-13-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>



On 08/29/2016 02:27 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch enables the synchronous clock mode for video clocks
> on STiH418 board.
> 
> Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih418-clock.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
> index a183583..ee6614b7 100644
> --- a/arch/arm/boot/dts/stih418-clock.dtsi
> +++ b/arch/arm/boot/dts/stih418-clock.dtsi
> @@ -271,7 +271,7 @@
>  
>  			clk_s_d2_flexgen: clk-s-d2-flexgen {
>  				#clock-cells = <1>;
> -				compatible = "st,flexgen";
> +				compatible = "st,flexgen-video", "st,flexgen";
>  
>  				clocks = <&clk_s_d2_quadfs 0>,
>  					 <&clk_s_d2_quadfs 1>,
> 
Hi Gabriel

Applied on STi tree for v4.9

Thanks
