Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E007AECAAD5
	for <linux-clk@archiver.kernel.org>; Mon,  5 Sep 2022 07:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbiIEHyT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Sep 2022 03:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbiIEHyR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 03:54:17 -0400
X-Greylist: delayed 1198 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Sep 2022 00:54:14 PDT
Received: from 6.mo550.mail-out.ovh.net (6.mo550.mail-out.ovh.net [46.105.43.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A258443E78
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 00:54:14 -0700 (PDT)
Received: from player778.ha.ovh.net (unknown [10.109.156.62])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id E4ED723BEB
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 07:15:36 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player778.ha.ovh.net (Postfix) with ESMTPSA id 8380C2E205F4C;
        Mon,  5 Sep 2022 07:15:28 +0000 (UTC)
MIME-Version: 1.0
Date:   Mon, 05 Sep 2022 09:15:28 +0200
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
In-Reply-To: <2cd712a5ae4fc0bf93e5b16ea640f1dc@milecki.pl>
References: <20220803025836.107886-1-f.fainelli@gmail.com>
 <2cd712a5ae4fc0bf93e5b16ea640f1dc@milecki.pl>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d2ad5cda0e9786e43d5cd235e5dcec59@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11680085637051165659
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelhedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgfefuefgleeffefhvefgueeffeeftdeljeevkefhudffheffheegvedukeejlefhnecuffhomhgrihhnpehsphhinhhitghsrdhnvghtnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeejkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedt
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022-09-04 17:00, Rafał Miłecki wrote:
> On 2022-08-03 04:58, Florian Fainelli wrote:
>> After commit 31fd9b79dc58 ("ARM: dts: BCM5301X: update CRU block
>> description") a warning from clk-iproc-pll.c was generated due to a
>> duplicate PLL name as well as the console stopped working. Upon closer
>> inspection it became clear that iproc_pll_clk_setup() used the Device
>> Tree node unit name as an unique identifier as well as a parent name 
>> to
>> parent all clocks under the PLL.
>> 
>> BCM5301X was the first platform on which that got noticed because of 
>> the
>> DT node unit name renaming but the same assumptions hold true for any
>> user of the iproc_pll_clk_setup() function.
>> 
>> The first 'clock-output-names' property is always guaranteed to be
>> unique as well as providing the actual desired PLL clock name, so we
>> utilize that to register the PLL and as a parent name of all children
>> clock.
>> 
>> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Acked-by: Rafał Miłecki <rafal@milecki.pl>
> 
> 
> Thanks for looking into this!
> 
> In the past I debugged this too and even developed a simple fix:
> clk & clock-controller@ DT nodes: __clk_core_init: clk
> clock-controller already initialized
> https://www.spinics.net/lists/linux-clk/msg63855.html
> 
> For some reason my old fix didn't work with usbclk clock.

I compared your changes with my old attempt and found the missing bit. I
forgot about updating parent_name.

FWIW something like below would work too.

Thanks again for taking care of this old regression.


diff --git a/drivers/clk/bcm/clk-iproc-pll.c 
b/drivers/clk/bcm/clk-iproc-pll.c
index 33da30f99..af9ca32b8 100644
--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -783,7 +783,7 @@ void iproc_pll_clk_setup(struct device_node *node,
  	iclk = &iclk_array[0];
  	iclk->pll = pll;

-	init.name = node->name;
+	init.name = node->full_name;
  	init.ops = &iproc_pll_ops;
  	init.flags = 0;
  	parent_name = of_clk_get_parent_name(node, 0);
@@ -809,7 +809,7 @@ void iproc_pll_clk_setup(struct device_node *node,
  		const char *clk_name;

  		memset(&init, 0, sizeof(init));
-		parent_name = node->name;
+		parent_name = node->full_name;

  		ret = of_property_read_string_index(node, "clock-output-names",
  						    i, &clk_name);
