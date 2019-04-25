Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74863C43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 17:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 028C920685
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556214671;
	bh=bGcgDgP+AlGUTJBd7p6PhXDCt/gxhGUApsvwLrTO604=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=Im12iI5RosIw+EE1HZi85rZFtDFvxPLuMghZdplM+7I14YqZVuDLaz6jAXUxpQAK5
	 Th+Ew79uSHclzLEyWBosJZvC8XbsaItYh4ml8Qq6XKd3HUS6c5NvYlKsFoD/sMHMuh
	 7zA+5dCSICM2Q/p3marLdDzjpSiEWRPJgjC5uXXM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfDYRvK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 13:51:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbfDYRvJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 13:51:09 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 988F5205F4;
        Thu, 25 Apr 2019 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556214669;
        bh=bGcgDgP+AlGUTJBd7p6PhXDCt/gxhGUApsvwLrTO604=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=dTjtl5qQb88jnCuUo/bdW915Ijck6uZy0fpyWKXJdT8VZw7UQfAa0yBkbVnpmbVGq
         cWTnFqBU+EVYycnxmTOfRhXJxrQ+nXm2JuqiiorU27NLNkhzhwOG2a5MQ5Yb6F8vYY
         uEHa3qzsyul712D3+lM/5ZH7zMGXIPE3tt9EwptY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0b729373-baa1-5258-064e-499b2f9ca807@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com> <1554365467-1325-6-git-send-email-t-kristo@ti.com> <20190404140635.GA49658@atomide.com> <0b729373-baa1-5258-064e-499b2f9ca807@ti.com>
Cc:     linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        mturquette@baylibre.com, Eric Ruei <e-ruei1@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/6] clk: ti: am33xx: drop idlest polling from gfx clkctrl clock
To:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Message-ID: <155621466804.15276.12136205638146291136@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 10:51:08 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-04-07 22:45:08)
> On 04/04/2019 17:06, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [190404 08:12]:
> >> From: Eric Ruei <e-ruei1@ti.com>
> >>
> >> The GFX modules on AM33xx SoCs have a hardreset line and are controlled
> >> by a GFX reset line. Any clkctrl enable/disable operations cannot be
> >> checked for module enabled/disabled status independent of the reset
> >> operation, and this causes some unwanted timeouts in the kernel and
> >> unbalanced states for the GFX clocks. These details should be handled
> >> by the driver integration code itself.
> >=20
> > These last two patches should no longer be needed with ti-sysc.
> > Well, at least based on testing with the earlier reset-simple driver
> > patch and a test for sgx register access on am335x.
> >=20
> > On init we deassert rstctrl if configured and in reset, then enable
> > clocks, and read the module revision. And the module is ready for child
> > device driver(s) to probe, and do what they want with the rstctrl via a
> > reset driver. If no child device driver(s) are configured, ti-sysc will
> > just put the module rstctrl back to reset using reset driver.
>=20
> Ok good to know, lets drop these patches for now and re-consider once we =

> can try out graphics with latest kernel... unfortunately it is not=20
> available upstream.

Sooooo drop the last two patches and I should pick up the first four?

