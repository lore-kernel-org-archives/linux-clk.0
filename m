Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAF8ECAAD3
	for <linux-clk@archiver.kernel.org>; Tue, 30 Aug 2022 01:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiH3BtM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 21:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiH3BtL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 21:49:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE428C031;
        Mon, 29 Aug 2022 18:49:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2040561483;
        Tue, 30 Aug 2022 01:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D78C433D6;
        Tue, 30 Aug 2022 01:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661824149;
        bh=JReXW3u43wicEZfYA/GoPI4zS9bDvlxqLVRcNUPvZsI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hlxLfCO0mx/WEwo54cs2UtVPkHa403J96mfeZnTME5Ne+aQnKPvZm+2urPjmF1M4E
         wvv6hJ/vP3uA9B9pRzWB5T96vTuahgJR3gexeb0Xz3TMjWG+3ERfmpR9LmHZO2X62U
         0d0RjqgA54aaNTB3sqBop+1NyXBSDVqv7/NVeHD2d51naiZGZvSIdUcSGONuOZsKK1
         PjVP04O/2XW9HfzDovQOSGd3ezalemyg6vshuR1pxcDQKAc7oOA8Ez03ckbBSEGg7S
         63R/aFB7bABd+1Yxcu1AhnCJtdbOzXB+VxaqnQVLkqBZpTyywQ8S4cP7kO9TlAv6aX
         dNRsQ2sF2JyaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220826091122.2344503-2-daniel@zonque.org>
References: <20220826091122.2344503-1-daniel@zonque.org> <20220826091122.2344503-2-daniel@zonque.org>
Subject: Re: [PATCH v2 2/2] clk: cs2000-cp: make PLL lock timeout configurable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Mon, 29 Aug 2022 18:49:06 -0700
User-Agent: alot/0.10
Message-Id: <20220830014909.64D78C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-08-26 02:11:22)
> The driver currently does 256 iterations of reads from the DEVICE_CTRL
> register to wait for the PLL_LOCK bit to clear, and sleeps one
> microsecond after each attempt.
>=20
> This isn't ideal because
>=20
>  a) the total time this allows for the device to settle depends on the I2C
>     bus speed, and
>  b) the device might need more time, depending on the application.
>=20
> This patch allows users to configure this timeout through a new device-tr=
ee
> property "cirrus,pll-lock-timeout-ms".

It's a timeout, so why not just increase the timeout regardless of
everything else? Or can we parse the bus speed (100kHz or 400kHz)
instead of adding a new property?

>=20
> In order to not break existing applications, a default value of 100 ms is
> assumed: For each read cycle, 8 bits are sent for the register address, a=
nd
> 8 bits are read with the values. 16 bits take about 160 us on a 100 kHz b=
us
> and 40 us on a 400 kHz bus. Hence 256 iterations would take a maximum of
> around 44 ms. Round up and double that value to be on the safe side.
>
