Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 25 Apr 2016 08:04:31 -0500
From: Rob Herring <robh@kernel.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: thierry.reding@gmail.com, tony@atomide.com, paul@pwsan.com,
	t-kristo@ti.com, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com
Subject: Re: [PATCH v6 5/7] ARM: dts: am437x/am33xx: Remove hwmod entries for
 ECAP and EPWM nodes
Message-ID: <20160425130431.GA10953@rob-hp-laptop>
References: <1461343238-29274-1-git-send-email-fcooper@ti.com>
 <1461343238-29274-6-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461343238-29274-6-git-send-email-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 22, 2016 at 11:40:36AM -0500, Franklin S Cooper Jr wrote:
> Previous patches switched the ECAP and EPWM to use the new bindings.
> These bindings explicitly adds the various required clocks via DT rather
> than depending on hwmod.
> 
> Therefore, it is safe to remove the hwmod entries since they are no longer
> needed.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-tiecap.txt   | 3 ---
>  Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt | 3 ---
>  arch/arm/boot/dts/am33xx.dtsi                          | 6 ------
>  arch/arm/boot/dts/am4372.dtsi                          | 9 ---------
>  4 files changed, 21 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
