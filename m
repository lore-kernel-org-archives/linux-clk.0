Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21288 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549AbbIOGDZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 15 Sep 2015 02:03:25 -0400
Subject: Re: [PATCH v2 01/12] clk: samsung: exynos7: Change the CMU_TOPC block
 clock names
To: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
 <1441874677-24148-2-git-send-email-alim.akhtar@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
	mturquette@baylibre.com, amit.daniel@samsung.com,
	gautam.vivek@samsung.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <55F7B4A1.2020206@samsung.com>
Date: Tue, 15 Sep 2015 15:03:13 +0900
MIME-version: 1.0
In-reply-to: <1441874677-24148-2-git-send-email-alim.akhtar@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10.09.2015 17:44, Alim Akhtar wrote:
> Corrects the CMU_TOPC block clock names as per user manual.
> This does not change any functionalities.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |   70 ++++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 33 deletions(-)
> 

Looks good now:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

