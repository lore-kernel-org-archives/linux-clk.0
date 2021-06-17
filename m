Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31A2C2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 13:10:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD59D613D6
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 13:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhFQNMU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 09:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhFQNMU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 09:12:20 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 59827C06175F;
        Thu, 17 Jun 2021 06:10:12 -0700 (PDT)
Received: from [192.168.178.130] (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 082F84C00EA;
        Thu, 17 Jun 2021 13:10:07 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document
 aux-output-source
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20210519201551.690654-1-daniel@zonque.org>
 <20210519201551.690654-3-daniel@zonque.org>
 <CAMuHMdUmEWNCj6J43jwxE67K=ksRy53Eb9B82HjDfC++-YLw9g@mail.gmail.com>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <ceb82b22-6657-0003-561c-cf4d72b9d5d7@zonque.org>
Date:   Thu, 17 Jun 2021 15:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUmEWNCj6J43jwxE67K=ksRy53Eb9B82HjDfC++-YLw9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for looking into this patch!

On 6/11/21 2:18 PM, Geert Uytterhoeven wrote:
>> +  cirrus,aux-output-source:
>> +    description:
>> +      Specfies the function of the auxililary clock output pin
> 
> Specifies ... auxiliary
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum:
>> +      - 0 # CS2000CP_AUX_OUTPUT_REF_CLK:  ref_clk input
>> +      - 1 # CS2000CP_AUX_OUTPUT_CLK_IN:   clk_in input
>> +      - 2 # CS2000CP_AUX_OUTPUT_CLK_OUT:  clk_out output
>> +      - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status
> 
> Should the default be documented? "default: 0"?

Both addressed. I will send a new series soon that supersedes this one
and carries some more changes.


Daniel
