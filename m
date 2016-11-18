Return-Path: <sricharan@codeaurora.org>
From: "Sricharan" <sricharan@codeaurora.org>
To: "'Stanimir Varbanov'" <svarbanov@mm-sol.com>,
	<sboyd@codeaurora.org>,
	<mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<rnayak@codeaurora.org>,
	<stanimir.varbanov@linaro.org>
References: <1479472107-18472-1-git-send-email-sricharan@codeaurora.org> <8257df0e-0cae-edbf-e845-e31fb50b7ba7@mm-sol.com>
In-Reply-To: <8257df0e-0cae-edbf-e845-e31fb50b7ba7@mm-sol.com>
Subject: RE: [PATCH V2 0/2] clk: qcom: gdsc: Add support for gdscs with HW control
Date: Fri, 18 Nov 2016 23:40:50 +0530
Message-ID: <000101d241c7$1c5f2320$551d6960$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Stan,

>Hi,
>
>On 11/18/2016 02:28 PM, Sricharan R wrote:
>> This series adds support for gdscs(powerdomains) that can be configured
>> in hw controlled mode. So they are turned 'ON' based on needs dynamically,
>> helping to save power. Also updated the venus video ip's gdsc/clock
>> data to put them in hw control.
>>
>> V2:
>>  Dropped patch#3 [1] as it was concluded that the patch was effectively
>>  masking the fact the clocks were not getting turned on when the gdsc
>>  is put in hwctrl. With some change in sequence from venus core, masking
>>  is not needed and so patch needs to handled in venus driver.
>
>Which sequence should be changed in venus driver?
>
Ya wanted to discuss this with you on the venus thread, but let me put it here.

So while enabling the hw control bit for the venus subcores 0/1 gdscs and turning
on the subcore 0/1 clks, we saw that unless the
VENUS_WRAPPER_VENUS0_MMCC_VDEC_VCODEC_POWER_CONTROL
register is programmed to '0'(reset value is 1), the subcores domain/
clocks do not turn on. So this means that the,

1) venus driver should turn on all clocks except the subcore clocks.
2) Program VENUS_WRAPPER_VENUS0_MMCC_VDEC_VCODEC_POWER_CONTROL to
    '0' to turn on sub domains.
3) Turn on subcore clocks (cbc) and verify their running status using clk_enable
4) Program VENUS_WRAPPER_VENUS0_MMCC_VDEC_VCODEC_POWER_CONTROL to
     '1' again to turn off subdomain/clocks and let the firmware turn it on when required.

Note that in my previous patch set, i was skipping the check to verify the subcore clocks
'running status' previously, assuming that it can't be done while the gdsc is in hwctrl, but
that was not right.

Regards,
 Sricharan
