Return-Path: <SRS0=TK4h=C6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F31CC4363C
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 20:52:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D602395B
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721534;
	bh=caz+2H2w7wsl/UXxZawljT6slmiD8Hkcm44uMUYbu8s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=n7shC6V6wp8QpMeWgyqDFbeByhxh2I9sBh3xhO9wP9xt/04UCre7jArOTrRxcGmEK
	 FDco0AdCy4CHMSywtHuHNXXbYLfpTdXpiOPyOa0daaaAniU0dvZ2c70XJT/oHGjeuG
	 5DQTTeN8i2UGuQJccwuMhNDaL2yyINoNkE+1nIbU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgIUUwO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:52:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727808AbgIUUwN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Sep 2020 16:52:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5234E238E2;
        Mon, 21 Sep 2020 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721533;
        bh=caz+2H2w7wsl/UXxZawljT6slmiD8Hkcm44uMUYbu8s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iTc6oy1GIyiCkxQr/YO+/rVQlFP285rKfLmhOyVUXk4nqg6dsdZdstwJCKKbsl/2x
         wPi+F1p9fIi2vfeWqWCmNntTjG51FV9VN0X1SJ9wVhLVCx3E4XMrXMf5Lk3vu5dXsm
         YCwbn55P6Q2MvModwxgQFLUeMHfvP/c846rpvmK8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918124819.15652-1-geert+renesas@glider.be>
References: <20200918124819.15652-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.10 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 21 Sep 2020 13:52:11 -0700
Message-ID: <160072153199.4188128.14560622973384403988@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-09-18 05:48:19)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e41cb217932969a20cea9c44299c449236058e=
43:
>=20
>   clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r) (2020-0=
9-04 09:42:01 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.10-tag2
>=20
> for you to fetch changes up to 15d683e61bdded719e6202fed2c7401f4dcd95ab:
>=20
>   clk: renesas: rcar-gen3: Update description for RZ/G2 (2020-09-17 15:32=
:25 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
