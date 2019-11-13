Return-Path: <SRS0=K/Jc=ZF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594B3C432C3
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 20:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C785206EC
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 20:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573678123;
	bh=cr9JMVegJx1oJynsuDAElAURTb0vNtKWI9b3GvC/J2Y=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=j1WBK2LsJkxZC1UU4i0uYlnI1Oi0BO/76K5RsMQ6Wl4//kkUftxWYoaXz/kkZ9Q97
	 ScjNQaqlY08bAKVe4bB0kFiz7gsH+MdjexAJpUbndNYd57aVDH0LVmJseZo2is39nr
	 odqzE0dlRF6SfCsFwSfDmkZsVG3bGKvR88ps1uKE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfKMUsl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Nov 2019 15:48:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:55890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMUsl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Nov 2019 15:48:41 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA7BE206CB;
        Wed, 13 Nov 2019 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573678121;
        bh=cr9JMVegJx1oJynsuDAElAURTb0vNtKWI9b3GvC/J2Y=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=hQdYxShn5pxruV9NXfokGFMUb8zaCN14jjz/I2zsY+13NPYw+L1GUVH4m/d9xw32e
         SWA9SFTwsc7aOcwgIxD786gLeUNYM6TXXVI3TgKaHNM9r5Nr8xSSrBMyqXilBsPUIC
         1SX95jAo9olQ9/QDYSek0kyQiL/4sm4HMZGMJP6Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2139639.gTPWsosUxc@phil>
References: <2139639.gTPWsosUxc@phil>
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Rockchip clock updates for 5.4
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 12:48:40 -0800
Message-Id: <20191113204841.BA7BE206CB@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-11-10 16:45:05)
> Hi Mike, Stephen,
>=20
> please find below rockchip clock changes for 5.5
> Please pull
>=20
> Thanks
> Heiko
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
v5.5-rockchip-clk-1
>=20
> for you to fetch changes up to 3b0b4ebfd761943179fe03b107f66c72c3b5c8d4:
>=20
>   clk: rockchip: protect the pclk_usb_grf as critical on px30 (2019-11-05=
 20:53:42 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

