Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33562 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752854AbdAJALa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2017 19:11:30 -0500
Date: Mon, 9 Jan 2017 16:11:29 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos542x: mark some clocks as critical
Message-ID: <20170110001129.GF17126@codeaurora.org>
References: <CGME20161222094441epcas5p330bb16763e02149a275c30eb644b0e7c@epcas5p3.samsung.com>
 <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Marek Szyprowski wrote:
> Some parent clocks of the Exynos542x clock blocks, which have separate
> power domains (like DISP, MFC, MSC, GSC, FSYS and G2D) must be always
> enabled to access any register related to power management unit or devices
> connected to it. For the time being, until a proper solution based on
> runtime PM is applied, mark those clocks as critical (instead of ignore
> unused or even no flags) to prevent disabling them.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
