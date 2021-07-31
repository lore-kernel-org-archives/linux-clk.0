Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52CFC4338F
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 14:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91EE460FE7
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 14:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhGaOex (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Jul 2021 10:34:53 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:52460 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232752AbhGaOew (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Jul 2021 10:34:52 -0400
Received: from [37.162.7.190] (port=62767 helo=[192.168.42.163])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1m9q4a-00BbNe-0s; Sat, 31 Jul 2021 16:34:44 +0200
Subject: Re: [PATCH v6 3/3] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210723231306.674310-1-sean.anderson@seco.com>
 <20210723231306.674310-3-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <87e03c94-f818-7b10-4ac2-11ab997d944c@lucaceresoli.net>
Date:   Sat, 31 Jul 2021 16:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723231306.674310-3-sean.anderson@seco.com>
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

On 24/07/21 01:13, Sean Anderson wrote:
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
> Changes in v6:
> - Use tri-state properties
> - Drop Reviewed-bys
> 
> Changes in v5:
> - Use if (...) mask |= ...; instead of mask = ... ? ... : 0;
> 
> Changes in v4:
> - Use dev_err_probe over dev_err
> - Put new variables on their own line
> 
> Changes in v3:
> - Default to not changing SH or SP unless there is a property affecting
>   them.
> 
> Changes in v2:
> - Set SH as well as SP
> 
>  drivers/clk/clk-versaclock5.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index bfbb51191c8d..5b986894bd3b 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
>  
>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
> +	unsigned int oe, sd, src_mask = 0, src_val = 0;
>  	struct vc5_driver_data *vc5;
>  	struct clk_init_data init;
>  	const char *parent_names[2];
> @@ -913,6 +914,29 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
>  				     "failed to allocate register map\n");
>  
> +	ret = of_property_read_u32(client->dev.of_node, "idt,shutdown", &sd);
> +	if (ret > 0) {
> +		src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
> +		if (sd)
> +			src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
> +	} else if (ret != -EINVAL) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "could not read idt,shutdown\n");

Minor nit: "could not read" sounds like "property not found", i.e. the
property is not present in DT, but if it's not present we do not enter
here (which is OK). For clarity I'd rather say "error reading idt,...".

> +	}
> +
> +	ret = of_property_read_u32(client->dev.of_node,
> +				   "idt,output-enable-active", &oe);
> +	if (ret > 0) {
> +		src_mask |= VC5_PRIM_SRC_SHDN_SP;
> +		if (oe)
> +			src_val |= VC5_PRIM_SRC_SHDN_SP;
> +	} else if (ret != -EINVAL) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "could not read idt,output-enable-active\n");

Ditto.

Otherwise LGTM.

-- 
Luca
