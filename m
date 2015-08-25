Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20150825065932.GA29101@unicorn.suse.cz>
References: <1439882205-10978-1-git-send-email-wens@csie.org>
 <20150824212828.GD14330@codeaurora.org> <CAGb2v67EhfgtbdLyFLd8xd6MMAnG4MGMvGLUTZxh=ag7XghvyA@mail.gmail.com>
 <20150825065932.GA29101@unicorn.suse.cz>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Aug 2015 15:41:02 +0800
Message-ID: <CAGb2v67a66VbpEs4SkDf8yCeuNxgHDtKxzpnGzxNnXvmkfZxAA@mail.gmail.com>
Subject: Re: [PATCH] clk: Add missing header for 'bool' definition to clk-conf.h
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 25, 2015 at 2:59 PM, Michal Kubecek <mkubecek@suse.cz> wrote:
> On Tue, Aug 25, 2015 at 10:55:28AM +0800, Chen-Yu Tsai wrote:
>> On Tue, Aug 25, 2015 at 5:28 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> > On 08/18, Chen-Yu Tsai wrote:
>> >> of_clk_set_defaults uses the type 'bool', but clk-conf.h does not
>> >> include its definition.
>> >>
>> >> This results in a compile error when only clk-conf.h is used.
>> >>
>> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> >> Cc: stable@vger.kernel.org
>> >
>> > Why is stable Cc-ed? Is there some sort of compilation failure on
>> > stable kernels?
>>
>> There isn't for now. Though I don't see why we shouldn't fix this for
>> stable kernels as well. It's possible other people or third-party
>> vendors working with stable/LTS kernels (Android?) may run into it.
>
> How about
>
>    - It must fix a real bug that bothers people (not a, "This could be a
>    problem..." type thing).
>
> in Documentation/stable_kernel_rules.txt?

My bad. I'll send a new version without the CC.

ChenYu
