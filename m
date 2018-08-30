Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20796 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725758AbeH3FR4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 01:17:56 -0400
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5B8745D5.7010707@samsung.com>
Date: Thu, 30 Aug 2018 10:18:13 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 04/10] clk: samsung: s3c2443: Use generic helper for
 handling suspend/resume
In-reply-to: <20180829155046.29359-5-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155100eucas1p1ba8149066e026fc15f82091968b78a08@eucas1p1.samsung.com>
        <20180829155046.29359-5-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2018년 08월 30일 00:50, Marek Szyprowski wrote:
> Replace common suspend/resume handling code by generic helper.
> No functional change.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s3c2443.c | 43 ++-----------------------------
>  1 file changed, 2 insertions(+), 41 deletions(-)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

(snip)

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
