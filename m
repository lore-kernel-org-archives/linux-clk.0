Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16BEC352A1
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 02:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiLGCRr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 21:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLGCRq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 21:17:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42131DFBD;
        Tue,  6 Dec 2022 18:17:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 508AF611DE;
        Wed,  7 Dec 2022 02:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3596C433C1;
        Wed,  7 Dec 2022 02:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670379462;
        bh=lxh+qkWtrAkQD6FWNVfNsV2V1Ki+c1iwrz1a+xcetr0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rshxMWMbp4jY5A3Nq2O5c7KmmaX6MZr80aizs8RFHHgf5gnyu5edJNDFxhhk7z7/Y
         ckBIRqkHc0yxl7ApXxB+NTs8/dTIiruW8ELggtlnE7epcE0x7bWR2SWPuX8q5hf4fG
         dVeJLhQrgpM5XWrCuJbWrbCcY5C5HrE7HmFyHyBM4pakwkMAj9Urz9TrRAWFu2d0QO
         vvDb4UkZZXe0rhD+MGA6otPd8oBVuFRPrVns2+L6zwtkorJou3Z7aXhSdwdphbsaFU
         wgJQBRZPAyOXQVs6C1I0uwvoGkcQl0R06amskDTpcv7UMC1TLnWflgELbrNjep7c4U
         tyLzbSifoOr9A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com> <20221027230331.19C2FC433D6@smtp.kernel.org> <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com> <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com> <20221101201020.B6180C433C1@smtp.kernel.org> <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-doc@vger.kernel.org
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date:   Tue, 06 Dec 2022 18:17:40 -0800
User-Agent: alot/0.10
Message-Id: <20221207021742.A3596C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2022-11-01 16:27:21)
> On 11/1/22 16:10, Stephen Boyd wrote:
> >>=20
> >> Oh, I remember why I did this. I need the reference clock for clk_hw_r=
ound_rate,
> >> which is AFAICT the only correct way to implement round_rate.
> >>=20
> >=20
> > Is the reference clk the parent of the clk implementing
> > clk_ops::round_rate()?
>=20
> Yes. We may be able to produce a given output with multiple reference
> rates. However, the clock API provides no mechanism to say "Don't ask
> for the parent clock to be rate X, you just tried it and the parent
> clock can't support it." So instead, we loop over the possible reference
> rates and pick the first one which the parent says it can round to.
>=20

Sorry, I'm lost. Why can't you loop over possible reference rates in
determine_rate/round_rate clk op here?
