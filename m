Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 May 2017 18:17:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC 1/2] clk: renesas: Rework Kconfig and Makefile logic
Message-ID: <20170519011755.GB20170@codeaurora.org>
References: <1493137626-21404-1-git-send-email-geert+renesas@glider.be>
 <1493137626-21404-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1493137626-21404-2-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 04/25, Geert Uytterhoeven wrote:
> The goals are to:
>   - Allow precise control over and automatic selection of which
>     (sub)drivers are used for which SoC (which may change in the
>     future),
>   - Allow adding support for new SoCs easily,
>   - Allow compile-testing of all (sub)drivers,
>   - Keep driver selection logic in the subsystem-specific Kconfig
>     independent from the architecture-specific Kconfig (i.e. no "select"
>     from arch/arm64/Kconfig.platforms), to avoid dependencies.
> 
> This is implemented by:
>   - Introducing Kconfig symbols for all drivers and sub-drivers,
>   - Introducing the Kconfig symbol CLK_RENESAS, which is enabled
>     automatically when building for a Renesas ARM platform, and which
>     enables all required drivers without interaction of the user, based
>     on SoC-specific ARCH_* symbols,
>   - Allowing the user to enable any Kconfig symbol manually if
>     COMPILE_TEST is enabled,
>   - Using the new Kconfig symbols instead of the ARCH_* symbols to
>     control compilation in the Makefile,
>   - Always entering drivers/clk/renesas/ during the build.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
