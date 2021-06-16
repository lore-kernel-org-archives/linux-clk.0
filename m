Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF42C49EA2
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 15:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 434376101A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 15:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhFPPoj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 11:44:39 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39916 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234906AbhFPPnN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 11:43:13 -0400
Received: from [77.244.183.192] (port=63570 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ltXf8-0003fF-TT; Wed, 16 Jun 2021 17:41:06 +0200
Subject: Re: [PATCH v2 2/2] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>
References: <20210614155437.3979771-1-sean.anderson@seco.com>
 <20210614155437.3979771-2-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <47b37414-6587-0792-201b-e255feeee9c9@lucaceresoli.net>
Date:   Wed, 16 Jun 2021 17:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614155437.3979771-2-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On 14/06/21 17:54, Sean Anderson wrote:
> The SD/OE pin may be configured to enable output when high or low, and
> to shutdown the device when high. This behavior is controller by the SH
> and SP bits of the Primary Source and Shutdown Register (and to a lesser
> extent the OS and OE bits). By default, both bits are 0, but they may
> need to be configured differently, depending on the external circuitry
> controlling the SD/OE pin.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

> @@ -914,6 +915,15 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return PTR_ERR(vc5->regmap);
>  	}
>  
> +	oe_polarity = of_property_read_bool(client->dev.of_node,
> +					    "idt,output-enable-active-high");
> +	sd_enable = of_property_read_bool(client->dev.of_node,
> +					  "idt,enable-shutdown");
> +	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
> +			   VC5_PRIM_SRC_SHDN_SP | VC5_PRIM_SRC_SHDN_EN_GBL_SHDN,
> +			   (oe_polarity ? VC5_PRIM_SRC_SHDN_SP : 0)
> +			   | (sd_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0));
> +

Did you test all combinations?

Thanks,
-- 
Luca
