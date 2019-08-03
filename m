Return-Path: <SRS0=KU3F=V7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC711C433FF
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 15:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E29F2166E
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564844684;
	bh=ZtnQiHcTsMI4Da/gZ9Elzfs6xppHV2apA6OfklfbEJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=G7tMK0KVgUzcOpvq1IMx2F0jGTMvS1szLGuZVEMt/qVmiWTsS6JwwlPI2GwKBBRXd
	 us/04WdVgXoMyP2p88EsklnZr3pszj7SkM1xcSZtvuV0tZsRdaujG1BjUitCCdArT8
	 OBBbPqPEa3UT3f526WliAtywe17oQVhHjzhbKPus=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfHCPEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Aug 2019 11:04:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfHCPEo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Aug 2019 11:04:44 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 013F6206C1;
        Sat,  3 Aug 2019 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564844683;
        bh=ZtnQiHcTsMI4Da/gZ9Elzfs6xppHV2apA6OfklfbEJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h8lOkzoJfFXGZDwMchIHpOc6AQo8qhjpkejNS5dA0LNgWnClZe/2sk04GzEYdg5AK
         dXFkrgALO3S2hGAXZLdq256kTh3n9cZXeBnjSsLmqFYLR1ZlsnBsXNIUXb8+PhTgmk
         HxOIDtoDO6/IDwmHa/2RuUlaD2kxDtC2eE2DS6ug=
Date:   Sat, 3 Aug 2019 17:04:36 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Guido Gunther <agx@sigxcpu.org>,
        Anson Huang <anson.huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] clk: imx8mq: Mark AHB clock as critical
Message-ID: <20190803150432.GP8870@X250.getinternet.no>
References: <1564471375-6736-1-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564471375-6736-1-git-send-email-abel.vesa@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jul 30, 2019 at 10:22:55AM +0300, Abel Vesa wrote:
> Initially, the TMU_ROOT clock was marked as critical, which automatically
> made the AHB clock to stay always on. Since the TMU_ROOT clock is not
> marked as critical anymore, following commit:
> 
> 431bdd1df48e ("clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT")

The commit ID is not stable before the commit actually lands mainline.
I could possibly rebase the branch.

> 
> all the clocks that derive from ipg_root clock (and implicitly ahb clock)
> would also have to enable, along with their own gate, the AHB clock.
> 
> But considering that AHB is actually a bus that has to be always on, we mark
> it as critical in the clock provider driver and then all the clocks that
> derive from it can be controlled through the dedicated per IP gate which
> follows after the ipg_root clock.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Tested-by: Daniel Baluta <daniel.baluta@nxp.com>
> Fixes: 431bdd1df48e ("clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT")

Dropped commit ID above and Fixes tag here, and applied the patch. 

Thanks for the fixing.

Shawn
