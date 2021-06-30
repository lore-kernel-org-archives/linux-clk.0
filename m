Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50C7C11F65
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 07:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BA3461D0F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 07:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhF3IAo convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 04:00:44 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40128 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232788AbhF3IAo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 04:00:44 -0400
Received: from [77.244.183.192] (port=64012 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lyV6s-0006c2-QX; Wed, 30 Jun 2021 09:58:14 +0200
Subject: Re: [PATCH v3 2/2] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <20210629154740.3091884-2-sean.anderson@seco.com>
 <1e720005-286a-c02c-88e8-3850dce8cae9@lucaceresoli.net>
 <f82ff572-4b04-6c1c-00fe-0035a53d49fd@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <0798ba03-c20d-35e2-829d-ff5eb34b05bf@lucaceresoli.net>
Date:   Wed, 30 Jun 2021 09:58:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f82ff572-4b04-6c1c-00fe-0035a53d49fd@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
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

Hi,

On 29/06/21 23:37, Sean Anderson wrote:
[...]
>>> @@ -914,6 +915,26 @@ static int vc5_probe(struct i2c_client *client,
> const struct i2c_device_id *id)
>>>          return PTR_ERR(vc5->regmap);
>>>      }
>>>
>>> +    oe_high = of_property_read_bool(client->dev.of_node,
>>> +                    "idt,output-enable-active-high");
>>> +    oe_low = of_property_read_bool(client->dev.of_node,
>>> +                    "idt,output-enable-active-low");
>>> +    sh_enable = of_property_read_bool(client->dev.of_node,
>>> +                      "idt,enable-shutdown");
>>> +    sh_disable = of_property_read_bool(client->dev.of_node,
>>> +                       "idt,disable-shutdown");
>>> +    if ((oe_high && oe_low) || (sh_enable && sh_disable)) {
>>> +        dev_err(&client->dev, "conflicting properties for SD/OE
> pin\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> Use dev_err_probe() to simplify code.
> 
> The existing errors are all done this way. I can add another patch
> converting them to dev_err_probe.

Not required but it would be nice, thanks.

-- 
Luca

