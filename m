Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D56ECAAD4
	for <linux-clk@archiver.kernel.org>; Wed, 31 Aug 2022 13:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbiHaN0e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Aug 2022 09:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiHaN0c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Aug 2022 09:26:32 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1BE7CCE19;
        Wed, 31 Aug 2022 06:26:30 -0700 (PDT)
Received: from [10.10.0.102] (unknown [62.214.9.170])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 9125E505D66;
        Wed, 31 Aug 2022 13:25:59 +0000 (UTC)
Message-ID: <25d25188-268c-0856-b4c4-3de4db5a84fd@zonque.org>
Date:   Wed, 31 Aug 2022 15:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] clk: cs2000-cp: make PLL lock timeout configurable
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com
References: <20220826091122.2344503-1-daniel@zonque.org>
 <20220826091122.2344503-2-daniel@zonque.org>
 <20220830014909.64D78C433D6@smtp.kernel.org>
 <20220830202523.GA1996382-robh@kernel.org>
From:   Daniel Mack <daniel@zonque.org>
In-Reply-To: <20220830202523.GA1996382-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/30/22 22:25, Rob Herring wrote:
> On Mon, Aug 29, 2022 at 06:49:06PM -0700, Stephen Boyd wrote:
>> Quoting Daniel Mack (2022-08-26 02:11:22)
>>> The driver currently does 256 iterations of reads from the DEVICE_CTRL
>>> register to wait for the PLL_LOCK bit to clear, and sleeps one
>>> microsecond after each attempt.
>>>
>>> This isn't ideal because
>>>
>>>  a) the total time this allows for the device to settle depends on the I2C
>>>     bus speed, and
>>>  b) the device might need more time, depending on the application.
>>>
>>> This patch allows users to configure this timeout through a new device-tree
>>> property "cirrus,pll-lock-timeout-ms".
>>
>> It's a timeout, so why not just increase the timeout regardless of
>> everything else? Or can we parse the bus speed (100kHz or 400kHz)
>> instead of adding a new property?
> 
> My thought too. Usually PLLs have a spec for max/typ lock times. Given 
> it's a should never happen type of thing, it doesn't seem like we need a 
> super precise time.

Alright. I guess the real problem here is with the generation of the
input clock signals, so I need to address that side of the design instead.


Thanks for the feedback!

Daniel

