Return-Path: <krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAJKOXPd7UDhn0oxyFsYAtD4zKfOoZA0LP-CNdXmhCzjOs6Le=A@mail.gmail.com>
References: <20170119091153.8439-1-valentinrothberg@gmail.com> <CAJKOXPd7UDhn0oxyFsYAtD4zKfOoZA0LP-CNdXmhCzjOs6Le=A@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 19 Jan 2017 11:20:17 +0200
Message-ID: <CAJKOXPdX2YhSf0T8zoZ_i=AxbNjWLy=jVF_zhj-b_kGX2x7zPA@mail.gmail.com>
Subject: Re: [PATCH] ARM: Exynos4415: remove dead build rule
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Valentin Rothberg <valetinrothberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 19, 2017 at 11:18 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jan 19, 2017 at 11:11 AM, Valentin Rothberg
> <valentinrothberg@gmail.com> wrote:
>> Commit 22dfab102cfa ("ARM: EXYNOS: Remove Exynos4415 arch code (SoC not
>> supported anymore)") removed the Kconfig option SOC_EXYNOS4415.  Thus,
>> we are safe to remove the last reference in the Makefile.
>>
>> Signed-off-by: Valentin Rothberg <valetinrothberg@gmail.com>
>> ---
>> Detected by using ./scripts/checkkconfigsymbols.py
>>
>>  drivers/clk/samsung/Makefile | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
>> index 57f4dc6dc447..7afc21dc374e 100644
>> --- a/drivers/clk/samsung/Makefile
>> +++ b/drivers/clk/samsung/Makefile
>> @@ -5,7 +5,6 @@
>>  obj-$(CONFIG_COMMON_CLK)       += clk.o clk-pll.o clk-cpu.o
>>  obj-$(CONFIG_SOC_EXYNOS3250)   += clk-exynos3250.o
>>  obj-$(CONFIG_ARCH_EXYNOS4)     += clk-exynos4.o
>> -obj-$(CONFIG_SOC_EXYNOS4415)   += clk-exynos4415.o
>
> It is already removed. Which tree are you using?

BTW, please fix your own mail/name etc in from and Signed-off-by. One
of them is wrong and bounces.

Best regards,
Krzysztof
