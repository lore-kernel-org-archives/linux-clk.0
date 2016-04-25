Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 25 Apr 2016 08:05:57 -0500
From: Rob Herring <robh@kernel.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: thierry.reding@gmail.com, tony@atomide.com, paul@pwsan.com,
	t-kristo@ti.com, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com
Subject: Re: [PATCH v6 7/7] ARM: dts: DRA7: Add dt nodes for PWMSS
Message-ID: <20160425130557.GA11485@rob-hp-laptop>
References: <1461343238-29274-1-git-send-email-fcooper@ti.com>
 <1461343238-29274-8-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461343238-29274-8-git-send-email-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 22, 2016 at 11:40:38AM -0500, Franklin S Cooper Jr wrote:
> From: Vignesh R <vigneshr@ti.com>
> 
> Add PWMSS device tree nodes for DRA7 SoC family and add documentation
> for dt bindings.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> [fcooper@ti.com: Add eCAP and use updated bindings for PWMSS and ePWM]
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../devicetree/bindings/pwm/pwm-tiecap.txt         |  9 +++
>  .../devicetree/bindings/pwm/pwm-tiehrpwm.txt       |  9 +++
>  .../devicetree/bindings/pwm/pwm-tipwmss.txt        | 15 +++-
>  arch/arm/boot/dts/dra7.dtsi                        | 90 ++++++++++++++++++++++
>  4 files changed, 122 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
