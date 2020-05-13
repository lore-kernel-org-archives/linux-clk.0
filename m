Return-Path: <SRS0=ZViX=63=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46385C2D0F6
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 03:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2369C23127
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 03:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589339913;
	bh=ed6gXENa/W1RjzBFyeIVvQW6Im7PXr0RmRmYy3seB8c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=w2T2Osm+Ps+/95HYjmoKvlEAuy+NFfcReCO0ddVnxA9A9ROg/NEKyh8LpMyntLDWh
	 BhzFC1K/ITEmH3uE/LdP4UqNte5UBudMSh11EiTEZVXM2pe6TRgeK1XsQd8ims0/0/
	 bcodu4A2/bmUS73PNgO67W359oEZT8O1ii0tLCok=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgEMDSc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 May 2020 23:18:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:50318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMDSa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 23:18:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 451A624927;
        Wed, 13 May 2020 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589339910;
        bh=ed6gXENa/W1RjzBFyeIVvQW6Im7PXr0RmRmYy3seB8c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G07pCmBY2YfcYT/8Dgz2GHDgNgVAtQm+vKpVa/BKuIO8kIc5xu8NO4hvYobThHJnU
         m4iiKkRkQqBZynA0XmrodJonIlEyakObiMOPHDJPuY7/xk2DzJb69VgugE4Nkig+Mk
         yc+4FqogA2Lv/ku3PaANBzdj7PtIKinu35LGy77M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200430083451.8562-1-t-kristo@ti.com>
References: <20200430083451.8562-1-t-kristo@ti.com>
Subject: Re: [PATCH] clk: ti: clkctrl: convert subclocks to use proper names also
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 12 May 2020 20:18:29 -0700
Message-ID: <158933990954.215346.10446994560814171691@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2020-04-30 01:34:51)
> Addition of the new internal API to get the clkctrl names missed adding
> the same conversion in place for the subclocks. This leads into missed
> parent/child relationships (i.e. orphaned clocks) with mixed node name
> handling, for example with omap4/omap5 where the l4_per clocks are using
> new naming, but rest are using old. Fix by converting the subclock
> registration to pick correct names for the clocks also.
>=20
> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node nam=
e")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-fixes
