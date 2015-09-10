Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v3 1/3] clk: Add safe switch hook
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1439387673-13015-1-git-send-email-georgi.djakov@linaro.org>
 <1439387673-13015-2-git-send-email-georgi.djakov@linaro.org>
 <20150909225230.GX15099@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <55F1B121.5040600@linaro.org>
Date: Thu, 10 Sep 2015 19:34:41 +0300
MIME-Version: 1.0
In-Reply-To: <20150909225230.GX15099@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 09/10/2015 01:52 AM, Stephen Boyd wrote:
> On 08/12, Georgi Djakov wrote:
>> From: Stephen Boyd <sboyd@codeaurora.org>
>>
>> Sometimes clocks can't accept their parent source turning off
>> while the source is reprogrammed to a different rate. Most
>> notably CPU clocks require a way to switch away from the current
>> PLL they're running on, reprogram that PLL to a new rate, and
>> then switch back to the PLL with the new rate once they're done.
>> Add a hook that drivers can implement allowing them to return a
>> 'safe parent' and 'safe frequency' that they can switch their
>> parent to while the upstream source is reprogrammed to support
>> this.
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> Weird to be reviewing my own patch...
> 
> Anyway, Mike tells me that coordinated clock rates are going to
> be on the list this month. We should use those patches instead of
> this safe parent/rate stuff. If the patches don't appear soon, we
> can look into having the clock provider handle the parent/rate
> switch itself. That isn't any worse that what we've been doing in
> other providers.
> 

Ok, thanks for the information! I will start moving this into the
clock provider and when the coordinated clock rates are posted
will try using them.
