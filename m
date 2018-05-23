Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33108 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754759AbeEWSXO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 May 2018 14:23:14 -0400
Date: Wed, 23 May 2018 13:23:11 -0500
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@bootlin.com, wens@csie.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 05/15] drm/sun4i: Add TCON TOP driver
Message-ID: <20180523182311.GA8741@rob-hp-laptop>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
 <20180519183127.2718-6-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180519183127.2718-6-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 19, 2018 at 08:31:17PM +0200, Jernej Skrabec wrote:
> As already described in DT binding, TCON TOP is responsible for
> configuring display pipeline. In this initial driver focus is on HDMI
> pipeline, so TVE and LCD configuration is not implemented.
> 
> Implemented features:
> - HDMI source selection
> - clock driver (TCON and DSI gating)
> - connecting mixers and TCONS
> 
> Something similar also existed in previous SoCs, except that it was part
> of first TCON.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/Makefile             |   3 +-
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c     | 256 +++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.h     |  20 ++
>  include/dt-bindings/clock/sun8i-tcon-top.h |  11 +

This belongs with the binding doc patch.

>  4 files changed, 289 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.h
>  create mode 100644 include/dt-bindings/clock/sun8i-tcon-top.h
