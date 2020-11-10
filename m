Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3484C2D0A3
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 01:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FCF82078D
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 01:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kr1Hk4nL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbgKJBJK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:09:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:56352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKJBJJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Nov 2020 20:09:09 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 555AB206D8;
        Tue, 10 Nov 2020 01:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604970549;
        bh=RIo3fK/MWXPbHbSM2PvGQBX/Qvsn97JKCRNg1IK3moM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kr1Hk4nL6ktQZD+5eWScYo7YAKxEfo0Y3vFP6SQcY9stktmEXnPfxXZXRtz1Rz8u9
         vD/wJPugKBcypmOd1B6d5c9m6aP8eZtACorFBUlHBACJryfiqfx8x3ViDH+ZeB8mWm
         OozaJqiV5yjqeD91zH5axzZPJ4Ad4d2McWlont1c=
Date:   Tue, 10 Nov 2020 09:09:03 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] clk: imx: gate2: Remove unused variable ret
Message-ID: <20201110010902.GL31601@dragon>
References: <1604403134-32814-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604403134-32814-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 03, 2020 at 07:32:14PM +0800, Zou Wei wrote:
> This patch fixes below warning reported by coccicheck:
> 
> ./clk-gate2.c:57:5-8: Unneeded variable: "ret". Return "0" on line 68
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Applied, thanks.
