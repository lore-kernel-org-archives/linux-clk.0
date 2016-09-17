Return-Path: <zajec5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160916232332.GB7243@codeaurora.org>
References: <20160905142935.4550-1-zajec5@gmail.com> <20160913070722.5867-1-zajec5@gmail.com>
 <20160916232332.GB7243@codeaurora.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sat, 17 Sep 2016 21:20:43 +0200
Message-ID: <CACna6rwx5Aridk6ff2f3utmkDHEVD1rTBBVAZhr7qp3futuRKA@mail.gmail.com>
Subject: Re: [PATCH V8] clk: bcm: Add driver for BCM53573 ILP clock
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 17 September 2016 at 01:23, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 09/13, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> This clock is present on BCM53573 devices (including BCM47189) that use
>> Cortex-A7. ILP is a part of PMU (Power Management Unit) multi-function
>> device so we use syscon (and regmap) for it.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>
> Applied to clk-next

Thank you and everyone who helped me getting this driver into a proper
shape. I appreciate your help!

--=20
Rafa=C5=82
