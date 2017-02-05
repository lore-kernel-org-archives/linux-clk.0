Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sun, 5 Feb 2017 12:49:44 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Andre Przywara <andre.przywara@arm.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dmaengine@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 08/10] dmaengine: sun6i: allow build on ARM64
 platforms (sun50i)
Message-ID: <20170205071944.GW19244@localhost>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-9-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170129023331.62106-9-icenowy@aosc.xyz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 29, 2017 at 10:33:29AM +0800, Icenowy Zheng wrote:
> As 64-bit Allwinner H5 SoC has the same DMA engine with H3, the DMA
> driver should be allowed to be built for ARM64, in order to make it work on H5.

Applied, thanks

-- 
~Vinod
