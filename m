Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8739CC4167B
	for <linux-clk@archiver.kernel.org>; Mon,  2 Jan 2023 06:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjABGsJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Jan 2023 01:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjABGsI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Jan 2023 01:48:08 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CD9113C
        for <linux-clk@vger.kernel.org>; Sun,  1 Jan 2023 22:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672642087; x=1704178087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sv/AgfXghztKK4vfj1fffmTCaPs0awcE88xjhBtD60Y=;
  b=RPp/eK+1gt8m05goinAIVsq4Yq7fq5u02wZ1EnU3KV/YlnTmv+Y9OO7v
   kz0IGy+a+GeqRw2GrfWXohfGOLrNwCL5A4PHoLKiIGC5EZxDq6OZlhYMl
   K1vJ/f9uRyyOkNhcGUzJed7ArcHFHUxlV6Rei/io6sjosEGRRwJNjvvS6
   clxO51zuzcDj7hrpFlpFo6ZJPdWTIbFzPsX1Zm1pb0tYnFBZA2a+tdqei
   47jsymWpuiK/0ZizUytb2gnNojPa0bzEdNDKC/lX44XV+qyKqRuK4GCSZ
   ug5qUTiIDwHNO2+do4kKvcfruaMOJt676qkrxPCJcAHH+WkriE3poPTYy
   g==;
X-IronPort-AV: E=Sophos;i="5.96,293,1665439200"; 
   d="scan'208";a="28194568"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jan 2023 07:48:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 02 Jan 2023 07:48:04 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 02 Jan 2023 07:48:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672642084; x=1704178084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sv/AgfXghztKK4vfj1fffmTCaPs0awcE88xjhBtD60Y=;
  b=g9AbTCZ0N8+qvxfB4gaHQtf+hgUDO+EDC4kHs2NmJjO+c9K9j4jC8mq7
   MHc5tXH3gh4yNLTIFt88lvUNiyaZF9kaS2e2dX+fiCLKkX1Y+GFtKfr0j
   etHzdbtFvkRNcJiMuJOVdd/YxrvCd7Ke7BKulizdvdmUYz+WFQy7GoVhW
   LErwSmEIb+LnY375arEdlV137KPOLVZ5A7tvb66PAGi9aejgfWdoFyw0f
   pLvPUPnYoLAvEgh8v5uRsZKemN3b/oiH+FfbrsVptQlgL2XTkv4VNV3TJ
   AvOAVsM3x4JuNKtBejFQhwOkVV4jGvAEofO5vgAXJPR/DzlABlI8cuzsY
   g==;
X-IronPort-AV: E=Sophos;i="5.96,293,1665439200"; 
   d="scan'208";a="28194567"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jan 2023 07:48:04 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        by vtuxmail01.tq-net.de (Postfix) with ESMTP id 4C64F280056;
        Mon,  2 Jan 2023 07:48:04 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: rs9: Drop unused pin_xin field
Date:   Mon, 02 Jan 2023 07:48:04 +0100
Message-ID: <12136118.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221216210922.592926-1-marex@denx.de>
References: <20221216210922.592926-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Marek,

thanks for the cleanup.

Am Freitag, 16. Dezember 2022, 22:09:22 CET schrieb Marek Vasut:
> The pin_xin field in struct rs9_driver_data is unused, drop it.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk-renesas-pcie.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index e6247141d0c05..f91f30560820d 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -60,7 +60,6 @@ struct rs9_driver_data {
>  	struct i2c_client	*client;
>  	struct regmap		*regmap;
>  	const struct rs9_chip_info *chip_info;
> -	struct clk		*pin_xin;
>  	struct clk_hw		*clk_dif[2];
>  	u8			pll_amplitude;
>  	u8			pll_ssc;

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>


