Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E69BC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63B0F61C31
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhF1DEx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:04:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:60414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhF1DEx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:04:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C55161C2A;
        Mon, 28 Jun 2021 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849348;
        bh=EkAiXzeW+4dFW8D0Ni+CY38WnLjnmxb9TuHgFo20sLY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ouJog4cp/HN8TDAjGmzjMOYnJxk7QrTr/FE4rWqkr6a3tIqbugTPTSAbieuIQILRD
         9W1C2xhC6crhr97QKPRMt3lDwLsR37zd5w3y9BjobHlUIA0m1QFSpV8+DsHsILGq8V
         /X9HIlbIEMVHb+jabQnUS40Wu+wqK3NX7f+BJdrIO6QCXnQI5bfU3QfJvPFHh+0Hk3
         PoFKpDhU7KGg7DI9CtOZtiQmTm8KGDyxCqdO7nCoVtEA10qXi6p19qwQ7+UkQL2L1Q
         XEA0g5gJN92uJ7ETgzsyxgkqP5bcT3ualFw+jpUt688Cve0DuJMWBe4t/Kz7Af7wcJ
         nMyC5oBKuYVdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-3-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-3-robert.hancock@calian.com>
Subject: Re: [PATCH v3 2/9] clk: si5341: Wait for DEVICE_READY on startup
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:27 -0700
Message-ID: <162484934724.2516444.644192914368553549@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:36)
> The Si5341 datasheet warns that before accessing any other registers,
> including the PAGE register, we need to wait for the DEVICE_READY register
> to indicate the device is ready, or the process of the device loading its
> state from NVM can be corrupted. Wait for DEVICE_READY on startup before
> continuing initialization. This is done using a raw I2C register read
> prior to setting up regmap to avoid any potential unwanted automatic PAGE
> register accesses from regmap at this stage.
>=20
> Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
