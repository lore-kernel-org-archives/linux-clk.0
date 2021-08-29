Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947D6C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 05:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BCDF60F25
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 05:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhH2FVk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 01:21:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233657AbhH2FVj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 01:21:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E76B60F38;
        Sun, 29 Aug 2021 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630214448;
        bh=FBmhYvFBl6A2T3xvjfB+bi/07BMWn85G+klp3N2C4CA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jUzLhWXna65prjoszxwQQMQZBSTY0VPNqk46zXwUgGbl+/yDZ5RamyK1dQdhFgVE/
         KKn1mFk2tN9KFhbYwfCKO3oVco3dFGwzgihtFRjmVgP/5XkzT0nRFtpKOV2JOfQtl/
         i0TFAep5CsgGZclE7/jpYevExt8oE07o63IEibSoBc2ZY1mt2Bg1mrqOQc33hxDUwM
         cdkGQYovkO8CtXOGZ4GjTMofs7CV7OWRckjfMJjn0t8F+SytBd4SRYT5cNY3EKDPxR
         z0hOGRiMxLw2SBTjP48Gn7RoPLhnP4CvfFrFN7H4Km197i2voIAaMobnxWGYq+c4/7
         0EMdNct5poHJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210813091118.17571-1-zhipeng.wang_1@nxp.com>
References: <20210813091118.17571-1-zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH] clk: add sys node to disable unused clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Zhipeng Wang <zhipeng.wang_1@nxp.com>, mturquette@baylibre.com
Date:   Sat, 28 Aug 2021 22:20:46 -0700
Message-ID: <163021444683.2676726.5708766744722496303@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zhipeng Wang (2021-08-13 02:11:18)
> The normal sequence is that the clock provider registers clk to
> the clock framework, and the clock framework manages the clock resources
> of the system. Clk consumers obtain clk through the clock framework API,
> enable and disable clk.
>=20
> Not all clk registered through the clock provider will be used
> by the clock consumer, so the clock framework has a function
> late_initcall_sync(clk_disable_unused); disables the unused clk.
>=20
> Now we modularize the clock provider and some consumers, which will
> cause late_initcall_sync(clk_disable_unused); cannot work properly, so
> increase the sys node.

Sorry, I honestly don't know what's going on here. The commit text is
describing the clk disable unused logic, and then we're adding a sysfs
attribute without documenting it in Documentation/ABI? And there's one
sentence about modular clks not working properly, but I don't know what
is wrong about it besides it is "wrong".

I've been considering ripping out the late initcall to disable unused
clks. It pretty much only leads to problems. If we want to save power,
then maybe we should have clk providers tell us what clks aren't ever
going to be used unless they're referenced in DT or via some clkdev
lookup and only turn the ones off that are in that list if they're on.
