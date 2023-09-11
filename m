Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99186CA0ED2
	for <linux-clk@archiver.kernel.org>; Tue, 12 Sep 2023 03:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbjILDQ3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Sep 2023 23:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241726AbjILDQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2023 23:16:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B281410459F
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 19:07:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559BEC433C7;
        Mon, 11 Sep 2023 20:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694465406;
        bh=2b8SGAE21odM9DkLgO7tG0F/Bh3n74Ew4ALGkLao9HY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tJTE8spMApaF2UOyoodztKt3ja+TUu1x2pUCSAdXF+otCk4g2xtCKq+kPIlJZa569
         ltc8Ao7tGX3Uf59oYQO7eFHOxpT2m133eWbCW9dK/GIzx3IJAC+zC8WugLauIYiMvo
         489fnB9ONdPE9JDTxrC4TcjwH+1b4MIeSaE6YEb4kX28/WwnJKLiddZLsLbSqEeOJ1
         eUZ4OLIhoExHzlzigD7LgTWIbL8fB3AjHvfDeoGkkewzM8CCNgoL2LG5uiV8GzkLK+
         Z6mZ/qS+Qpbm6xj+72VOTdsQoUoa5XhY9jTdjTpX7a3pUQqHjjjG6AMfhUR2o5kh8D
         pmekDETZgM6Xw==
Message-ID: <9434b9e6b7f60c308df5b1f28edbbe5c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230831181656.154750-2-marex@denx.de>
References: <20230831181656.154750-1-marex@denx.de> <20230831181656.154750-2-marex@denx.de>
Subject: Re: [PATCH 2/2] clk: si521xx: Fix regmap write accessor
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Mon, 11 Sep 2023 13:50:04 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-08-31 11:16:56)
> Rework the write operation such that the Byte Count register is written w=
ith
> a single raw i2c write outside of regmap using transfer which does specify
> the number of bytes to be transfered, one in this case, and which makes t=
he
> expected subsequent write transfer look like address+register+data, and t=
hen
> make use of this method. Without this change, the Byte Count register wri=
te
> in probe() would succeed as it would provide the byte count as part of its
> write payload, but any subsequent writes would fail due to this Byte Count
> register programming. Such failing writes happens e.g. during resume, when
> restoring the regmap content.
>=20
> Fixes: edc12763a3a2 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C=
 PCIe clock generators")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-fixes
