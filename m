Return-Path: <SRS0=96bN=W7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223AFC3A5A9
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 18:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E44E1206B8
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 18:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567621039;
	bh=3jHminz3YdT9MdadS5kKTfIqy3pQoGEAUZ8tniXD4rg=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=JFj34h9X9Egax5e/qQslcUKLThEP3xWEu+kroEtoW4ob4cIC03iH1zpK96yNpF1qJ
	 twsvMNnMAGGn5tS5UrrAJPvXVMJGQ9FO46+zZ2Fga6wrxJictM1SRKGookuz2i2iqg
	 89E1XEGsfGveCSFYcqdACI9LX/rn2oVALrqWeceo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390016AbfIDSRS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Sep 2019 14:17:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:57898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389864AbfIDSNM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Sep 2019 14:13:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFD1F208E4;
        Wed,  4 Sep 2019 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567620791;
        bh=3jHminz3YdT9MdadS5kKTfIqy3pQoGEAUZ8tniXD4rg=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=tqLtGOc0E3SNT83XMp9Lg1zsznc2P+WpNwm5rt3a2bxqqH3OpbnHbmVPEUVjkEjz3
         JkvEgelijBohZ/unci0YvEilG9IUjAW5hJXL4yOXZjnneFZmsyGNakp+EH0Ckih3D4
         j9bCKqTFh5bPSc4qttV6Z0VYExFpq2HJAprbd7IU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190825115505.GA20454@X250>
References: <20190825115505.GA20454@X250>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX clock changes for 5.4
To:     Shawn Guo <shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 11:13:10 -0700
Message-Id: <20190904181311.BFD1F208E4@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-08-25 04:55:06)
> Hi Stephen,
>=20
> This is the i.MX clock changes I collected for 5.4.  Please help pull,
> and keep commit 6ad7cb7122ce ("clk: imx8: Add DSP related clocks")
> stable, as I pulled it into my DT branch as dependency.  Thanks!
>=20
> Shawn
>=20
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.4
>=20
> for you to fetch changes up to 760e548e7f885d89bf2dfab4838df9379edd19fc:
>=20
>   clk: imx: imx8mn: fix audio pll setting (2019-08-24 21:04:27 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

