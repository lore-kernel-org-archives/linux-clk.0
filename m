Return-Path: <SRS0=HJ9p=6E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63875C54FCB
	for <linux-clk@archiver.kernel.org>; Mon, 20 Apr 2020 14:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 402CC20775
	for <linux-clk@archiver.kernel.org>; Mon, 20 Apr 2020 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587393604;
	bh=Lhz0nasPZld7LvSr8M4fskng9n+bjY4BzRtGx4zauhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xO0+gvqSfKWgD1fNzTx5BBUE+iQPo7BMy5MSg3t4Co4/5eR3GP/2XTNXRa8P5U5ug
	 /tBBHrD0j2V0JZN0QL+6JqRzd0kU58BjoudnxE1eJT4ZVupujhxfaHW7YbV4fLRMhs
	 SPwFIaOrySgAw2KSOpPn4RSArsGJe2p+5PlSyCn8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgDTOkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Apr 2020 10:40:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbgDTOkD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 Apr 2020 10:40:03 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39703206B9;
        Mon, 20 Apr 2020 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587393603;
        bh=Lhz0nasPZld7LvSr8M4fskng9n+bjY4BzRtGx4zauhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1NKTJk+45D6Kz97Y0b7tPm8VbegrEC3Q4MEo7a2KGwLtL84m5N1ACTltn0uCf83Yd
         SN50U+x0WbPVr7W1EPvA/gt3YGGKLrnGvCfaiybZwWPmG4DFqBvI99aPHDDxX+hOqC
         v0W51sI5Pu+7zsIOEiPQz17WTpm9d0g9IsCc0cZY=
Date:   Mon, 20 Apr 2020 22:39:58 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, abel.vesa@nxp.com,
        t-kristo@ti.com, jonas.gorski@gmail.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] clk: imx: clk-sscg-pll: Remove unnecessary blank lines
Message-ID: <20200420143956.GC32419@dragon>
References: <1584495566-15110-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584495566-15110-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 18, 2020 at 09:39:25AM +0800, Anson Huang wrote:
> Remove many unnecessary blank lines for cleanup.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
