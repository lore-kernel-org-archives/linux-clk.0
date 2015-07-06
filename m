Return-Path: <sboyd@codeaurora.org>
Date: Mon, 6 Jul 2015 15:13:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mturquette@linaro.org, lho@apm.com, ksankaran@apm.com, fkan@apm.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: xgene: Delete duplicated name field
Message-ID: <20150706221319.GA30412@codeaurora.org>
References: <1434576529-4183-1-git-send-email-matthias.bgg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1434576529-4183-1-git-send-email-matthias.bgg@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/17, Matthias Brugger wrote:
> X-Gene clocks implement it's name in the clock private struct.
> This is a duplication of the name field. We can delete the field
> and rely on the common implementation to retrieve the name.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
