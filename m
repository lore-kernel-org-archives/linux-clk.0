Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADF4C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6A50603E9
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241745AbhJGN5w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241708AbhJGN5v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 09:57:51 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7BEC061746
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 06:55:57 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id p2so6809652vst.10
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 06:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qW8m1SaxmQIj7wM+TidVARVLr4KonH1Gr2w/bGXEOY0=;
        b=gdnX780pQYX5Bh13tiCOp6idbiqMiY+3mx8xAd43ZIvuYx3Z+rGWSWjecLDQOaZAmM
         gmHCjcszW+SSezgbKjpgQYumYuQ4fd9OqF4lbEMRLwrDV9GgoTbuvmKp9kUhpUQU+tBW
         PnbJWvARfWQUc2OoxdzsxFteKz1osnW770ktYKc5uji/YisDuP3kQagiZqvnVhxaLqfA
         AGuOIsH3cjRK4N/06ZfZy34KL14eHk1ZsuX19RmX5X8jFCxiEse9SYZ6D7Vvr7936KPm
         AphOnugWtagODJ2nVbYRotZI0gjpXjGDaWatZFXSN3xQRr4B1AIl17GSthaa8tKJQ2MN
         sW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qW8m1SaxmQIj7wM+TidVARVLr4KonH1Gr2w/bGXEOY0=;
        b=W23Sf3sLGY0LWFubBpjGtwyfJdArotw4Twt3zrXMFF22JbZrOKiKQ7jDqZdLmPiHLW
         HhtJU62a+Oud9HrYT6CoLxj39v6C+6h+Ik2Syh5JjObPgGHEmGlPD+QANh1W+xOknFHL
         wPVhcS+fGRR1c3RbFsHUV53ysl0iwAydC1/3Aaf/nFJ30c+uX9Kn4ik+47BsTfctYMgM
         z+8A4xlmF6tdGGtrGs2+CP1QI/GS86Cz1d/GvzNbaqxFQDslk+h/7wxrNlgglfGoW+Vj
         TJW/OIYh7sbcNWE6m9tYHQsic9m8VGsns6TXgle7TsileqmjJrNh8K0jWTl3lDnABNBM
         9sjA==
X-Gm-Message-State: AOAM532kBGmgB02hSsGn8SgHXo7/I2h7MzF9IEU5PshwPHZWjN4icGwl
        KPymmxeO0ilG/yfSOB+7v/Y+xJkBsgzO7wOM1ace/Q==
X-Google-Smtp-Source: ABdhPJzdHnA+anF4NU8tNyCmDmqyvHss+eeEkI+Wlt4B2z11dcHGS4NqAnAxEjqf3bvjsKuE6AhONinuaALg9A75dKA=
X-Received: by 2002:a67:d91b:: with SMTP id t27mr4474526vsj.55.1633614956667;
 Thu, 07 Oct 2021 06:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211007135003.2229-1-semen.protsenko@linaro.org>
In-Reply-To: <20211007135003.2229-1-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 7 Oct 2021 16:55:45 +0300
Message-ID: <CAPLW+4k6mX9BwR8jHXprvzi3iim5txp29qjpCC0YX65pUdsPsw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Add clk_set_parent debugfs node
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Oct 2021 at 16:50, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> Useful for testing mux clocks. One can write the index of the parent to
> set into clk_parent node, starting from 0. Example
>
>     # cd /sys/kernel/debug/clk/mout_peri_bus
>     # cat clk_possible_parrents
>       dout_shared0_div4 dout_shared1_div4
>     # cat clk_parent
>       dout_shared0_div4
>     # echo 1 > clk_parent
>     # cat clk_parent
>       dout_shared1_div4
>
> One needs to define CLOCK_ALLOW_WRITE_DEBUGFS in drivers/clk/clk.c in
> order to use this feature.
>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Please ignore this one, it has unwanted changes added by mistake. I'll
send v3 soon.

> Changes in v2:
>   - Merged write() function into existing 'clk_parent' file
>   - Removed 'if (val >= core->num_parents)' check
>   - Removed incorrect usage of IS_ERR_OR_NULL()
>
>  drivers/clk/clk.c | 56 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 806c55f0991b..5776efab4739 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3224,6 +3224,46 @@ static int current_parent_show(struct seq_file *s, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(current_parent);
>
> +#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
> +static ssize_t current_parent_write(struct file *file, const char __user *ubuf,
> +                                   size_t count, loff_t *ppos)
> +{
> +       struct seq_file *s = file->private_data;
> +       struct clk_core *core = s->private;
> +       struct clk_core *parent;
> +       char buf[4] = { 0 };
> +       u8 idx;
> +       int err;
> +
> +       if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
> +               return -EFAULT;
> +
> +       err = kstrtou8(buf, 0, &idx);
> +       if (err)
> +               return err;
> +
> +       parent = clk_core_get_parent_by_index(core, idx);
> +       if (!parent)
> +               return -ENOENT;
> +
> +       clk_prepare_lock();
> +       err = clk_core_set_parent_nolock(core, parent);
> +       clk_prepare_unlock();
> +       if (err)
> +               return err;
> +
> +       return count;
> +}
> +
> +static const struct file_operations current_parent_rw_fops = {
> +       .open           = current_parent_open,
> +       .write          = current_parent_write,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +#endif
> +
>  static int clk_duty_cycle_show(struct seq_file *s, void *data)
>  {
>         struct clk_core *core = s->private;
> @@ -3291,13 +3331,25 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
>                             &clk_prepare_enable_fops);
>  #endif
>
> -       if (core->num_parents > 0)
> +       if (core->num_parents > 0) {
> +#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
> +               if (core->num_parents > 1) {
> +                       debugfs_create_file("clk_parent", 0644, root, core,
> +                                           &current_parent_rw_fops);
> +               } else {
> +                       debugfs_create_file("clk_parent", 0444, root, core,
> +                                           &current_parent_fops);
> +               }
> +#else
>                 debugfs_create_file("clk_parent", 0444, root, core,
>                                     &current_parent_fops);
> +#endif
> +       }
>
> -       if (core->num_parents > 1)
> +       if (core->num_parents > 1) {
>                 debugfs_create_file("clk_possible_parents", 0444, root, core,
>                                     &possible_parents_fops);
> +       }
>
>         if (core->ops->debug_init)
>                 core->ops->debug_init(core->hw, core->dentry);
> --
> 2.30.2
>
