Return-Path: <SRS0=q5Yd=OZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA282C43444
	for <linux-clk@archiver.kernel.org>; Sun, 16 Dec 2018 07:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88DAA206C2
	for <linux-clk@archiver.kernel.org>; Sun, 16 Dec 2018 07:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ua90CWZW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729804AbeLPHSa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Dec 2018 02:18:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45918 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbeLPHSa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Dec 2018 02:18:30 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFAD159;
        Sun, 16 Dec 2018 08:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544944708;
        bh=qoGwzlaskFJNCbfPgNBGL4Dln3f/91qSpPx48HuywhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ua90CWZWdoJLCxITBI91/TRhy2b/TM5x7kieiQOg9Vbx7fGTvSRFI9J2hQetdiSS9
         v4Xl/0REENMvhUJeCbKEkR4Sl5yOPYOTPjRSrD376/tSD+7ezvW7yvEpywWrhmskSb
         DwZ4hKvr2UGS5/vtp5QvOjJiP27MXLgkgjniMW6M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: vc5: Abort clock configuration without upstream clock
Date:   Sun, 16 Dec 2018 09:19:16 +0200
Message-ID: <13438812.kSL9ZioSIq@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20181215005519.3695-1-marek.vasut+renesas@gmail.com>
References: <20181215005519.3695-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Saturday, 15 December 2018 02:55:19 EET Marek Vasut wrote:
> In case the upstream clock are not set, which can happen in case the
> VC5 has no valid upstream clock, the $src variable is used uninited
> by regmap_update_bits(). Check for this condition and return -EINVAL
> in such case.

Note that the probe() function will fail in this case, so vc5_mux_set_parent() 
won't be reached.

> Note that in case the VC5 has no valid upstream clock, the VC5 can
> not operate correctly. That is a hardware property of the VC5. The
> internal oscilator present in some VC5 models is also considered
> upstream clock.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: This is an updated version of:
>       https://patchwork.kernel.org/patch/10731699/
> ---
>  drivers/clk/clk-versaclock5.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 5b393e711e94..b10801506518 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8
> index)
> 
>  		if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
>  			src = VC5_PRIM_SRC_SHDN_EN_XTAL;
> -		if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
> +		else if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
>  			src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
> +		else
> +			return -EINVAL;
>  	}

I'd rather go for Stephen's approach if the goal is just to silence a warning 
for a condition that can't happen in practice.

>  	return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, mask, src);

-- 
Regards,

Laurent Pinchart



