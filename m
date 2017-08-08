Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Mon, 7 Aug 2017 20:28:11 -0500
From: Andy Gross <andy.gross@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
	vivek.gautam@codeaurora.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] arm64: qcom: Select PM_GENERIC_DOMAINS
Message-ID: <20170808012811.GA31304@hector.attlocal.net>
References: <1500526099-9935-1-git-send-email-rnayak@codeaurora.org>
 <1500526099-9935-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1500526099-9935-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 20, 2017 at 10:18:15AM +0530, Rajendra Nayak wrote:
> Enable PM_GENERIC_DOMAINS for 64-bit qualcomm platforms. This is required
> to ensure devices which are dependent on some gdscs (powerdomains) to be
> powered on before they can be probed, work as expected.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Go ahead and queue this with the related changes.

Acked-by: Andy Gross <andy.gross@linaro.org>
