Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:40738 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754094AbdJQKJ5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 06:09:57 -0400
MIME-Version: 1.0
In-Reply-To: <a1d1a106d6db266305f86b1e2626105cb8b88d0a.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <a1d1a106d6db266305f86b1e2626105cb8b88d0a.1508231063.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 17 Oct 2017 18:09:32 +0800
Message-ID: <CAGb2v670-UPVq-4QPj=CuOLyWWHjqcRWqFr5cM1ck14bMwd_5g@mail.gmail.com>
Subject: Re: [PATCH 11/23] drm/sun4i: Rename layers to UI planes
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
> The currently supported planes for DE2 are actually only UI planes, and the
> VI planes will differ both in terms of code and features.
>
> It will make sense to support them in a separate file, so let's make sure
> we don't create a confusing file name.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/sun4i/Makefile      |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_layer.c | 134 +-----------------------------
>  drivers/gpu/drm/sun4i/sun8i_layer.h |  36 +--------
>  drivers/gpu/drm/sun4i/sun8i_mixer.c |   4 +-
>  drivers/gpu/drm/sun4i/sun8i_ui.c    | 134 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun8i_ui.h    |  36 ++++++++-
>  6 files changed, 173 insertions(+), 173 deletions(-)
>  delete mode 100644 drivers/gpu/drm/sun4i/sun8i_layer.c
>  delete mode 100644 drivers/gpu/drm/sun4i/sun8i_layer.h
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_ui.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_ui.h
>

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui.c b/drivers/gpu/drm/sun4i/sun8i_ui.c
> new file mode 100644
> index 000000000000..077099ef565a
> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui.c
> @@ -0,0 +1,134 @@

[...]

> +static const struct sun8i_plane_desc sun8i_mixer_planes[] = {

You might want to update this name as well to be consistent.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
