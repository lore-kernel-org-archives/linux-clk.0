Return-Path: <SRS0=99XN=PW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900C0C43387
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jan 2019 17:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A18420659
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jan 2019 17:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfANRF7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jan 2019 12:05:59 -0500
Received: from gateway32.websitewelcome.com ([192.185.144.98]:45574 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726646AbfANRF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Jan 2019 12:05:59 -0500
X-Greylist: delayed 1272 seconds by postgrey-1.27 at vger.kernel.org; Mon, 14 Jan 2019 12:05:58 EST
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 468912D943
        for <linux-clk@vger.kernel.org>; Mon, 14 Jan 2019 10:44:46 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id j5Lxg7Y5mYTGMj5Lygrn0l; Mon, 14 Jan 2019 10:44:46 -0600
X-Authority-Reason: nr=8
Received: from [189.250.130.205] (port=46058 helo=[192.168.43.131])
        by gator4166.hostgator.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1gj5Lw-002oK3-CM; Mon, 14 Jan 2019 10:44:45 -0600
Subject: Re: [PATCH] clk: imx: imx7ulp: use struct_size() in kzalloc()
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20181224064025.GA9588@embeddedor.com>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <18969a9a-f9e1-e301-9f17-d1e3ab301dbd@embeddedor.com>
Date:   Mon, 14 Jan 2019 10:44:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181224064025.GA9588@embeddedor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.130.205
X-Source-L: No
X-Exim-ID: 1gj5Lw-002oK3-CM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [189.250.130.205]:46058
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Friendly ping:

Who can take this?

Thanks
--
Gustavo

On 12/24/18 12:40 AM, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct foo {
>      int stuff;
>      void *entry[];
> };
> 
> instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);
> 
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> 
> instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);
> 
> This issue was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>   drivers/clk/imx/clk-imx7ulp.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
> index 4e18f629f823..ce306631e844 100644
> --- a/drivers/clk/imx/clk-imx7ulp.c
> +++ b/drivers/clk/imx/clk-imx7ulp.c
> @@ -48,8 +48,8 @@ static void __init imx7ulp_clk_scg1_init(struct device_node *np)
>   	struct clk_hw **clks;
>   	void __iomem *base;
>   
> -	clk_data = kzalloc(sizeof(*clk_data) + sizeof(*clk_data->hws) *
> -			   IMX7ULP_CLK_SCG1_END, GFP_KERNEL);
> +	clk_data = kzalloc(struct_size(clk_data, hws, IMX7ULP_CLK_SCG1_END),
> +			   GFP_KERNEL);
>   	if (!clk_data)
>   		return;
>   
> @@ -136,8 +136,8 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
>   	struct clk_hw **clks;
>   	void __iomem *base;
>   
> -	clk_data = kzalloc(sizeof(*clk_data) + sizeof(*clk_data->hws) *
> -			   IMX7ULP_CLK_PCC2_END, GFP_KERNEL);
> +	clk_data = kzalloc(struct_size(clk_data, hws, IMX7ULP_CLK_PCC2_END),
> +			   GFP_KERNEL);
>   	if (!clk_data)
>   		return;
>   
> @@ -183,8 +183,8 @@ static void __init imx7ulp_clk_pcc3_init(struct device_node *np)
>   	struct clk_hw **clks;
>   	void __iomem *base;
>   
> -	clk_data = kzalloc(sizeof(*clk_data) + sizeof(*clk_data->hws) *
> -			   IMX7ULP_CLK_PCC3_END, GFP_KERNEL);
> +	clk_data = kzalloc(struct_size(clk_data, hws, IMX7ULP_CLK_PCC3_END),
> +			   GFP_KERNEL);
>   	if (!clk_data)
>   		return;
>   
> @@ -228,8 +228,8 @@ static void __init imx7ulp_clk_smc1_init(struct device_node *np)
>   	struct clk_hw **clks;
>   	void __iomem *base;
>   
> -	clk_data = kzalloc(sizeof(*clk_data) + sizeof(*clk_data->hws) *
> -			   IMX7ULP_CLK_SMC1_END, GFP_KERNEL);
> +	clk_data = kzalloc(struct_size(clk_data, hws, IMX7ULP_CLK_SMC1_END),
> +			   GFP_KERNEL);
>   	if (!clk_data)
>   		return;
>   
> 
