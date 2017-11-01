Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:48357 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933124AbdKAVLe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Nov 2017 17:11:34 -0400
Date: Wed, 1 Nov 2017 16:11:32 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 08/10] dt-bindings: add binding for A64 DE2 CCU SRAM
Message-ID: <20171101211132.jtbhywkudrev4ux3@rob-hp-laptop>
References: <20171027150658.18509-1-icenowy@aosc.io>
 <20171027150658.18509-9-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171027150658.18509-9-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 27, 2017 at 11:06:56PM +0800, Icenowy Zheng wrote:
> A64's Display Engine 2.0 needs a section of SRAM (SRAM C) to be claimed,
> otherwise the whole DE2 memory zone cannot be accessed (kept to all 0).
> 
> Add binding for this, in order to make the DE2 CCU able to claim the
> SRAM and enable access to the DE2 clock and reset registers.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Adds description of the situation when the SRAM is not claimed.
> 
>  Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
