Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E74AC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 14:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 437686142D
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 14:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhGBOOt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 10:14:49 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:54476 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232938AbhGBOOt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 10:14:49 -0400
Received: from [151.57.67.62] (port=43384 helo=[192.168.1.114])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lzJtw-0007br-9N; Fri, 02 Jul 2021 16:12:16 +0200
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
References: <20210701182012.3421679-1-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <91e7eb17-48b7-ca81-902d-aec48b8b7a67@lucaceresoli.net>
Date:   Fri, 2 Jul 2021 16:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701182012.3421679-1-sean.anderson@seco.com>
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

On 01/07/21 20:20, Sean Anderson wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v4:
> - Specify that bindings should specify these properties, but don't make
>   any guarantees about the driver's behavior when they are not present.
> - Clarify description of idt,(en|dis)able-shutdown properties.
> - Make opposing properties mutually exclusive.
> - Add these properties to the example.
> 
> Changes in v3:
> - Add idt,disable-shutdown and idt,output-enable-active-low to allow for
>   a default of not changing the SP/SH bits at all.
> 
> Changes in v2:
> - Rename idt,sd-active-high to idt,output-enable-active-high
> - Add idt,enable-shutdown
> 
>  .../bindings/clock/idt,versaclock5.yaml       | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index 28675b0b80f1..2631a175612b 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -30,6 +30,21 @@ description: |
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

I just got an update from Renesas support, which confirms our table as
far as possible:

> I find that SH will only work when the Polarity bit is set to Active Low (SP=0).  When I program SP=1 together with SH=1, the outputs are always off. It simply won’t work.  So the Shutdown function can only be used with Active Low polarity for the SD/OE pin.  There is a pull-down resistor on the chip so when the pin is left open, outputs will be enabled with Active Low polarity.
>  
> [...] What is a more accurate description is that you can only use the Shutdown function (SH=1) together with the Active Low polarity (SP=0) setting.  The combination of SH=1 and SP=1 is an ‘illegal’ combination.
>  
> We actually find that very few customers use the Shutdown function. It is only partly useful because it turns off more circuits than the Output Enable function but there is still significant power consumption in Shutdown. The general expectation of a Shutdown function is that the power consumption will go down to a few microamperes of leakage current when in Shutdown but this device will not do that.

The combination SH=1 and SP=1 is not well specified, so I can't confirm
whether it should be Inactive/Shutdown or Shutdown/Shutdown or whatever.
Also I would not define the SH=1 and SP=1 combination as "illegal" but
rather as "useless".

Definitely (and obviously) the outputs are never driven when SH=1 and
SP=1. So I think we can stick to your table and I think this patch is
fine, more details are not needed in the DT bindings IMO. The only open
point now is the remark by Geert about the 'if: true' construct.

-- 
Luca

