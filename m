Return-Path: <SRS0=IuOY=PG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E54BC43612
	for <linux-clk@archiver.kernel.org>; Sat, 29 Dec 2018 16:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D84B0217F4
	for <linux-clk@archiver.kernel.org>; Sat, 29 Dec 2018 16:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r5oKKmPf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbeL2QdZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Dec 2018 11:33:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43524 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbeL2QdY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 Dec 2018 11:33:24 -0500
Received: from avalon.localnet (unknown [IPv6:2a02:2788:66a:3eb:2624:a446:f4b7:b19d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AB3767;
        Sat, 29 Dec 2018 17:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1546101201;
        bh=ubYu2qSabs/NxhAew+yt6jyiwOZvytkc3wxkvWZ24Vw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r5oKKmPfNgitcKmbM148j1Pmjkrr72h3eVVakj8h6GtxeDgJiikepPHIyzgHl1tKW
         ZY+6N56gFg6g72j117rVA308uq1NPs9noAgVt49Ul4OKIELVqOrc4GNV4u7JpJ94MC
         uOwe5ZKgR7zkplTZztChUCsfKOzogVaArorJzo28=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>
Subject: Re: [PATCH] clk: vc5: Abort clock configuration without upstream clock
Date:   Sat, 29 Dec 2018 18:34:18 +0200
Message-ID: <55221313.VLWvnZIo28@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <154603621662.179992.6055107804025821286@swboyd.mtv.corp.google.com>
References: <20181215005519.3695-1-marek.vasut+renesas@gmail.com> <3220bca0-486d-08a8-7575-34c961ed1261@gmail.com> <154603621662.179992.6055107804025821286@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Saturday, 29 December 2018 00:30:16 EET Stephen Boyd wrote:
> Quoting Marek Vasut (2018-12-16 09:14:29)
> > On 12/16/2018 08:19 AM, Laurent Pinchart wrote:
> > > On Saturday, 15 December 2018 02:55:19 EET Marek Vasut wrote:
> > >> In case the upstream clock are not set, which can happen in case the
> > >> VC5 has no valid upstream clock, the $src variable is used uninited
> > >> by regmap_update_bits(). Check for this condition and return -EINVAL
> > >> in such case.
> > > 
> > > Note that the probe() function will fail in this case, so
> > > vc5_mux_set_parent() won't be reached.
> > > 
> > >> Note that in case the VC5 has no valid upstream clock, the VC5 can
> > >> not operate correctly. That is a hardware property of the VC5. The
> > >> internal oscilator present in some VC5 models is also considered
> > >> upstream clock.
> > >> 
> > >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > >> Cc: Alexey Firago <alexey_firago@mentor.com>
> > >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >> Cc: Stephen Boyd <sboyd@kernel.org>
> > >> Cc: linux-renesas-soc@vger.kernel.org
> > >> ---
> > >> 
> > >> NOTE: This is an updated version of:
> > >>       https://patchwork.kernel.org/patch/10731699/
> > >> 
> > >> ---
> > >> 
> > >>  drivers/clk/clk-versaclock5.c | 4 +++-
> > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > >> 
> > >> diff --git a/drivers/clk/clk-versaclock5.c
> > >> b/drivers/clk/clk-versaclock5.c
> > >> index 5b393e711e94..b10801506518 100644
> > >> --- a/drivers/clk/clk-versaclock5.c
> > >> +++ b/drivers/clk/clk-versaclock5.c
> > >> @@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *hw,
> > >> u8> index)
> > >> 
> > >>              if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
> > >>                      src = VC5_PRIM_SRC_SHDN_EN_XTAL;
> > >> -            if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
> > >> +            else if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
> > >>                      src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
> > >> +            else
> > >> +                    return -EINVAL;
> > >>      }
> > > 
> > > I'd rather go for Stephen's approach if the goal is just to silence a
> > > warning for a condition that can't happen in practice.
> > 
> > Sure, probe will fail, but it's safer to handle the possibility that
> > probe() is broken and this code is reached by properly handling the
> > failure instead of doing something obviously wrong (like configuring the
> > hardware with value 0).
> 
> I'm fine with this approach. Laurent?

So am I. I might add a comment in the vc5_mu_set_parent() function to explain 
this can't happen.

-- 
Regards,

Laurent Pinchart



