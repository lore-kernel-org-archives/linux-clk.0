Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:38076 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754740AbdEEDKo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2017 23:10:44 -0400
MIME-Version: 1.0
In-Reply-To: <20170504114858.9008-7-icenowy@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-7-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 May 2017 11:10:19 +0800
Message-ID: <CAGb2v67s4qZL7yDfZWjsno7KZzhAMsXcKLwX8ciBhrUfFNT7BQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v6 06/13] drm/sun4i: add a dedicated module
 for sun4i-backend and sun4i-layer
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 4, 2017 at 7:48 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> Currently the direct call from CRTC code to layer code has disappeared,
> instead the layer's init function is called via the backend's ops.
>
> Add a dedicated module for sun4i-backend and sun4i-layer, and drop the
> EXPORT_SYMBOL from backend code to layer code.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
