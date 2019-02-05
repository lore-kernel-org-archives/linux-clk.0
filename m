Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595E0C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 10:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 331662145D
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 10:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfBEKsT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 05:48:19 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34745 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfBEKsT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 05:48:19 -0500
Received: by mail-vs1-f68.google.com with SMTP id y27so1870136vsi.1;
        Tue, 05 Feb 2019 02:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGaFgVO7R3UTfl8joDIeXgDdfkFqHZwe182TfUHL74U=;
        b=Kai6z7++Gvf6hhJJPbTNYQgcBo1jEmRTbglvBF+Mv0vXLiIUZ3mv8b0TJysDrBShi0
         l2KgIt/PfDZKI0+hW9p/ITtW+VFWLMuq6uZmXEBn+6Ll7oUvCmssMKrX9wbGHxv6iyxV
         xkxWVx3IOvJ6y8tzkw9+qAVBwXlcRNouJXOXGOsZ30nK7jAzEBovTBlpnzw9CJBhbmRm
         6/fxfcPx88s6JRzVEhwFZDILV120z1kgvgS7C0zVsMIk2bNO3nWc4mtELrYiaqVoDGaw
         fWfzvKmyfFub45zRf/e4MwtxzipPWEAu6D9S1/3Lr7qZkGxM2v50pi3PS0g+JyiJRVf9
         LQRw==
X-Gm-Message-State: AHQUAuYGWWaOJSx3vn8fA68/4sHnUnhfBM/2RiEQJrPqBrMgO8cWKpmb
        rssdwM/Id9cwEHUkVYTQ1R/9XpabR0DllayabTM=
X-Google-Smtp-Source: AHgI3IaX07hsQtSKfIy8Ipvz+UnhhfdmBtsTo0NLYiwDLl3uIUG/+wGUVHO6kYpGJkULdY5sDImxuEjTSR2cBMW/TFU=
X-Received: by 2002:a67:c202:: with SMTP id i2mr1770183vsj.11.1549363698393;
 Tue, 05 Feb 2019 02:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au> <20190131094021.3092-3-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 11:48:06 +0100
Message-ID: <CAMuHMdXsQ_e3=9q8EJVcK3L5BSNGQDux4tGe+sxLJPgFFVEtZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: rcar-gen3: Parameterise Z and Z2
 clock offset
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Parameterise the offset of control bits within the FRQCRC register
> for Z and Z2 clocks.
>
> This is in preparation for supporting the Z2 clock on the R-Car E3
> (r8a77990) SoC which uses a different offset for control bits to
> other, already, supported SoCs.
>
> This mechanism should be extendable to other clocks, such as ZG,
> f.e. by adding the number of control bits as a parameter to
> cpg_z_clk_register().
>
> As suggested by Geert Uytterhoeven.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c

> @@ -568,14 +566,9 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                 break;
>
>         case CLK_TYPE_GEN3_Z:
> -               return cpg_z_clk_register(core->name, __clk_get_name(parent),
> -                                         base, CPG_FRQCRC_ZFC_MASK,
> -                                         core->div);
> -
>         case CLK_TYPE_GEN3_Z2:
>                 return cpg_z_clk_register(core->name, __clk_get_name(parent),
> -                                         base, CPG_FRQCRC_Z2FC_MASK,
> -                                         core->div);
> +                                         base, core->div, core->offset);

CLK_TYPE_GEN3_Z and CLK_TYPE_GEN3_Z2 are now the same type.
Perhaps they can be merged completely, and be absorbed into the
DEF_GEN3_Z() macro?
Or not, depending on how ZG support will be added...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
