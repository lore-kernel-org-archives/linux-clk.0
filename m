Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9750DEB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 19:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjFPTQf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jun 2023 15:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjFPTQe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jun 2023 15:16:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8745B35A7;
        Fri, 16 Jun 2023 12:16:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A6DB632A3;
        Fri, 16 Jun 2023 19:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67232C433C8;
        Fri, 16 Jun 2023 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686942991;
        bh=Tq66GZ+DhfCcoRUc3uEXXVUGnwi3mpxnBzgStUFszQo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eLqZROco87/7dR7Srddsokk5uqNIdWIay8Jg+pnG0nbD/q7tt/4us7qcQbLtE17CL
         KlnlYzjnw0s7vzf07tzRW92KmmKzy87BLOg9tkyd/Ae/zQ0n212J7IF+9qhLyYSGFH
         IXYn3wwi9+X4aAYdvFs2f2TFNoO36jmCFnbte+rFa1aQakhvKeF4LEjP/FYUORqJiI
         k6VUKYvukPNKWDJ/9GYVi7BrvQLQ0E+ps0QCFc0MElLTDCW4G6BCIiPGPw6Rp+S6ki
         bF1yQ7/RBnie1lSvGxMy8C6lk6O/Enk/pb7Nk17zt1PslL+Cadd/33dzTbqpGYY7fP
         GGkrBt3MneS3Q==
Message-ID: <7c1dbb26bb7693929bca45a7b28bf9c8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230515-refclk-v3-2-37c0b550f406@ti.com>
References: <20230515-refclk-v3-0-37c0b550f406@ti.com> <20230515-refclk-v3-2-37c0b550f406@ti.com>
Subject: Re: [PATCH v3 2/2] clk: keystone: syscon-clk: Add support for audio refclk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Jai Luthra <j-luthra@ti.com>
To:     Conor Dooley <conor+dt@kernel.org>, Jai Luthra <j-luthra@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Date:   Fri, 16 Jun 2023 12:16:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jai Luthra (2023-06-15 04:55:36)
> TI's AM62 SoC can optionally provide two audio reference clocks
> (AUDIO_REFCLKx) to external peripherals.
>=20
> By default this reference clock is looped-back inside the SoC to a mux
> that goes to McASP AHCLK, but can optionally be enabled as an output to
> peripherals outside the SoC by setting a bit through CTRL_MMR registers.
>=20
> This bit only controls the direction of the clock, while the parent
> is a muxed input from sci-clk [1] which may be a configurable PLL or a
> master clock from one of the McASP instances.
>=20
> Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62x/clocks.htm=
l#clocks-for-board0-device [1]
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---

Applied to clk-next
