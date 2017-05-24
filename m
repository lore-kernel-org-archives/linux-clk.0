Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbXEFeVkD8rETyrnuoAxUvnFt2BL07UsXuXfSnq3Qdyfw@mail.gmail.com>
References: <20170419091326.11226-1-linus.walleij@linaro.org> <CACRpkdbXEFeVkD8rETyrnuoAxUvnFt2BL07UsXuXfSnq3Qdyfw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 May 2017 11:16:22 +0200
Message-ID: <CACRpkdYvwwJcxKPtKUyZBLWsmjXji7pHDKNz9NRTETqj2P3drQ@mail.gmail.com>
Subject: Re: [PATCH 1/5 v2] clk: qcom: Update DT bindings for the
 MSM8660/APQ8060 RPMCC
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 17, 2017 at 9:23 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Apr 19, 2017 at 11:13 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>
>> These compatible strings need to be added to extend support
>> for the RPM CC to cover MSM8660/APQ8060. We also need to add
>> enumberators to the include file for a few clocks that were
>> missing.
>>
>> Cc: devicetree@vger.kernel.org
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> ChangeLog v1->v2:
>> - Collect Rob's ACK
>
> Ping on this patch set. It's been sitting for a month and was
> not changed from v1 either, if you want me to change something
> it'd be good to know.

Ping on this again.

I am sorry if you guys are swamped, I just don't know what to do,
clock drivers are starting to become the bottleneck for everything
I do. I bet the ARM SoC maintainers must be noticing it too.

Unfortunately I am already managing two subsystems and cannot
volunteer to help out with a third, I would blow a fuse.

But it seems the CLK subsystem could use some co-maintainers?

Peter de Schrijver is a big authority in all things clocking (I clearly
remember him discussing the subject a lot at conferences with lots
of good points) so I would ask him to help, but I don't know how busy
Peter may be with nVidia business etc these days...

Yours,
Linus Walleij
