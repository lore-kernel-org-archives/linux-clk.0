Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53581C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 00:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiKWAqZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 19:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235330AbiKWAqW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 19:46:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD74D5A29
        for <linux-clk@vger.kernel.org>; Tue, 22 Nov 2022 16:46:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC7F4B81DDD
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 00:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACC3C433D7;
        Wed, 23 Nov 2022 00:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669164378;
        bh=gIMCV5gyT82yo+HFsfNWftEXriutUyJ7+qmBzFZ0BtQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CGMcUF9fMBAnJr1a0WmP/VzoxkRdQW2w96cnH5ZILXr/w+9A0pathMZK3ek3l6f2v
         kdSnXtodj+d8VuWzM73cRwbxpwvEVGqoiNegvbsiwL5rAtxlAGm0Prx3GTFJDfl7Ru
         RelQN5ackBF2dlWQpQMIu7pJJQ3MaN+1iUUBZTKoOeWfI0yzLbRynT7AMHf8DA5Nuf
         0++Rc4a3FgSWRePLsvL6Sy45hu+zYa53Iql8YsieDrHsH3/Ua5dfIlHAsP3x83ZPT3
         RH4gH2R/HxV+UGOsLg9iNm67w/PZ9JQQZCg4RO0RoFle9Q2MQevuMsH9W83Og6Xmuw
         lIHD8wZVJAuag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221118131414.301703-1-claudiu.beznea@microchip.com>
References: <20221118131414.301703-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock fixes for 6.1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        conor.dooley@microchip.com, linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com
Date:   Tue, 22 Nov 2022 16:46:16 -0800
User-Agent: alot/0.10
Message-Id: <20221123004618.9ACC3C433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2022-11-18 05:14:14)
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-fixes-6.1
>=20
> for you to fetch changes up to 57976762428675f259339385d3324d28ee53ec02:
>=20
>   ARM: at91: rm9200: fix usb device clock id (2022-11-17 15:35:52 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
