MIME-Version: 1.0
In-Reply-To: <20151216233015.GC5951@Agamemnon.attlocal.net>
References: <1448933502-11944-4-git-send-email-sboyd@codeaurora.org>
	<20151216233015.GC5951@Agamemnon.attlocal.net>
Date: Wed, 23 Dec 2015 16:17:34 -0800
Message-ID: <CAEG3pNCCFLxfqby0noMJ-VbNo5BWjq9Wt864tH6gUPMVyCLdLA@mail.gmail.com>
Subject: Re: [v2,3/5] clk: qcom: Add MSM8996 Global Clock Control (GCC) driver
From: Michael Turquette <mturquette@baylibre.com>
To: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Andy,

On Wed, Dec 16, 2015 at 3:30 PM, Andy Gross <andy.gross@linaro.org> wrote:
> On Mon, Nov 30, 2015 at 05:31:40PM -0800, Stephen Boyd wrote:
>> Add support for the global clock controller found on MSM8996
>> based devices. This should allow most non-multimedia device
>> drivers to probe and control their clocks.
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>>
>> ---
>
> I saw that this complete set of patches was pulled into clk-next.  Would it be
> possible for you to host an immutable branch so that I can get the DTS pulled in
> properly with all the dependencies?

We already have this in our git tree (as part of our normal topic
branch process):

git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-msm8996

I'll be sure not to blow it up.

Regards,
Mike

>
> Thanks,
>
> Andy



-- 
Michael Turquette
CEO
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
