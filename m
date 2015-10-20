Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:36853 "EHLO
	mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752118AbbJTMTB (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 08:19:01 -0400
MIME-Version: 1.0
In-Reply-To: <1445332961-25419-3-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
	<1445332961-25419-3-git-send-email-a.hajda@samsung.com>
Date: Tue, 20 Oct 2015 21:19:00 +0900
Message-ID: <CAJKOXPfNQ51nDpemiirs-jyQCo5TeCK0H7S-m1x-Wdv5Hs8_6A@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk/samsung: exynos5433: add pclk_decon clock
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2015-10-20 18:22 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> This undocumented gate clock is used by DECON IP.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 2 ++
>  include/dt-bindings/clock/exynos5433.h | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>

Indeed looks undocumented... but vendor tree has it so it makes sense to me:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
