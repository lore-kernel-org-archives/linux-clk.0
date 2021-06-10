Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B809C48BCD
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 09:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0628F61403
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 09:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFJJHj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 05:07:39 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55896 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229715AbhFJJHj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 05:07:39 -0400
Received: from [77.244.183.192] (port=63626 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lrGdB-0003wE-P8; Thu, 10 Jun 2021 11:05:41 +0200
Subject: Re: [PATCH 1/2] dt-bindings: clk: vc5: Add property for SD polarity
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210607154931.2491499-1-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <eafea6ac-fbfd-3f42-93fa-edb8cdced3ea@lucaceresoli.net>
Date:   Thu, 10 Jun 2021 11:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607154931.2491499-1-sean.anderson@seco.com>
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

Hi Sean,

On 07/06/21 17:49, Sean Anderson wrote:
> This property allows setting the SD/OE pin's polarity to active-high,
> instead of the default of active-low.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Thanks.

> +  idt,sd-active-high:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: SD/OE pin polarity is active-high

I think the name "sd" is misleading.

In the Renesas docs (which are very confusing on their own about this
topic) this bit is called "SP" -- *S*D/OE *P*olarity. But actually it
controls polarity of the SD/OE pin only if the pin is configured for
"OE" function:

> SP bit = “SD/OE pin Polarity Bit”: Set the polarity of the SD/OE
> pin where outputs enable or disable. Only works with OE, not with SD.
(VC6E register and programming guide [0])

As such I suggest you use either "sp" to keep the naming used in the
Renesas docs or "oe" as it actually controls OE polarity only. I do
prefer "sp" as it helps matching with the datasheets, but maybe adding a
little more detail in bindings docs to clarify, as in:

 idt,sp-active-high:
   $ref: /schemas/types.yaml#/definitions/flag
   description: SD/OE pin polarity is active-high
                (only works when SD/OE pin is configured as OE)

BTW is it only me finding the "Shutdown Function" of [0] completely
confusing? Also, Table 24 has contradictory lines and missing lines. I'm
sending a request to Renesas support to ask them to clarify it all.

[0]
https://www.renesas.com/eu/en/document/mau/versaclock-6e-family-register-descriptions-and-programming-guide

-- 
Luca

