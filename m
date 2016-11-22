Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: clk-smd-rpm: Fix clk_hw_onecell_data
 references
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20161121140450.12353-1-georgi.djakov@linaro.org>
 <20161121231312.GZ25626@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.scott@linaro.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <e70a844a-c8c3-68b3-2cce-7296bfed2b12@linaro.org>
Date: Tue, 22 Nov 2016 17:53:06 +0200
MIME-Version: 1.0
In-Reply-To: <20161121231312.GZ25626@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 11/22/2016 01:13 AM, Stephen Boyd wrote:
> On 11/21, Georgi Djakov wrote:
>> The clk_hw_onecell_data struct is missing references to the
>> actual clocks. Fix this.
>>
>> Reported-by: Michael Scott <michael.scott@linaro.org>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>  drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++++-----------
>>  1 file changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index a27013dbc0aa..58821f7213b0 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -148,8 +148,7 @@ struct clk_smd_rpm_req {
>>
>>  struct rpm_cc {
>>  	struct qcom_rpm *rpm;
>> -	struct clk_hw_onecell_data data;
>> -	struct clk_hw *hws[];
>> +	struct clk_hw_onecell_data *data;
>
> How about rolling our own xlate function to return hw pointers?
> We already have a list of hws here, so it doesn't seem like much
> more to do.

We could do this, but is there any benefit of adding and using our own
xlate function instead of the of_clk_hw_onecell_get, which is already
there? Maybe I'm missing something..?

Thanks,
Georgi
