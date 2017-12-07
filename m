Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37322 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752142AbdLGGlL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 01:41:11 -0500
Date: Wed, 6 Dec 2017 22:41:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        ysato@users.sourceforge.jp, vz@mleia.com, slemieux.tyco@gmail.com,
        vireshk@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] SPEAr: clk: pr_err() strings should end with newlines
Message-ID: <20171207064107.GS4283@codeaurora.org>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
 <35a712ed8ee10491c0a605d0cc825250286370a4.1511505932.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <35a712ed8ee10491c0a605d0cc825250286370a4.1511505932.git.arvind.yadav.cs@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/24, Arvind Yadav wrote:
> pr_err() messages should end with a new-line to avoid other messages
> being concatenated.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
