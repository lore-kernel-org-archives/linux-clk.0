Return-Path: <valentinrothberg@gmail.com>
Return-Path: <valentinrothberg@gmail.com>
Subject: Re: [PATCH] ARM: Exynos4415: remove dead build rule
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20170119091153.8439-1-valentinrothberg@gmail.com>
 <CAJKOXPd7UDhn0oxyFsYAtD4zKfOoZA0LP-CNdXmhCzjOs6Le=A@mail.gmail.com>
 <CAJKOXPdX2YhSf0T8zoZ_i=AxbNjWLy=jVF_zhj-b_kGX2x7zPA@mail.gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Valentin Rothberg <valentinrothberg@gmail.com>
From: Valentin Rothberg <valentinrothberg@gmail.com>
Message-ID: <3c181bf8-7861-5197-f423-03e36bc440c5@gmail.com>
Date: Thu, 19 Jan 2017 10:25:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAJKOXPdX2YhSf0T8zoZ_i=AxbNjWLy=jVF_zhj-b_kGX2x7zPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

On 19/01/2017 10:20, Krzysztof Kozlowski wrote:
> On Thu, Jan 19, 2017 at 11:18 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Thu, Jan 19, 2017 at 11:11 AM, Valentin Rothberg
>> <valentinrothberg@gmail.com> wrote:
>>> Commit 22dfab102cfa ("ARM: EXYNOS: Remove Exynos4415 arch code (SoC not
>>> supported anymore)") removed the Kconfig option SOC_EXYNOS4415.  Thus,
>>> we are safe to remove the last reference in the Makefile.
>>>
>>> Signed-off-by: Valentin Rothberg <valetinrothberg@gmail.com>
>>> ---
>>> Detected by using ./scripts/checkkconfigsymbols.py
>>>
>>>  drivers/clk/samsung/Makefile | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
>>> index 57f4dc6dc447..7afc21dc374e 100644
>>> --- a/drivers/clk/samsung/Makefile
>>> +++ b/drivers/clk/samsung/Makefile
>>> @@ -5,7 +5,6 @@
>>>  obj-$(CONFIG_COMMON_CLK)       += clk.o clk-pll.o clk-cpu.o
>>>  obj-$(CONFIG_SOC_EXYNOS3250)   += clk-exynos3250.o
>>>  obj-$(CONFIG_ARCH_EXYNOS4)     += clk-exynos4.o
>>> -obj-$(CONFIG_SOC_EXYNOS4415)   += clk-exynos4415.o
>>
>> It is already removed. Which tree are you using?

I'm on today's linux-next.  Please excuse the noise, I did not see your
other patch on lkml.

> BTW, please fix your own mail/name etc in from and Signed-off-by. One
> of them is wrong and bounces.

Thanks for the hint.

Kind regards,
 Valentin
