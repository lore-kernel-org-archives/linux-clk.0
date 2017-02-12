Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <CAGS+omCV-90OsBk1c1Xj9_20yC5CmPNtMb+K9R7=mOiTg3sAJw@mail.gmail.com>
References: <1442230072-31593-1-git-send-email-pi-cheng.chen@linaro.org>
 <CAGS+omCkYTPyjMk6QaoxGAL4QVU8VcpWyFqWhST+iP2EFRcRYg@mail.gmail.com>
 <CALx668XVnhhLJWs7RBxvaX=SU=S9=wFVT9HMDP2edqiH4Jio4A@mail.gmail.com>
 <20151217090628.GA317@quark.deferred.io> <CAGS+omCV-90OsBk1c1Xj9_20yC5CmPNtMb+K9R7=mOiTg3sAJw@mail.gmail.com>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Sun, 12 Feb 2017 11:31:35 +0800
Message-ID: <CAGS+omCf0ubiVbUQ58tPvM0jshadKgiB-FnMXEdC=0XB6ygArQ@mail.gmail.com>
Subject: Re: [PATCH v6] clk: mediatek: Export CPU mux clocks for CPU frequency control
To: Michael Turquette <mturquette@baylibre.com>
Cc: Pi-Cheng Chen <pi-cheng.chen@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	James Liao <jamesjj.liao@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Pi-Cheng, Matthias,

On Mon, Feb 15, 2016 at 11:28 AM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> Hi Mike, Pi-Cheng,
>
> On Thu, Dec 17, 2015 at 5:06 PM, Michael Turquette
> <mturquette@baylibre.com> wrote:
>> On 12/01, Pi-Cheng Chen wrote:
>>> On Mon, Nov 30, 2015 at 11:48 AM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>> > Hi Pi-Cheng and Michael,
>>> >
>>> > On Mon, Sep 14, 2015 at 7:27 PM, Pi-Cheng Chen <pi-cheng.chen@linaro.org> wrote:
>>> >> From: "pi-cheng.chen" <pi-cheng.chen@linaro.org>
>>> >>
>>> >> This patch adds CPU mux clocks which are used by Mediatek cpufreq driver
>>> >> for intermediate clock source switching.
>>> >
>>> > It looks like this patch was never picked up.
>>> > It is required for MT8173 cpufreq.
>>> >
>>> > What is the plan to get this one merged?
>>>
>>> Hi Dan,
>>> Mike is working on a new CCF feature called "coordinated clock rate changes"
>>> which would help to migrate mt8173-cpufreq driver to generic cpufreq-dt
>>> driver, and I am working with him to port MT8173 clock driver on the new
>>> feature. So I think that's why this patch was not picked since it will
>>> be migrated to new implementation once the new feature's ready.
>>>
>>> @Mike:
>>> Are you plannig to post those patches on the mailing list ?
>>> Or is it fine for you to take this first and then I will refine it for
>>> the new feature later?
>>
>> I plan to post those patches next week.
>
> Were these patches ever posted?
> I'm not really sure what patch set I am looking for.

Another friendly (+1 year) ping on the status of the "coordinated
clock rate changes" patches that were a prerequisite to finally finish
merging the complete Mediatek MT8173 cpufreq implementation.

Thanks,
-Dan
