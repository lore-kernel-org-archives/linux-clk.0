Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CA5C43214
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 13:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F27AC60F46
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 13:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbhG2NT1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:19:27 -0400
Received: from gloria.sntech.de ([185.11.138.130]:57682 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237339AbhG2NT1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Jul 2021 09:19:27 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m95wX-0003Jt-Io; Thu, 29 Jul 2021 15:19:21 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Yunhao Tian <t123yh@outlook.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, t123yh.xyz@gmail.com,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rk3308: make ddrphy4x clock critical
Date:   Thu, 29 Jul 2021 15:19:19 +0200
Message-Id: <162755606328.1705274.2205144584185916023.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com>
References: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Jul 2021 20:48:16 +0800, Yunhao Tian wrote:
> Currently, no driver support for DDR memory controller (DMC) is present,
> as a result, no driver is explicitly consuming the ddrphy clock. This means
> that VPLL1 (parent of ddr clock) will be shutdown if we enable
> and then disable any child clock of VPLL1 (e.g. SCLK_I2S0_8CH_TX).
> If VPLL1 is disabled, the whole system will freeze, because the DDR
> controller will lose its clock. So, it's necessary to prevent VPLL1 from
> shutting down, by marking the ddrphy4x CLK_IS_CRITICAL.
> 
> [...]

Applied, thanks!

[1/1] clk: rk3308: make ddrphy4x clock critical
      commit: c0c81245dac7caaef4db627fb7043495d1afe662

Though I moved the clock to the pre-existing
list of critical clocks.

I'm still hoping for that handoff mechanism before
we sprinkle CLK_IS_CRITICAL throughout the clock trees.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
