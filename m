Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CEAC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 11:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F0F613D3
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 11:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhJTLIc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Oct 2021 07:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhJTLIc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Oct 2021 07:08:32 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0380C06161C;
        Wed, 20 Oct 2021 04:06:17 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F14748203C;
        Wed, 20 Oct 2021 13:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634727974;
        bh=3tpa3Pkoj0NtJdxOQqp8jDQybuRxsQiaTI0HGmlt218=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WJXssBecCJPI9OMqBhRT4gkmsN7wXyfZlxFLGnojm30R5lOahUxREpB0VGZ7RvrF2
         6koUqWW5RHyMnF9w9JNdly90sv6GFCOty/Od6qTGDKgkD6KR6NfBxYkNiz76AVerBe
         VQ+WMip8xoYlPQfC9zut53aCqveZLPBOX+QTjwJOgqZlJY7j0P40zzCw/2VPk5xOPC
         xS/LE99axg3t4hEXfk/qDdGl00sW/qCKpA5Tkm5KGB2EecSBmNBxi4vyWzWM7r5euP
         4KpWilUFyhT0bnaXhXRiYn5No4h0uboRRGv9LMP7RDHiEzkgeP/1NPJZSzzMSMxUyc
         s24mG3DPiCncw==
Subject: Re: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
References: <20211020084956.83041-1-marex@denx.de>
 <263da45f-d648-3c65-aed3-e4ba41927911@fi.rohmeurope.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <4b3cc52c-a618-ea7d-6778-68060cfadf8e@denx.de>
Date:   Wed, 20 Oct 2021 13:06:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <263da45f-d648-3c65-aed3-e4ba41927911@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/20/21 12:14 PM, Vaittinen, Matti wrote:
[...]

> I wonder if this really is something specific to ROHM ICs? Do you think
> this would warrant a generic, non vendor specific property? I am Ok with
> the ROHM specific property too but it just seems to me this might not be
> unique to ROHM IC(s).
> 
> By the way, the very same clk driver where you implemented the property
> reading (patch 2/2) is used by few other ROHM PMICs. At least by
> BD71837, BD71828, BD71815, BD9576 and BD9573. So the code change here
> adds support for this property to all of those PMICs. I wonder if the
> property should be mentioned in all of the binding docs... That could be
> another argument for making this a generic property and describing it in
> clk yaml ;)
> 
> Well, just my 10 Cents - I am ok with this change as you presented it
> here if you don't think this should be generic one.

I think we need something like gpio-hog, except for clock. Some clk-hog 
maybe ? That would be useful not only here, but also for things where 
some output generates clock for random stuff which cannot be described 
in the DT for whatever reason (like e.g. the SoC is used as a substitute 
for CPLD XTAL and the CPLD isn't connected to the SoC in any other way).
