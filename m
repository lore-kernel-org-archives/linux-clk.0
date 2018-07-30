Return-Path: <sudeep.holla@arm.com>
Date: Mon, 30 Jul 2018 12:36:52 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Fix the rounding of clock rate
Message-ID: <20180730113652.GA16266@e107155-lin>
References: <1532700112-11852-1-git-send-email-amit.kachhap@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1532700112-11852-1-git-send-email-amit.kachhap@arm.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 27, 2018 at 07:31:52PM +0530, Amit Daniel Kachhap wrote:
> This fix rounds the clock rate properly by using quotient and not
> remainder in the calculation. This issue was found while testing HDMI
> in the Juno platform.
>
Good find, thanks.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
