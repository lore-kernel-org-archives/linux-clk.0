Return-Path: <mopsfelder@gmail.com>
MIME-Version: 1.0
In-Reply-To: <554AB7E8.1040009@codeaurora.org>
References: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com>
 <1430959861-14925-3-git-send-email-mopsfelder@gmail.com> <554AB7E8.1040009@codeaurora.org>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=C3=BAjo?= <mopsfelder@gmail.com>
Date: Wed, 6 May 2015 21:59:34 -0300
Message-ID: <CA+LKeY7mrQrh6VYSLMX3p-nwryHb3WO9dgz=xD4Y_YKT4T5r7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers: clk: clk.c: Make clk_is_orphan() dependent
 of CONFIG_OF
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Mike Turquette <mturquette@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 6, 2015 at 9:55 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/06/15 17:51, Murilo Opsfelder Araujo wrote:
>> The function clk_is_orphan() is called only by
>> __of_clk_get_from_provider(), which depends on CONFIG_OF, so it does
>> make sense the move.
>>
>> This change also gets rid of the following build message when CONFIG_OF
>> is not set:
>>
>> drivers/clk/clk.c:2231:13: warning: =E2=80=98clk_is_orphan=E2=80=99 defi=
ned but not used [-Wunused-function]
>>
>> Signed-off-by: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
>
> The patch that introduces this problem is gone now.
>

Nice to know it is gone.  I'm using next-20150506 which still contains
that.  Probably the fix will land a next -next release.

Thanks, Stephen.

--=20
Murilo
