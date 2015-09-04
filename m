Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20150903173458.GF15099@codeaurora.org>
References: <20150724232045.GA14059@www.outflux.net> <CAAObsKBp-hPknWUxJxJGPV1RTj+Q_yc+xxVG315FjQXk9_CK2g@mail.gmail.com>
 <CAGXu5jKnvPw=LM6uynk532AzON1hoD+PmA0t-eA4oOfW=R986w@mail.gmail.com>
 <CAAObsKAyKVM-Y4XZJZ-dPXnZZpQ4_ytovkshAXCWj6UFU7-XGw@mail.gmail.com>
 <CAAObsKC4s8M3NgvSn2NS8jginvdnQNZmYydt_Zswz992=yTW0w@mail.gmail.com> <20150903173458.GF15099@codeaurora.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 4 Sep 2015 07:17:28 +0200
Message-ID: <CAAObsKAPKRA1Tw4cVwy3=72D4t2pKoOfwXB_BAtGuB7x8enfQg@mail.gmail.com>
Subject: Re: [PATCH] clk_register_clkdev: handle callers needing format string
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 3 September 2015 at 19:34, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 09/03, Tomeu Vizoso wrote:
>> On 5 August 2015 at 15:09, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>> >
>> > Could this patch be removed from linux-next in the meantime?
>>
>> Stephen, Mike,
>>
>> the Tegra portion of this patch is wrong because it registers some
>> clocks with a dev_id of "(null)", which is really inconvenient when
>> debugging because one cannot tell from the logs if it's NULL or that
>> actual string.
>>
>> Could this be reverted?
>
> Was this patch applied somewhere? clkdev is maintained by
> Russell, so Mike and I didn't apply this patch to begin with.

Sorry about that, it came into -next via mmotm.

Regards,

Tomeu

> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
