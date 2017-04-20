Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36001 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031668AbdDTN6d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2017 09:58:33 -0400
Date: Thu, 20 Apr 2017 08:58:31 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 01/11] dt-bindings: add binding for the Allwinner DE2
 CCU
Message-ID: <20170420135831.owkaymplu4tbzdzs@rob-hp-laptop>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170416120849.54542-2-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Apr 16, 2017 at 08:08:39PM +0800, Icenowy Zheng wrote:
> Allwinner "Display Engine 2.0" contains some clock controls in it.
> 
> In order to add them as clock drivers, we need a device tree binding.
> Add the binding here.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Dropped the leading 0 in clock@1000000 .
> Changes in v3:
> - Fill the address space length of DE2 CCU to 0x100000, just reach the start of mixer0.
> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt

Acked-by: Rob Herring <robh@kernel.org>
