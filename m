Return-Path: <khilman@kernel.org>
MIME-Version: 1.0
In-Reply-To: <55440EDA.4030905@codeaurora.org>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
	<1981330.kGUrTurMy5@diego>
	<5543E79F.2080400@codeaurora.org>
	<22709390.NTAlubMgNB@diego>
	<55440EDA.4030905@codeaurora.org>
Date: Thu, 7 May 2015 08:17:19 -0700
Message-ID: <CAMAWPa_n+59+v+x3fKkmdtW1wMJF7kqtTjLLowmv1xwGWprYJw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
From: Kevin Hilman <khilman@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Mike Turquette <mturquette@linaro.org>, Doug Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Alex Elder <elder@linaro.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Stephen Warren <swarren@wwwdotorg.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Sascha Hauer <kernel@pengutronix.de>, Zhangfei Gao <zhangfei.gao@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, Chao Xie <chao.xie@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>, Stefan Wahren <stefan.wahren@i2se.com>,
	Andrew Bresticker <abrestic@chromium.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
	Georgi Djakov <georgi.djakov@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Barry Song <baohua@kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <viresh.linux@gmail.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
	Peter De Sc hrijver <pdeschrijver@nvidia.com>, Tero Kristo <t-kristo@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Pawel Moll <pawel.moll@arm.com>,
	Michal Simek <michal.simek@xilinx.com>, Olof Johansson <olof@lixom.net>,
	Tyler Baker <tyler.baker@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 1, 2015 at 4:40 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/01/15 15:07, Heiko St=C3=BCbner wrote:
>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
>>
>>>> Instead I guess we could hook it less deep into clk_get_sys, like in t=
he
>>>> following patch?
>>> It looks like it will work at least, but still I'd prefer to keep the
>>> orphan check contained to clk.c. How about this compile tested only pat=
ch?
>> I gave this a spin on my rk3288-firefly board. It still boots, the clock=
 tree
>> looks the same and it also still defers nicely in the scenario I needed =
it
>> for. The implementation also looks nice - and of course much more compac=
t than
>> my check in two places :-) . I don't know if you want to put this as fol=
low-up
>> on top or fold it into the original orphan-check, so in any case
>>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
> Thanks. I'm leaning towards tossing your patch 2/2 and replacing it with
> my patch and a note that it's based on an earlier patch from you.

It appears this has landed in linux-next in the form of 882667c1fcf1
clk: prevent orphan clocks from being used.  A bunch of boot failures
for sunxi in today's linux-next[1] were bisected down to that patch.

I confirmed that reverting that commit on top of next/master gets
sunxi booting again.

Kevin

[1] http://kernelci.org/boot/all/job/next/kernel/next-20150507/
