Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751318AbdLZTAo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Dec 2017 14:00:44 -0500
MIME-Version: 1.0
In-Reply-To: <20171222122243.25735-2-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io> <20171222122243.25735-2-icenowy@aosc.io>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 26 Dec 2017 13:00:22 -0600
Message-ID: <CAL_JsqLh4dgWOcsZ0aXCKvEUsANE=enPB0f-LthYOjRGZCkUfQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: fix the binding of Allwinner DE2
 CCU of A83T and H3
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Dec 22, 2017 at 6:22 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The DE2 CCU is different on A83T and H3 -- the parent of the clocks on
> A83T is PLL_DE but on H3 it's the DE module clock. This is not noticed
> when I develop the DE2 CCU driver.
>
> Fix the binding by using different compatibles for A83T and H3, adding
> notes for the PLL_DE usage on A83T, and change the binding example's
> compatible from A83T to H3 (as it specifies the DE module clock).
>
> Fixes: ed74f8a8a679 ("dt-bindings: add binding for the Allwinner DE2 CCU")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Please add acks when posting new versions.

Rob
