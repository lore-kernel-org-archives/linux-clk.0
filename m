Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Message-ID: <5b6cc314.1c69fb81.96ced.16f7@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:22 -0600
From: Rob Herring <robh@kernel.org>
To: enric.balletbo@collabora.com
Subject: Re: [PATCH 7/8] arm64: dts: rk3399: Add dfi and dmc nodes.
References: <20180730081124.30698-1-enric.balletbo@collabora.com>
 <20180730081124.30698-8-enric.balletbo@collabora.com>
In-Reply-To: <20180730081124.30698-8-enric.balletbo@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: , Mark Rutland <mark.rutland@arm.com>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Brian Norris <briannorris@chromium.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Nickey Yang <nickey.yang@rock-chips.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, devicetree@vger.kernel.org,
 Randy Li <ayaka@soulik.info>, linux-pm@vger.kernel.org,
 Derek Basehore <dbasehore@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Jacob Chen <jacob-chen@iotwrt.com>, Lin Huang <hl@rock-chips.com>,
 Sandy Huang <hjc@rock-chips.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 robin.murphy@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Mon, 30 Jul 2018 10:11:23 +0200, Enric Balletbo i Serra wrote:
> From: Lin Huang <hl@rock-chips.com>
> 
> These are required to support DDR DVFS on rk3399 platform. The patch also
> introduces two new files (rk3399-dram.h and rk3399-dram-default-timing)
> with default DRAM settings.
> 
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
> 
> Changes in v1:
> - [RFC 8/10] Move rk3399-dram.h to dt-includes.
> - [RFC 8/10] Put sdram default values under the dmc node.
> - [RFC 8/10] Removed rk3399-dram-default-timing.dts
> 
>  .../boot/dts/rockchip/rk3399-op1-opp.dtsi     | 29 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      | 49 +++++++++++++
>  include/dt-bindings/power/rk3399-dram.h       | 73 +++++++++++++++++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 include/dt-bindings/power/rk3399-dram.h
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
