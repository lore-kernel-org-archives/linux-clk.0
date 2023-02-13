Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294E0C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 09:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjBMJX7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 04:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjBMJXz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 04:23:55 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125A914EA4;
        Mon, 13 Feb 2023 01:23:52 -0800 (PST)
Received: from [172.16.71.140] (unknown [49.255.141.98])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F85420034;
        Mon, 13 Feb 2023 17:23:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676280230;
        bh=8NfI8n6ob4UpJIwWuXqxPyBf2X4KaQKZoWPaNN7OI/o=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=AhF7TY9RIivSqSFJEZeHw70z/vCFZp4aAp1QY46RqbPjJsZIlMygkbz5vJ25Yp0BC
         uSIjVQ8vwf+ZxBu21PnOlyz6fMEZXsHX2aR5kXTA02ZYvnysgPVyTUESTcnYZre5QY
         UFIpJoVPnlz0lhT4ELJpWSudbKuQGOPdnubkKYPOQIXgPpKBzRdk7eyozPsioS6ENT
         kU5j0g+ZIoKqSLGxIMb7soibcSDL3pa7qyo8D/n0JM6YzhJwbZ0UfmFMu1T48HvPza
         vwWfNLwj8qaaZ/+pywsfK2CrT/KIHnJgZ8aCiH+iEycCH7KuvussmuLNcoii5dnArV
         y57z05Xo3nLKg==
Message-ID: <34b2ebb4781c6157496012efce392743e1821c8a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Mon, 13 Feb 2023 17:23:50 +0800
In-Reply-To: <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
         <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
         <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
         <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
         <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

> There was clk already, wasn't it? What do you want to change?
> I asked why do you call it in the same patchset aspeed and as2600?

There was "clk" and "dts", where the latter should have probably been eithe=
r
also "clk" or "dt-bindings".

I'll unify the "aspeed" to "ast2600".

Cheers,


Jeremy
