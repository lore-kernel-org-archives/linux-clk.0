Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CABFC77B7C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 19:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbjEETEV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 15:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbjEETEU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 15:04:20 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2ECE52270E
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 12:04:18 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB7421FB;
        Fri,  5 May 2023 12:05:02 -0700 (PDT)
Received: from [10.57.82.41] (unknown [10.57.82.41])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DC133F64C;
        Fri,  5 May 2023 12:04:16 -0700 (PDT)
Message-ID: <840b618a-0185-90a6-63c1-76d2635974ed@arm.com>
Date:   Fri, 5 May 2023 20:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 39/68] clk: versatile: sp810: Add a determine_rate hook
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-39-971d5077e7d2@cerno.tech>
 <CACRpkdY-n6NO7AFmAaoJgO0WfqAd52mMcDj0q+WdGY-UwzmuKA@mail.gmail.com>
From:   Pawel Moll <pawel.moll@arm.com>
In-Reply-To: <CACRpkdY-n6NO7AFmAaoJgO0WfqAd52mMcDj0q+WdGY-UwzmuKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/05/2023 12:30, Linus Walleij wrote:
> On Fri, May 5, 2023 at 1:27 PM Maxime Ripard <maxime@cerno.tech> wrote:
> 
>> The Versatile sp810 "timerclken" clock implements a mux with a
>> set_parent hook, but doesn't provide a determine_rate implementation.
>>
>> This is a bit odd, since set_parent() is there to, as its name implies,
>> change the parent of a clock. However, the most likely candidates to
>> trigger that parent change are either the assigned-clock-parents device
>> tree property or a call to clk_set_rate(), with determine_rate()
>> figuring out which parent is the best suited for a given rate.
>>
>> This mismatch is probably due to the fact that the driver introduction
>> predates the determine_rate introduction, and it was never revised since
>> then.
>>
>> The default, implicit, behaviour that has been in use so far has thus
>> been to simply keep using the current parent in all cases. This is also
>> the behaviour of the new clk_hw_determine_rate_no_reparent() helper, so
>> we can simply use it to make our expectation explicit.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Pawel Moll <pawel.moll@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> I think Pawel's reply reads as an ACK as well?

Indeed, for what it's worth (not much ;-)

Acked-by: Pawel Moll <pawel.moll@arm.com>

Cheers!

Paweł
