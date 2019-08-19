Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4C6C3A59D
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 11:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAF6A2086C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566215717;
	bh=dEeA2uQyaoXqutXQcrXuZVMeCePDLqTpkPsRnQe15N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sayOjZzFzD4mAd3HyhBwkX1TK4hiDdDpjUjyInti5Y6VCx/wgO3WCmz/TPdeRGL5x
	 rU/hjmWyGoJttUCkikuvUYao3iblZIN+/K1zi9xQRh3VbznzzehsfhNBc8VHyqmTPl
	 WBJp3kvZrqxCoPZDuCkqkqPgC8HoXpFewUf7EKWc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfHSLzQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 07:55:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:43592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfHSLzQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Aug 2019 07:55:16 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5A992085A;
        Mon, 19 Aug 2019 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566215715;
        bh=dEeA2uQyaoXqutXQcrXuZVMeCePDLqTpkPsRnQe15N8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t6w9eaym8VxzPY29L9jVJSOgQXWZKbfZnoYfh2255ufHURxQstc1vc4z5/7KjfJBP
         1Vk0ED/DyhxJbI4OfaU1nQkgYvU73mtQuzoIKHaFNH3b7bSZ5bLHDo259KKc6bNXZw
         8KnVWuPfaX9e/K0CUVy8RVwOa6h7RTfMEVOe7/KA=
Date:   Mon, 19 Aug 2019 13:55:03 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] clk: imx8m: Fix incorrect parents
Message-ID: <20190819115502.GA5999@X250>
References: <cover.1565715590.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1565715590.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 13, 2019 at 08:05:27PM +0300, Leonard Crestez wrote:
> No checks are made to ensure the parents in the _sels arrays actually
> exist and it turns out that several are incorrect.
> 
> I found the errors using a hack to clk core, is there a better way?
> Link: https://github.com/cdleonard/linux/commit/da32c2e76eb373e8a03aec905af2eef28a7997a7
> 
> Also add imx8mn GIC clock while we're at it because otherwise parent
> could get disabled and lock the system.
> 
> Leonard Crestez (4):
>   clk: imx8mq: Fix sys3 pll references
>   clk: imx8mm: Fix incorrect parents
>   clk: imx8mn: Fix incorrect parents
>   clk: imx8mn: Add GIC clock

Applied all, thanks.
