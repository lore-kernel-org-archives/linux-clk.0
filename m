Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C322C54E94
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 20:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235812AbjAYUDt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236127AbjAYUDs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 15:03:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A181F27D5F
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 12:03:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E800B81B9E
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 20:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0990C433EF;
        Wed, 25 Jan 2023 20:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674677019;
        bh=kn6P29NYevX/17qdzAsruk7PdSVl/V+qy7iMJ1lvCik=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TtTR4zcu67KbEe0YVujvuRPbTKmUrTF4XwP7VqKVT8WLUcyV8MVcWNUh2aKjWcfN4
         q108IEgMs1JdxNng2LnAXHDc8YV9bpXJWa3KxQPcEJubro66LBm325Zpe0cobqhDhl
         cq2p6P3vcGbOTHNTyhW/y/6u5okiw0udeB+2FTq9M+yYniHmdgJkaYHHK05hGPLsok
         tCVrQVGHh4X72igUgCOmmEq007aA9PFEmpl3Rc/Uq4ZiPF4MaV643ymMSYUeOaziLa
         XreVXWHBv4QKMNPd67dT9UQvNmHedckclQCr0sfJm0uxXpeGC2mM9KCUe5ejepaUtS
         2hyzqLuB2fKmQ==
Message-ID: <a07bd8050512432223e5887157888b5f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230119113825.44374-1-claudiu.beznea@microchip.com>
References: <20230119113825.44374-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock updates for 6.3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        conor.dooley@microchip.com, linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com
Date:   Wed, 25 Jan 2023 12:03:36 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2023-01-19 03:38:25)
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.3
>=20
> for you to fetch changes up to 80519d8ccc6b65bfbc8571ea16992141d71510e9:
>=20
>   clk: at91: do not compile dt-compat.c for sama7g5 and sam9x60 (2023-01-=
09 14:05:41 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
