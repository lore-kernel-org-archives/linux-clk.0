Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8213EEB64D7
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 23:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjFZXi1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 19:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjFZXi0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 19:38:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BDA198C
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 16:38:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3FFB860F9F
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 23:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98818C433C0;
        Mon, 26 Jun 2023 23:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687822704;
        bh=7GRQp+r8i892Ey0ELnlXFWYOEkr3uFQ1hVjQmxqTVkM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hVhb6v59iTM2rtaVQzL4j+zPOOEZjK1xCd8GFaQbJ8ElxTKt4BLPbGT6x4Kpb5Xef
         kWJMSG4itm2U5Zz7d9bc2zlqhmaJd5LxLTBemfEjBsnk9LOqzNtjNImt4ZIGPsIa4z
         YDxZpqnlGEdNpne2nsyyHPic+PrDiUtJrFG7KkBzLnXPFmk7+586aOlJs15A3AZ1xg
         wBAAb1zpoFDl/8B1J4zW7JVn9kWJwgayoK3KQ0v8xVJSNZbYm7KBHBr6fIzcrCRp3m
         6uW243JpSehKd60fIeK3VmoS8beyRJmqPxEfG/tnXzNc5DRtelF2qgB+tndWM/4A+F
         P480A2b0nJEBA==
Message-ID: <d72436382792c91f11941b18f484142a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230621094106.1575553-1-claudiu.beznea@microchip.com>
References: <20230621094106.1575553-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock updates for 6.5 #2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, conor.dooley@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Mon, 26 Jun 2023 16:38:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2023-06-21 02:41:06)
> Hi, Stephen,
>=20
> Please pull in case it is not too late.
>=20
> Thank you,
> Claudiu
>=20
> The following changes since commit 9a7b010116a430d74dc30a214ea55a58a2863d=
71:
>=20
>   dt-bindings: clocks: at91sam9x5-sckc: convert to yaml (2023-05-22 15:59=
:49 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.5-2
>=20
> for you to fetch changes up to 5619c2ddaf3ff77ce393716a6fed3267cb906344:
>=20
>   clk: at91: sama7g5: s/ep_chg_chg_id/ep_chg_id (2023-06-21 10:42:48 +030=
0)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
