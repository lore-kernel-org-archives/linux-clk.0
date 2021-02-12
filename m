Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D873FC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 03:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B020964E3C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 03:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhBLDXD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 22:23:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:54792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhBLDXC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 22:23:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67B8864E36;
        Fri, 12 Feb 2021 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613100141;
        bh=hyBpi+ClYaKPnvkR/kK7oGVApwvlgIkGzdJrF1paRyw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KV2Qp2Er2HPCU9by/u8CJYJy+0sJZIrVb7lyFTaB79IUvdZL6wZGcDxVngoc/XV76
         x0a0hBjI7ch56ewjxbbTUI+LF7p0uL4bfWF7TFywcP4KbbFEdcMpsuEGqve/fsCcaI
         hNH3S6vDtn4DRMXQBas8tlA8OcKz9IeF1durVB4clPduQTy1PgDxNba2UP+L4sI6/I
         +8+Dr/soAcwls8Ow3JdF3BFRVKbHFI10cDyryFJ6JwBULj+Dn6+vUJBvfhiHpNOTBb
         Ql9HYXUC3FJPc7RVNkLtGvPeNozh/2M0iSSj2MNHBNcOUPcH99sFA8zo0HnuDx18jT
         TrtW3EoaHtGGQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210105123028.GA3409663@localhost.localdomain>
References: <20210105123028.GA3409663@localhost.localdomain>
Subject: Re: [PATCH] clk: BD718x7: Do not depend on parent driver data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Date:   Thu, 11 Feb 2021 19:22:20 -0800
Message-ID: <161310014002.1254594.7610815155009256091@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Matti Vaittinen (2021-01-05 04:47:54)
> The bd718x7 only needs a regmap from parent device. This can be
> obtained by call to dev_get_regmap. Do not require parent to
> populate the driver data for this.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---

Applied to clk-next
