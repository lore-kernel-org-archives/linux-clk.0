Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33546 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754245AbeFTTPz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jun 2018 15:15:55 -0400
Date: Wed, 20 Jun 2018 13:15:53 -0600
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@bootlin.com, wens@csie.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 10/27] dt-bindings: display: sun4i-drm: Add R40 TV
 TCON description
Message-ID: <20180620191553.GA5151@rob-hp-laptop>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-11-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180612200036.21483-11-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 12, 2018 at 10:00:19PM +0200, Jernej Skrabec wrote:
> TCON description is expanded with R40 TV TCON compatibles. TV TCONs,
> which are connected to TCON TOP muxes, such as those on R40 SoC, also
> needs additional clock gate to be specified.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
