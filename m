Return-Path: <gabriel.fernandez@st.com>
Subject: Re: [PATCH 0/2] STM32F4 clock fixes
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1489588071-18164-1-git-send-email-gabriel.fernandez@st.com>
 <20170315204307.GK10239@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        <daniel.thompson@linaro.org>, <andrea.merello@gmail.com>,
        <radoslaw.pietrzyk@gmail.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Gabriel Fernandez <gabriel.fernandez@st.com>
Message-ID: <d400ff60-06ce-c765-981a-2dce4b1de89d@st.com>
Date: Thu, 16 Mar 2017 09:04:40 +0100
MIME-Version: 1.0
In-Reply-To: <20170315204307.GK10239@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 03/15/2017 09:43 PM, Stephen Boyd wrote:
> On 03/15, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> This patch-set contains 2 fixes.
>> One concerning exclusion of wrong values for PLLQ (0 & 1)
>> And the second is a fix about timeout management of PLL and LSE/LSI clocks.
> But neither of the patches have a "Fixes" tag. Can you please
> indicate what commits they're fixing?
>
Okay i will send a v2 with "Fixes" tags

BR

Gabriel
