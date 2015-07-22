Return-Path: <linux-pm-owner@vger.kernel.org>
Message-ID: <55AFB96E.1050406@arm.com>
Date: Wed, 22 Jul 2015 16:40:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Liviu Dudau <Liviu.Dudau@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 6/8] arm64: dts: add SRAM, MHU mailbox and SCPI support
 on Juno
References: <1433760002-24120-1-git-send-email-sudeep.holla@arm.com> <1433760002-24120-7-git-send-email-sudeep.holla@arm.com> <20150722132809.GG14923@e106497-lin.cambridge.arm.com>
In-Reply-To: <20150722132809.GG14923@e106497-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 22/07/15 14:28, Liviu Dudau wrote:
> On Mon, Jun 08, 2015 at 11:40:00AM +0100, Sudeep Holla wrote:
>> This patch adds support for the MHU mailbox peripheral used on Juno by
>> application processors to communicate with remote SCP handling most of
>> the CPU/system power management. It also adds the SRAM reserving the
>> shared memory and SCPI message protocol using that shared memory.
>>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>   arch/arm64/boot/dts/arm/juno-base.dtsi   | 31 +++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/arm/juno-clocks.dtsi | 23 +++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>

[..]

>> diff --git a/arch/arm64/boot/dts/arm/juno-clocks.dtsi b/arch/arm64/boot/dts/arm/juno-clocks.dtsi
>> index 25352ed943e6..64af7370815a 100644
>> --- a/arch/arm64/boot/dts/arm/juno-clocks.dtsi
>> +++ b/arch/arm64/boot/dts/arm/juno-clocks.dtsi
>> @@ -42,3 +42,26 @@
>>   		clock-frequency = <400000000>;
>>   		clock-output-names = "faxi_clk";
>>   	};
>> +
>> +	scpi {
>> +		compatible = "arm,scpi";
>> +		mboxes = <&mailbox 1>;
>> +		shmem = <&cpu_scp_hpri>;
>> +
>> +		clocks {
>> +			compatible = "arm,scpi-clocks";
>> +
>> +			scpi_dvfs: scpi_clocks@0 {
>> +				compatible = "arm,scpi-dvfs-clocks";
>> +				#clock-cells = <1>;
>> +				clock-indices = <0>, <1>, <2>;
>> +				clock-output-names = "vbig", "vlittle", "vgpu";
>> +			};
>> +			scpi_clk: scpi_clocks@3 {
>> +				compatible = "arm,scpi-variable-clocks";
>> +				#clock-cells = <1>;
>> +				clock-indices = <3>, <4>;
>
> Subject to you addressing Mark's comments regarding the indices values (maybe choose
> a different property to show the fact that the index is actually an SCPI index
> rather than the clock's), you can add my
>

I don't understand why we need to do that. I will anyway follow up on
that thread.

> Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Thanks for all the ACKs.

Regards,
Sudeep
