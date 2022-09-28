Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F6FC32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 17:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbiI1RyB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbiI1Rxm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 13:53:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEA4FDFBB
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:53:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5B03EB821BA
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 17:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05556C43148;
        Wed, 28 Sep 2022 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664387595;
        bh=s7Zxwo0t3A2ydwDx8zy545isqdO/Dv+8Qx3epKlmPWs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Hy4saa0qiQvOnNw1CoOK2OeRWw3Gj9QTIiUf+byAqG6njkAYGwc9zriBHqqgCurJo
         eC8akzxnJPgRUKhBIaVg1iCAVa7yLXEfXEhurlaw90c9UoNLjueGYF4wPG3EO43dJx
         KykvoT5J2zX4mwnwUOaRGWWUakpvmB8J3f8W4L1iZZOFsPVgLcBFG60hk4LTZ5Prwh
         +6KGhueWj85u4Z6tuQ7FfZlYwZYADaTvLWXjNiBUOeiSYb8I4iAB1pZVbhs47/Y41s
         36n78JxO2rszg5MF0aj5XPy5mTPcRLd2ovoUM/rGX40pRlAi9D11ErhLV5IryyQZ7J
         Pp3DXKInyxNkQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220915092711.4158723-1-claudiu.beznea@microchip.com>
References: <20220915092711.4158723-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock fixes for 6.0
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com, mturquette@baylibre.com,
        nicolas.ferre@microchip.com
Date:   Wed, 28 Sep 2022 10:53:13 -0700
User-Agent: alot/0.10
Message-Id: <20220928175315.05556C43148@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2022-09-15 02:27:11)
> Hi, Stephen, Micheal,
>=20
> On Microchip we decided to send a single clock pull request for both
> AT91 and Polarfire architectures. Let us know if you would prefer otherwi=
se.
>=20
> Thank you,
> Claudiu Beznea
>=20
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:
>=20
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-fixes-6.0
>=20
> for you to fetch changes up to 05d27090b6dc88bce71a608d1271536e582b73d1:
>=20
>   clk: microchip: mpfs: make the rtc's ahb clock critical (2022-09-14 10:=
45:52 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
