Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C04C432BE
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 08:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 748B761019
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 08:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbhGaIA1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Jul 2021 04:00:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229703AbhGaIA1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 31 Jul 2021 04:00:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3366560F94;
        Sat, 31 Jul 2021 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627718421;
        bh=SN+1kRVrZjrEwupZ5IzY4aUxZJ0yQ++l4f6CDcEeOLE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vIKV668DBuSFQiFPK8s8F1GezhtiabdYgkG2xfpi1Yl5J2JmW6sXStMuL8A3X+vVp
         /vEE5ykaNkiJ6MGRIYSBOL1ueB0tdZ+c/afXInMvJ7F7vNggVxjRYIePw9224n8m1S
         Vxd5SLYMGkYJKhknNe1cMvteehvBZyZ9Ulr6jRRjIG3P8O5mMyRiB5DcPkPyzz3RkX
         n6V8buUh4rwU7jBkzIjmcdu6dGYZ1SMwb+sc1+T8FNxbCiMFJvQOEJSweuNP4rvRLU
         MAno4bpfQSokLZqORzYeSWfNhsDOHhPIMp+nYmIySMSuWHXCndLt7Mxd4RqcORuBRY
         eXZTuGuU8xuQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1627652021.git.geert+renesas@glider.be>
References: <cover.1627652021.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.15
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Sat, 31 Jul 2021 01:00:18 -0700
Message-ID: <162771841892.714452.7462427338622077163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2021-07-30 06:44:42)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe=
0c:
>=20
>   Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.15-tag1
>=20
> for you to fetch changes up to d28b1e03dc8d1070538ca3ea3f4e6732109ddf42:
>=20
>   clk: renesas: r9a07g044: Add entry for fixed clock P0_DIV2 (2021-07-26 =
14:15:23 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
