Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35169 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S946252AbdDTOF6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2017 10:05:58 -0400
Date: Thu, 20 Apr 2017 09:05:54 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 03/11] dt-bindings: add bindings for DE2 on V3s SoC
Message-ID: <20170420140554.f5squ3uqah3dfvlv@rob-hp-laptop>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170416120849.54542-4-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Apr 16, 2017 at 08:08:41PM +0800, Icenowy Zheng wrote:
> Allwinner V3s SoC have a display engine which have a different pipeline
> with older SoCs.
> 
> Add document for it (new compatibles and the new "mixer" part).
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Removed the refactor at TCON chapter.
> 
> Changes in v3:
> - Remove the description of having a BE directly as allwinner,pipeline.
> 
>  .../bindings/display/sunxi/sun4i-drm.txt           | 29 ++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
