Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF75C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:33:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 868E321A4C
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tbS7vsPl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbfIIKd2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 06:33:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41230 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbfIIKd1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 06:33:27 -0400
Received: by mail-io1-f67.google.com with SMTP id r26so27364436ioh.8
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 03:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fuz0APlA/91vrCKi8bgo0ZO6GT+wvw8fr5yIHMd8ndA=;
        b=tbS7vsPlsq4H9GZeJS8G+mX1H76qs4fHTPvjl6vrUekVObE4mnV36z9jP3iQdkhE4H
         jStQyOt4LQxGg8ssfN9otSTRoryWz/1PGeC/gWXnLNJ1w9K4cgT+ftlLNdQgI+enSpij
         vCE5hdZxWi7SCzYky2nt+WvFHta8yhbdAU+ifI/7vRdw28UWnqSbGu6i8T3TK9B2S73/
         AtretYLKnHjrqH0lp9C/HLGBwIEl4U6fX4cPgPEKEwpzAJNM76axXQwWXMBf/YsaBJ5G
         EeSH+t5E3KmcA6jvpcq339YbCsowWp5cXq9Al6AJPGD0+nk/0Tr0smv13WH9JoZvsjy9
         kdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fuz0APlA/91vrCKi8bgo0ZO6GT+wvw8fr5yIHMd8ndA=;
        b=HnnYJa26RA1fpBNourol2suS+SIoF770Xqmw0x4+3rUCs7KkHkTzZsCHDNsJCj54jO
         JzDKADDM8hpsx6+gSadgBctglxlMDKK8pyjICSRMGfsrtcSOxl2VgtEpfij3tdG1iT8o
         Dn9jq7pZXHq0Tl/b2xkqdLUfi0l1V6yl+WToyBdJYxnJdLPHol+mOt8dpboWtEwJ1MMx
         lisfqYlbvwsgbCtP2ho0Mc4D6Yr9yxZO/Mr7fjBOxLBVzmmv169l+cq/jhAlJ/3iSZD4
         W8zs2xboq1quITR8pnzI8wl3zvv54+lgQqTWCNOKzJxnnY8MmDmYS92f9vRek8QUlTYU
         HcVQ==
X-Gm-Message-State: APjAAAXgXSOiBsM1MGWYoq8sneghu20Cyz2wa5ODgsbYYOCXlRDaFDTl
        H3icFXL9bQhrRe5hVStL5oEEpdyuQTi0t14L/+k=
X-Google-Smtp-Source: APXvYqyNtCv+7lh5AAglF7wdI0kymQ1YlOxUM2k5zsdtIckxMfVfQa6VopJ4YAj2nAD+UIzYSZo8klCrbUFIV2jbmbU=
X-Received: by 2002:a02:3b6f:: with SMTP id i47mr197535jaf.24.1568025206922;
 Mon, 09 Sep 2019 03:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-4-git-send-email-aisheng.dong@nxp.com> <20190906170643.B310F20578@mail.kernel.org>
In-Reply-To: <20190906170643.B310F20578@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 9 Sep 2019 18:23:25 +0800
Message-ID: <CAA+hA=QoZFFb_EVfxcDuJB-9VobVd-1-RyhWeNTSePxW50P8Eg@mail.gmail.com>
Subject: Re: [PATCH V4 03/11] clk: imx: scu: add two cells binding support
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Thanks for the review.

On Sat, Sep 7, 2019 at 5:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-08-20 04:13:17)
> > diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> > index 5e2903e..1ad3f2a 100644
> > --- a/drivers/clk/imx/clk-imx8qxp.c
> > +++ b/drivers/clk/imx/clk-imx8qxp.c
> > @@ -134,7 +134,12 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
> >                                 i, PTR_ERR(clks[i]));
> >         }
> >
> > -       return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
> > +       if (clock_cells == 2)
>
> Can you just read this from the DT node again instead of having a global
> variable called "clock_cells" for this?
>

I tried thinking about it.
One problem is that we also need this information in the exist clk
registration API to
keep the backwards compatibility:
e.g.
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
                                         u8 clk_type)
 {
-       return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
+       if (clock_cells == 2)
+               return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
+       else
+               return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
 }

Parsing it for all clocks seems not good.

In the future, i planned to totally remove the legacy binding support which
is a premature one and missing continued support.
Then we will also remove this unneeded clock_cells.

> > +               ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
> > +       else
> > +               ret = of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
> > +
> > +       return ret;
> >  }
> >
> >  static const struct of_device_id imx8qxp_match[] = {
> > diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> > index fbef740..48bfb08 100644
> > --- a/drivers/clk/imx/clk-scu.c
> > +++ b/drivers/clk/imx/clk-scu.c
> > @@ -16,6 +19,21 @@
> >  #define IMX_SIP_SET_CPUFREQ            0x00
> >
> >  static struct imx_sc_ipc *ccm_ipc_handle;
> > +struct device_node *pd_np;
> > +u32 clock_cells;
> > +
> > +struct imx_scu_clk_node {
> > +       const char *name;
> > +       u32 rsrc;
> > +       u8 clk_type;
> > +       const char * const *parents;
> > +       int num_parents;
> > +
> > +       struct clk_hw *hw;
> > +       struct list_head node;
> > +};
> > +
> > +struct list_head imx_scu_clks[IMX_SC_R_LAST];
> >
> >  /*
> >   * struct clk_scu - Description of one SCU clock
> > @@ -128,9 +146,29 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
> >         return container_of(hw, struct clk_scu, hw);
> >  }
> >
> > -int imx_clk_scu_init(void)
> > +int imx_clk_scu_init(struct device_node *np)
> >  {
> > -       return imx_scu_get_handle(&ccm_ipc_handle);
> > +       struct platform_device *pd_dev;
> > +       int ret, i;
> > +
> > +       ret = imx_scu_get_handle(&ccm_ipc_handle);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (of_property_read_u32(np, "#clock-cells", &clock_cells))
> > +               return -EINVAL;
> > +
> > +       if (clock_cells == 2) {
> > +               for (i = 0; i < IMX_SC_R_LAST; i++)
> > +                       INIT_LIST_HEAD(&imx_scu_clks[i]);
> > +
> > +               pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
> > +               pd_dev = of_find_device_by_node(pd_np);
> > +               if (!pd_dev || !device_is_bound(&pd_dev->dev))
> > +                       return -EPROBE_DEFER;
>
> Do you need to put some nodes here with of_node_put() one failure or
> when they're done being used?
>

Good catch.
We should put the node for of_find_compatible_node().

> > +       }
> > +
> > +       return 0;
> >  }
> >
> >  /*
> > @@ -387,3 +425,99 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
> [...]
> > +
> > +struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
> > +                                    const char * const *parents,
> > +                                    int num_parents, u32 rsrc_id, u8 clk_type)
> > +{
> > +       struct imx_scu_clk_node clk = {
> > +               .name = name,
> > +               .rsrc = rsrc_id,
> > +               .clk_type = clk_type,
> > +               .parents = parents,
> > +               .num_parents = num_parents,
> > +       };
> > +       struct platform_device *pdev;
> > +       int ret;
> > +
> > +       pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
> > +       if (!pdev) {
> > +               pr_err("%s: failed to allocate scu clk dev rsrc %d type %d\n",
> > +                      name, rsrc_id, clk_type);
> > +               return ERR_PTR(-ENOMEM);
> > +       }
> > +
> > +       ret = platform_device_add_data(pdev, &clk, sizeof(clk));
> > +       if (ret) {
> > +               platform_device_put(pdev);
> > +               return ERR_PTR(-ENOMEM);
>
> Why not ERR_PTR(ret)?
>

Good catch. Will fix.

Regards
Aisheng

> > +       }
> > +
> > +       pdev->driver_override = "imx-scu-clk";
> > +
> > +       ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
> > +       if (ret)
> > +               pr_warn("%s: failed to attached the power domain %d\n",
> > +                       name, ret);
> > +
> > +       platform_device_add(pdev);
> > +
> > +       /* For API backwards compatiblilty, simply return NULL for success */
> > +       return NULL;
> > +}
