Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD4BC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 12:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3A436142C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 12:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbhGBMgp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 08:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232643AbhGBMgo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 08:36:44 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26515C061762;
        Fri,  2 Jul 2021 05:34:12 -0700 (PDT)
Received: from [192.168.178.106] (p57bc995e.dip0.t-ipconnect.de [87.188.153.94])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 9C8664C5159;
        Fri,  2 Jul 2021 12:34:09 +0000 (UTC)
Subject: Re: [PATCH v3 3/9] dt-bindings: clock: cs2000-cp: make clk_in
 optional
To:     Rob Herring <robh@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20210617190912.262809-1-daniel@zonque.org>
 <20210617190912.262809-4-daniel@zonque.org>
 <20210624213317.GA2020700@robh.at.kernel.org>
 <963c50c4-6adc-e437-dd12-08e75c2dbc84@zonque.org>
 <CAL_JsqJagK4a57enCvLeyCNujxTphYsh=Mc+=A5Zz=5z37_FSA@mail.gmail.com>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <643cf315-84f0-587a-e0d0-107d2fa3b1b3@zonque.org>
Date:   Fri, 2 Jul 2021 14:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJagK4a57enCvLeyCNujxTphYsh=Mc+=A5Zz=5z37_FSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 7/1/21 6:07 PM, Rob Herring wrote:
> On Mon, Jun 28, 2021 at 10:03 AM Daniel Mack <daniel@zonque.org> wrote:
>>
>> On 6/24/21 11:33 PM, Rob Herring wrote:
>>> On Thu, Jun 17, 2021 at 09:09:06PM +0200, Daniel Mack wrote:
>>>> CLK_IN is only used in dynamic mode and is hence optional.
>>>>
>>>> Re-order the clocks so REF_CLK is specified first.
>>>
>>> It's not a compatible change. You can't do that unless you can explain
>>> why it doesn't matter.
>>
>> Hmm okay. And that rule also applies even if I patch all mainline users?
> 
> Explaining why you are doing something and the implications of the
> change, yes that's required for every commit. Whether you can make
> incompatible changes, that's up to platform maintainers. I only ask
> that doing that is documented clearly.
> 
> Do you know that every user of affected h/w is okay with you requiring
> them update their dtb?

Alright, I'll rework that to use a new property then for mode selection.
and repost.


Thanks,
Daniel
