Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:34052 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbdGZUHS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jul 2017 16:07:18 -0400
Received: by mail-wr0-f175.google.com with SMTP id 12so135975448wrb.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2017 13:07:17 -0700 (PDT)
Message-ID: <1501099634.2401.37.camel@baylibre.com>
Subject: Re: [PATCH 3/3] dt-bindings: clock: amlogic,gxbb-aoclkc: Update
 bindings
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Date: Wed, 26 Jul 2017 22:07:14 +0200
In-Reply-To: <20170726004830.GI2146@codeaurora.org>
References: <1499336663-23875-1-git-send-email-narmstrong@baylibre.com>
         <1499336663-23875-4-git-send-email-narmstrong@baylibre.com>
         <20170710035031.rdbi64ookkbq6zeo@rob-hp-laptop>
         <20170721204439.GJ19878@codeaurora.org>
         <1a971e80-1f91-c446-7e28-d193354b2859@baylibre.com>
         <1500897650.2401.1.camel@baylibre.com>
         <20170726004830.GI2146@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-07-25 at 17:48 -0700, Stephen Boyd wrote:
> > 
> > Maybe it is time to investigate having the regmap clock from qcom available
> > to
> > every other platform ?
> 
> I think we have regmap clk duplicated a couple times in the
> drivers/clk/ directory now.

Which is why we may start thinking of common and generic "regmap" compatible
solution in the CCF, at least for things like gates, dividers and muxes

The approach used in qcom with regmap clocks could be a candidate for this,
don't you think ?

> Not sure how this is related, except
> for that there looks to be a desire to use a syscon binding here
> and that forces regmap on drivers?

Syscon has been created exactly for this case where you want to create an mfd
just for sharing a register region between several, otherwise well separated,
devices, isn't it ?
