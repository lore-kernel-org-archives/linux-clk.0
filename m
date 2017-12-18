Return-Path: <sboyd@codeaurora.org>
Date: Mon, 18 Dec 2017 11:03:03 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: check ops pointer on clock register
Message-ID: <20171218190303.GV7997@codeaurora.org>
References: <20171218170007.28042-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171218170007.28042-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/18, Jerome Brunet wrote:
> Nothing really prevents a provider from (trying to) register a clock
> without providing the clock ops structure.
> 
> We do check the individual fields before using them, but not the
> structure pointer itself. This may have the usual nasty consequences when
> the pointer is dereferenced, mostly likely when checking one the field
> during the initialization.

Yes, that nasty consequence should be a kernel oops, and the
developer should notice that before submitting the driver for
inclusion. I don't think we really care to return an error here
if this happens.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
