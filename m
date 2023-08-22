Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55C6EE49AF
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 20:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbjHVUMa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 16:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjHVUM3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 16:12:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BD5CC;
        Tue, 22 Aug 2023 13:12:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ADEEE634C3;
        Tue, 22 Aug 2023 20:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB6EC433C7;
        Tue, 22 Aug 2023 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692735147;
        bh=TN1H8gUyaETFAyGrWUwEMZDyuYdbnn/nYeCVjIIESkg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FUGegvpmxDBtJJvwjxxCR3x0yvwHivZPxPz9P5hwtCPEmldFkBJqa3mroaSoPH/vp
         GjhbA75tjyCFtcA0p55VkT0uivl/1pBp/ZWlAR7ivsl8f5CbVqLOMn16iPaul4dOgr
         SM7ZBCzfehUNTR/ss0VFziSszIlYYOh2DIchCpS1ynv9vVhGcntdcXyR5d0hgCjIoq
         slgDWbuAD3tmwIw325JK2B8VX36PpEnEN2lLED44I45BJqWcxUVkeoGiEGBQkk22uW
         VbI+6goPtC6w/icV1lrDXJ1xG/ktyZeYsf+hmHVuB4XIrhfR5VVj4QbwVqU7CHU0LH
         0Q2hVrvhmMvsg==
Message-ID: <c14eb42b2b0642f520e33626be9e499d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230721070019.96627-2-biju.das.jz@bp.renesas.com>
References: <20230721070019.96627-1-biju.das.jz@bp.renesas.com> <20230721070019.96627-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] clk: vc5: Use i2c_get_match_data() instead of device_get_match_data()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Aug 2023 13:12:24 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Biju Das (2023-07-21 00:00:18)
> The device_get_match_data(), is to get match data for firmware interfaces
> such as just OF/ACPI. This driver has I2C matching table as well. Use
> i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> matching.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
