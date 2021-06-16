Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41825C48BE5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 15:42:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A3E560FE3
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 15:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhFPPoi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 11:44:38 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:35858 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235179AbhFPPnN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 11:43:13 -0400
Received: from [77.244.183.192] (port=63566 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ltXf7-0003e5-Ad; Wed, 16 Jun 2021 17:41:05 +0200
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
References: <20210614155437.3979771-1-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e75abee4-3400-c984-29ca-34304c87bc3f@lucaceresoli.net>
Date:   Wed, 16 Jun 2021 17:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614155437.3979771-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: it-IT
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

On 14/06/21 17:54, Sean Anderson wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
-- 
Luca
