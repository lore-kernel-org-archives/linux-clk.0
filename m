Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20151123124356.GW32142@lukather>
References: <cover.1448263428.git.atx@atx.name> <b897b1c8741c8a871163b84d01b480f99329536d.1448263428.git.atx@atx.name>
 <20151123124356.GW32142@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Nov 2015 11:13:13 +0800
Message-ID: <CAGb2v65qfaTdQqXHD=-FHz1M1sHCTro97QETZUH=vA2BbRS+7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: dts: sun8i: Add SID node
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Josef Gajdusek <atx@atx.name>, linux-sunxi <linux-sunxi@googlegroups.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, gpatchesrdh@mveas.com,
	Mike Turquette <mturquette@linaro.org>, Hans De Goede <hdegoede@redhat.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>, Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>,
	Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Mon, Nov 23, 2015 at 8:43 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Mon, Nov 23, 2015 at 09:02:48AM +0100, Josef Gajdusek wrote:
>> Add a node describing the Security ID memory to the
>> Allwinner H3 .dtsi file.
>>
>> Signed-off-by: Josef Gajdusek <atx@atx.name>
>> ---
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
>> index 0faa38a..58de718 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -359,6 +359,13 @@
>>                       #size-cells = <0>;
>>               };
>>
>> +             sid: eeprom@01c14000 {
>> +                     compatible = "allwinner,sun4i-a10-sid";
>> +                     reg = <0x01c14000 0x400>;
>
> The datasheet says it's 256 bytes wide, while the size here is of 1kB,
> is it intentional?

My H3 datasheet (v1.1) says its 1 kB wide.

It'd be nice if Allwinner actually listed the "usable" E-fuse offsets
and widths, instead of having us dig through the SDK code.

Regards
ChenYu
