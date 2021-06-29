Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BD3C11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC39261DA6
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbhF2VZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 17:25:53 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59659 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235952AbhF2VZv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 17:25:51 -0400
Received: from [77.244.183.192] (port=63740 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lyLCU-0005gS-6J; Tue, 29 Jun 2021 23:23:22 +0200
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210629154740.3091884-1-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net>
Date:   Tue, 29 Jun 2021 23:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629154740.3091884-1-sean.anderson@seco.com>
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
> These properties allow configuring the SD/OE pin as described in the
> datasheet.

*Many* thanks for addressing this issue so quickly!

> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Rob Herring <robh@kernel.org>

I don't think Rob's ack should be present, he hasn't approved _this_
version of the patch.

> ---
> 
> Changes in v3:
> - Add idt,disable-shutdown and idt,output-enable-active-low to allow for
>   a default of not changing the SP/SH bits at all.
> 
> Changes in v2:
> - Rename idt,sd-active-high to idt,output-enable-active-high
> - Add idt,enable-shutdown
> 
>  .../bindings/clock/idt,versaclock5.yaml       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index 28675b0b80f1..51f0f78cc3f4 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -30,6 +30,22 @@ description: |
>      3 -- OUT3
>      4 -- OUT4
>  
> +  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
> +  properties control the SH (en_global_shutdown) and SP bits of the
> +  Primary Source and Shutdown Register, respectively. Their behavior is
> +  summarized by the following table:
> +
> +  SH SP Output when the SD/OE pin is Low/High
> +  == == =====================================
> +   0  0 Active/Inactive
> +   0  1 Inactive/Active
> +   1  0 Active/Shutdown
> +   1  1 Inactive/Shutdown
> +
> +  If no properties related to these bits are specified, then they will
> +  be left in their default state. This may be useful if the SH and SP
> +  bits are set to a default value using the OTP memory.

This paragraph looks more an implementation description than a hardware
description.

I suggest something like (possibly better rephrased):

It is recommended to specify the two properties that describe the
hardware. The lack of them leaves the value unspecified and thus opens
to the risk of future incompatibilities, depending on implementation
details.

> @@ -64,6 +80,34 @@ properties:
>      maximum: 22760
>      description: Optional load capacitor for XTAL1 and XTAL2
>  
> +  idt,enable-shutdown:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Enable the shutdown function when the SD/OE pin is high. This
> +      corresponds to setting the SH bit of the Primary Source and
> +      Shutdown Register.
> +
> +  idt,disable-shutdown:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Disable the shutdown function for the SD/OE pin. This corresponds
> +      to clearing the SH bit of the Primary Source and Shutdown
> +      Register.

Saying "Disable the shutdown function" leaves a hole, it is not telling
what gets enabled. I'd rephrase using positive logic:

  Enable the OE (output enable) function for the SD/OE pin. This...

But there are too many "enable" words in it now, it's confusing, so why not:

  Choose the OE (output enable) function for the SD/OE pin. This...

And change correspondingly the idt,enable-shutdown description:
s/^Enable/Choose/.

Also it would be nice to declare in DT that the two flags are mutually
exclusive (same for idt,output-enable-active-*).

-- 
Luca
