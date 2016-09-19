Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  <linux-clk@vger.kernel.org>,  <linux-usb@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,  <jbrunet@baylibre.com>,  <johnyoun@synopsys.com>,  <carlo@caione.org>,  <linux-arm-kernel@lists.infradead.org>,  <devicetree@vger.kernel.org>,  <sboyd@codeaurora.org>,  <mturquette@baylibre.com>,  <will.deacon@arm.com>,  <catalin.marinas@arm.com>,  <gregkh@linuxfoundation.org>,  <mark.rutland@arm.com>,  <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/6] phy: meson: add USB2 PHY support for Meson8b and GXBB
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
	<20160911134111.31141-1-martin.blumenstingl@googlemail.com>
	<20160911134111.31141-4-martin.blumenstingl@googlemail.com>
	<m2a8faxy72.fsf@baylibre.com> <57DCC3CF.9090409@ti.com>
Date: Mon, 19 Sep 2016 09:42:22 -0700
In-Reply-To: <57DCC3CF.9090409@ti.com> (Kishon Vijay Abraham, I's message of
	"Sat, 17 Sep 2016 09:47:19 +0530")
Message-ID: <m2wpi7hmdt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Kishon Vijay Abraham I <kishon@ti.com> writes:

> Hi Kevin,
>
> On Wednesday 14 September 2016 09:36 PM, Kevin Hilman wrote:
>> Kishon,
>> 
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>> 
>>> This is a new driver for the USB PHY found in Meson8b and GXBB SoCs.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>> 
>> Will you be picking this up for v4.9?
>
> It's already late for 4.9. Generally send pull request to Greg around -rc6.
> This can go only in 4.10.

That's fine.

Does that mean you have it queued someplace?  I don't see it in any of
your branches.

Kevin
