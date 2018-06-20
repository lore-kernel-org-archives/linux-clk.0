Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:37417 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754580AbeFTTRK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jun 2018 15:17:10 -0400
Date: Wed, 20 Jun 2018 13:17:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@bootlin.com, wens@csie.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 18/27] dt-bindings: display: sun4i-drm: Add
 description of A64 HDMI PHY
Message-ID: <20180620191708.GA6846@rob-hp-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-19-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180612200036.21483-19-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 12, 2018 at 10:00:27PM +0200, Jernej Skrabec wrote:
> A64 HDMI PHY is similar to H3 HDMI PHY except it has two possible PLL
> clock parents. It is compatible to other HDMI PHYs, like that found in
> R40.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

