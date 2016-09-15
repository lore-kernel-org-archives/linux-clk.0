Return-Path: <patrice.chotard@st.com>
Subject: Re: [PATCH v3 03/14] ARM: DT: STiH4xx: Simplify clock binding of
 STiH4xx platforms
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
 <1472473626-15398-4-git-send-email-gabriel.fernandez@st.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@stlinux.com>,
        <linux-clk@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Peter Griffin
	<peter.griffin@linaro.org>, <arnaud.pouliquen@st.com>,
        <benjamin.gaignard@st.com>, <vincent.abriou@st.com>,
        Gabriel Fernandez
	<gabriel.fernandez@linaro.org>
From: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <c2ccce91-4748-fe87-8864-b1c3a4138cb2@st.com>
Date: Thu, 15 Sep 2016 09:44:35 +0200
MIME-Version: 1.0
In-Reply-To: <1472473626-15398-4-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>



On 08/29/2016 02:26 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch simplifies the clock binding because we had too much detail.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  arch/arm/boot/dts/stih407-clock.dtsi | 18 +++++++++---------
>  arch/arm/boot/dts/stih410-clock.dtsi | 16 ++++++++--------
>  arch/arm/boot/dts/stih418-clock.dtsi | 16 ++++++++--------
>  3 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
> index ad45f5e..38a56d7 100644
> --- a/arch/arm/boot/dts/stih407-clock.dtsi
> +++ b/arch/arm/boot/dts/stih407-clock.dtsi
> @@ -42,7 +42,7 @@

[...]
> @@ -309,7 +309,7 @@
>  
>  		clk_s_d3_quadfs: clk-s-d3-quadfs@9107000 {
>  			#clock-cells = <1>;
> -			compatible = "st,stih407-quadfs660-D", "st,quadfs";
> +			compatible = "st,quadfs";
>  			reg = <0x9107000 0x1000>;
>  
>  			clocks = <&clk_sysin>;
> 


Hi Gabriel

Applied on STi tree for v4.9

Thanks
