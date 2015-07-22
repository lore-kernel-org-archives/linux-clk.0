Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55AF6570.3010505@st.com>
Date: Wed, 22 Jul 2015 11:42:08 +0200
From: Maxime Coquelin <maxime.coquelin@st.com>
MIME-Version: 1.0
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabian Frederick <fabf@skynet.be>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@stlinux.com>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH 9/9] ARM: STi: DT: Rename st_pll3200c32_407_c0_x into
 st_pll3200c32_cx_x
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org> <1435068567-30995-10-git-send-email-gabriel.fernandez@linaro.org>
In-Reply-To: <1435068567-30995-10-git-send-email-gabriel.fernandez@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Gabriel,

On 06/23/2015 04:09 PM, Gabriel Fernandez wrote:
> Use a generic name for this kind of PLL
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>   Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt | 4 ++--
>   arch/arm/boot/dts/stih407-clock.dtsi                         | 4 ++--
>   arch/arm/boot/dts/stih410-clock.dtsi                         | 4 ++--
>   arch/arm/boot/dts/stih418-clock.dtsi                         | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
>

Patch applied to sti-dt-for-v4.3.

Thanks!
Maxime
