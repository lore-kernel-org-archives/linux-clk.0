Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:25189 "EHLO
	sender163-mail.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbbHQSvb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 17 Aug 2015 14:51:31 -0400
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH] clk: rockchip: add pclk_cpu to the list of rk3188 critical clocks
From: Michael Niewoehner <linux@mniewoehner.de>
In-Reply-To: <5275855.eah07vmf4I@phil>
Date: Mon, 17 Aug 2015 20:51:14 +0200
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org
Message-Id: <9DBF9CCE-196E-43FB-BA76-BFB4B5F47A22@mniewoehner.de>
References: <5400BEF8-5245-4F7B-845B-D326A7BC56B5@mniewoehner.de> <5275855.eah07vmf4I@phil>
To: Heiko Stuebner <heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,

I merged yours and mine :-)


pclk_cpu needs to keep running because it is needed for devices like
the act8865 regulator but with the recent gpio clock handling this is
not always the case anymore. So add it to the list of critical clocks.

Signed-off-by: Michael Niewoehner <linux@mniewoehner.de>
---
drivers/clk/rockchip/clk-rk3188.c | 1 +
1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index e4f9d47..1c93229 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -708,6 +708,7 @@ static const char *const rk3188_critical_clocks[] __initconst = {
	"aclk_cpu",
	"aclk_peri",
	"hclk_peri",
+	"pclk_cpu",
};

static void __init rk3188_common_clk_init(struct device_node *np)
-- 
2.5.0





Am 17.08.2015 um 20:01 schrieb Heiko Stuebner <heiko@sntech.de>:

> Hi,
> 
> Am Montag, 17. August 2015, 19:38:22 schrieb Michael Niewoehner:
>> gpio clock is getting disabled to save power but pclk_cpu is needed for
>> act8865 regulator
> 
> Please refine the commit message a bit :-) . Something along
> 
> pclk_cpu needs to keep running and with the recent gpio clock
> handling this is not always the case anymore. So add it to the list
> of critical clocks.
> 
> 
> and also please add "Linus Walleij <linus.walleij@linaro.org>" to the list of 
> recipients. As the gpio clock handling change does go through his tree, the 
> matching critical clock handling should also go through him.
> 
> 
> Heiko
> 
>> 
>> Signed-off-by: Michael Niewoehner <linux@mniewoehner.de>
>> ---
>> drivers/clk/rockchip/clk-rk3188.c | 1 +
>> 1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/clk/rockchip/clk-rk3188.c
>> b/drivers/clk/rockchip/clk-rk3188.c index e4f9d47..1c93229 100644
>> --- a/drivers/clk/rockchip/clk-rk3188.c
>> +++ b/drivers/clk/rockchip/clk-rk3188.c
>> @@ -708,6 +708,7 @@ static const char *const rk3188_critical_clocks[]
>> __initconst = { "aclk_cpu",
>> 	"aclk_peri",
>> 	"hclk_peri",
>> +	"pclk_cpu",
>> };
>> 
>> static void __init rk3188_common_clk_init(struct device_node *np)
> 


