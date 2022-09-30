Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC05C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:31:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbiI3VbO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiI3VbG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:31:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FAF12936D;
        Fri, 30 Sep 2022 14:31:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C89B624F4;
        Fri, 30 Sep 2022 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DB7C433C1;
        Fri, 30 Sep 2022 21:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664573463;
        bh=8ngmKzeml8m0R0g4rXI8BPfKYpVbq7Y5xNMXyRhTE8c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WRGmagP2FEI04rKREfs9yeCTGovcqoBIz0d5iNsZ8VQTilwbe7J0oHu0GbjFp2yXe
         FR9KJHvAl+lDYqP0Pjij8FAGFSilGxB592RG84yFSl7AM+XonvGuVBPBzWb+6eiAOM
         TRznfycXnyg/g1hvKNZ91jhnuF6Tr0Nju0ycEGHOjCGW8v7pGadt4F7h99XIt9OWTo
         SGgJhLaKNBnipryyp5bPrCwK+zVy+L6bFQQHENzmNdsc3FpFZ1s780p0gOcoU7kqKV
         vmMdU5bFFbkim5SF2KfwO9FDIkXydXRkKRkKyARdGxWCcsiNX1xjt37JaJDmxf3MTc
         gWHmc2/lV3LeQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220904141037.38816-1-stefan.wahren@i2se.com>
References: <20220904141037.38816-1-stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: bcm2835: fix bcm2835_clock_rate_from_divisor declaration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Date:   Fri, 30 Sep 2022 14:31:00 -0700
User-Agent: alot/0.10
Message-Id: <20220930213103.60DB7C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2022-09-04 07:10:37)
> The return value of bcm2835_clock_rate_from_divisor is always unsigned
> and also all caller expect this. So fix the declaration accordingly.
>=20
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio=
 domain clocks")
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to clk-next
