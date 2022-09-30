Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543AAC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbiI3V2a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiI3V22 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:28:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819F91497BB
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 14:28:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A86E624E5
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 21:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC82C433D6;
        Fri, 30 Sep 2022 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664573306;
        bh=w+upoy39VhWN2Ls5//Nx+yAfOki/I/SDOFq449OV9Wg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EB9XBZXa9wpwhgGNyRbAD1aLU0/msAMMIBuBI5F7D+5tk+fQHJ0ySITp5D/UeLtsH
         5EnTq0EtOenDt5fidmVRI/JQgDzjNIE+4Q+h7R3002pimoH1THVkcEiYgBoaGwsokz
         62+IBnYwqvYLhhx/mTnOIZjRz1LcXgtog3t3jQqUDUaeF/65G2XP2AEryg+BXIFwDw
         EWpdwGlDYHx0DpoFdimeVAZUU1FTsLdZHlZXbXy5E/9ubXBft7uyGkUgg0QTyDTXw9
         x/YnMa16P0niCdSUIegPM1VB/egzkYYiFvVptbkBNUv2+4JsIQd4n4eHtgFYWlkdyt
         xZ0ifQCX8Y/9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220926084509.12233-1-maxime@cerno.tech>
References: <20220926084509.12233-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: bcm2835: Make peripheral PLLC critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-rpi-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>,
        Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Date:   Fri, 30 Sep 2022 14:28:23 -0700
User-Agent: alot/0.10
Message-Id: <20220930212826.5CC82C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-09-26 01:45:09)
> When testing for a series affecting the VEC, it was discovered that
> turning off and on the VEC clock is crashing the system.
>=20
> It turns out that, when disabling the VEC clock, it's the only child of
> the PLLC-per clock which will also get disabled. The source of the crash
> is PLLC-per being disabled.
>=20
> It's likely that some other device might not take a clock reference that
> it actually needs, but it's unclear which at this point. Let's make
> PLLC-per critical so that we don't have that crash.
>=20
> Reported-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
