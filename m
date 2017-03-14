Return-Path: <afaerber@suse.de>
Subject: Re: [PATCH 1/4] ARM64: Prepare Marvell IAP140 aka PXA1908
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20170219032000.4674-1-afaerber@suse.de>
 <20170219032000.4674-2-afaerber@suse.de>
 <CAPDyKFoy-dKTk=t6cmwzbjyntZHrkSyZbtpJ0wAMUDJ5xz4viA@mail.gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jisheng Zhang <jszhang@marvell.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 info@andromedabox.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-serial@vger.kernel.org
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <9c1fe53f-d25a-6bba-c324-a08818431795@suse.de>
Date: Tue, 14 Mar 2017 19:10:29 +0100
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoy-dKTk=t6cmwzbjyntZHrkSyZbtpJ0wAMUDJ5xz4viA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Am 14.03.2017 um 17:30 schrieb Ulf Hansson:
> On 19 February 2017 at 04:19, Andreas Färber <afaerber@suse.de> wrote:
>> Suppress COMMON_CLK_PXA and MMC_PXA for now as they don't build on arm64.
>> Also suppress the deprecated SERIAL_PXA in favor of SERIAL_8250_PXA.
>>
>> Signed-off-by: Andreas Färber <afaerber@suse.de>
>> ---
>>  arch/arm64/Kconfig.platforms | 5 +++++
>>  drivers/clk/Kconfig          | 2 +-
>>  drivers/mmc/host/Kconfig     | 2 +-
>>  drivers/tty/serial/Kconfig   | 2 +-
>>  4 files changed, 8 insertions(+), 3 deletions(-)
> 
> Please try split this up so it can be applied on each subsystem independently.

I believe that comment is obsoleted by later versions of the patchset
using ARCH_MMP instead?

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
