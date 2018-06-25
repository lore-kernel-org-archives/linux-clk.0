Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:32775 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934023AbeFYUSh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jun 2018 16:18:37 -0400
Date: Mon, 25 Jun 2018 14:18:34 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 2/7] dt-bindings: add binding for the Allwinner A64
 DE2 bus
Message-ID: <20180625201834.GA14276@rob-hp-laptop>
References: <20180622124540.56203-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180622124540.56203-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 22, 2018 at 08:45:35PM +0800, Icenowy Zheng wrote:
> All the sub-blocks of Allwinner A64 DE2 needs the SRAM C on A64 SoC to
> be claimed, otherwise the whole DE2 space is inaccessible.
> 
> Add a device tree binding of the DE2 part as a sub-bus.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes since v1.
> 
>  .../bindings/bus/sun50i-de2-bus.txt           | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt

Reviewed-by: Rob Herring <robh@kernel.org>
