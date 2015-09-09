Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 9 Sep 2015 15:52:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: Add safe switch hook
Message-ID: <20150909225230.GX15099@codeaurora.org>
References: <1439387673-13015-1-git-send-email-georgi.djakov@linaro.org>
 <1439387673-13015-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1439387673-13015-2-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Georgi Djakov wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> Sometimes clocks can't accept their parent source turning off
> while the source is reprogrammed to a different rate. Most
> notably CPU clocks require a way to switch away from the current
> PLL they're running on, reprogram that PLL to a new rate, and
> then switch back to the PLL with the new rate once they're done.
> Add a hook that drivers can implement allowing them to return a
> 'safe parent' and 'safe frequency' that they can switch their
> parent to while the upstream source is reprogrammed to support
> this.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Weird to be reviewing my own patch...

Anyway, Mike tells me that coordinated clock rates are going to
be on the list this month. We should use those patches instead of
this safe parent/rate stuff. If the patches don't appear soon, we
can look into having the clock provider handle the parent/rate
switch itself. That isn't any worse that what we've been doing in
other providers.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
