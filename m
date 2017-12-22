Return-Path: <zhang.lyra@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171221230316.GY7997@codeaurora.org>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com>
 <20171207125715.16160-12-chunyan.zhang@spreadtrum.com> <20171221230316.GY7997@codeaurora.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 22 Dec 2017 13:30:43 +0800
Message-ID: <CAAfSe-tc6s6F-1AYEamZubJ7VfMXm-rp18c8pctE51izeHXsnA@mail.gmail.com>
Subject: Re: [PATCH V7 11/12] arm64: dts: add syscon for whale2 platform
To: Stephen Boyd <sboyd@codeaurora.org>, "arm@kernel.org" <arm@kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>,
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 22 December 2017 at 07:03, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/07, Chunyan Zhang wrote:
>> Some clocks on SC9860 are in the same address area with syscon
>> devices, the proper syscon node will be quoted under the
>> definitions of those clocks in DT.
>>
>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>> ---
>
> These last two can go via arm-soc?

Thanks Stephen!

Hi Arnd, Olof

Could you please take the patch 11, 12 through arm-soc?

Thanks,
Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
