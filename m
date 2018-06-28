Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46513 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752512AbeF1Ccf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 22:32:35 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-22-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-22-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 10:32:12 +0800
Message-ID: <CAGb2v66vEJZijF82u6cKf3j0J678=kNCCps5+=oj7iHCzM9n6g@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] drm: of: Export drm_crtc_port_mask()
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 25, 2018 at 8:03 PM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> Function is useful when drm_of_find_possible_crtcs() can't be used and
> custom parsing is needed. This can happen for example when there is a
> node with multiple muxes between crtc and encoder.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
