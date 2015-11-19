Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39151 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892AbbKSLH1 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2015 06:07:27 -0500
Message-id: <564DAD0A.3000007@samsung.com>
Date: Thu, 19 Nov 2015 12:05:46 +0100
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Kevin Hilman <khilman@linaro.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: Don't build ARMv8 clock drivers on ARMv7
References: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
 <1447637775-9887-2-git-send-email-k.kozlowski@samsung.com>
 <CA+Ln22HAGwfPDqXBQatBraLd=DyGYF2WyV4wJ9RvGOc58puymQ@mail.gmail.com>
 <564D5552.4070806@samsung.com>
 <CA+Ln22GTPFk6KpWZPDzLRBqO8B+iwwesQEzBwYikXnf0gr3Csg@mail.gmail.com>
In-reply-to: <CA+Ln22GTPFk6KpWZPDzLRBqO8B+iwwesQEzBwYikXnf0gr3Csg@mail.gmail.com>
Content-type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 19/11/15 10:16, Tomasz Figa wrote:
> 2015-11-19 13:51 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>> > On 19.11.2015 13:18, Tomasz Figa wrote:
>>> >> However, I don't think we can disable compilation of particular
>>> >> 64-bit SoCs, so maybe there isn't much sense in splitting their 
>>> >> clock drivers into separate symbols?
>> >
>> > To me it does not really matter. Indeed as you said one cannot 
>> > disable building of one particular Exynos SoCs.
>> >
>> > However we could still want not build some parts of such SoCs (like
>> > clock, pinctrl etc). I don't see much benefit for such case except
>> > when someone would like to drastically reduce the size of kernel 
>> > image (for whatever reasons he has.).
>
> Can we really build a kernel that support selected Exynos SoC without
> its clock driver? Actually I don't think we even allow deselecting
> clock drivers currently, because they are not visible in menuconfig.
> Unless there is a clear goal to separate ARCH level Kconfig symbol for
> particular ARM64-based Exynos SoCs, I don't think it makes any sense
> to keep the clock-related symbols separate.
> 
>> >
>> > On the other hand having separate symbols causes duplication and
>> > obfuscates a little the Kconfig/Makefile. I like keeping things 
>> > simple so one symbol for all ARM64 Exynos clocks sounds good.
>> >
>> > Sylwester preferred current approach. You and Pankaj seem to prefer
>> > one symbol-way.
>
> Hmm, I read Sylwester's post as a reply to your original message and
> not Pankaj's. Sylwester, could you clarify?

OK, let's just use a common clk Kconfig symbol for Exynos ARM64.

What I tried to say is that with addition of support for few more
of those SoCs the kernel image size can easily grow by 1MB order,
due to just clk drivers inclusion. Perhaps it's not a big issue
with current hardware configuration.
Maybe in long term we should think about splitting CMU drivers
into a built-in critical clocks part and the rest in loadable
modules.

-- 
Thanks,
Sylwester
