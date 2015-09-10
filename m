Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25026 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843AbbIJEF4 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 10 Sep 2015 00:05:56 -0400
Subject: Re: [PATCH 10/11] clk: samsung: exynos7: Add missing fixed_clks to
 cmu_info
To: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-11-git-send-email-alim.akhtar@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
	mturquette@baylibre.com, amit.daniel@samsung.com,
	gautam.vivek@samsung.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <55F101A2.3070201@samsung.com>
Date: Thu, 10 Sep 2015 13:05:54 +0900
MIME-version: 1.0
In-reply-to: <1441366637-28001-11-git-send-email-alim.akhtar@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04.09.2015 20:37, Alim Akhtar wrote:
> FSYS0 fixed clocks are not added to fsys0_cmu_info, this make
> some of the usb clocks as orphan. This fixes the same.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |    2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


