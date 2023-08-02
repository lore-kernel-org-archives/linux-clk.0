Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17578C001DE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 09:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbjHBJRS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 05:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbjHBJQ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 05:16:56 -0400
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E68730F4;
        Wed,  2 Aug 2023 02:16:26 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        by mail11.truemail.it (Postfix) with ESMTPA id 617561F83F;
        Wed,  2 Aug 2023 11:16:20 +0200 (CEST)
Date:   Wed, 2 Aug 2023 11:16:13 +0200
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jai Luthra <j-luthra@ti.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux@ew.tq-group.com
Subject: Re: [PATCH 0/3] clk: keystone: syscon-clk: fixes for audio refclk
Message-ID: <ZMoe3e4eF3Hll1e3@francesco-nb.int.toradex.com>
References: <cover.1690885413.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690885413.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 01, 2023 at 12:36:06PM +0200, Matthias Schiffer wrote:
> The actual fix is in patch 3; patches 1 and 2 are preparation and
> related cleanup. I've added a Fixes: tag to all 3 patches, as they
> need to be backported together.

Please see this https://lore.kernel.org/all/20230728222639.110409-1-francesco@dolcini.it/
that was sent a few days ago. It fixes the same issue and it's already
reviewed.

Francesco

