Return-Path: <sboyd@codeaurora.org>
Date: Tue, 5 May 2015 22:54:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: s3c2410: Staticize local symbols
Message-ID: <20150506055456.GD10871@codeaurora.org>
References: <1430496168-32408-1-git-send-email-k.kozlowski.k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430496168-32408-1-git-send-email-k.kozlowski.k@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/02, Krzysztof Kozlowski wrote:
> Staticize symbols not exported and not used outside of file.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
