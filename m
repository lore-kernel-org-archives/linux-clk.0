Return-Path: <sboyd@codeaurora.org>
Message-ID: <55AE88CF.5040407@codeaurora.org>
Date: Tue, 21 Jul 2015 11:00:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Tyler Baker <tyler.baker@linaro.org>
CC: Dinh Nguyen <dinguyen@opensource.altera.com>,
 Mike Turquette <mturquette@linaro.org>,
 dinh.linux@gmail.com, linux-clk@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?B?RW1pbGlvIEzDsw==?=
 =?UTF-8?B?cGV6?= <emilio@elopez.com.ar>
Subject: Re: [PATCHv2 5/6] clk: sunxi: make use of of_clk_parent_fill helper
 function
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com> <1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com> <20150718005313.GE30412@codeaurora.org> <CANMBJr6q7w4SzB2m4JPgwaAFPmSmQcVFu1Sq3EU0_k_Zx7Sa8A@mail.gmail.com> <alpine.DEB.2.02.1507211020420.22725@linux-builds1> <CANMBJr5FCib=+JG9hdGehbxhayFDkTp341mNCnFTiS0GpGxZZw@mail.gmail.com>
In-Reply-To: <CANMBJr5FCib=+JG9hdGehbxhayFDkTp341mNCnFTiS0GpGxZZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/21/2015 09:29 AM, Tyler Baker wrote:
> Hi Dinh,
>
> On 21 July 2015 at 08:22, Dinh Nguyen <dinguyen@opensource.altera.com> wrote:
>> On Tue, 21 Jul 2015, Tyler Baker wrote:
>>
>>> Hi,
>>>
>>> On 17 July 2015 at 17:53, Stephen Boyd <sboyd@codeaurora.org> wrote:
>>>> On 07/06, dinguyen@opensource.altera.com wrote:
>>>>> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>>>>>
>>>>> Use of_clk_parent_fill to fill in the parent clock names' array.
>>>>>
>>>>> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>>>>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>>> Cc: "Emilio López" <emilio@elopez.com.ar>
>>>>> ---
>>>> Applied to clk-next with that fix I posted.
>>> The kernelci.org bot reported sunxi a20 boot failures[1][2] in
>>> next-20150720 and next-20150721. I have bisected[3] these failures to
>>> this commit. However, I have not investigated any further but
>>> reverting this commit on top of next-20150721 gets the boards booting
>>> again.
>>>
>> Can you please try this patch?
> I've tested the patch below on top of next-20150721 and can confirm it
> fixes the sunxi a20 issues I've reported.

Thanks both. I've squashed this in and pushed it out to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
