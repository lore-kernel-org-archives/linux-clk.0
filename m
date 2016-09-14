Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 11:36:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@stlinux.com,
	linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>, arnaud.pouliquen@st.com,
	benjamin.gaignard@st.com, vincent.abriou@st.com,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH v3 00/14] Clock improvement for video playback
Message-ID: <20160914183620.GV7243@codeaurora.org>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/29, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> v3:
>   - Rebase to v4.8-rc1
>   - Tipo fix in st,clkgen-pll.txt
>   - Add Ack of Peter for the series
>   - Add missed patch: "ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms"
> 
> v2:
>   - Simpliflication of clock binding
>     remark from Rob https://lkml.org/lkml/2016/5/25/492
>   - Suppression of stih415-416 support for the clocks (in order
> 	to help simplification of clock binding)
>     (others patchs for the machine and drivers will come)
> 
> This serie allows to increase video resolutions and make audio
> adjustment during a video playback.
> 
> Gabriel Fernandez (14):
>   drivers: clk: st: Remove stih415-416 clock support
>   drivers: clk: st: Simplify clock binding of STiH4xx platforms
>   ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms
>   drivers: clk: st: Add fs660c32 synthesizer algorithm
>   drivers: clk: st: Add clock propagation for audio clocks
>   drivers: clk: st: Handle clk synchronous mode for video clocks
>   ARM: DT: STiH407: Enable clock propagation for audio clocks
>   ARM: DT: STiH410: Enable clock propagation for audio clocks
>   ARM: DT: STiH418: Enable clock propagation for audio clocks
>   ARM: DT: STiH407: Enable synchronous clock mode for video clocks
>   ARM: DT: STiH410: Enable synchronous clock mode for video clocks
>   ARM: DT: STiH418: Enable synchronous clock mode for video clocks
>   ARM: DT: STi: STiH407: clock configuration to address 720p and 1080p
>   ARM: DT: STi: STiH410: clock configuration to address 720p and 1080p

The order of patches intermingles clk changes and dts changes.
I'd prefer to not take any patches for dts through the clk tree,
so can those be deferred to an arm-soc PR? Assuming that works,
I'd just pick 1-2, and 4-6 into the clk tree and the rest can go
on top through arm-soc.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
