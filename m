Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E5AC001B0
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 18:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjHISoH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 14:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjHISoG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 14:44:06 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D423AC9;
        Wed,  9 Aug 2023 11:44:05 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RLf8y3x59z9ts9;
        Wed,  9 Aug 2023 20:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1691606642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OHztLns/SEAN/eWS1xJ1M1QeZedq2Q0tPuXS7nMFpiU=;
        b=SqBgB3qZoafG5hX/f1pj41bDcLd6yXlIByiI3kOZk6djecEosEMzBt1QsENNCIvCi7L/uC
        kVxXtTJkBny9323/FS3T0aXZwZbSRSwS+isCLMv5+r3ophqVCG1/nPrnLjkce7q7wOIlA6
        kTnkD41DMbuTT6Fngsv9QBjsMGMvU0LBKWcouUAurm2pEfoHnbdvIljVVRj3CIH9MrcQmf
        8YP3mOncx1o0Ru3PHAYEFy2rDX1MDIWq1h1lGfQl6nhcolUcQnD69hSjSMiu7sBEhCWbWa
        LzgkQBSZnQdarIQzSUB9eMXG1hM7djDB/cglwowgWrGWxSjDyWE3pfqki5wQTA==
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML
 format
Date:   Wed, 09 Aug 2023 20:44:00 +0200
Message-ID: <8294548.NyiUUSuA9g@kongar>
In-Reply-To: <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-MBO-RS-META: o741jirs9h84kpbx6socy3zifu3qzbyf
X-MBO-RS-ID: de6b6dc4972feb208bc
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Am Mittwoch, 9. August 2023, 15:02:23 CEST schrieb Krzysztof Kozlowski:
> On 09/08/2023 08:58, Jerome Brunet wrote:
> >>> +      required:
> >>> +        - '#reset-cells'
> >>
> >> else:
> >>   properties:
> >>     '#reset-cells': false
> >> ???
> >>
> >>
> >> You need to constrain the clocks per variant. Probably names are also
> >> specific to each one, so the list of names can be moved here and you
> >> keep just min/maxItems in the top level property.
> >>
> > 
> > input clock names and constraints are the same for all 3 variants.
> 
> Then why do you have this huge, apparently unnecessary, oneOf? If it's
> the same, then drop the oneOf and make number of clocks fixed.

But as far as I understand the number of clocks is not fixed. As Jerome pointed 
out in the other post, it can have any combination of clocks and range from 1 
up to 11, where 'pclk' is always 1st clock.
I currently have no idea how to constraint that, despite limiting the number 
of clock-names.

Best regards,
Alexander


