Return-Path: <SRS0=eZMu=MX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD0FC32788
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 12:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2947020652
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 12:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2947020652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbeJKUXj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Oct 2018 16:23:39 -0400
Received: from gloria.sntech.de ([185.11.138.130]:39840 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbeJKUXj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Oct 2018 16:23:39 -0400
Received: from we0660.dip.tu-dresden.de ([141.76.178.148] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1gAaVz-00049O-Mg; Thu, 11 Oct 2018 14:56:31 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Shawn Lin <shawn.lin@rock-chips.com>
Cc:     linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Ziyuan Xu <xzy.xu@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: fix wrong mmc sample phase shift for rk3328
Date:   Thu, 11 Oct 2018 14:56:31 +0200
Message-ID: <5032667.9LSsaU41HY@phil>
In-Reply-To: <1539242803-68356-1-git-send-email-shawn.lin@rock-chips.com>
References: <1539242803-68356-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Donnerstag, 11. Oktober 2018, 09:26:43 CEST schrieb Shawn Lin:
> From: Ziyuan Xu <xzy.xu@rock-chips.com>
> 
> mmc sample shift is 0 for RK3328 referring to the TRM.
> So fix them.
> 
> Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

checked the manual and applied for 4.20.

Thanks for catching this
Heiko


