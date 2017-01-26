Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v2] clk: qcom: gdsc: Fix handling of hw control
 enable/disable
To: Rajendra Nayak <rnayak@codeaurora.org>, sboyd@codeaurora.org,
 mturquette@baylibre.com
References: <1485145581-517-1-git-send-email-rnayak@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e92f172f-c24c-cf37-4e7f-be70a6191aeb@linaro.org>
Date: Thu, 26 Jan 2017 23:31:03 +0200
MIME-Version: 1.0
In-Reply-To: <1485145581-517-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

Thanks for the patch!

On 23.01.2017 06:26, Rajendra Nayak wrote:
> Once a gdsc is brought in and out of HW control, there is a
> power down and up cycle which can take upto 1us. Polling on
> the gdsc status immediately after the hw control enable/disable
> can mislead software/firmware to belive the gdsc is already either on
> or off, while its yet to complete the power cycle.
> To avoid this add a 1us delay post a enable/disable of HW control
> mode.
>
> Also after the HW control mode is disabled, poll on the status to
> check gdsc status reflects its 'on' before force disabling it
> in software.
>
> Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/clk/qcom/gdsc.c | 58 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 45 insertions(+), 13 deletions(-)

Reviewed and Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

regards,
Stan
