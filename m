Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3940C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jan 2021 14:39:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65204207B1
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jan 2021 14:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhA0Oje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Jan 2021 09:39:34 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:56245 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232684AbhA0OhU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2021 09:37:20 -0500
Received: from [77.244.183.192] (port=64750 helo=[192.168.178.24])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1l4lvk-00HSux-1o; Wed, 27 Jan 2021 15:36:24 +0100
Subject: Re: [PATCH v3] dt-bindings: clk: versaclock5: Miscellaneous fixes and
 improvements:
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210126163955.1933893-1-geert+renesas@glider.be>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <0ee344aa-8d19-1817-ca13-41a5fdb60867@lucaceresoli.net>
Date:   Wed, 27 Jan 2021 15:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126163955.1933893-1-geert+renesas@glider.be>
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

Hi Geert,

On 26/01/21 17:39, Geert Uytterhoeven wrote:
>   - Remove unneeded reference for "idt,slew-percent", as vendor specific
>     properties having a standard unit suffix don't need a type,
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
> 
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage"
> https://lore.kernel.org/r/20210126162756.1932692-1-geert+renesas@glider.be

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
