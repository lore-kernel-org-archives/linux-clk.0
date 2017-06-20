Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Jun 2017 13:44:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: zhoubb <zhoubb@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
	James Hogan <james.hogan@imgtec.com>,
	John Crispin <john@phrozen.org>,
	"Steven J . Hill" <Steven.Hill@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fuxin Zhang <zhangfx@lemote.com>,
	Zhangjin Wu <wuzhangjin@gmail.com>,
	Kelvin Cheung <keguang.zhang@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>,
	=?utf-8?B?6LCi6Ie06YKm?= <Yeking@red54.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	HuaCai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v7 7/8] clk: Loongson: Add Loongson-1A clock support
Message-ID: <20170620204444.GT4493@codeaurora.org>
References: <1497581573-17258-1-git-send-email-zhoubb@lemote.com>
 <1497581573-17258-8-git-send-email-zhoubb@lemote.com>
 <20170619233434.GQ20170@codeaurora.org>
 <CAMpQs4L1_VvWxk_mkbRgvVb3o23m+RdVosgzxFLMRX7fjKa+6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAMpQs4L1_VvWxk_mkbRgvVb3o23m+RdVosgzxFLMRX7fjKa+6w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/20, zhoubb wrote:
> On Tue, Jun 20, 2017 at 7:34 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 06/16, Binbin Zhou wrote:
> >> +
> >> +static DEFINE_SPINLOCK(_lock);
> >
> > I know the other loongson1*.c files also call it "_lock", but
> > that's not a very good name for something that may show up in
> > lockdep debugging error messages. How about something a bit more
> > descriptive, loongson1x_clk_lock?
> >
> It's a good idea！
> Actually, the variable is not be used in this file.
> If I rename it in another new patch will be better.
> Do you think so ?

Ok sure.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
