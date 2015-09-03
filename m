Return-Path: <Bjorn.Andersson@sonymobile.com>
Date: Thu, 3 Sep 2015 10:22:59 -0700
From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
To: Georgi Djakov <georgi.djakov@linaro.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: Add support for RPM Clocks
Message-ID: <20150903172259.GV13472@usrtlx11787.corpusers.net>
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
 <1438620489-32515-2-git-send-email-georgi.djakov@linaro.org>
 <20150902203154.GA15099@codeaurora.org>
 <55E869F2.5020008@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <55E869F2.5020008@linaro.org>
Return-Path: bjorn.andersson@sonymobile.com
List-ID: <linux-clk.vger.kernel.org>

On Thu 03 Sep 08:40 PDT 2015, Georgi Djakov wrote:

> Hi Stephen,
> 
> On 09/02/2015 11:31 PM, Stephen Boyd wrote:
> > On 08/03, Georgi Djakov wrote:
> >> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> >> new file mode 100644
> >> index 000000000000..e564673ec3a5
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> 
> [..]
> 
> >> +static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
> >> +				unsigned long parent_rate)
> >> +{
> >> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> >> +	int ret = 0;
> >> +
> >> +	if (r->enabled) {
> >> +		u32 value;
> >> +		struct clk_smd_rpm *peer = r->peer;
> >> +
> >> +		/* Take peer clock's rate into account only if it's enabled. */
> >> +		if (peer->enabled)
> > 
> > This peer stuff almost doesn't even matter because we're only
> > sending active set requests. Why can't this code be updated to
> > send both active and sleep set requests? The sleep set stuff
> > won't be cached, etc., but I don't see a problem in doing both.
> > Otherwise we should drop all the peer stuff until we introduce
> > active only clocks.
> 
> Initially I tried sending both active and sleep sets, but as they are
> not cached like in downstream (yet) i got hangs during boot. Disabling
> caching in downstream kernel also caused the same hangs, so i left
> this out for now. Will try debugging it further.
> 

This sounds odd, although I presume the downstream code is rarely/never
tested with the caching disabled.

Can you please retry this with [1] applied (should be in -next), the RPM
fifo is tiny, so I would not be surprised if this could be your problem.

[1] https://lkml.org/lkml/2015/8/24/756

Regards,
Bjorn
