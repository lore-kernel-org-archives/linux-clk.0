Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 10:41:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jacob Siverskog <jacob@teenage.engineering>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Belisko Marek <marek.belisko@gmail.com>,
	Jens Rudberg <jens@teenage.engineering>
Subject: Re: [PATCH v3 1/1] clk: si5351: Add PLL soft reset
Message-ID: <20151120184108.GS32672@codeaurora.org>
References: <564F5E8F.80709@gmail.com>
 <1448042593-23670-1-git-send-email-jacob@teenage.engineering>
 <1448042593-23670-2-git-send-email-jacob@teenage.engineering>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448042593-23670-2-git-send-email-jacob@teenage.engineering>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Jacob Siverskog wrote:
> This is according to figure 12 ("I2C Programming Procedure") in
> "Si5351A/B/C Data Sheet"
> (https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf).
> 
> Without the PLL soft reset, we were unable to get three outputs
> working at the same time.
> 
> According to Silicon Labs support, performing PLL soft reset will only
> be noticeable if the PLL parameters have been changed.
> 
> Signed-off-by: Jacob Siverskog <jacob@teenage.engineering>
> Signed-off-by: Jens Rudberg <jens@teenage.engineering>
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
