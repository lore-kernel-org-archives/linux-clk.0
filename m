Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3947EC2BB48
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 21:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0614E221FA
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 21:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgLGV1D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 16:27:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:36456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbgLGV1D (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Dec 2020 16:27:03 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607376382;
        bh=UQLaibMgpyMvr32nuqQHPcu4qUSJSpj3TApSORzRpYM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sCKOZGQwawg3hHnN1AVHz3SbrWRy8TX0HURsSa/VyKUp7STCV4N3sHzb7F01I4QAU
         Qk60siVJfyCj+cIIj4uAx/ikffa8ZUO2+yx31fosBbBeTqRy/qQtTL9mvXl6o6G2wo
         a7qqW2cqvDxfB35Jihuc1rVa5XqaXXcvzOFVIX2llvuPkpro5CyThPXEsE6M62kkvw
         Wr9Zaf2sBn+DIJ0oudWm0dGr1fTjNMXLHg2tsEQnegodGBHOi83iLFA5cE9pXk99BQ
         RR9h147N+z3JOgR2KlRVLSw5jOEL3ZXu11tFOFvqzIgiKBX5wCgapZfZBAB74KIQiu
         oUVLz4YtiT4CA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j360kp1zh.fsf@starbuckisacylon.baylibre.com>
References: <1j360kp1zh.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL RESEND] clk: meson: amlogic updates for v5.11
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Mon, 07 Dec 2020 13:26:20 -0800
Message-ID: <160737638080.1580929.6951606729739105639@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-12-05 10:00:18)
> Hi Stephen,
>=20
> Here are the updates for amlogic clocks for v5.11. This is based on your
> clk-hw branch, instead of the usual rc1, since it depends on clk_hw
> stuff you've already applied.
>=20
> Hopefully I got it right this time ...
>=20
> Please Pull.
> Thx.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit e6fb7aee486c7fbd4d94f4894feaa6f0424c17=
40:
>=20
>   clk: meson: g12: use devm variant to register notifiers (2020-11-14 12:=
58:31 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.11-1
>=20
> for you to fetch changes up to 88b9ae600138baff18c7f4c4870622584acc6111:
>=20
>   clk: meson: g12a: add MIPI DSI Host Pixel Clock (2020-11-26 15:25:20 +0=
100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
