Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:36100 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750803AbdLGGkk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 01:40:40 -0500
Date: Wed, 6 Dec 2017 22:40:38 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        ysato@users.sourceforge.jp, vz@mleia.com, slemieux.tyco@gmail.com,
        vireshk@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] clk: stm32f4: pr_err() strings should end with
 newlines
Message-ID: <20171207064038.GP4283@codeaurora.org>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
 <d5b9943c076a8ad168d9b0b3ba3aec7c9b8d7d06.1511505932.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d5b9943c076a8ad168d9b0b3ba3aec7c9b8d7d06.1511505932.git.arvind.yadav.cs@gmail.com>
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
