Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D3AC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 14:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B28C46142D
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 14:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhGBOOk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 10:14:40 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:44956 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232979AbhGBOOk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 10:14:40 -0400
Received: from [151.57.67.62] (port=43383 helo=[192.168.1.114])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lzJtm-0007WW-9J; Fri, 02 Jul 2021 16:12:06 +0200
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net>
 <3feea852-cd59-520a-ec60-5dd1c1c7a824@seco.com>
 <b546c671-2bec-4db7-2f5d-63c97c3a3258@lucaceresoli.net>
 <CAMuHMdWau7XH_Krpws6U_n1GeX-AFh139PsrmOux-5oO2DwNuA@mail.gmail.com>
 <af422b9e-8820-5c43-527a-ca1d9ee413f6@seco.com>
 <CAMuHMdUYwEJ8Jauv1vdou_5kyx7WhMan8Zkme55LJixMqPCqKQ@mail.gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <609e6330-b5f6-28a8-a805-ce6b41997034@lucaceresoli.net>
Date:   Fri, 2 Jul 2021 16:12:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUYwEJ8Jauv1vdou_5kyx7WhMan8Zkme55LJixMqPCqKQ@mail.gmail.com>
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

On 01/07/21 18:44, Geert Uytterhoeven wrote:
[...]
>>>> Perhaps these properties might be made mandatory later, after upgrading
>>>> all DTs (at least those in mainline Linux). and a grace period.
>>>
>>> Yes, they should be marked as required.
>>
>> I don't think I can do that without going through all existing users and
>> defining these properties for them. Otherwise, dt_bindings_check will
>> complain. I believe (but please correct me if I'm wrong) that patches
>> are not to introduce new warnings.
>>
>> However, setting these propreties is not possible for me to do; I would
>> need someone familiar with their board to determine how the SD/OE pin is
>> used, and what the correct setting is.
> 
> Sure, we can only make them required once all in-tree DTS files have been
> fixed.

Good this is your opinion: as all of the vc5/6 instances in mainline
Linux are on Renesas dts[i] files, so I guess we can count on you to fix
them. :)

-- 
Luca
