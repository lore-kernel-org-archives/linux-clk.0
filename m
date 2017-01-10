Return-Path: <alexandre.torgue@st.com>
Subject: Re: [PATCH v4 1/9] clk: stm32f4: Update DT bindings documentation
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1481638820-29324-1-git-send-email-gabriel.fernandez@st.com>
 <1481638820-29324-2-git-send-email-gabriel.fernandez@st.com>
 <20161222001051.GP8288@codeaurora.org>
 <ccd14adb-9d10-ae9e-de6d-565418421968@st.com>
 <20170109193312.GN17126@codeaurora.org>
CC: Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
        Rob Herring
	<robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King
	<linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael
 Turquette <mturquette@baylibre.com>,
        Nicolas Pitre <nico@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>,
        "daniel.thompson@linaro.org"
	<daniel.thompson@linaro.org>,
        "andrea.merello@gmail.com"
	<andrea.merello@gmail.com>,
        "radoslaw.pietrzyk@gmail.com"
	<radoslaw.pietrzyk@gmail.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "kernel@stlinux.com" <kernel@stlinux.com>,
        Ludovic BARRE <ludovic.barre@st.com>,
        Olivier BIDEAU <olivier.bideau@st.com>,
        Amelie DELAUNAY <amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <0031c2ec-5fc8-4abf-29ef-5039b0508931@st.com>
Date: Tue, 10 Jan 2017 11:08:55 +0100
MIME-Version: 1.0
In-Reply-To: <20170109193312.GN17126@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 01/09/2017 08:33 PM, Stephen Boyd wrote:
> On 01/09, Alexandre Torgue wrote:
>> Hi Stephen,
>>
>> On 12/22/2016 01:10 AM, Stephen Boyd wrote:
>>> On 12/13, gabriel.fernandez@st.com wrote:
>>>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>>>
>>>> Creation of dt include file for specific stm32f4 clocks.
>>>> These specific clocks are not derived from system clock (SYSCLOCK)
>>>> We should use index 1 to use these clocks in DT.
>>>> e.g. <&rcc 1 CLK_LSI>
>>>>
>>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>>>> Acked-by: Rob Herring <robh@kernel.org>
>>>> ---
>>>
>>> Applied to clk-stm32f4 and merged into clk-next.
>>>
>>
>> I'm preparing pull request branch for STM32 DT part. This patch is
>> also requested to build correctly DT patches. Do you know how could
>> we synchronize our pull request ?
>>
>
> clk-stm32f4 is stable and not going to be rebased, so you're good
> to base patches on it and send it off to arm-soc if the arm-soc
> maintainers agree to it. You can also base off an earlier part of
> the branch if you only need this first patch for example.
>
I will base my DT branch from 4.10-rc1 + this commit (seen with Arnd)

Thanks
