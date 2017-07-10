Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Sun, 9 Jul 2017 20:02:03 -0500
From: Rob Herring <robh@kernel.org>
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com,
	lgirdwood@gmail.com, broonie@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
	linux@armlinux.org.uk, boris.brezillon@free-electrons.com,
	perex@perex.cz, tiwai@suse.com, cyrille.pitchen@wedev4u.fr,
	thomas.petazzoni@free-electrons.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/9] ASoC: atmel-classd: remove aclk clock from DT
 binding
Message-ID: <20170710010203.u54wtave2a3x2ke6@rob-hp-laptop>
References: <20170704115927.32662-1-quentin.schulz@free-electrons.com>
 <20170704115927.32662-8-quentin.schulz@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170704115927.32662-8-quentin.schulz@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 04, 2017 at 01:59:25PM +0200, Quentin Schulz wrote:
> Since gclk (generated-clk) is now able to determine the rate of the
> audio_pll, there is no need for classd to have a direct phandle to the
> audio_pll while already having a phandle to gclk.
> 
> This binding is used by no board in mainline so it is safe to be
> modified.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> ---
> 
> added in v2
> 
>  Documentation/devicetree/bindings/sound/atmel-classd.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
