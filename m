Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97046C88CB2
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 19:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbjFLTaL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 15:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238089AbjFLT3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 15:29:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5A31994;
        Mon, 12 Jun 2023 12:29:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B3B862DA4;
        Mon, 12 Jun 2023 19:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E53C4339B;
        Mon, 12 Jun 2023 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686598164;
        bh=pp4IfnUgseYYo5pXvDeULpRr37FELb9R2IMgv7cV/KU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Tp92YkFg7FoKu2jkhmBLq3jtKoya4QLwB4KhjtVY5MM1aCh/DNZurQqY2Vm77fozi
         to7vhZs2c/HPYHi3XrsQJzGGYH37wBopcit9RK+FARdUkhZPS1A6/V/BbSk+4tePZo
         CffxCmR1n5qMr1RLElJH2VxVhfLazK6M/uronApip0HoYDq/TnK5Ggm6NSihoM0JaL
         Fzfl4XcqMaGscYVBCuplAJT9lm49j4r8ENMa31EsGe60jx7gUg6NkgesfGT1peYjuM
         a/u2gDhBQRF/fjSSSLnqs4rSUcO9xakzbDowTEnqLT7r9TSoeh75g8/Ebx8oV2Jgma
         acTVZb0dzgF8g==
Message-ID: <a9e1fc3eae03aafd93602842abc80c81.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230421091649.7sihfhq62p5qstom@pengutronix.de>
References: <20221219171058.164381-1-m.felsch@pengutronix.de> <7687837da16c41ffca3cda747483f2d1.sboyd@kernel.org> <20230421091649.7sihfhq62p5qstom@pengutronix.de>
Subject: Re: [PATCH 1/2] clk: imx8mp: fix sai4 clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Anson.Huang@nxp.com, abelvesa@kernel.org, festevam@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
To:     Marco Felsch <m.felsch@pengutronix.de>
Date:   Mon, 12 Jun 2023 12:29:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marco Felsch (2023-04-21 02:16:49)
> Hi,
>=20
> On 23-01-12, Stephen Boyd wrote:
> > Quoting Marco Felsch (2022-12-19 09:10:57)
> > > The reference manual don't mention a SAI4 hardware block. This would =
be
> > > clock slice 78 which is skipped (TRM, page 237). Remove any reference=
 to
> > > this clock to align the driver with the reality.
> > >=20
> > > Fixes: 9c140d992676 ("clk: imx: Add support for i.MX8MP clock driver")
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> >=20
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>=20
> I noticed that this isn't part of v6.3. @Abel can you add your rb or
> comments please?
>=20

Please resend and Cc linux-imx@nxp.com
