Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40670C7EE22
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 21:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjEJV1V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 17:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjEJV1T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 17:27:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7A42711;
        Wed, 10 May 2023 14:27:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 06232640AC;
        Wed, 10 May 2023 21:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C78CC433EF;
        Wed, 10 May 2023 21:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683754037;
        bh=CAyv81d+tAIxrI/12F3v0y8IbDlYx5tJictm0wCSQZA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q6yKzZaJBjcXmx07schORKHFVnj7njMn1XldKwgkDxL6KXyhCXaARSB6A1UXrf4OL
         U+vFJQqtdx31nYuLC5K3UROytqCFtERe4h5KgAsj0mxszrivJ73vfNd6KlwU9bH4zb
         MxCw5+nsgOLo1sQn9roLKOI2XmFq+AfURDIYMigmjvbAGCcnA1rJkz63rsf1ioSaP6
         /WPUVlKFPkszuXtyuUt7EIoP75qiRE+pZ1VH6+/8A/Vz56210a6Lc2PGVnjDfjFg8m
         9w4gZD8Hu2cf8BP2CHaLfecULR60Q0juKXjXxGrX/PXt9MTo0wFFMkgHs/1Nh06mOW
         wk3QhZvEJTwcg==
Message-ID: <817a2a01770e9a90317ad3f81219ca43.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 1/3] clk: vc5: Fix .driver_data content in i2c_device_id
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-renesas-soc@vger.kernel.org
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-clk@vger.kernel.org
Date:   Wed, 10 May 2023 14:27:13 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-05-07 06:39:04)
> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
>=20
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible =3D "idt,\([^"]\+"\), .data =3D \(.*\)@"\1, .driver_data =
=3D (kernel_ulong_t)\2@'
>=20
> Fixes: 9adddb01ce5f ("clk: vc5: Add structure to describe particular chip=
 features")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next
