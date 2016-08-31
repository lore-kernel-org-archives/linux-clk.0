Return-Path: <mirza.krak@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1472627926.31008.7.camel@toradex.com>
References: <1472569349.5703.25.camel@toradex.com> <1472627926.31008.7.camel@toradex.com>
From: Mirza Krak <mirza.krak@gmail.com>
Date: Wed, 31 Aug 2016 11:48:07 +0200
Message-ID: <CALw8SCW49jOZ7gBTwhNLSMeeDUCYUpRs-GNgXo84pOkUfLTcUA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ARM: tegra: Add Tegra20 GMI support
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-08-31 9:18 GMT+02:00 Marcel Ziswiler <marcel.ziswiler@toradex.com>:
> On Wed, 2016-08-24 at 15:37 +0200, Mirza Krak wrote:
>>
>> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add a device node for the GMI controller found on Tegra20.
>>
>> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.g
>> mane.org>
>> ---
>> Changes in v2:
>> - added address-cells, size-cells and ranges properties
>>
>>  arch/arm/boot/dts/tegra20.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra20.dtsi
>> b/arch/arm/boot/dts/tegra20.dtsi
>> index 2207c08..03eb029 100644
>> --- a/arch/arm/boot/dts/tegra20.dtsi
>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>> @@ -376,6 +376,20 @@
>>               status = "disabled";
>>       };
>>
>> +
>> +     gmi@70009000 {
>> +             compatible = "nvidia,tegra20-gmi";
>> +             reg = <70009000 0x1000>;
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges = <0 0x48000000 0x7ffffff>;
>
> On T20 it is actually rather 0xd0000000.

It indeed is, thank you catching this.

Best Regards
Mirza
