Return-Path: <sboyd@codeaurora.org>
Message-ID: <552571ED.9010303@codeaurora.org>
Date: Wed, 08 Apr 2015 11:22:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
CC: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] clk: qcom: Fix parent_map translations
References: <1428416091-31844-1-git-send-email-georgi.djakov@linaro.org> <CAP71WjxnL0_AUSYmMuBPLs+teWeC6rMuO7S8L8to1cWvnM2FBg@mail.gmail.com>
In-Reply-To: <CAP71WjxnL0_AUSYmMuBPLs+teWeC6rMuO7S8L8to1cWvnM2FBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 04/08/15 01:38, Nicolas Dechesne wrote:
> On Tue, Apr 7, 2015 at 4:14 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>> When we introduced the parent_map tables, we missed to update some
>> of the functions where mapping is translated. Fix this.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>
>> Changes since v1:
>>  * Pass parent map to _freq_tbl_determine_rate()
> tested this v2 as well, on ifc6410, I have done the same functional
> tests as mentioned in [1].
>
> Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> [1] https://lkml.org/lkml/2015/4/3/298

Thanks. Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
