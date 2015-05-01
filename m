Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Apr 2015 18:23:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
	Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: at91: Constify irq_domain_ops
Message-ID: <20150501012344.GH32407@codeaurora.org>
References: <1430139158-3919-1-git-send-email-k.kozlowski.k@gmail.com>
 <20150427151240.14cb4a0d@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150427151240.14cb4a0d@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>

On 04/27, Boris Brezillon wrote:
> On Mon, 27 Apr 2015 21:52:38 +0900
> Krzysztof Kozlowski <k.kozlowski.k@gmail.com> wrote:
> 
> > The irq_domain_ops are not modified by the driver and the irqdomain core
> > code accepts pointer to a const data.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 

Thanks. Applied to clk-next.
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
