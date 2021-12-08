Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83503C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 08:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhLHIll (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 03:41:41 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:32897 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236193AbhLHIlk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 03:41:40 -0500
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Dec 2021 03:41:40 EST
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4J89P40jSzz1r877;
        Wed,  8 Dec 2021 09:31:20 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4J89P36P6wz1qqkC;
        Wed,  8 Dec 2021 09:31:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id BADRdZDQlkw7; Wed,  8 Dec 2021 09:31:19 +0100 (CET)
X-Auth-Info: tna6jNS7OLYeuupep279fwxSQb4u5tIM75GH2/x8Ki5BnDbR5rcv9nJuNY1bNTwr
Received: from igel.home (ppp-46-244-185-244.dynamic.mnet-online.de [46.244.185.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed,  8 Dec 2021 09:31:19 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 8588A2C3839; Wed,  8 Dec 2021 09:31:18 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/1] clk: sifive: Fix W=1 kernel build warning
References: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
X-Yow:  Three attractive BANK ROBBERS are discussing RELIGIOUS DIFFERENCES and
 MAKE-UP TECHNIQUE with them!!
Date:   Wed, 08 Dec 2021 09:31:18 +0100
In-Reply-To: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
        (Zong Li's message of "Wed, 8 Dec 2021 10:04:22 +0800")
Message-ID: <87pmq7qyzt.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Dez 08 2021, Zong Li wrote:

> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> index c220677dc010..c8271efa7bdc 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -13,4 +13,9 @@
>  
>  extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
>  
> +static const struct prci_clk_desc prci_clk_fu540 = {
> +	.clks = __prci_init_clocks_fu540,
> +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> +};
> +

A header should only declare things, not define them.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
