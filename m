Return-Path: <dongas86@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170602224034.GX20170@codeaurora.org>
References: <1495201746-31841-1-git-send-email-aisheng.dong@nxp.com> <20170602224034.GX20170@codeaurora.org>
From: Dong Aisheng <dongas86@gmail.com>
Date: Tue, 13 Jun 2017 17:18:26 +0800
Message-ID: <CAA+hA=ROWfUD3LCxj=POs4QPeqKF0MjKQMeC2WMbVbGiRwL9vQ@mail.gmail.com>
Subject: Re: [PATCH V3 0/3] clk: introduce clk_bulk_get accessories
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, anson.huang@nxp.com,
	Bai Ping <ping.bai@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>,
	Octavian Purdila <octavian.purdila@nxp.com>, Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Sat, Jun 3, 2017 at 6:40 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/19, Dong Aisheng wrote:
>> These helper function allows drivers to get several clk consumers in
>> one operation.  If any of the clk cannot be acquired then any clks
>> that were got will be put before returning to the caller.
>>
>
> I've merged the first two into a stable branch and merged to
> clk-next. The third one can go via cpufreq.
>

Thanks.
I will resend the third once the first two hit mainline.

Regards
Dong Aisheng

> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
