Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <90b4396e19b3eca61b2ebfdae0672074b88ad74d.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <90b4396e19b3eca61b2ebfdae0672074b88ad74d.1508231063.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 17 Oct 2017 17:28:42 +0800
Message-ID: <CAGb2v66AAVv+mMcEyiF36OteyYxr82kt78XXR5p0HkymJFF3Tw@mail.gmail.com>
Subject: Re: [PATCH 05/23] drm/sun4i: tcon: Don't rely on encoders to enable
 the TCON
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
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> So far, we've required all the TCON-connected encoders to call the TCON
> enable and disable functions.
>
> This was made this way because in the RGB/LVDS case, the TCON is the CRTC
> and the encoder. However, in all the other cases (HDMI, TV, DSI, etc.), we
> have another encoder down the road that needs to be programmed.
>
> We also needed to know which channel the encoder is connected to, which is
> encoder-specific.
>
> The CRTC's enable and disable callbacks can work just fine for our use
> case, and we can get the channel to use just by looking at the type of
> encoder, since that is fixed. Implement those callbacks, which will
> remove some of the encoder boilerplate.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
