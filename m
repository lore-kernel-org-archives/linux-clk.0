Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 20 Jun 2018 13:16:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@bootlin.com, wens@csie.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 16/27] dt-bindings: display: sun4i-drm: Add R40 mixer
 compatibles
Message-ID: <20180620191636.GA6106@rob-hp-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-17-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180612200036.21483-17-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 12, 2018 at 10:00:25PM +0200, Jernej Skrabec wrote:
> R40 DE2 mixers are similar to those found in A83T, except it needs
> different clock settings.
> 
> Add a compatibles for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
