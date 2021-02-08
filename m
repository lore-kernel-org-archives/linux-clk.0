Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EEBC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 12:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E296E64E87
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 12:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbhBHMDv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 07:03:51 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40111 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233465AbhBHMBp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Feb 2021 07:01:45 -0500
Received: from [185.56.157.72] (port=42748 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1l95Di-00AE2N-P5; Mon, 08 Feb 2021 13:00:46 +0100
Subject: Re: [PATCH V3 2/2] clk: vc5: Add support for optional load
 capacitance
To:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org
Cc:     aford@beaconembedded.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210207185140.3653350-1-aford173@gmail.com>
 <20210207185140.3653350-2-aford173@gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <9fabc42a-cd04-7971-d6c2-b0ea0b70f655@lucaceresoli.net>
Date:   Mon, 8 Feb 2021 13:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210207185140.3653350-2-aford173@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Adam,
On 07/02/21 19:51, Adam Ford wrote:
> There are two registers which can set the load capacitance for
> XTAL1 and XTAL2. These are optional registers when using an
> external crystal.  Parse the device tree and set the
> corresponding registers accordingly.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
