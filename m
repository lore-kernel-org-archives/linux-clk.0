Return-Path: <sboyd@codeaurora.org>
Date: Tue, 28 Feb 2017 13:26:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>, linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: fix SET_PARM macro
Message-ID: <20170228212654.GM25384@codeaurora.org>
References: <20170228093016.5624-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170228093016.5624-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/28, Jerome Brunet wrote:
> parameter val is not enclosed in parenthesis which is buggy when given an
> expression instead of a simple value
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Fixes tag? Is there a place in the code that is using a complex
expression for val right now?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
