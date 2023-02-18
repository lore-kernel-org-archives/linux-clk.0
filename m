Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEEBC61DA4
	for <linux-clk@archiver.kernel.org>; Sat, 18 Feb 2023 04:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBREqT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 23:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBREqR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 23:46:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C81A305C7
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 20:46:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 02841B82D76
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 04:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F4AC433EF;
        Sat, 18 Feb 2023 04:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676695572;
        bh=T+sDRqs30I4bOQHqUlyM8ZtuiCgxTPU/ZD5Dx1yA400=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pCJ+j4QVqgKcgTN9fzvTMVxrQUQL1en5Ujw+xMrbpiimBeAFgB4WcQ5lVjqf00pQD
         x5iO9thKaITLceuuzetxqEvWpOpqWLMF19gDI8tKv6qDi3eVSM/zRumWGf5gBfJTD5
         2eVdrHnwrCzF3ShDBh+CY1zgso7MB5hvCmpzDsNGOuGmKcyV/7Q3lrFJKJTQdul9z2
         bomFNmDyh48lLePyfXofOc/+VzhRGhn9iZidDhDi0+vZJBMP0XFip6NXPkFFLaUtnJ
         JC7tCLBii/Mv2hruATLgXT9VUhdHHsCJX65k35KKFqmNxu5z0v0wbbY09bw1hABfzX
         8Hil2Zcdq9QBg==
Message-ID: <7a9af046a8ec29433e453de3964cef52.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221216210922.592926-1-marex@denx.de>
References: <20221216210922.592926-1-marex@denx.de>
Subject: Re: [PATCH] clk: rs9: Drop unused pin_xin field
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 17 Feb 2023 20:46:10 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-12-16 13:09:22)
> The pin_xin field in struct rs9_driver_data is unused, drop it.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
