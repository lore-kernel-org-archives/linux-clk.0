Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE7AC04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:22:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA8E4206BB
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559841732;
	bh=1AjvWgz8cnWvQFq4o6RvdCfmRcXAyUoCZKFQsjPyZi0=;
	h=In-Reply-To:References:To:Subject:From:Cc:Date:List-ID:From;
	b=fe9P8tnWHcYVyFA9aQvntN3ECdP6N68/Yx2vB+E5hwXNRTjJBGXIo0lgouPQ5E7Dh
	 daPQ7GJl3hHUg6y40YS+L3cAr8sGBEFB7nmdkZtTFHIpKmt0WGcsnyhckQs19hUTMF
	 cETHCoWzuiQ/FeAPXAAZxNib10XFZ6O2evuJrYYg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfFFRWL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 13:22:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbfFFRWL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 13:22:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B3F82083E;
        Thu,  6 Jun 2019 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559841730;
        bh=1AjvWgz8cnWvQFq4o6RvdCfmRcXAyUoCZKFQsjPyZi0=;
        h=In-Reply-To:References:To:Subject:From:Cc:Date:From;
        b=N3ypeV9TX+LXXjQYzKmGX/BUZ4H6eJl9o+GwKvqLX9piKcVk9GUVMR48XUtMwGTz0
         4w5HUsv3apA2ALQdDjHwYQicYQG/hQQNly13X5zWDT7R2aJGGnOKEN7OsYXu2AHv7B
         DYMEkkxFdj1lO0Njmnm2vxpS6PHa3DwqXDm971lA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190606164443.6991-1-festevam@gmail.com> <20190606165546.6675520693@mail.kernel.org> <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 10:22:09 -0700
Message-Id: <20190606172210.7B3F82083E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-06-06 10:15:32)
> On 06.06.2019 19:55, Stephen Boyd wrote:
> > Quoting Fabio Estevam (2019-06-06 09:44:43)
> >> Use devm_platform_ioremap_resource() to simplify the code a bit.
> >>
> >> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> >> ---
> >=20
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>=20
> An extremely similar patch was already submitted and then reverted=20
> because it breaks boot:
>=20
>      https://patchwork.kernel.org/patch/10908807/
>=20
> I tested and this new patch also breaks boot.
>=20
> The current imx8 lpcg driver maps entire subsystems at once and if=20
> devm_platform_ioremap_resource is used then devices inside the subsystem =

> will fail to probe, including lpuart!
>=20
> The hardware on imx8qxp and related parts (imx8qm) has multiple separate =

> LPCG blocks interspersed between devices. Some refactoring patches were=20
> posted by Aisheng to split LPCG into multiple blocks but apparently got=20
> stuck in review:
>=20
>      https://patchwork.kernel.org/cover/10924029/
>      https://patchwork.kernel.org/cover/10824443/
>      https://patchwork.kernel.org/cover/10824537/
>=20
> There were some disagreements regarding DT bindings for split imx8=20
> clocks, what would it take to move those patches forward?
>=20

Don't know. I'll have to read those patches on the list and reply there.

