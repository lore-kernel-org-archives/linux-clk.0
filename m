Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47406 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751962AbdGRBRv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2017 21:17:51 -0400
Date: Mon, 17 Jul 2017 18:17:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: dan.carpenter@oracle.com, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mediatek: fixed static checker warning in
 clk_cpumux_get_parent call
Message-ID: <20170718011747.GO22780@codeaurora.org>
References: <e1f7ea2d9cc9717fce5c349bcfb81ce37306aad1.1500270942.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e1f7ea2d9cc9717fce5c349bcfb81ce37306aad1.1500270942.git.sean.wang@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/17, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fixed the signedness bug returning '(-22)' on the return type as u8 with
> removing the sanity checker in clk_cpumux_get_parent() since
> clk_cpumux_set_parent() always ensures validity in clk_cpumux_get_parent()
> got called.
> 
> Fixes: commit 1e17de9049da ("clk: mediatek: add missing cpu mux causing Mediatek cpufreq can't work")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
