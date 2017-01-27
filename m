Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:35856 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752703AbdA0AQ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2017 19:16:26 -0500
Date: Thu, 26 Jan 2017 16:04:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        James Liao <jamesjj.liao@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] clk: mediatek: Fix MT8135 dependencies
Message-ID: <20170127000444.GL8801@codeaurora.org>
References: <20170124130912.14375a32@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170124130912.14375a32@endymion>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01/24, Jean Delvare wrote:
> The MT8135 is a 32-bit SoC, so only propose it on ARM architecture,
> not ARM64.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 234d511d8c15 ("clk: mediatek: Add hardware dependency")
> Cc: Andreas Färber <afaerber@suse.de>
> Cc: James Liao <jamesjj.liao@mediatek.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
