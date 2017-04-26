Return-Path: <horms@verge.net.au>
Date: Wed, 26 Apr 2017 09:36:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC 0/2] clk / soc: renesas: Rework Kconfig and Makefile
 logic
Message-ID: <20170426073601.GF25517@verge.net.au>
References: <1493137626-21404-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1493137626-21404-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 06:27:04PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This RFC patch series reworks the Kconfig and Makefile logic for the
> Renesas clock and SoC drivers. It was sparked by a discussion with Olof
> about the Renesas clock driver dependencies.
> 
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
> The series can't be applied as-is, because compile-testing all drivers
> depends on independent fixes, some in other subsystems.
> 
> More details are provided in the individual patch descriptions.
> 
> For testing, this patch series, plus several fixes to allow more
> compile-testing, are available in the
> topic/clk-soc-renesas-Kconfig-rework branch of my renesas-drivers git
> repository at 
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> This has been tested on R-Car Gen2 and Gen3, and compile-tested for
> various other configurations.
> 
> Thanks for your comments!

Hi Geert,

thanks for working on this. I am very pleased to see something that
is more robust with regards to adding new platforms without causing
build breakage - I have been burnt by this several times.

Acked-by: Simon Horman <horms+renesas@verge.net.au>
