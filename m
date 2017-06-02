Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:45:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Phil Elwell <phil@raspberrypi.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
Message-ID: <20170602224523.GB20170@codeaurora.org>
References: <8cc0ba82-d33e-127b-7b86-ac595ef416d1@raspberrypi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8cc0ba82-d33e-127b-7b86-ac595ef416d1@raspberrypi.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Phil Elwell wrote:
> Restrict clock sources for the PCM peripheral to the oscillator and
> PLLD_PER because other source may have varying rates or be switched off.
> Prevent other sources from being selected by replacing their names in
> the list of potential parents with dummy entries (entry index is
> significant).
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
