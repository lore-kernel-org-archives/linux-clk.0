Return-Path: <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SDM845
To: Amit Nischal <anischal@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>,
 David Brown <david.brown@linaro.org>, Rajendra Nayak
 <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
References: <1522761761-15262-1-git-send-email-anischal@codeaurora.org>
 <1522761761-15262-4-git-send-email-anischal@codeaurora.org>
 <152393708031.51482.15076025836699678476@swboyd.mtv.corp.google.com>
 <f563532b5c43960a61ae12a37a131be8@codeaurora.org>
From: Manu Gautam <mgautam@codeaurora.org>
Message-ID: <23b9ca5a-b708-f142-9906-3f3eadd8c26a@codeaurora.org>
Date: Wed, 18 Apr 2018 22:08:41 +0530
MIME-Version: 1.0
In-Reply-To: <f563532b5c43960a61ae12a37a131be8@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Amit,


On 4/18/2018 6:33 PM, Amit Nischal wrote:
>>> +       /* Disable the GPLL0 active input to MMSS and GPU via MISC registers */
>>> +       regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
>>> +       regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
>>
>> I think we'll have to throw in the pipe clk branch stuff in here too?
>> And then drop the pipe clks from the driver?
>
> All the USB pipe clocks would be taken care. The PCIE pipe branch
> clocks would have to be explicitly disabled so as to retain the
> memory logic. Otherwise, it would lead to memory corruption in case
> the external source is directly disabled without disabling the branch clock. 

PHY driver is same for both USB and PCIE and both PHYs use pipe_clk.
If there is indeed some limitation and pipe_clk cant be left enabled
always then I will suggest to not change pipe_clk handling for USB as well.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
