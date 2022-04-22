Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA558C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 22 Apr 2022 02:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243870AbiDVCiH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 22:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443290AbiDVCiG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 22:38:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8150B4B412
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 19:35:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30A8AB81C21
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 02:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01EEC385A7;
        Fri, 22 Apr 2022 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650594912;
        bh=9bdSIGjXftPYDw2zoU9ZhcnuKxacuGWiim8SFrqnmjs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sbrNFO4vmmSoJtB15Y2pMJQoQO+TJ/xXFaKfzeInH6/UB5P6OiwHE9pduYriMmwSR
         jVe3v161VAk+RSDRT1XoX3PiO23AoMQqGg8uzNtRUuqatI290In5Zmp3GZ0++Pl34l
         EMUggPHDHAdETytdlKR1KYkcw0KbuPOU2MjvUsILDzjgNzJwZBX7UWLomaDidIfNLY
         XpMIhbWHfhWXZHmyfJKsi23fff4aLpfm5GIV6V+pic1UFTGdchIwIo4P7Gi0JIsT2S
         wsDut3kYv7lAjLvd3xqiUxyWpSC1LfSi+lIsge6UngEEgnhyUV+aSLDef2TPDfRqsn
         rHmJRN5wZxFXQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220411072340.740981-1-conor.dooley@microchip.com>
References: <20220411072340.740981-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v2] clk: microchip: mpfs: don't reset disabled peripherals
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org,
        palmer@rivosinc.com, andrew@lunn.ch, linux@armlinux.org.uk,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>,
        linux-clk@vger.kernel.org, mturquette@baylibre.com
Date:   Thu, 21 Apr 2022 19:35:10 -0700
User-Agent: alot/0.10
Message-Id: <20220422023512.C01EEC385A7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Conor Dooley (2022-04-11 00:23:41)
> The current clock driver for PolarFire SoC puts the hardware behind
> "periph" clocks into reset if their clock is disabled. CONFIG_PM was
> recently added to the riscv defconfig and exposed issues caused by this
> behaviour, where the Cadence GEM was being put into reset between its
> bringup & the PHY bringup:
>=20
> https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@=
microchip.com/
>=20
> Fix this (for now) by removing the reset from mpfs_periph_clk_disable.
>=20
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire =
SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
