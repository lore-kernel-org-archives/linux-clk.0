Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B037C38A2D
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 01:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbiJ0BK7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Oct 2022 21:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbiJ0BK5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 21:10:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CFD63F00;
        Wed, 26 Oct 2022 18:10:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73254B82399;
        Thu, 27 Oct 2022 01:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A99BC433D6;
        Thu, 27 Oct 2022 01:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666833054;
        bh=VWd30oTwyvksTyVTDfeh8V7aHOOQT63px8KLQkTs16E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eaOg2N9g35yQVZhra08R53L9zVHS2DxpWyW7JcFXfjxZGQ0BDX8EV445XSeSkDI7O
         hGFkJr820P+6lWhWtPN2AaX62EQI6P17hBz+QUrMESnQm46N4wr8XK3+g9MPlrRebB
         08rwlZwgY5sUuENnw6Wfuh/DdrCU2UOTTyJurn++1v0k+rtp8x/5J+AUcF1ZG12oUP
         JOPjRKOB1eyvY3BUxFdKPkcyiPOyEhiiDYzEChamz2s75N8O3eGQveYuzihtPMuaba
         GL3xGF6iYtkbUeC8d+x0BHot7z3u/UAMbA6vW0rVpaJ5/G9LrdN53SnDhE5kamkqS/
         zVWsbd8XL5M8w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221019152947.3857217-3-arnd@kernel.org>
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-3-arnd@kernel.org>
Subject: Re: [PATCH 02/14] ARM: davinci: drop DAVINCI_DMxxx references
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org
To:     Arnd Bergmann <arnd@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sekhar Nori <nsekhar@ti.com>,
        linux-arm-kernel@lists.infradead.org
Date:   Wed, 26 Oct 2022 18:10:51 -0700
User-Agent: alot/0.10
Message-Id: <20221027011054.0A99BC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2022-10-19 08:29:28)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Support for all the dm3xx/dm64xx SoCs is no longer
> available, so drop all other references to those.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
