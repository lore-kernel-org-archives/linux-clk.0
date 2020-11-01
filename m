Return-Path: <SRS0=2OLx=EH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061B7C55178
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 15:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C55C5206D8
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 15:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgKAPdz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Nov 2020 10:33:55 -0500
Received: from gloria.sntech.de ([185.11.138.130]:47652 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgKAPdz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 1 Nov 2020 10:33:55 -0500
Received: from p57b773f8.dip0.t-ipconnect.de ([87.183.115.248] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kZFMZ-0003rS-NV; Sun, 01 Nov 2020 16:33:47 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Robin Murphy <robin.murphy@arm.com>, sboyd@kernel.org,
        mturquette@baylibre.com
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
        zhangqing@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: Add appropriate arch dependencies
Date:   Sun,  1 Nov 2020 16:33:44 +0100
Message-Id: <160424139255.1224767.12169508412175070171.b4-ty@sntech.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <72abb0f794b8ed77e274e8ee21c22e0bd3223dfd.1603710913.git.robin.murphy@arm.com>
References: <72abb0f794b8ed77e274e8ee21c22e0bd3223dfd.1603710913.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 26 Oct 2020 11:17:20 +0000, Robin Murphy wrote:
> There's no point offering support for 32-bit platforms to users
> configuring a 64-bit kernel - and vice-versa - unless they are
> explicitly interested in compile-testing.

Applied, thanks!

[1/1] clk: rockchip: Add appropriate arch dependencies
      commit: 6e0781e092a150b040cc305fd1832730cf78580a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
