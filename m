Return-Path: <vkoul@kernel.org>
Date: Fri, 6 Jul 2018 10:17:00 +0530
From: Vinod <vkoul@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: Disable halt check on UFS clock
Message-ID: <20180706044700.GO22377@vkoul-mobl>
References: <20180704121901.30755-1-vkoul@kernel.org>
 <20180705174933.GG2050@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180705174933.GG2050@tuxbook-pro>
List-ID: <linux-clk.vger.kernel.org>

On 05-07-18, 10:49, Bjorn Andersson wrote:
> On Wed 04 Jul 05:19 PDT 2018, Vinod Koul wrote:
> 
> Thanks Vinod, sorry for missing the tx clock.
> 
> > Commit 12d807cd34b8 ("clk: qcom: gcc-msm8996: Disable halt check on UFS
> > clocks") marked BRANCH_HALT_SKIP for ufs tx clocks, but missed ufs rx
> > clocks. The result of that is kernel warnings at reboot:
> 
> "rx clocks"..."tx clock".

will fix

> 
> and it wouldn't be unreasonable to have a Fixes: tag.

I did think about it, a miss maynot be called a fix, so was not fully
convinced but as suggested will add

> Apart from that, you have my:
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks, will send v2 now

-- 
~Vinod
