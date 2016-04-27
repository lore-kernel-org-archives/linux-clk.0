Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:52497 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752389AbcD0TcM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 27 Apr 2016 15:32:12 -0400
Date: Wed, 27 Apr 2016 12:32:07 -0700
From: Tony Lindgren <tony@atomide.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, paul@pwsan.com,
	t-kristo@ti.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com
Subject: Re: [PATCH v7 0/9] ARM: dts: DRA7: Add dt nodes for PWMSS
Message-ID: <20160427193207.GB5995@atomide.com>
References: <1461710209-6563-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461710209-6563-1-git-send-email-fcooper@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

* Franklin S Cooper Jr <fcooper@ti.com> [160426 15:38]:
>
>  .../devicetree/bindings/pwm/pwm-tiecap.txt         | 36 +++++++--
>  .../devicetree/bindings/pwm/pwm-tiehrpwm.txt       | 36 +++++++--
>  .../devicetree/bindings/pwm/pwm-tipwmss.txt        | 33 +++++++-
>  arch/arm/boot/dts/am33xx.dtsi                      | 36 ++++++---
>  arch/arm/boot/dts/am4372.dtsi                      | 63 ++++++++++-----
>  arch/arm/boot/dts/da850.dtsi                       | 15 ++--
>  arch/arm/boot/dts/dra7.dtsi                        | 90 ++++++++++++++++++++++
>  .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  | 18 -----
>  .../omap_hwmod_33xx_43xx_interconnect_data.c       | 64 ---------------
>  .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 84 --------------------
>  arch/arm/mach-omap2/omap_hwmod_33xx_data.c         |  9 ---
>  arch/arm/mach-omap2/omap_hwmod_43xx_data.c         | 54 -------------
>  drivers/clk/ti/clk-33xx.c                          |  3 +
>  drivers/clk/ti/clk-43xx.c                          |  6 ++
>  drivers/pwm/pwm-tiecap.c                           |  7 ++
>  drivers/pwm/pwm-tiehrpwm.c                         |  7 ++
>  16 files changed, 279 insertions(+), 282 deletions(-)

Thierry, do you want to pick the driver changes or ack them
and then I can queue the rest if no more comments?

Regards,

Tony

