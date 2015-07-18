Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37325 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755772AbbGRAwz (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jul 2015 20:52:55 -0400
Date: Fri, 17 Jul 2015 17:52:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: mturquette@linaro.org, dinh.linux@gmail.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCHv2 6/6] clk: ti: make use of of_clk_parent_fill helper
 function
Message-ID: <20150718005252.GD30412@codeaurora.org>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
 <1436241546-16731-7-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436241546-16731-7-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/06, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> Use of_clk_parent_fill to fill in the parent clock names' array.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
