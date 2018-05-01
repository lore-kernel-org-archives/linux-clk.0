Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750771AbeEAVuV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 May 2018 17:50:21 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Tali Perry <tali.perry1@gmail.com>,
        Wei Yongjun <weiyongjun1@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, openbmc@lists.ozlabs.org,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
Message-ID: <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH -next] clk: npcm7xx: fix return value check in npcm7xx_clk_init()
Date: Tue, 01 May 2018 14:50:20 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Wei Yongjun (2018-04-26 04:21:08)
> In case of error, the function ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Have you made this into a scripts/coccinelle/ script I can run?

Applied to clk-next
