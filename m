Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: pxa: fix the rtc controller
References: <20180627150150.23951-1-robert.jarzmik@free.fr>
 <20180627150150.23951-2-robert.jarzmik@free.fr>
 <20180627171627.592849b5@windsurf.home>
Date: Wed, 27 Jun 2018 17:28:04 +0200
In-Reply-To: <20180627171627.592849b5@windsurf.home> (Thomas Petazzoni's
 message of "Wed, 27 Jun 2018 17:16:27 +0200")
Message-ID: <87muvgl057.fsf@belgarion.home>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello,
>> +		rtc@40900000 {
>> +			clocks = <&clks CLK_OSC32k768>>;
>
> Double closing bracket, doesn't look good.

Rrrr you're right ... I swear this patchset is cursed ...

Thanks for spotting that, I'll send a v4.

Cheers.

-- 
Robert

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
