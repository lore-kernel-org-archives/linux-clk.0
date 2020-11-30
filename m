Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A324EC83012
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 01:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 658A42076C
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 01:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgK3Bwt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Nov 2020 20:52:49 -0500
Received: from gloria.sntech.de ([185.11.138.130]:40852 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgK3Bwt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Nov 2020 20:52:49 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kjYMF-0007OY-AD; Mon, 30 Nov 2020 02:52:03 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Xu Wang <vulab@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, linux-rockchip@lists.infradead.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Remove redundant null check before clk_prepare_enable
Date:   Mon, 30 Nov 2020 02:51:59 +0100
Message-Id: <160670107988.1055391.13206262718686759521.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127090551.50254-1-vulab@iscas.ac.cn>
References: <20201127090551.50254-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Nov 2020 09:05:51 +0000, Xu Wang wrote:
> Because clk_prepare_enable() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.

Applied, thanks!

[1/1] clk: rockchip: Remove redundant null check before clk_prepare_enable
      commit: 7f5b57a095f3b9532793d143655e83433bb448af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
