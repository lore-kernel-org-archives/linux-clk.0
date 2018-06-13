Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180612200036.21483-2-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <20180612200036.21483-2-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 13 Jun 2018 11:18:45 +0800
Message-ID: <CAGb2v66rUqqUrqmq09hHcGHF1buZieYmu1zOkUXZyyQPtyUZew@mail.gmail.com>
Subject: Re: [PATCH v2 01/27] clk: sunxi-ng: r40: Add minimal rate for video PLLs
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
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 13, 2018 at 4:00 AM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> According to documentation and experience with other similar SoCs, video
> PLLs don't work stable if their output frequency is set below 192 MHz.
>
> Because of that, set minimal rate to both R40 video PLLs to 192 MHz.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
