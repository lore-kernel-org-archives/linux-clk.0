Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3DCC001B0
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 23:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjGSXk1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 19:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjGSXk0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 19:40:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D5910A;
        Wed, 19 Jul 2023 16:40:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFDF061856;
        Wed, 19 Jul 2023 23:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9CEC433C7;
        Wed, 19 Jul 2023 23:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689810025;
        bh=ZNL8TFy0BLJ1xs9ikWwNmyuOAwjZW5vrMEww1YaR+v4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LULCTci0a4jJATGsmB98OnwuNbM7yH9N9833aRu1xHrx8sWSpxU39gWCv4NC/3AMR
         ZFErZTPr+p4v0x6aic8Y5f3KPqHTujr3z7n3aIqNu4XEOml8HfJbdWJnizuIG7PXKP
         obdBF1H1zXHfIwT1S3y+ILvFDE5Yva/xsZDsB+iR2NgyYRjDrWpfv7Uovj/8ji1h4v
         ybQAhuRjp6b25QhL9h3fLohrhFcSE80HtW5HRey5gmFbfen8cC2jxTyRM1ozSaTAY1
         SYuLSPgxcfV8CBfuszpCSUKRLmx6FdwRcjhZ79fjKf1ij3ofi5dFBmJ1kKq1QC/Sgv
         YzjWVURH2Q3xA==
Message-ID: <d09aab276a50ae450bba019b9f0cdd1e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705171000.85786-3-biju.das.jz@bp.renesas.com>
References: <20230705171000.85786-1-biju.das.jz@bp.renesas.com> <20230705171000.85786-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v6 2/2] drivers: clk: Add support for versa3 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 19 Jul 2023 16:40:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Biju Das (2023-07-05 10:10:00)
> Add support for Renesas versa3 clock driver(5p35023).
> The clock generator provides 6 output clocks.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next
