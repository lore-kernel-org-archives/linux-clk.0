Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17B1C04EB9
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 13:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 975EE20850
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 13:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bpgzi4Kb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975EE20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbeLENyA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 08:54:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50770 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbeLENyA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Dec 2018 08:54:00 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 494D1546;
        Wed,  5 Dec 2018 14:53:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544018037;
        bh=cZBmqfkJ6vqjrhOLv8B+J4bXQjMCy719PQOHXDZaHMo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bpgzi4KbDaxe4asfhMYeckfVitnLGqHdb+sPq9v95ExidB4c/wzhhs0vNQJORCrg+
         mhII1VKm7HlcM6nA/qLKrSKF5J/Gt21pb/2NbnBUicTCSi6pG3cQeTTGpi4s/jfT4h
         Mjs+1qBGK31YsXQxjsdakHGcAPM4GXn657R2ipMo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
Date:   Wed, 05 Dec 2018 15:54:33 +0200
Message-ID: <5897969.XemNuYOREI@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <5bd189ca-2bac-58ce-a635-58f515962f82@gmail.com>
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com> <2439179.Yi0TbQOvfy@avalon> <5bd189ca-2bac-58ce-a635-58f515962f82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Wednesday, 5 December 2018 14:29:22 EET Marek Vasut wrote:
> On 12/05/2018 06:21 AM, Laurent Pinchart wrote:
> > On Wednesday, 5 December 2018 01:48:01 EET Marek Vasut wrote:
> >> On 12/04/2018 09:52 PM, Stephen Boyd wrote:
> >>> Quoting Marek Vasut (2018-12-04 10:27:21)
> >>> 
> >>>> diff --git a/drivers/clk/clk-versaclock5.c
> >>>> b/drivers/clk/clk-versaclock5.c
> >>>> index decffb3826ec..ac90fb36af1a 100644
> >>>> --- a/drivers/clk/clk-versaclock5.c
> >>>> +++ b/drivers/clk/clk-versaclock5.c
> >>>> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
> >>>>         return 0;
> >>>>  }
> >>>> 
> >>>> +#ifdef CONFIG_PM_SLEEP
> >>>> +static int vc5_suspend(struct device *dev)
> >>> 
> >>> Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP
> >>> 
> >>>> +{
> >>>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
> >>>> +       int ret;
> >>>> +
> >>>> +       ret = regcache_sync(vc5->regmap);
> >>>> +       if (ret != 0) {
> >>>> +               dev_err(dev, "Failed to save register map: %d\n", ret);
> >>>> +               return ret;
> >>> 
> >>> Do we need to block suspend if we can't save the register map away? Or
> >>> can we just throw up our hands and not restore on resume?
> >> 
> >> Some hardware will fail on resume, so I'd say -- yes ?
> > 
> > But why do you need to sync on suspend in the first place ? What could
> > cause the map to be dirty at this stage, and require syncing before
> > suspend, that couldn't work with the sync be delayed to resume time ?
> 
> Possibly a configuration coming from eg. bootloader time , or some other
> configuration not done by Linux.

I still don't get it. As far as I know, regcache_sync() will write the content 
of the regmap to the hardware, not the other way around. You call it at resume 
time, so the hardware should be programmed properly, regardless of what the 
boot loader or the firmware does when resuming.

Could you please explain why this is needed at suspend time ?

-- 
Regards,

Laurent Pinchart



