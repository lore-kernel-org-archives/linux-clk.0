Return-Path: <sboyd@codeaurora.org>
Date: Wed, 18 Nov 2015 14:28:23 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	uclinux-h8-devel@lists.sourceforge.jp, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] h8300: Replace read/write to ioread/write
Message-ID: <20151118222823.GH32672@codeaurora.org>
References: <1447079782-26027-1-git-send-email-daniel.lezcano@linaro.org>
 <1447501756-31668-1-git-send-email-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447501756-31668-1-git-send-email-ysato@users.sourceforge.jp>
List-ID: <linux-clk.vger.kernel.org>

On 11/14, Yoshinori Sato wrote:
> read[bwl] and write[bwl] is only little-endian I/O.
> But h8300's peripheral of big-endian. So use ioread/write.
> 
> And h8300 specific __raw_read/write is same of generic.
> It can remove.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  drivers/clk/h8300/clk-h8s2678.c      |  6 ++---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
