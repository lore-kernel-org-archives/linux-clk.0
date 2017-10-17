Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:40404 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754505AbdJQJT3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 05:19:29 -0400
MIME-Version: 1.0
In-Reply-To: <4ecb323e787918208f6a5d9f0ebba12c62583c98.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <4ecb323e787918208f6a5d9f0ebba12c62583c98.1508231063.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 17 Oct 2017 17:19:04 +0800
Message-ID: <CAGb2v65zJh1Fqqxo22RTL8TQ90FrxywVo0J_bhD04JYHnVjdhg@mail.gmail.com>
Subject: Re: [PATCH 01/23] drm/sun4i: Implement endpoint parsing using kfifo
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
> The commit da82b8785eeb ("drm/sun4i: add components in breadth first
> traversal order") implemented a breadth first traversal of our device tree
> nodes graph. However, it was relying on the kernel linked lists, and those
> are not really safe for addition.
>
> Indeed, in a single pipeline stage, your first stage (ie, the mixer or
> fronted) will be queued, and it will be the final iteration of that list as
> far as list_for_each_entry_safe is concerned. Then, during that final
> iteration, we'll queue another element (the TCON or the backend) that
> list_for_each_entry_safe will not account for, and we will leave the loop
> without having iterated over all the elements. And since we won't have
> built our components list properly, the DRM driver will be left
> non-functional.
>
> We can instead use a kfifo to queue and enqueue components in-order, as was
> the original intention. This also has the benefit of removing any dynamic
> allocation, making the error handling path simpler too. The only thing
> we're losing is the ability to tell whether an element has already been
> queued, but that was only needed to remove spurious logs, and therefore
> purely cosmetic.
>
> This means that this commit effectively reverses e8afb7b67fba ("drm/sun4i:
> don't add components that are already in the queue").
>
> Fixes: da82b8785eeb ("drm/sun4i: add components in breadth first traversal order")
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 71 +++++---------------------------
>  1 file changed, 13 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index b5879d4620d8..a27efad9bc76 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include <linux/component.h>
> +#include <linux/kfifo.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_reserved_mem.h>
>
> @@ -222,29 +223,15 @@ static int compare_of(struct device *dev, void *data)
>   * matching system handles this for us.
>   */
>  struct endpoint_list {
> -       struct device_node *node;
> -       struct list_head list;
> +       DECLARE_KFIFO(fifo, struct device_node *, 16);
>  };

Is there any reason to keep using struct endpoint_list, other than
to avoid using kfifo in function parameter lists?

Otherwise the rest of the code looks sound.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
