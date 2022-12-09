Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE32DC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 18:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiLIS2C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 13:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiLIS15 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 13:27:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E24532EE;
        Fri,  9 Dec 2022 10:27:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9EA46622F2;
        Fri,  9 Dec 2022 18:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030F9C433EF;
        Fri,  9 Dec 2022 18:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670610474;
        bh=8vekvIuMoN9SLcC/7erPZXNzxTduODMnP/xUFfZumk0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QlbIs+nYCnVPSeWpCGXFr7V/34JQdWLrL2HPd9fT3qfdB5e/1jzuJ5KI/pBbF1fxC
         opMEULVsWXFUQVjHh+AAhi7sD+jrjxsy0SWLvb2RcxhPMmCP7i/0tsNTEeIGwI3fV5
         ig5dskWhjhRPbOdREiLh0sp9+dzTYfElNGaXZmT2qrQH7nF/OZ2f0adBurr/wqDPzb
         NhXOR1PuX/9iS+JjwlfpINMpzpmoLcrkojTyFIr7/6iJoFNoT9PU0msgIGXFvFi4r7
         wqVJha22Rs9atFRgLw+lareBIKORzGyMzSIs/U6HWEu6ugRLoc4BgkCJojxkX5Njm3
         b96HeDaW03ysw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221207081042.3897128-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20221207081042.3897128-1-Qing-wu.Li@leica-geosystems.com.cn>
Subject: Re: [PATCH V1] clk: imx8mp: Alias M7 SRC/DIV to M7 CORE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Qing-wu.Li@leica-geosystems.com.cn, 18701859600@163.com
To:     LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>,
        abelvesa@kernel.org, festevam@gmail.com, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, s.hauer@pengutronix.de,
        shawnguo@kernel.org
Date:   Fri, 09 Dec 2022 10:27:51 -0800
User-Agent: alot/0.10
Message-Id: <20221209182754.030F9C433EF@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting LI Qingwu (2022-12-07 00:10:42)
> Defined IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV in imx8mp-clock.h
> but never assigned. It will cause the system to hang if using it.
> Alias IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV to IMX8MP_CLK_M7_CORE
> for backward compatibility.
>=20
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>

Any Fixes tag?
