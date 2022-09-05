Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C50DECAAD5
	for <linux-clk@archiver.kernel.org>; Mon,  5 Sep 2022 07:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237001AbiIEHf3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Sep 2022 03:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236854AbiIEHfO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 03:35:14 -0400
X-Greylist: delayed 59674 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Sep 2022 00:34:57 PDT
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net [46.105.63.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E6193D3
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 00:34:57 -0700 (PDT)
Received: from player772.ha.ovh.net (unknown [10.110.171.96])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id B6BCA23810
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 07:16:39 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player772.ha.ovh.net (Postfix) with ESMTPSA id 3E8D92E399D8C;
        Mon,  5 Sep 2022 07:16:31 +0000 (UTC)
MIME-Version: 1.0
Date:   Mon, 05 Sep 2022 09:16:31 +0200
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
Message-ID: <b25e377dc1272f7bb45cbb9ea1a99887@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11697818560452471771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelhedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthejjhdttdervdenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepveeikeevgeetfeffheehheelgfekffdvvdetuedtkeejjefffefhteevudevieehnecuffhomhgrihhnpehophgvnhifrhhtrdhorhhgnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeejvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedt
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

One nitpick below.


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

You could probably get rid of that empty line above memset().


> -		parent_name = node->name;
> 
>  		ret = of_property_read_string_index(node, "clock-output-names",
>  						    i, &clk_name);
