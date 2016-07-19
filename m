Return-Path: <s.nawrocki@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Subject: Re: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem
 CLKCON driver
To: =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski.k+lkml@gmail.com>
References: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
 <146799700614.73491.6564650478987470074@resonance>
 <578616AE.7010805@samsung.com>
 <CAJKOXPc3NqsLjEdbs3o1vwaKWCsxK5HxH9G1pRKpMKLD0QXQGw@mail.gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <578DF91D.8050800@samsung.com>
Date: Tue, 19 Jul 2016 11:55:41 +0200
In-reply-to: 
 <CAJKOXPc3NqsLjEdbs3o1vwaKWCsxK5HxH9G1pRKpMKLD0QXQGw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/19/2016 11:26 AM, Krzysztof Kozłowski wrote:
> On Wed, Jul 13, 2016 at 12:23 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> > On 07/08/2016 06:56 PM, Michael Turquette wrote:
>>> >> Quoting Sylwester Nawrocki (2016-07-08 07:15:00)
>>>>> >>> > Any clock dependencies can be properly handled with deferred probing
>>>>> >>> > so we can remove core_initcall and switch to a proper loadable platform
>>>>> >>> > driver module.
>>>>> >>> > This change has been tested on Exynos4412 Odroid U3 based board.
>>>>> >>> >
>>>>> >>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> >>
>>> >> Looks good to me.
>> >
>> > Thanks, I have added this patch to my tree, however at the moment
>> > I have only two patches queued there. Please feel free to apply
>> > this patch directly to clk-next.
> 
> Unfortunately this breaks the audio on Odroid XU3 (simple-card). There
> is no sound from:
> $ aplay /usr/share/sounds/alsa/Front_Right.wav
> and the command does not exit.
> 
> Sylwester,
> Are you going to look at this?

Thanks for the bug report, I will check what's the problem here.
Odroid U3 also uses simple card and same codec and it all works there.

--
Regards,
Sylwester
