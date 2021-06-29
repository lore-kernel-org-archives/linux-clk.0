Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07236C11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEF0961DA8
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbhF2VZ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 17:25:56 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55074 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235952AbhF2VZz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 17:25:55 -0400
Received: from [77.244.183.192] (port=63744 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lyLCZ-0005jC-2B; Tue, 29 Jun 2021 23:23:27 +0200
Subject: Re: [PATCH v3 2/2] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <20210629154740.3091884-2-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <1e720005-286a-c02c-88e8-3850dce8cae9@lucaceresoli.net>
Date:   Tue, 29 Jun 2021 23:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629154740.3091884-2-sean.anderson@seco.com>
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

On 29/06/21 17:47, Sean Anderson wrote:
> The SD/OE pin may be configured to enable output when high or low, and
> to shutdown the device when high. This behavior is controller by the SH
> and SP bits of the Primary Source and Shutdown Register (and to a lesser
> extent the OS and OE bits). By default, both bits are 0 (unless set by
> OTP memory), but they may need to be configured differently, depending
> on the external circuitry controlling the SD/OE pin.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v3:
> - Default to not changing SH or SP unless there is a property affecting
>   them.
> 
> Changes in v2:
> - Set SH as well as SP
> 
>  drivers/clk/clk-versaclock5.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 344cd6c61188..b5f6f5708c77 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -886,10 +886,11 @@ static const struct of_device_id clk_vc5_of_match[];
>  
>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
> +	bool oe_high, oe_low, sh_enable, sh_disable;
>  	struct vc5_driver_data *vc5;
>  	struct clk_init_data init;
>  	const char *parent_names[2];
> -	unsigned int n, idx = 0;
> +	unsigned int sp_mask, sh_mask, sp_val, sh_val, n, idx = 0;

Very minor nitpicking, but for readability I'd put the new variables on
a line on their own, perhaps close the the new 'bool' line, and not mix
too many unrelated variables in the same line.

> @@ -914,6 +915,26 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return PTR_ERR(vc5->regmap);
>  	}
>  
> +	oe_high = of_property_read_bool(client->dev.of_node,
> +					"idt,output-enable-active-high");
> +	oe_low = of_property_read_bool(client->dev.of_node,
> +					"idt,output-enable-active-low");
> +	sh_enable = of_property_read_bool(client->dev.of_node,
> +					  "idt,enable-shutdown");
> +	sh_disable = of_property_read_bool(client->dev.of_node,
> +					   "idt,disable-shutdown");
> +	if ((oe_high && oe_low) || (sh_enable && sh_disable)) {
> +		dev_err(&client->dev, "conflicting properties for SD/OE pin\n");
> +		return -EINVAL;
> +	}

Use dev_err_probe() to simplify code.

Overall LGTM.

-- 
Luca
