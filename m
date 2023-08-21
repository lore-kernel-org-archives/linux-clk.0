Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E79EE49A5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Aug 2023 17:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjHURBO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Aug 2023 13:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbjHURBN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Aug 2023 13:01:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F39109;
        Mon, 21 Aug 2023 10:01:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F12BF6168C;
        Mon, 21 Aug 2023 17:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432E8C433C8;
        Mon, 21 Aug 2023 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692637265;
        bh=6AdN+9G9dxKvXWZxZb/ZY2OrQYhcjSuVE5fOG+Zsit0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sxa90grenj+OAFbf80xgvwOZigQ/ePqP6MP/cU/WfCelENeYUifWXVBypjUGQhyl8
         HfhROWeUtRYTOVOJyklYkGQhQtI1eYeXWp0sg2mRBBXpbXPhLKzxetkJ7KRpesLbSA
         7I99UgpKYYId6OODDjIrgv+NwEpwzGV+n21SO3a9u2IsjzkYR60dT95I3QTu1cYQDO
         d31C+mF4wMK0QPGiADSEam4LGNXmWseOpn+rZQOU++g8f6xM5/K3QfFHthFT/uSTeK
         xlgFb+JD2r7OJLMP0TIZTpxrNwCUwf7aH3Wx25kyNEwmbuklrDbYZO+0DXyAM9ZtX5
         8omohTlaTZ3VQ==
Received: (nullmailer pid 1891702 invoked by uid 1000);
        Mon, 21 Aug 2023 17:01:03 -0000
Date:   Mon, 21 Aug 2023 12:01:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Message-ID: <20230821170103.GA1888062-robh@kernel.org>
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
 <8294548.NyiUUSuA9g@kongar>
 <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
 <1jwmy39wfs.fsf@starbuckisacylon.baylibre.com>
 <d2225b8a-a622-3936-1e43-d5a9801c2cd7@linaro.org>
 <1jsf8r9v1v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jsf8r9v1v.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Aug 10, 2023 at 09:51:05AM +0200, Jerome Brunet wrote:
> 
> On Thu 10 Aug 2023 at 09:46, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> > On 10/08/2023 09:32, Jerome Brunet wrote:
> >>>>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
> >>>>> the same, then drop the oneOf and make number of clocks fixed.
> >>>>
> >>>> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
> >>>> out in the other post, it can have any combination of clocks and range from 1 
> >>>> up to 11, where 'pclk' is always 1st clock.
> >>>> I currently have no idea how to constraint that, despite limiting the number 
> >>>> of clock-names.
> >>>
> >>> The same as in all other clock controllers (was also present on my list
> >>> of useful patterns - Variable length arrays (per variant)):
> >>> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
> >> 
> >> In the example provided, the number and list of clocks required by each
> >> controller variant is fixed, if I'm reading it correctly
> >> 
> >> Here the controller (regardless of the variant) accepts a maximum 29
> >> clock inputs. Only pclk is required. It is valid to have any of 28
> >> optional clocks at index 2, 3, etc ...
> >
> > I actually doubt that it is optional. These are valid clock inputs. I
> > could imagine they are optional depending on the use-case, like some
> > block being turned off or on... but then still the clock is there, just
> > not actively used.
> >
> > Aren't you now describing existing Linux driver?
> 
> They are valid inputs but not required. It is valid (and expected) to
> have a fair share of them not connected. The slave clocks just don't exist
> most of the time, and the IP can totally accept unwired master clock
> inputs on SoC variant. Nothing is going to break down if some are
> missing.
> 
> >From the controller perspective, the description given here is correct
> and the inputs are optional.
> 
> The more generic question is how do we deal with multiple,
> independent and optional ressources ? Because then, the order in which
> they appear cannot be predicted.

phandle values of 0 or -1 are treated as "NULL" entries.

Rob
