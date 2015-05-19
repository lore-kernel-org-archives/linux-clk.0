Return-Path: <sboyd@codeaurora.org>
Message-ID: <555B9C93.7030002@codeaurora.org>
Date: Tue, 19 May 2015 13:26:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 Mike Turquette <mturquette@linaro.org>
CC: linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: fix output format of debugfs/clk_dump
References: <1432050130-12612-1-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1432050130-12612-1-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/19/15 08:42, Vladimir Zapolskiy wrote:
> The output format of $(cat /sys/kernel/debug/clk/clk_dump) was
> compliant to JSON and Python dictionary type some time ago, but at the
> moment a couple of commas are missing, fix it.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Isn't this already fixed in clk-next with 7cb81136d2ef (clk: Fix JSON
output in debugfs, 2015-04-29)?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
