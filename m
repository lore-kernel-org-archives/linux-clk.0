Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FD4C43612
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 15:33:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D334206E0
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 15:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Zx9J+jur"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbeLNPdg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 10:33:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35572 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbeLNPdg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Dec 2018 10:33:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 61D8A25AD76;
        Sat, 15 Dec 2018 02:33:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544801614; bh=38cf1kJeuuuFhK9SU/edUHvVa7qRxa4ggOpmDGBaVr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zx9J+jurfWqZ+XWRhHMpkTyKgqMoXpWeL2+tcAJzBRpsVOIeUMID5VWn89Sz7jETC
         thnSuAhyKDJzZdwi+P9qVi+4uMm92EcBUfoloeV/ZXBd2bVUkWMEyJJ7TtsZSd7ESE
         YMPE6CfCQNgPhn0bvfZQqLdhigahcGLKnZ8Nj7x0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7C92B9403C3; Fri, 14 Dec 2018 16:33:32 +0100 (CET)
Date:   Fri, 14 Dec 2018 16:33:32 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
Message-ID: <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
 <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 10:49:44PM +0300, Sergei Shtylyov wrote:
> Protect the CPG register read-modify-write sequence with a spinlock.

Spinlocks are expensive, I think an explanation of why this is
necessary would be worthwhile.

> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - new patch.
> 
>  drivers/clk/renesas/rcar-gen3-cpg.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
> ===================================================================
> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -30,14 +30,19 @@
>  
>  #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
>  
> +static spinlock_t cpg_lock;
> +
>  static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
>  {
> +	unsigned long flags;
>  	u32 val;
>  
> +	spin_lock_irqsave(&cpg_lock, flags);
>  	val = readl(reg);
>  	val &= ~clear;
>  	val |= set;
>  	writel(val, reg);
> +	spin_unlock_irqrestore(&cpg_lock, flags);
>  };
>  
>  struct cpg_simple_notifier {
> @@ -604,5 +609,8 @@ int __init rcar_gen3_cpg_init(const stru
>  	if (attr)
>  		cpg_quirks = (uintptr_t)attr->data;
>  	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
> +
> +	spin_lock_init(&cpg_lock);
> +
>  	return 0;
>  }
> 
