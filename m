Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC1FC6FA82
	for <linux-clk@archiver.kernel.org>; Sun,  4 Sep 2022 17:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiIDRZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Sep 2022 13:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiIDRZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Sep 2022 13:25:52 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 04 Sep 2022 10:25:50 PDT
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net [46.105.79.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD912F00C
        for <linux-clk@vger.kernel.org>; Sun,  4 Sep 2022 10:25:49 -0700 (PDT)
Received: from player746.ha.ovh.net (unknown [10.111.172.14])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 696A0229D5
        for <linux-clk@vger.kernel.org>; Sun,  4 Sep 2022 15:00:21 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player746.ha.ovh.net (Postfix) with ESMTPSA id F0B2520CEF2C6;
        Sun,  4 Sep 2022 15:00:10 +0000 (UTC)
MIME-Version: 1.0
Date:   Sun, 04 Sep 2022 17:00:10 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: iproc: Do not rely on node name for correct PLL
 setup
In-Reply-To: <20220803025836.107886-1-f.fainelli@gmail.com>
References: <20220803025836.107886-1-f.fainelli@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2cd712a5ae4fc0bf93e5b16ea640f1dc@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13656321445241793499
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelgedgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeegvdegvdehjeevffejjeegjeffveejtedvheekhfehheeuudejueetjeehteelffenucffohhmrghinhepshhpihhnihgtshdrnhgvthdpohhpvghnfihrthdrohhrghenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhe
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022-08-03 04:58, Florian Fainelli wrote:
> After commit 31fd9b79dc58 ("ARM: dts: BCM5301X: update CRU block
> description") a warning from clk-iproc-pll.c was generated due to a
> duplicate PLL name as well as the console stopped working. Upon closer
> inspection it became clear that iproc_pll_clk_setup() used the Device
> Tree node unit name as an unique identifier as well as a parent name to
> parent all clocks under the PLL.
> 
> BCM5301X was the first platform on which that got noticed because of 
> the
> DT node unit name renaming but the same assumptions hold true for any
> user of the iproc_pll_clk_setup() function.
> 
> The first 'clock-output-names' property is always guaranteed to be
> unique as well as providing the actual desired PLL clock name, so we
> utilize that to register the PLL and as a parent name of all children
> clock.
> 
> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Rafał Miłecki <rafal@milecki.pl>


Thanks for looking into this!

In the past I debugged this too and even developed a simple fix:
clk & clock-controller@ DT nodes: __clk_core_init: clk clock-controller 
already initialized
https://www.spinics.net/lists/linux-clk/msg63855.html

For some reason my old fix didn't work with usbclk clock.

I just tested your patch agains kernel 5.15 and it works!

root@OpenWrt:/# uname -r
5.15.64
root@OpenWrt:/# cat /sys/kernel/debug/clk/usbclk/clk_rate
40000000



> ---
> Rafal,
> 
> This is a replacement for this patch that you checked into OpenWrt:
> 
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/bcm53xx/patches-5.15/320-ARM-dts-BCM5301X-Switch-back-to-old-clock-nodes-name.patch;h=cee37732ab9e2ac8bc2a399a53d01b9ead756cb8;hb=HEAD
> 
> 
>  drivers/clk/bcm/clk-iproc-pll.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-iproc-pll.c 
> b/drivers/clk/bcm/clk-iproc-pll.c
> index 33da30f99c79..92be88eb1d11 100644
> --- a/drivers/clk/bcm/clk-iproc-pll.c
> +++ b/drivers/clk/bcm/clk-iproc-pll.c
> @@ -736,6 +736,7 @@ void iproc_pll_clk_setup(struct device_node *node,
>  	const char *parent_name;
>  	struct iproc_clk *iclk_array;
>  	struct clk_hw_onecell_data *clk_data;
> +	const char *clk_name;
> 
>  	if (WARN_ON(!pll_ctrl) || WARN_ON(!clk_ctrl))
>  		return;
> @@ -783,7 +784,12 @@ void iproc_pll_clk_setup(struct device_node *node,
>  	iclk = &iclk_array[0];
>  	iclk->pll = pll;
> 
> -	init.name = node->name;
> +	ret = of_property_read_string_index(node, "clock-output-names",
> +					    0, &clk_name);
> +	if (WARN_ON(ret))
> +		goto err_pll_register;
> +
> +	init.name = clk_name;
>  	init.ops = &iproc_pll_ops;
>  	init.flags = 0;
>  	parent_name = of_clk_get_parent_name(node, 0);
> @@ -803,13 +809,12 @@ void iproc_pll_clk_setup(struct device_node 
> *node,
>  		goto err_pll_register;
> 
>  	clk_data->hws[0] = &iclk->hw;
> +	parent_name = clk_name;
> 
>  	/* now initialize and register all leaf clocks */
>  	for (i = 1; i < num_clks; i++) {
> -		const char *clk_name;
> 
>  		memset(&init, 0, sizeof(init));
> -		parent_name = node->name;
> 
>  		ret = of_property_read_string_index(node, "clock-output-names",
>  						    i, &clk_name);
