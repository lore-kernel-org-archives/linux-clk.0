Return-Path: <khilman@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20150513201426.GH4004@lukather>
References: <1981330.kGUrTurMy5@diego>
	<5543E79F.2080400@codeaurora.org>
	<22709390.NTAlubMgNB@diego>
	<55440EDA.4030905@codeaurora.org>
	<CAMAWPa_n+59+v+x3fKkmdtW1wMJF7kqtTjLLowmv1xwGWprYJw@mail.gmail.com>
	<554BD33D.7050907@codeaurora.org>
	<20150508100247.GQ11057@lukather>
	<55528046.4030107@codeaurora.org>
	<20150513130304.GA4004@lukather>
	<7hiobw8s31.fsf@deeprootsystems.com>
	<20150513201426.GH4004@lukather>
Date: Wed, 13 May 2015 13:44:50 -0700
Message-ID: <CAMAWPa9nDJzz_1D7FVnMO3PGAZ6PnmBKoL_iEvHFMDzQND6Wbw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
From: Kevin Hilman <khilman@kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
	Tyler Baker <tyler.baker@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 13, 2015 at 1:14 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Wed, May 13, 2015 at 07:33:54AM -0700, Kevin Hilman wrote:
>> Maxime Ripard <maxime.ripard@free-electrons.com> writes:
>>
>> > On Tue, May 12, 2015 at 03:35:50PM -0700, Stephen Boyd wrote:
>> >> On 05/08/15 03:02, Maxime Ripard wrote:
>> >> > On Thu, May 07, 2015 at 02:03:57PM -0700, Stephen Boyd wrote:
>> >> >> On 05/07/15 08:17, Kevin Hilman wrote:
>> >> >>> On Fri, May 1, 2015 at 4:40 PM, Stephen Boyd <sboyd@codeaurora.or=
g> wrote:
>> >> >>>> On 05/01/15 15:07, Heiko St=C3=BCbner wrote:
>> >> >>>>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
>> >> >>>>>
>> >> >>>>>>> Instead I guess we could hook it less deep into clk_get_sys, =
like in the
>> >> >>>>>>> following patch?
>> >> >>>>>> It looks like it will work at least, but still I'd prefer to k=
eep the
>> >> >>>>>> orphan check contained to clk.c. How about this compile tested=
 only patch?
>> >> >>>>> I gave this a spin on my rk3288-firefly board. It still boots, =
the clock tree
>> >> >>>>> looks the same and it also still defers nicely in the scenario =
I needed it
>> >> >>>>> for. The implementation also looks nice - and of course much mo=
re compact than
>> >> >>>>> my check in two places :-) . I don't know if you want to put th=
is as follow-up
>> >> >>>>> on top or fold it into the original orphan-check, so in any cas=
e
>> >> >>>>>
>> >> >>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> >> >>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> >> >>>> Thanks. I'm leaning towards tossing your patch 2/2 and replacing=
 it with
>> >> >>>> my patch and a note that it's based on an earlier patch from you=
.
>> >> >>> It appears this has landed in linux-next in the form of 882667c1f=
cf1
>> >> >>> clk: prevent orphan clocks from being used.  A bunch of boot fail=
ures
>> >> >>> for sunxi in today's linux-next[1] were bisected down to that pat=
ch.
>> >> >>>
>> >> >>> I confirmed that reverting that commit on top of next/master gets
>> >> >>> sunxi booting again.
>> >> >>>
>> >> >>>
>> >> >> Thanks for the report. I've removed the two clk orphan patches fro=
m
>> >> >> clk-next. Would it be possible to try with next-20150507 and
>> >> >> clk_ignore_unused on the command line?
>> >> > This makes it work, but it's not really an option.
>> >> >
>> >>
>> >> Hmm.. I thought it didn't fix it for Kevin. Confused.
>> >
>> > I'm too, but it does fix things here.
>>
>> To be more precise on what I tested.  I used next-20150507 and tested on
>> 4 different sunxi platforms.  First test was "normal" commandline,
>> second was with clk_ignore_unused appended:
>>
>>   - cubie: fail, fail
>>   - cubie2: fail, fail
>>   - bananpi: fail, pass
>>   - cubietruck: fail, pass
>>
>> So it seems to have some effect, but by itself, doesn't fix the issue.
>
> It's very odd, I actually tried with a cubie2 here...
>
> I'm booting on an initramfs and not MMC though, but I can't see how
> that can be related to our issue...

I'm booting an initramfs too.

Kevin
