Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FEBC47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 11:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D34946135D
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 11:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhFBLPe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 07:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFBLPd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Jun 2021 07:15:33 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3FEBC061574;
        Wed,  2 Jun 2021 04:13:50 -0700 (PDT)
Received: from [192.168.178.106] (p57bc9aa3.dip0.t-ipconnect.de [87.188.154.163])
        by mail.bugwerft.de (Postfix) with ESMTPSA id A43614CE395;
        Wed,  2 Jun 2021 11:13:46 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document
 aux-output-source
To:     Rob Herring <robh@kernel.org>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com,
        kuninori.morimoto.gx@renesas.com, linux-clk@vger.kernel.org,
        sboyd@kernel.org, devicetree@vger.kernel.org
References: <20210519201551.690654-1-daniel@zonque.org>
 <20210519201551.690654-3-daniel@zonque.org>
 <20210521020014.GA2499566@robh.at.kernel.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <686a774c-f336-8a2c-259f-14fffd3dff94@zonque.org>
Date:   Wed, 2 Jun 2021 13:13:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521020014.GA2499566@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/21/21 4:00 AM, Rob Herring wrote:
> On Wed, 19 May 2021 22:15:50 +0200, Daniel Mack wrote:
>> This new optional property can be used to control the function of the
>> auxiliary output pin. Introduce a new dt-bindings include file that
>> contains the numerical values.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>  .../bindings/clock/cirrus,cs2000-cp.yaml           | 13 +++++++++++++
>>  include/dt-bindings/clock/cirrus,cs2000-cp.h       | 14 ++++++++++++++
>>  2 files changed, 27 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks Rob!

Mike, Stephen, do you want me to resend with Rob's ack?


Thanks,
Daniel
