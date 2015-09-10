Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24952 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbbIJEBZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 10 Sep 2015 00:01:25 -0400
Subject: Re: [PATCH 05/11] clk: samsung: exynos7: Corrects CMU_PERIC0 clocks
 names
To: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-6-git-send-email-alim.akhtar@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
	mturquette@baylibre.com, amit.daniel@samsung.com,
	gautam.vivek@samsung.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <55F1008C.5040005@samsung.com>
Date: Thu, 10 Sep 2015 13:01:16 +0900
MIME-version: 1.0
In-reply-to: <1441366637-28001-6-git-send-email-alim.akhtar@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04.09.2015 20:37, Alim Akhtar wrote:
> This patch rename CMU_PERIC0 clocks names to match with user manual.
> And also adds missing gate clock for aclk_peric0_66.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |   12 ++++++++----
>  include/dt-bindings/clock/exynos7-clk.h |    3 ++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

