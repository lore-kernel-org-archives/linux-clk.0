Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637D9C0015E
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 21:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjHIV2Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 17:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjHIV2Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 17:28:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C775138;
        Wed,  9 Aug 2023 14:28:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DE8A63FED;
        Wed,  9 Aug 2023 21:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0320C433C8;
        Wed,  9 Aug 2023 21:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691616495;
        bh=FdvTilkKSkQ8vAqa9+CyzBQk/hXXyy1elvk/K/FyXjs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FZKwvFkICOQumiCP808+0Ym4o1OqW1f2Wj2AJ1Xy7WVlwdbh0kwSdgDcUMQlWcyJD
         rVOYEqiEZDM05rBS3CXFG7ihLy9RtR2TYjv+INZsFIa9pTLHI3XjHh6Rymt+3LJ1sJ
         4Q6gu8IBoZ+jOMW9XzkUg6z6caSMhyigvEMngquXY9BVK1t1cCz5rlpAiyMgmlWF+e
         e2SUus0+wO0IoqSigtIkRJHUSs3obdyC0IrNxr4Fbhbp5Lul1L+hHE8Q88Kokq4Nft
         0eVzm0QhfUAn8AW/HrhUMf+uxlBqlx9ydi4LjTr9mluKfDtIpIw15jHdF77Z8gUfPD
         JCqTUZ3t+Gt6g==
Message-ID: <677706de77d5d5b799d25c855a723b2c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4c0dfd1c-2b61-b954-73ad-ac8d4b82487d@kernel.org>
References: <20230618132235.728641-1-niravkumar.l.rabara@intel.com> <20230801010234.792557-1-niravkumar.l.rabara@intel.com> <20230801010234.792557-5-niravkumar.l.rabara@intel.com> <4c0dfd1c-2b61-b954-73ad-ac8d4b82487d@kernel.org>
Subject: Re: [PATCH v2 4/5] clk: socfpga: agilex: add clock driver for the Agilex5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     adrian.ho.yin.ng@intel.com, andrew@lunn.ch, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, netdev@vger.kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        robh+dt@kernel.org, wen.ping.teh@intel.com
To:     Dinh Nguyen <dinguyen@kernel.org>, niravkumar.l.rabara@intel.com
Date:   Wed, 09 Aug 2023 14:28:11 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2023-08-08 04:03:47)
> Hi Stephen/Mike,
>=20
> On 7/31/23 20:02, niravkumar.l.rabara@intel.com wrote:
> > From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >=20
> > Add support for Intel's SoCFPGA Agilex5 platform. The clock manager
> > driver for the Agilex5 is very similar to the Agilex platform,we can
> > re-use most of the Agilex clock driver.
> >=20
> > Signed-off-by: Teh Wen Ping <wen.ping.teh@intel.com>
> > Reviewed-by: Dinh Nguyen <dinguyen@kernel.org>
> > Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> > ---
> >   drivers/clk/socfpga/clk-agilex.c | 433 ++++++++++++++++++++++++++++++-
> >   1 file changed, 431 insertions(+), 2 deletions(-)
> >=20
>=20
> If you're ok with this patch, can I take this through armsoc?
>=20

Usually any binding files go through arm-soc and clk tree but the driver
only goes through clk tree via a PR. Is that possible here?
