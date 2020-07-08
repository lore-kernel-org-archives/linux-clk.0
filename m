Return-Path: <SRS0=0nR9=AT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CB2C433DF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jul 2020 14:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B601207C4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jul 2020 14:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbgGHOXT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Jul 2020 10:23:19 -0400
Received: from gloria.sntech.de ([185.11.138.130]:44888 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729467AbgGHOXT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 8 Jul 2020 10:23:19 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.sntech)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jtAyg-00059g-Jd; Wed, 08 Jul 2020 16:23:14 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Robin Murphy <robin.murphy@arm.com>,
        sboyd@kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] Revert "clk: rockchip: fix wrong mmc sample phase shift for rk3328"
Date:   Wed,  8 Jul 2020 16:23:12 +0200
Message-Id: <159421818548.390170.4458225200930874828.b4-ty@sntech.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <c80eb52e34c03f817586b6b7912fbd4e31be9079.1589475794.git.robin.murphy@arm.com>
References: <c80eb52e34c03f817586b6b7912fbd4e31be9079.1589475794.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 18 Jun 2020 18:56:29 +0100, Robin Murphy wrote:
> This reverts commit 82f4b67f018c88a7cc9337f0067ed3d6ec352648.
> 
> According to a subsequent revert in the vendor kernel, the original
> change was based on unclear documentation and was in fact incorrect.
> 
> Emprically, my board's HS200 eMMC at 200MHZ apparently gets lucky with a
> phase where this had no impact, but limiting max-frequency to 150MHz to
> match the nominal capability of the I/O pins made it virtually unusable,
> constantly throwing errors and retuning. With this revert, it starts
> behaving perfectly at 150MHz too.

Applied, thanks!

[1/1] clk: rockchip: Revert "fix wrong mmc sample phase shift for rk3328"
      commit: 465931e70881476a210d44705102ef8b6ee6cdb0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
