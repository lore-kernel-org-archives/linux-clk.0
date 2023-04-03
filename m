Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8EEC76196
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 10:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjDCKXd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 06:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbjDCKXd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 06:23:33 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CDA527F;
        Mon,  3 Apr 2023 03:23:25 -0700 (PDT)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1pjHLI-0006VW-Dh; Mon, 03 Apr 2023 12:23:16 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Vincent Legoll <vincent.legoll@gmail.com>
Cc:     linux-rockchip@lists.infradead.org,
        Peter Geis <pgwipeout@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Jagan Teki <jagan@edgeble.ai>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 0/2] Improve RK3588 clocks and power domains support
Date:   Mon, 03 Apr 2023 12:22:39 +0200
Message-ID: <22215580.EfDdHjke4D@diego>
In-Reply-To: <CAEwRq=q=W57W33nYe_uUDQb0cf7QkFoa0rO+EWdsuUGTN7k_Vg@mail.gmail.com>
References: <20230331163058.5688-1-sebastian.reichel@collabora.com>
 <CAEwRq=q=W57W33nYe_uUDQb0cf7QkFoa0rO+EWdsuUGTN7k_Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Am Samstag, 1. April 2023, 16:30:53 CEST schrieb Vincent Legoll:
> Hello,
> 
> I'm running a QuartzPro64 with this patch set applied, everything(*)
> works properly.
> 
> (*) eMMC, SD, LED, ethernet, serial, watchdog.
> 
> Are there any tests I can do to help with this ?

gmac1 and sdmmc do reference power-domains in the dts, so things should
be fine and I guess if your system boots successfully this might be enough.

If you want to check more, try
# mkdir /debug
# mount none /debug -t debugfs
[or do this to a location of your choice, I guess the standard is under /proc]

# cat /debug/pm_genpd/pm_genpd_summary

and check the runtime_status field.


Also you could provide a email-reply with a

Tested-by: Your Name <your-email>

line in it :-)


Heiko


