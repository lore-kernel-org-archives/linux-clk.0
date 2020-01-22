Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA25C2D0CE
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 00:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BA9624655
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 00:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579651911;
	bh=EIpwquWNrAe0Mtsm6fBObrPGhp5j7Siw39D+6l/OS5w=;
	h=In-Reply-To:References:Cc:To:Subject:From:Date:List-ID:From;
	b=x8Zacr4v0LyboNoT2WcJZE0VkyTtShZ/av4N/hu7UjzV1VGYvpK5L1NguzGZ5gWXb
	 ax4zKZI7ia2oMsRp5FfO7zHZGDfQERpeLfmfh5duRTFcX33DaK6DIQfAEKSD47MuIj
	 SeyBNNhgVokLPozUxpca1l4xQuZyWJdbzQMCuwHk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgAVALu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 19:11:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:57814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgAVALu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 19:11:50 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C4622253D;
        Wed, 22 Jan 2020 00:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579651910;
        bh=EIpwquWNrAe0Mtsm6fBObrPGhp5j7Siw39D+6l/OS5w=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=AHiwvSiSslTthdBt/+ysJZHg9bQJn47JWnRjjjwmZYrZIf0jgAkj4jJf8aZc364hg
         G3iZILTa4DbHBLIz2KeIOL0PDQiCcxGxywaxatZew8XgQxNM14Bs5NRNAytZ7hGg3J
         s08uPEvhTpgkvbjVGdi//6/FqAnCi4NBQWE5Ry8I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cf293816-3ef7-4b67-bd9e-be2e88bfa950.lettre@localhost>
References: <cf293816-3ef7-4b67-bd9e-be2e88bfa950.lettre@localhost>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.6
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 21 Jan 2020 16:11:49 -0800
Message-Id: <20200122001150.1C4622253D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-01-10 09:11:42)
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.6
>=20
> for you to fetch changes up to 9c232d324bfa1bb6204f6c2c5e1bea12c51cc6bd:
>=20
>   clk: sunxi: a23/a33: Export the MIPI PLL (2020-01-04 09:45:19 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

