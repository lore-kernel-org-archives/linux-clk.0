Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:40474 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754063AbdJQJW2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 05:22:28 -0400
MIME-Version: 1.0
In-Reply-To: <e6f92f126640aa6de639386f9b4677db3d8bb37b.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <e6f92f126640aa6de639386f9b4677db3d8bb37b.1508231063.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 17 Oct 2017 17:22:03 +0800
Message-ID: <CAGb2v65BNixB8evAqk-7uRKL=OuRW2aa+4gNedz5CdXEBoFACw@mail.gmail.com>
Subject: Re: [PATCH 04/23] drm/sun4i: tcon: Make tcon_get_clk_delay mode
 argument const
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The drm_display_mode pointer can be mark const, so let's do it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
