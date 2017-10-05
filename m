Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20171005172207.GD457@codeaurora.org>
References: <20171005121301.584338-1-arnd@arndb.de> <20171005172207.GD457@codeaurora.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Oct 2017 22:31:02 +0200
Message-ID: <CAK8P3a0Cyr-+pRecB4Exe1F7Cz6ijisNjoyRWisLjAU_utH2Hw@mail.gmail.com>
Subject: Re: [PATCH] clk: export clk_bulk_prepare
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Oct 5, 2017 at 7:22 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 10/05, Arnd Bergmann wrote:
>> The ARM allmodconfig build fails in linux-next, since one
>
> Which version of linux-next? I merged a patch for this already
> and pushed it out a day or two ago.

I used the latest linux-next, which unfortunately is a few days old by now,
just ignore my patch then.

      Arnd
