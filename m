Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:38656 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732805AbeHGJqx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Aug 2018 05:46:53 -0400
MIME-Version: 1.0
References: <20180803030237.3366-1-songjun.wu@linux.intel.com> <20180803030237.3366-9-songjun.wu@linux.intel.com>
In-Reply-To: <20180803030237.3366-9-songjun.wu@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 09:33:38 +0200
Message-ID: <CAMuHMdXkGchPN337dXbBVOFsb1o-Tkh8S_z=uCm3Z0sDjPVMKA@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] serial: intel: Get serial id from dts
To: songjun.wu@linux.intel.com
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Songjun,

On Fri, Aug 3, 2018 at 5:04 AM Songjun Wu <songjun.wu@linux.intel.com> wrote:
> Get serial id from dts.
>
> "#ifdef CONFIG_LANTIQ" preprocessor is used because LTQ_EARLY_ASC
> macro is defined in lantiq_soc.h.
> lantiq_soc.h is in arch path for legacy product support.
>
> arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
>
> If "#ifdef preprocessor" is changed to
> "if (IS_ENABLED(CONFIG_LANTIQ))", when CONFIG_LANTIQ is not enabled,
> code using LTQ_EARLY_ASC is compiled.
> Compilation will fail for no LTQ_EARLY_ASC defined.
>
> Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>

Thanks for your patch!

> @@ -699,9 +700,19 @@ lqasc_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       /* check if this is the console port */
> -       if (mmres->start != CPHYSADDR(LTQ_EARLY_ASC))
> -               line = 1;
> +       /* get serial id */
> +       line = of_alias_get_id(node, "serial");
> +       if (line < 0) {
> +#ifdef CONFIG_LANTIQ
> +               if (mmres->start == CPHYSADDR(LTQ_EARLY_ASC))
> +                       line = 0;
> +               else
> +                       line = 1;
> +#else
> +               dev_err(&pdev->dev, "failed to get alias id, errno %d\n", line);
> +               return line;

Please note that not providing a fallback here makes life harder when using
DT overlays.
See the description of commit 7678f4c20fa7670f ("serial: sh-sci: Add support
for dynamic instances") for background info.

> +#endif
> +       }
>
>         if (lqasc_port[line]) {
>                 dev_err(&pdev->dev, "port %d already allocated\n", line);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
