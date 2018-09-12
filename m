Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37024 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbeIMCI0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Sep 2018 22:08:26 -0400
Subject: Re: [PATCH] clk: samsung: exynos5433: Keep sclk_uart clocks enabled
 in suspend
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20180912131657eucas1p2eecc0e4a01ed9ddbf4417c17eba0fee0@eucas1p2.samsung.com>
 <20180912131641.21688-1-m.szyprowski@samsung.com>
From: Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
Message-ID: <43460289-8685-9377-5643-6255c2c7c8e4@gmail.com>
Date: Wed, 12 Sep 2018 23:02:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180912131641.21688-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 09/12/2018 03:16 PM, Marek Szyprowski wrote:
> All sclk_uart clocks in TOP CMU have to be kept enabled for suspend/resume
> cycle, otherwise TM2(e) boards hangs before entering the suspend mode.
> 
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>

Patch applied, thanks.
