Return-Path: <ctatlor97@gmail.com>
Return-Path: <ctatlor97@gmail.com>
From: Craig Tatlor <ctatlor97@gmail.com>
To: robh@kernel.org,
	viresh.kumar@linaro.org,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux@armlinux.org.uk,
	andy.gross@linaro.org,
	david.brown@linaro.org,
	rjw@rjwysocki.net,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux@arm.linux.org.uk
Subject: Re: [v9,04/15] clk: qcom: Add HFPLL driver
Date: Sun, 25 Mar 2018 20:33:41 +0100
Message-Id: <20180325193341.27845-1-ctatlor97@gmail.com>
In-Reply-To: <520347148-27852-5-git-send-email-sricharan@codeaurora.org>
References: <520347148-27852-5-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This doesn't seem to work correctly with the higher clocks on 8974pro, specifically 2150400000 hz or above, maybe its something to do with being bigger than an unsigned long.

When i try to set any higher frequency it jumps down to 300mhz.
