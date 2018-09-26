Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C794C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 20:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 147A021537
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 20:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="TDzrGI7h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 147A021537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbeI0DDl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 23:03:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34718 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbeI0DDl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 23:03:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so341428ljk.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Sep 2018 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7oD9sYIUcCm9E0Nnxrnm8ExXZYVUrMRpi6rnvsEhoBA=;
        b=TDzrGI7hHzNaTo7OW/yChpZ4LVs31KqS7Hkj7R68PhFThMbWQNS2NKJv132ECTPrqW
         IteQS4rhVR4Qen1PImuSk1/QeSW3bnC+3uRZi+Gf88wNg4GqlwF79fiQ/0fbuGAXSWND
         xtLXL0iz+tmUfJ2BqQOOhRsEs0lVLu9y6LuW768VZXuuTWK6eL/QeoWZOT3RFYMR0+dM
         VLfuljfHaINGv3JYAIFwzetOsGSS7XCzLaAxhJ3SKHRREXo91J4Bc/f6CmKVGAk4xPnP
         y+q5zFz0YLi6fOj6f+5dATxCjkp0OxoMuDzzLvmXgLgcprGWpSz79uA7vQa1eGMH0ZhS
         1mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7oD9sYIUcCm9E0Nnxrnm8ExXZYVUrMRpi6rnvsEhoBA=;
        b=nRZGyLiV53oaz/zfW2XyPOgJFY0yD/c2C5fbYjS+8TGuYbTPk3j90eAx0FGWo0j7fo
         EUebXMVjpU2fCzlewP3Z7sJ+MCrOjCgwqZ1sjBmd/hV5tk7FINHEag39BffszB3DBjg9
         JCb19cyIn4EhqEGXoHZvAc6aHUQ90GnBLF65EkJ1Ub6aFd/1blu0Ynhf37llsSHLH9s0
         fD1PHWUWYY3G8VPl3dD/RTk0aqhHz80/mpn4AZw9KWOBWyy1YGyje+gEvwu9Wmjqcizt
         VZ1ZyY7fecgX33NsZ0L4iBhZrohllwFJ6QTLx+lq/yihsEsKSwOnu+hsxiRvtYrxuXyd
         U4ew==
X-Gm-Message-State: ABuFfoh9FglGqa3jXlIA5N246+fNmjoGF9QANPVHpSFeiFF3dPnFr3GV
        SwoSghvzMpFgobKTy4oFmsjj5Zh9mhaup70Mw1itBw==
X-Google-Smtp-Source: ACcGV61Ddr01bKOAy8FioIfnocgXvd3C52tHnQnkozeY7FyaBfWshVjty04up/ZRp/bBQdsZXQ9IDN8en9UgcXc1N6A=
X-Received: by 2002:a2e:44d:: with SMTP id 74-v6mr5949189lje.146.1537994932817;
 Wed, 26 Sep 2018 13:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <1537985581-32164-1-git-send-email-jollys@xilinx.com> <1537985581-32164-3-git-send-email-jollys@xilinx.com>
In-Reply-To: <1537985581-32164-3-git-send-email-jollys@xilinx.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Wed, 26 Sep 2018 13:48:41 -0700
Message-ID:
 <CAOesGMhEcMB4caAPtCSq-m5zQBDc-8Z4f_xAkomnEwVaHyX2Mw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] firmware: xilinx: Add zynqmp IOCTL API for device control
To:     Jolly Shah <jolly.shah@xilinx.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michal Simek <michal.simek@xilinx.com>,
        ARM-SoC Maintainers <arm@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rajan Vaja <rajanv@xilinx.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        rajan.vaja@xilinx.com, Jolly Shah <jollys@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926204841.jc_rM4csX3Dw2SZFKhM5vlMAWBrPMSVng6uuC_iv8WA@z>

Hi,

Just nits on code readability below. Approach looks OK to me.

On Wed, Sep 26, 2018 at 11:13 AM Jolly Shah <jolly.shah@xilinx.com> wrote:
>
> From: Rajan Vaja <rajan.vaja@xilinx.com>
>
> Add ZynqMP firmware IOCTL API to control and configure
> devices like PLLs, SD, Gem, etc.
>
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 43 ++++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  4 +++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 84b3fd2..671a37a 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -428,6 +428,48 @@ static int zynqmp_pm_clock_getparent(u32 clock_id, u32 *parent_id)
>         return ret;
>  }
>
> +/**
> + * zynqmp_is_valid_ioctl() - Check whether IOCTL ID is valid or not
> + * @ioctl_id:  IOCTL ID
> + *
> + * Return: 0 if IOCTL is valid, else -EINVAL
> + */
> +static inline int zynqmp_is_valid_ioctl(u32 ioctl_id)

I think most who come across the use of this would expect an
.*is_valid() to return true (non-0) when valid, and 0 otherwise.

> +{
> +       if (ioctl_id == IOCTL_SET_PLL_FRAC_MODE ||
> +           ioctl_id == IOCTL_GET_PLL_FRAC_MODE ||
> +           ioctl_id == IOCTL_SET_PLL_FRAC_DATA ||
> +           ioctl_id == IOCTL_GET_PLL_FRAC_DATA)
> +               return 0;

This is purely a matter of taste, and no requirement to change, but I
find a switch slightly easier to read for this kind of usage:

        switch(ioctl_id) {
        case IOCTL_SET_PLL_FRAC_MODE:
        case IOCTL_GET_PLL_FRAC_MODE:
        case IOCTL_SET_PLL_FRAC_DATA:
        case IOCTL_GET_PLL_FRAC_DATA:
                return 1;
        default:
                return 0;
        }

> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * zynqmp_pm_ioctl() - PM IOCTL API for device control and configs
> + * @node_id:   Node ID of the device
> + * @ioctl_id:  ID of the requested IOCTL
> + * @arg1:      Argument 1 to requested IOCTL call
> + * @arg2:      Argument 2 to requested IOCTL call
> + * @out:       Returned output value
> + *
> + * This function calls IOCTL to firmware for device control and configuration.
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_ioctl(u32 node_id, u32 ioctl_id, u32 arg1, u32 arg2,
> +                          u32 *out)
> +{
> +       int ret;
> +
> +       ret = zynqmp_is_valid_ioctl(ioctl_id);
> +       if (ret)
> +               return ret;

So with changed return values, this would turn into:

        if (!zynqmp_is_valid_ioctl(ioctl_id))
                return -EINVAL;

> +
> +       return zynqmp_pm_invoke_fn(PM_IOCTL, node_id, ioctl_id,
> +                                  arg1, arg2, out);
> +}
> +
>  static const struct zynqmp_eemi_ops eemi_ops = {
>         .get_api_version = zynqmp_pm_get_api_version,
>         .query_data = zynqmp_pm_query_data,
> @@ -440,6 +482,7 @@ static const struct zynqmp_eemi_ops eemi_ops = {
>         .clock_getrate = zynqmp_pm_clock_getrate,
>         .clock_setparent = zynqmp_pm_clock_setparent,
>         .clock_getparent = zynqmp_pm_clock_getparent,
> +       .ioctl = zynqmp_pm_ioctl,
>  };
>
>  /**
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 015e130..7a9db08 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -34,7 +34,8 @@
>
>  enum pm_api_id {
>         PM_GET_API_VERSION = 1,
> -       PM_QUERY_DATA = 35,
> +       PM_IOCTL = 34,
> +       PM_QUERY_DATA,
>         PM_CLOCK_ENABLE,
>         PM_CLOCK_DISABLE,
>         PM_CLOCK_GETSTATE,
> @@ -99,6 +100,7 @@ struct zynqmp_eemi_ops {
>         int (*clock_getrate)(u32 clock_id, u64 *rate);
>         int (*clock_setparent)(u32 clock_id, u32 parent_id);
>         int (*clock_getparent)(u32 clock_id, u32 *parent_id);
> +       int (*ioctl)(u32 node_id, u32 ioctl_id, u32 arg1, u32 arg2, u32 *out);
>  };
>
>  #if IS_REACHABLE(CONFIG_ARCH_ZYNQMP)
> --
> 2.7.4
>
