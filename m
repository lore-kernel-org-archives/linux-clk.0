Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20150824212828.GD14330@codeaurora.org>
References: <1439882205-10978-1-git-send-email-wens@csie.org> <20150824212828.GD14330@codeaurora.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Aug 2015 10:55:28 +0800
Message-ID: <CAGb2v67EhfgtbdLyFLd8xd6MMAnG4MGMvGLUTZxh=ag7XghvyA@mail.gmail.com>
Subject: Re: [PATCH] clk: Add missing header for 'bool' definition to clk-conf.h
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 25, 2015 at 5:28 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/18, Chen-Yu Tsai wrote:
>> of_clk_set_defaults uses the type 'bool', but clk-conf.h does not
>> include its definition.
>>
>> This results in a compile error when only clk-conf.h is used.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> Cc: stable@vger.kernel.org
>
> Why is stable Cc-ed? Is there some sort of compilation failure on
> stable kernels?

There isn't for now. Though I don't see why we shouldn't fix this for
stable kernels as well. It's possible other people or third-party
vendors working with stable/LTS kernels (Android?) may run into it.

I'm perfectly fine with not Cc-ing stable. It just seemed like the
right thing to do.


Regards
ChenYu
