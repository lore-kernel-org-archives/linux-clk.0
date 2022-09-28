Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0481FC32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 23:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbiI1XVD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbiI1XU4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 19:20:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4572DA86
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 16:20:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 83003B821BC
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 23:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468DAC4347C;
        Wed, 28 Sep 2022 23:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664407237;
        bh=uG0EpGL5rkBaZipmTUFXtFlsjk+lRWfT/d9dKqqy+IY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dZJ8oarGjMVwSVUAsDfSfDQWc7dz522TgoAyc48ys0/+R9El+F4vznmmQ+RX4d13d
         d0fi2bzC9OokWtVKGxWQkS0Ue1ySAHfVdX0eQIDIHNtF93XJMRveqZIxSewl0iZ+7c
         7dIosaOWnEzAy+13Aus3PtEcJWyIXC1Zf6auifZmQ0c7Etmx69aBuk6+lxbyoch296
         CaV2jTzpi1EDSfviFBataEnwiH/tlaxUPVJse/vfhPI/V0efoxuRUT/kpwGgS0Iz2Y
         FH5q/KSMmDvAw52RJfkV5YRzb7NQ7gnQamNPoVWWIpzPaeJ3HafQ+xW4yXGP19NfzZ
         X9F2UUc6RQx9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220915092927.4158755-1-claudiu.beznea@microchip.com>
References: <20220915092927.4158755-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock updates for 6.1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com, mturquette@baylibre.com,
        nicolas.ferre@microchip.com
Date:   Wed, 28 Sep 2022 16:20:35 -0700
User-Agent: alot/0.10
Message-Id: <20220928232037.468DAC4347C@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2022-09-15 02:29:27)
> Hi, Stephen, Michael,
>=20
> On Microchip we decided to send a single clock pull request for both
> AT91 and Polarfire architectures. Let us know if you would prefer otherwi=
se.
>=20
> Please note that this PR is based on Microchip clock fixes PR.
>=20
> Thank you,
> Claudiu Beznea
>=20
> The following changes since commit 05d27090b6dc88bce71a608d1271536e582b73=
d1:
>=20
>   clk: microchip: mpfs: make the rtc's ahb clock critical (2022-09-14 10:=
45:52 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.1
>=20
> for you to fetch changes up to 935edf0c145596c26e7c6825918acde27ff94ff6:
>=20
>   clk: at91: sama5d2: Add Generic Clocks for UART/USART (2022-09-15 11:01=
:37 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
