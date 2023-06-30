Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1DAEB64DA
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 21:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbjF3VvI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 17:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjF3VvG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 17:51:06 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Jun 2023 14:51:04 PDT
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E16702D60
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 14:51:04 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id FLtpqjTftwzPwFLtpqurzA; Fri, 30 Jun 2023 23:43:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688161413;
        bh=AIucvni9X/ZbEloP+tU3J5b8QfRRMxTW27SNEEcKab8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jb1S7dQ0KQp/kcSXL2IY7HuSg/W5x6NcXA3+rk4QiLIGyxBfHZDWWF20bFuPcstgR
         xb8T3dj+/w4A9seuio9yXc/YXZALFWbCdYYyeSdj36ah7m9LUYOPrO/ndKNccYjdgP
         onACMsHuYfMw0NXmHYzWDgzBdlNO3ZbxmaIQ96F07qHtxeB9igQQIK3MR1xkxyS1aD
         J198Jyal7LwIYrKlXk77vGnNO6FsT4kvCmq4eDwz2uMKbKb3xbJhto2ELsM92qYwg2
         OPNVlx2Ud2YHUk3z9CalxUEbLfxDmjfYxLUw3LSuLmow3BIj3RvV+36a0vpCetOUzV
         mRUtq/mguCa0A==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Jun 2023 23:43:33 +0200
X-ME-IP: 86.243.2.178
Message-ID: <09e96a5a-2e02-e832-8fdd-48e9d5e5c3a7@wanadoo.fr>
Date:   Fri, 30 Jun 2023 23:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/4] clk: mvebu: Iterate over possible CPUs instead of
 DT CPU nodes
Content-Language: fr
To:     Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Walter Harms <wharms@bfs.de>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <20230327-mvebu-clk-fixes-v2-0-8333729ee45d@kernel.org>
 <20230327-mvebu-clk-fixes-v2-3-8333729ee45d@kernel.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230327-mvebu-clk-fixes-v2-3-8333729ee45d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le 09/06/2023 à 20:13, Rob Herring a écrit :
> Rework iterating over DT CPU nodes to iterate over possible CPUs
> instead. There's no need to walk the DT CPU nodes again. Possible CPUs
> is equal to the number of CPUs defined in the DT. Using the "reg" value
> for an array index is fragile as it assumes "reg" is 0-N which often is
> not the case.

Hi,

just for the records, this also fixes 2 bugs that were reported as patch 
1 and 2 at [1].

Nice :)


Part of patch 1 could still have some interest in order to remove the 
hard-coded 5 in the kzalloc().
Patch 3 and 4 are mostly useless.

Feel free to check/apply them if it makes sense to you.

Personaly, I won't bother resending them, unless explicitly requested.


CJ

[1]: 
https://lore.kernel.org/all/cover.1619157996.git.christophe.jaillet@wanadoo.fr/

> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/clk/mvebu/clk-cpu.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
> index c2af3395cf13..db2b38c21304 100644
> --- a/drivers/clk/mvebu/clk-cpu.c
> +++ b/drivers/clk/mvebu/clk-cpu.c
> @@ -168,8 +168,8 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>   	struct cpu_clk *cpuclk;
>   	void __iomem *clock_complex_base = of_iomap(node, 0);
>   	void __iomem *pmu_dfs_base = of_iomap(node, 1);
> -	int ncpus = 0;
> -	struct device_node *dn;
> +	int ncpus = num_possible_cpus();
> +	int cpu;
>   
>   	if (clock_complex_base == NULL) {
>   		pr_err("%s: clock-complex base register not set\n",
> @@ -181,9 +181,6 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>   		pr_warn("%s: pmu-dfs base register not set, dynamic frequency scaling not available\n",
>   			__func__);
>   
> -	for_each_of_cpu_node(dn)
> -		ncpus++;
> -
>   	cpuclk = kcalloc(ncpus, sizeof(*cpuclk), GFP_KERNEL);
>   	if (WARN_ON(!cpuclk))
>   		goto cpuclk_out;
> @@ -192,19 +189,14 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>   	if (WARN_ON(!clks))
>   		goto clks_out;
>   
> -	for_each_of_cpu_node(dn) {
> +	for_each_possible_cpu(cpu) {
>   		struct clk_init_data init;
>   		struct clk *clk;
>   		char *clk_name = kzalloc(5, GFP_KERNEL);
> -		int cpu, err;
>   
>   		if (WARN_ON(!clk_name))
>   			goto bail_out;
>   
> -		err = of_property_read_u32(dn, "reg", &cpu);
> -		if (WARN_ON(err))
> -			goto bail_out;
> -
>   		sprintf(clk_name, "cpu%d", cpu);
>   
>   		cpuclk[cpu].parent_name = of_clk_get_parent_name(node, 0);
> 

