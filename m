Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158F4C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E141060F92
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236268AbhJ0BFr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:05:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232410AbhJ0BFr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Oct 2021 21:05:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBD706044F;
        Wed, 27 Oct 2021 01:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635296602;
        bh=B9gOl/8qkuWlqzTV1DKKZpkCPjpgl9hAk1G9qNSC6YI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZnzGsjGCz2z6U46JkhEUYO7Etbod4T/XwH2Y+DmyPNTVTCjVz3FGC2NfBkBNB1SGl
         BEyNhQGEiGTUsntpwmQFVm0TClTRSBsyLOqNWXqgEbL6Yh7kY+QxtyDyFXjwf2jfSX
         xUbi2S2mhUUm85Kp3+A9BImqG+mZ/NS6SGCyQIk25XyH8VZBkQOC7TAGPJ68XCuh2Z
         0+v5QlScYmPZn0H+cW9waN83qjmzn0nmysfps8z8hMU2Nl0PEYZnQaWA7vgURb9UP0
         6Lw4DPNjH0GjdDv9bz5FcC9sfM0SAdSvh8NOzSm7sYmGp39D3/JOiNN6wLvXGn1BtW
         HLsAdgXgw5yzg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdbLxhUtXHs2+hy6U6OW2V3YTxrjxp0AxVP3PnV1hoFNKw@mail.gmail.com>
References: <20210921184803.1757916-1-linus.walleij@linaro.org> <CACRpkdbLxhUtXHs2+hy6U6OW2V3YTxrjxp0AxVP3PnV1hoFNKw@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: u8500: Rewrite in YAML and extend
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 26 Oct 2021 18:03:21 -0700
Message-ID: <163529660150.15791.6118121878230730314@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2021-10-19 16:57:55)
> On Tue, Sep 21, 2021 at 8:50 PM Linus Walleij <linus.walleij@linaro.org> =
wrote:
>=20
> > This rewrites the ux500/u8500 clock bindings in YAML schema and extends=
 them
> > with the PRCC reset controller.
> >
> > The bindings are a bit idiomatic but it just reflects their age, the ux=
500
> > platform was used as guinea pig for early device tree conversion of pla=
tforms
> > in 2015. The new subnode for the reset controller follows the pattern o=
f the
> > old bindings and adds a node with reset-cells for this.
> >
> > Cc: devicetree@vger.kernel.org
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> One month has passed, can we merge this patch?
>=20

Of course
