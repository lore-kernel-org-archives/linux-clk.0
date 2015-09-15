Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21585 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751694AbbIOGLh (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 15 Sep 2015 02:11:37 -0400
Subject: Re: [PATCH v2 5/12] clk: samsung: exynos7: Corrects CMU_CCORE clocks
 names
To: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
 <1441874677-24148-6-git-send-email-alim.akhtar@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
	mturquette@baylibre.com, amit.daniel@samsung.com,
	gautam.vivek@samsung.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <55F7B693.1030903@samsung.com>
Date: Tue, 15 Sep 2015 15:11:31 +0900
MIME-version: 1.0
In-reply-to: <1441874677-24148-6-git-send-email-alim.akhtar@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10.09.2015 17:44, Alim Akhtar wrote:
> This patch renames CMU_CCORE clocks names to match with user manual.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

