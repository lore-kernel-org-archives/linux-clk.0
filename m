Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jisheng Zhang <jszhang@marvell.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160309152420.20de187a@xhacker>
Cc: pi-cheng.chen@linaro.org
References: <20160309152420.20de187a@xhacker>
Message-ID: <20160311165152.4103.82090@quark.deferred.io>
Subject: Re: [Query]set clk rate must operate its coordinated clock
Date: Fri, 11 Mar 2016 08:51:52 -0800
List-ID: <linux-clk.vger.kernel.org>

Jisheng,

Quoting Jisheng Zhang (2016-03-08 23:24:20)
> Dear Stephen, Michael, Sebastian and all, =

> =

> I have the following clk case which I dunno the elegant solution:
> =

> =

> cpuclk have two parents: cpupll and refclk. When set the cpuclk freq, we
> have to set its parent's freq, I.E cpupll freq. But before changing the
> cpupll's freq, we should set its refclk as its parent firstly.
> =

> AFAIK, this is a common case, I have seen such requirement in rockchip, s=
amsung
> clk driver. They solve this by notifier, but as pointed out by Michael
> in http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/351565=
.html
> =

> "This is also a hack and it points towards some missing infrastructure in=
 the
> clock framework."
> =

> I also don't like the notifier solution, I believe the elegant solution c=
ould
> be using the coordinated clock infrastructure. So what's the status of
> this infrastructure? I can test, and I can even add some code to make it =
be
> ready to be merged if you guide me ;)

Thanks for the email. I hope to finish that feature before ELC. I have
Cc'd Pi-Cheng Chen from Mediatek who is also interested in coordinated
clock rates.

Regards,
Mike

> =

> Thanks in advance,
> Jisheng
