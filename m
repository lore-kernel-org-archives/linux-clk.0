Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46820 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751626AbdF1Wlf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jun 2017 18:41:35 -0400
Date: Wed, 28 Jun 2017 15:41:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] clk: at91: Add sama5d2 suspend/resume
Message-ID: <20170628224134.GA22780@codeaurora.org>
References: <20170608003647.15721-1-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170608003647.15721-1-alexandre.belloni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Alexandre Belloni wrote:
> On sama5d2, VDD core maybe be cut while in suspend. This means registers
> will be lost. Ensure they are saved and restored properly.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
