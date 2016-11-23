Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38872 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933829AbcKWM44 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2016 07:56:56 -0500
Received: by mail-wm0-f49.google.com with SMTP id f82so22621957wmf.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2016 04:56:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <6dd874b4-8f60-471b-d1e7-089b4b035ad2@codeaurora.org>
References: <1479710246-26676-1-git-send-email-riteshh@codeaurora.org>
 <CAPDyKFrRbf0+G5K=-jsaevAGbTqhTAss2zJv3QdiyCrv0BG-zA@mail.gmail.com>
 <d4d05fb9-8a9e-6cf2-dc63-0edbd27a9e55@codeaurora.org> <20161121231138.GY25626@codeaurora.org>
 <6dd874b4-8f60-471b-d1e7-089b4b035ad2@codeaurora.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Nov 2016 13:49:29 +0100
Message-ID: <CAPDyKFr-zu1V-7oOndAb_uZCSj2BEvyiUR-siZjteyyoy98Txw@mail.gmail.com>
Subject: Re: [PATCH v9 00/16] mmc: sdhci-msm: Add clk-rates, DDR, HS400 support
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Alex Lemberg <alex.lemberg@sandisk.com>,
        Mateusz Nowak <mateusz.nowak@intel.com>,
        Yuliy Izrailov <Yuliy.Izrailov@sandisk.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        David Griego <david.griego@linaro.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Pramod Gurav <pramod.gurav@linaro.org>, jeremymc@redhat.com
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 23 November 2016 at 01:05, Ritesh Harjani <riteshh@codeaurora.org> wrote:
>
>
> On 11/22/2016 4:41 AM, Stephen Boyd wrote:
>>
>> On 11/21, Ritesh Harjani wrote:
>>>
>>>
>>>
>>> On 11/21/2016 3:36 PM, Ulf Hansson wrote:
>>>>
>>>> On 21 November 2016 at 07:37, Ritesh Harjani <riteshh@codeaurora.org>
>>>> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> This is v9 version of the patch series which adds support for MSM8996.
>>>>> Adds HS400 driver support as well.
>>>>> These are tested on internal msm8996 & db410c HW.
>>>>>
>>>>> The patch series is ready. Do we think we can apply these
>>>>> patches for next now?
>>>>
>>>>
>>>> I guess the DTS changes can be picked up by Andy, so they can go via
>>>> arm-soc?
>>>
>>> Yes.
>>>
>>>>
>>>> Then, does the mmc changes depend on the clock changes? If so, I can
>>>> pick them as well, but then I need an ack from Stephen....
>>>
>>> Ideal and preferable, would be that clk & mmc changes go in
>>> together. But either ways should be fine.
>>>
>>
>> There's only a runtime dependency where the clk rates will be
>> wrong if clk tree isn't merged. I'd rather just apply the clk
>> ones directly to clk tree and let all three trees come together
>> in linux-next and work.
>
>
> Ok great! So can we queue this patch series to next?

Yes. I have picked up all the mmc patches, including the DT
documentation patch. They are queued for next!
The rest is for Andy and Stephen to pick.

Thanks and kind regards
Uffe
