Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25069 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbbIJEIy (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 10 Sep 2015 00:08:54 -0400
Subject: Re: [PATCH 11/11] clk: samsung: exynos7: Add required clock tree for
 UFS
To: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-12-git-send-email-alim.akhtar@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
	mturquette@baylibre.com, amit.daniel@samsung.com,
	gautam.vivek@samsung.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <55F10253.6000308@samsung.com>
Date: Thu, 10 Sep 2015 13:08:51 +0900
MIME-version: 1.0
In-reply-to: <1441366637-28001-12-git-send-email-alim.akhtar@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04.09.2015 20:37, Alim Akhtar wrote:
> Adding required mux/div/gate clocks for UFS controller
> present on Exynos7.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |  116 +++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos7-clk.h |   24 ++++++-
>  2 files changed, 138 insertions(+), 2 deletions(-)
> 

My previous comments are fixed, rest looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


