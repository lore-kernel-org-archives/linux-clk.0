Return-Path: <cw00.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Message-id: <58808789.2090001@samsung.com>
Date: Thu, 19 Jan 2017 18:31:53 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Valentin Rothberg <valentinrothberg@gmail.com>, krzk@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@baylibre.com,
 sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Valentin Rothberg <valetinrothberg@gmail.com>
Subject: Re: [PATCH] ARM: Exynos4415: remove dead build rule
In-reply-to: <5880836E.80006@samsung.com>
References: 
 <CGME20170119091246epcas2p3b647c978e26c99baaa4cab3d757fd59d@epcas2p3.samsung.com>
 <20170119091153.8439-1-valentinrothberg@gmail.com> <5880836E.80006@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Dear all,

On 2017년 01월 19일 18:14, Chanwoo Choi wrote:
> Hi,
> 
> On 2017년 01월 19일 18:11, Valentin Rothberg wrote:
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

Please ignore this reply. Krzysztof's patch[1] already
removed the entry of clk-exynos4415.c.
[1] https://www.spinics.net/lists/arm-kernel/msg554369.html

-- 
Best Regards,
Chanwoo Choi
S/W R&D Center
Samsung Electronics
