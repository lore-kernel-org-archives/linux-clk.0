Return-Path: <jh80.chung@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Message-id: <560DF150.3000906@samsung.com>
Date: Fri, 02 Oct 2015 11:52:00 +0900
From: Jaehoon Chung <jh80.chung@samsung.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Alexandru Stan <amstan@chromium.org>
Subject: Re: [PATCH v2 3/8] mmc: core: Add mmc_regulator_set_vqmmc()
References: <1443622064-14362-1-git-send-email-heiko@sntech.de>
 <17200614.QxCe8zAb7I@diego>
 <CAPDyKFpis8XnvrppHq7q_7DQeN2UiEpykNTJ=1iJJ9AGOHTW6Q@mail.gmail.com>
 <2695161.Z1IhqPE0bd@diego> <20151001173554.GB19319@codeaurora.org>
 <CAPDyKFqrkYXsbBJ61yYo0G8za1szARvA=as-5nLTiwGH5pCrEQ@mail.gmail.com>
In-reply-to: 
 <CAPDyKFqrkYXsbBJ61yYo0G8za1szARvA=as-5nLTiwGH5pCrEQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/02/2015 06:05 AM, Ulf Hansson wrote:
> On 1 October 2015 at 19:35, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 10/01, Heiko St=C3=BCbner wrote:
>>> Am Donnerstag, 1. Oktober 2015, 11:54:24 schrieb Ulf Hansson:
>>>> On 30 September 2015 at 16:55, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>>>>> Am Mittwoch, 30. September 2015, 16:42:05 schrieb Ulf Hansson:
>>>>>> On 30 September 2015 at 16:07, Heiko Stuebner <heiko@sntech.de> wrote:
>>>>> The clock changes of course only touch internals of the phase-clocks, so
>>>>> should have no problem going through another tree.
>>>>
>>>> What happens if I take mmc and dt changes, wouldn't I need the clock
>>>> patches as well=3F
>>>
>>> The API stays of course the same, only the degree to settings translation gets
>>> optimized, so I guess in the worst case you would get no good phase and thus
>>> fall back to non-highspeed modes - but the system would stay running.
>>>
>>> But of course, if the clock maintainers could Ack the two clock patches and
>>> everything would stay together that would work even better :-)
>>>
>>
>> If Ulf doesn't want to take them we can apply them to clk tree.
>> Otherwise, you can have my acked-by on the clk patches.
> 
> I don't mind picking up the clock patches. So I consider this as an
> ack for both patch 1 and patch2, thanks.
> 
> Now, let's give Jaehoon some time to review the dw_mmc parts.

I will check other patches on today, if it's ok, i will apply at my repository.
Thanks for giving time! :)

Best Regards,
Jaehoon Chung

> 
> Kind regards
> Uffe
> 
