Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rob Herring <robh@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Thu, 19 Jan 2017 03:24:35 +0000
Message-ID: <e9cd1318dfe04d7ca3bad0e2073587d8@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-2-chris.packham@alliedtelesis.co.nz>
 <20170118222508.prn5xk63nuc3ocr7@rob-hp-laptop>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 19/01/17 11:25, Rob Herring wrote:=0A=
> On Fri, Jan 13, 2017 at 10:12:16PM +1300, Chris Packham wrote:=0A=
>> The 98DX3236, 98DX3336, 98DX4521 and variants have a different TCLK from=
=0A=
>> the Armada XP (200MHz vs 250MHz). The CPU core clock is fixed at 800MHz.=
=0A=
>>=0A=
>> The clock gating options are a subset of those on the Armada XP.=0A=
>>=0A=
>> The core clock divider is different to the Armada XP also.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>=0A=
>> Notes:=0A=
>>     Changes in v2:=0A=
>>     - Update devicetree binding documentation for new compatible string=
=0A=
>>     Changes in v3:=0A=
>>     - Add 98dx3236 support to mvebu/clk-corediv.c rather than creating a=
 new=0A=
>>       driver.=0A=
>>     - Document mv98dx3236-corediv-clock binding=0A=
>>     Changes in v4:=0A=
>>     - None=0A=
>>=0A=
>>  .../bindings/clock/mvebu-corediv-clock.txt         |  1 +=0A=
>>  .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |  1 +=0A=
>=0A=
> Please add acks when posting new versions.=0A=
>=0A=
> Acked-by: Rob Herring <robh@kernel.org>=0A=
>=0A=
=0A=
Thanks Rob. I must have missed the earlier ack. Will be in v5.=0A=
