Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Message-ID: <55E869F2.5020008@linaro.org>
Date: Thu, 03 Sep 2015 18:40:34 +0300
From: Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: Add support for RPM Clocks
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org> <1438620489-32515-2-git-send-email-georgi.djakov@linaro.org> <20150902203154.GA15099@codeaurora.org>
In-Reply-To: <20150902203154.GA15099@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 09/02/2015 11:31 PM, Stephen Boyd wrote:
> On 08/03, Georgi Djakov wrote:
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> new file mode 100644
>> index 000000000000..e564673ec3a5
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c

[..]

>> +static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				unsigned long parent_rate)
>> +{
>> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
>> +	int ret = 0;
>> +
>> +	if (r->enabled) {
>> +		u32 value;
>> +		struct clk_smd_rpm *peer = r->peer;
>> +
>> +		/* Take peer clock's rate into account only if it's enabled. */
>> +		if (peer->enabled)
> 
> This peer stuff almost doesn't even matter because we're only
> sending active set requests. Why can't this code be updated to
> send both active and sleep set requests? The sleep set stuff
> won't be cached, etc., but I don't see a problem in doing both.
> Otherwise we should drop all the peer stuff until we introduce
> active only clocks.

Initially I tried sending both active and sleep sets, but as they are
not cached like in downstream (yet) i got hangs during boot. Disabling
caching in downstream kernel also caused the same hangs, so i left
this out for now. Will try debugging it further.

Will fix the rest according to your comments. Thank you!

BR,
Georgi
