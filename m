Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:40471 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966703AbeFSRax (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jun 2018 13:30:53 -0400
Received: by mail-wm0-f66.google.com with SMTP id n5-v6so1899351wmc.5
        for <linux-clk@vger.kernel.org>; Tue, 19 Jun 2018 10:30:52 -0700 (PDT)
Subject: Re: [PATCH] video: fbdev: simplefb: Stop including
 <linux/clk-provider.h>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org
References: <20180619172221.20252-1-geert+renesas@glider.be>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <23991cf4-d926-246d-2362-a28d490eb246@redhat.com>
Date: Tue, 19 Jun 2018 19:30:50 +0200
MIME-Version: 1.0
In-Reply-To: <20180619172221.20252-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 19-06-18 19:22, Geert Uytterhoeven wrote:
> Simplefb is not a clock provider, but it uses of_clk_get_parent_count(),
> so it can just include <linux/of_clk.h> instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

LGTM:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/video/fbdev/simplefb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index a3c44ecf4523e8ed..9a9d748b07f2777d 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -27,8 +27,8 @@
>   #include <linux/platform_data/simplefb.h>
>   #include <linux/platform_device.h>
>   #include <linux/clk.h>
> -#include <linux/clk-provider.h>
>   #include <linux/of.h>
> +#include <linux/of_clk.h>
>   #include <linux/of_platform.h>
>   #include <linux/parser.h>
>   #include <linux/regulator/consumer.h>
> 
