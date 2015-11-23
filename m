Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Message-ID: <56535D8C.9000807@gmail.com>
Date: Mon, 23 Nov 2015 10:40:12 -0800
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: linux-clk@vger.kernel.org
CC: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com,
 linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
Subject: Re: [PATCH v4 3/3] ARM: dts: BCM63xx: Add ARMPLL device tree nodes
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com> <1446168199-5959-4-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1446168199-5959-4-git-send-email-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 29/10/15 18:23, Florian Fainelli wrote:
> Add the ARM PLL controller which comes standard with the Cortex-A9 found
> on the BCM63138 SoCs. This is the same controller as the one found in
> the Broadcom iProc architecture, however, we have a separate compatible
> string to indicate the integration difference, since the hardware is
> different.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to devicetree/next with a merge commit of clk/clk-bcm63xx to
resolve dependencies.
-- 
Florian
