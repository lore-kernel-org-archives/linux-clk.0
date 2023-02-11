Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6591CC05027
	for <linux-clk@archiver.kernel.org>; Sat, 11 Feb 2023 00:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjBKAwm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Feb 2023 19:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBKAwm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Feb 2023 19:52:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB567E8C0;
        Fri, 10 Feb 2023 16:52:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 075DCB82657;
        Sat, 11 Feb 2023 00:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A137C433D2;
        Sat, 11 Feb 2023 00:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676076758;
        bh=D49sgUgNLNWlzLq20NRbDWd+naxD5xg3/gh6XeOqQdQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ezIYBNWxvGlxjgjxs6/gVS9z7elFP9vZFoz9LoYnRMQhJHmBjmp4XbP+um4OtooER
         obAOz7AYif362RhprGvM2PUwT0ik2CCn4ebZ6WG48xGYbDu1FX1Gko8n/ISXVhxXU8
         4aW49heEjAvg1ubW2yvuUcT1PBS8R3INHp3SLHRyxjsIBL9SaB9PD2ZzAxwpMMyC92
         2HrNMn83EkZ5tPsqyvNri1XT40YQfGEn4jcoiocftUM+FZpmQlKSzxOpv3j0sFKiCP
         oh8wUqsfsD9fl0y2FoqRVxCmOiikYKTOASRYVz8ue2ENW3C+CqTRukg3H1iDLAkhu+
         jMnwZLQjsQx6g==
Message-ID: <47e7fa4c103d08374d071fdf6de3b8ca.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230131160829.23369-2-ansuelsmth@gmail.com>
References: <20230131160829.23369-1-ansuelsmth@gmail.com> <20230131160829.23369-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: gate: Add missing fw_name for clk_gate_register_test_parent_data_legacy
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        kernel test robot <oliver.sang@intel.com>
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 10 Feb 2023 16:52:36 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Christian Marangi (2023-01-31 08:08:29)
> Fix warning for missing .fw_name in parent_data based on names.
> It's wrong to define only .name since clk core expect always .fw_name to
> be defined.
>=20
> Reported-by: kernel test robot <oliver.sang@intel.com>

What was the report?

> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-gate_test.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/clk-gate_test.c b/drivers/clk/clk-gate_test.c
> index e136aaad48bf..a0a63cd4ce0b 100644
> --- a/drivers/clk/clk-gate_test.c
> +++ b/drivers/clk/clk-gate_test.c
> @@ -74,6 +74,7 @@ static void clk_gate_register_test_parent_data_legacy(s=
truct kunit *test)
>                                             1000000);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
>         pdata.name =3D "test_parent";
> +       pdata.fw_name =3D "test_parent";
> =20
>         ret =3D clk_hw_register_gate_parent_data(NULL, "test_gate", &pdat=
a, 0,

We don't pass a 'dev' here, so the pdata.index isn't looked at. I
suppose we can assign .index to -1 to be more explicit, but because
there isn't a device used for registering, we won't try to use the
.index. Instead we'll try to use .fw_name for clkdev, of which there
won't be a clkdev lookup either. Eventually we'll fallback to the .name
lookup, and it will be fine.

We need tests that exercises the 'dev' path and also the DT path and the
clkdev path. I was thinking about working on that outside of the gate
test though, and just having a generic clk test for that with simple
clk_ops that do basically nothing.
