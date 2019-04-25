Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38697C43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF9A620717
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556216122;
	bh=0/Kt3x/5zOtmLh233f0p7vxpl0T/06aXPWCKQuYod4o=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=E4CUtN+Y7sCmOHzxwm7Nf+Pp9FcvGQlKKF28uxqyGtE8dC2QbQeZfPejk0h5GE764
	 1axCznHSJpI6rJBDw5f7WDz/AFtZbh2WpKJBOSV9+YJNnOz6yf1IhFkE3M9nBYnMSh
	 xT9A8UspY516IW4mHpcugU2Ji7HZ9+3arhnS7VjQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfDYSPV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 14:15:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbfDYSPV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 14:15:21 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86DCB20685;
        Thu, 25 Apr 2019 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556216121;
        bh=0/Kt3x/5zOtmLh233f0p7vxpl0T/06aXPWCKQuYod4o=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=rQgFHZw2FneL4BXHiookOi+mZIneg7z33Dr3BF4KGAP41ExrBxdAugwkOlHrRIOLG
         Bm+6aEl6+5XnJM1WSze4Xxa7ntKdRy8rXTkOshftWicg4sD0TYT0F9tV4kGUZbPrGc
         w7lQUEIM8NaVXSHiERpsuOOa+Xqqdzk+schihNMA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1554365467-1325-4-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com> <1554365467-1325-4-git-send-email-t-kristo@ti.com>
Cc:     tony@atomide.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/6] clk: ti: dra7x: prevent non-existing clkctrl clocks from registering
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com
Message-ID: <155621612017.15276.13460948100711255038@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 11:15:20 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-04-04 01:11:04)
> Certain clkctrl clocks (like the USB_OTG_SS4) do not exist on some
> variants of the dra7x SoC. Append a flag for these clocks and skip
> the registration in cases where the clocks do not exist.
>=20
> Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next

