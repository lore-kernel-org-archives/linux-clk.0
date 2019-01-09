Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D134C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 19:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3090D214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547063140;
	bh=0+uopRbkH5Rbfc67bi8QdrqvasHZcYbqIajLo1L7SEQ=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=LN1C1+ElG0UCXBSQZlAqDVzr3LCixv9xqxzA6vrTJJk9HVImDGToJjv4C7XzY8PKO
	 A4zHsHGf3MgQZrtrbqWQxAqZGe7MHFR3ai2zI5DjxSPaXfLcKn0ifeeA74C7mZg/Jc
	 rwG4KK7RR8hQFYL68eM/o7kRCUnoZXcfxtdmEKBY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfAITpj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 14:45:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:41522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728151AbfAITpj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 14:45:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD42A20859;
        Wed,  9 Jan 2019 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547063138;
        bh=0+uopRbkH5Rbfc67bi8QdrqvasHZcYbqIajLo1L7SEQ=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=GVN2/odYuRKIUnsM4cVkAyN96qBRE5/eRcaQeLiYYyQQ074FSG5CUuW1I59gn8GXZ
         QRaSfi40ajgJuJB3tVW817ZRPNMXaaefFi5K/P67eMW8Dkjn9itJnRT1Cu+PcUT0Lx
         YgK8s33dMChIWg3QfB3zxMf7BBbTPyuv/14ae2B4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [bug report] clk: ti: divider: add driver internal API for parsing divider data
Cc:     linux-clk@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>, t-kristo@ti.com
In-Reply-To: <20181217144553.GA11066@kadam>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181217144553.GA11066@kadam>
Message-ID: <154706313779.15366.12078258980663060364@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 11:45:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2018-12-17 06:45:53)
> Hello Tero Kristo,
>=20
> The patch 4f6be5655dc9: "clk: ti: divider: add driver internal API
> for parsing divider data" from Feb 9, 2017, leads to the following
> static checker warning:
>=20
>         drivers/clk/ti/divider.c:491 ti_clk_register_divider()
>         warn: 'table' isn't an ERR_PTR
>=20
> drivers/clk/ti/divider.c
>    468  struct clk *ti_clk_register_divider(struct ti_clk *setup)
>    469  {
>    470          struct ti_clk_divider *div =3D setup->data;
>    471          struct clk_omap_reg reg =3D {
>    472                  .index =3D div->module,
>    473                  .offset =3D div->reg,
>    474          };
>    475          u8 width;
>    476          u32 flags =3D 0;
>    477          u8 div_flags =3D 0;
>    478          const struct clk_div_table *table;
>    479          struct clk *clk;
>    480 =20
>    481          if (div->flags & CLKF_INDEX_STARTS_AT_ONE)
>    482                  div_flags |=3D CLK_DIVIDER_ONE_BASED;
>    483 =20
>    484          if (div->flags & CLKF_INDEX_POWER_OF_TWO)
>    485                  div_flags |=3D CLK_DIVIDER_POWER_OF_TWO;
>    486 =20
>    487          if (div->flags & CLKF_SET_RATE_PARENT)
>    488                  flags |=3D CLK_SET_RATE_PARENT;
>    489 =20
>    490          table =3D _get_div_table_from_setup(div, &width);
>    491          if (IS_ERR(table))
>                            ^^^^^
>=20
> NULL is actually allowed here so we can't just change this to a check
> for NULL.  Prior to this commit if the:
>=20
>         tmp =3D kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
>=20
> allocation failed then table was PTR_ERR(-ENOMEM).  I guess we should
> change it back.  We could probably do sothing like the diff below?

Patch looks fine to me. Are you going to send a proper change?

