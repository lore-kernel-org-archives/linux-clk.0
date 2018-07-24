Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <f4f92dcd-7a63-f9de-a7a0-c403672d5c6c@codeaurora.org>
References: <20180723215404.74296-1-dianders@chromium.org> <20180723215404.74296-3-dianders@chromium.org>
 <f4f92dcd-7a63-f9de-a7a0-c403672d5c6c@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Jul 2018 20:30:21 -0700
Message-ID: <CAD=FV=WkC5BsreD8t8_+-5J3ztFp5nAFAA+HSwHVvYW3ED3yiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: qcom: Add qspi (Quad SPI) clocks for sdm845
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, grahamr@codeaurora.org,
	Girish Mahadevan <girishm@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	David Brown <david.brown@linaro.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Mon, Jul 23, 2018 at 7:22 PM, Taniya Das <tdas@codeaurora.org> wrote:
>
>
> On 7/24/2018 3:24 AM, Douglas Anderson wrote:
>>
>> Add both the interface and core clock.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>> Changes in v2:
>> - Only 19.2, 100, 150, and 300 MHz now.
>> - All clocks come from MAIN rather than EVEN.
>> - Use parent map 0 instead of new parent map 9.
>>
>>   drivers/clk/qcom/gcc-sdm845.c | 63 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
>> index 0f694ed4238a..5bca634e277a 100644
>> --- a/drivers/clk/qcom/gcc-sdm845.c
>> +++ b/drivers/clk/qcom/gcc-sdm845.c
>> @@ -162,6 +162,13 @@ static const char * const gcc_parent_names_10[] = {
>>         "core_bi_pll_test_se",
>>   };
>>   +static const char * const gcc_parent_names_9[] = {
>> +       "bi_tcxo",
>> +       "gpll0",
>> +       "gpll0_out_even",
>> +       "core_pi_sleep_clk",
>> +};
>> +
>
>
> Please remove this.

Oops, that's embarrassing.  Please stay tuned for v3.

-Doug
