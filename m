Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36682 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbeIGA0c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 20:26:32 -0400
Subject: Re: [PATCH v2 00/10] Cleanup suspend/resume code in Samsung clock
 drivers
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20180906155555eucas1p2cab3dde337bf2f9f7a7d8b4dc17c371d@eucas1p2.samsung.com>
 <20180906155532.4085-1-m.szyprowski@samsung.com>
From: Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
Message-ID: <9e9d9847-4ea6-595c-fc87-57fcdb4f4239@gmail.com>
Date: Thu, 6 Sep 2018 21:49:29 +0200
MIME-Version: 1.0
In-Reply-To: <20180906155532.4085-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/06/2018 05:55 PM, Marek Szyprowski wrote:
> Patch summary:
> 
> Marek Szyprowski (10):
>    clk: samsung: Remove excessive include
>    clk: samsung: s3c2410: Use generic helper for handling suspend/resume
>    clk: samsung: s3c2412: Use generic helper for handling suspend/resume
>    clk: samsung: s3c2443: Use generic helper for handling suspend/resume
>    clk: samsung: s3c64xx: Use generic helper for handling suspend/resume
>    clk: samsung: s5pv210: Use generic helper for handling suspend/resume
>    clk: samsung: exynos5250: Use generic helper for handling
>      suspend/resume
>    clk: samsung: Add support for setting registers state before suspend
>    clk: samsung: exynos4: Use generic helper for handling suspend/resume
>    clk: samsung: exynos5420: Use generic helper for handling
>      suspend/resume

Whole series applied, thanks.
