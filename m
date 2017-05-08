Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34931 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752165AbdEHQoi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2017 12:44:38 -0400
Date: Mon, 8 May 2017 11:44:36 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 07/10] dt-bindings: add compatible string for
 Allwinner R40 CCU
Message-ID: <20170508164436.vlnrvv6qcu2f74sa@rob-hp-laptop>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-8-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170504135006.16483-8-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 04, 2017 at 09:50:03PM +0800, Icenowy Zheng wrote:
> Allwinner R40 has a clock controlling unit like the ones on other
> Allwinner SoCs after sun6i, and can also use a CCU-based driver.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
