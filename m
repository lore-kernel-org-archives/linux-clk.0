Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48819C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6461208C7
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604538357;
	bh=GGuaK/Ot5YtcJjRZ8WQiVH2qoBPN5mXyJAlJ9l9r7K8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=G5x16Sgw6FCAUB/8KvKBn5eH/uGZzDxleIovsyivKNu4XubQotXSYpGWBRpoKYNL/
	 Xm66jiqdVcZN9UNOfM/KanG9kPKPkUppLK+L+KdCX7BH/sgEhHDd+qunaN6VBQ7JYP
	 dWNOlmZJ8LjFlI5XJHOYgqdOmOFhwu/F7azRCrPs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388068AbgKEBF4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:05:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:55440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgKEBF4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:05:56 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 945DE20867;
        Thu,  5 Nov 2020 01:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604538355;
        bh=GGuaK/Ot5YtcJjRZ8WQiVH2qoBPN5mXyJAlJ9l9r7K8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vKh4T8R/iUeENsd5H2wkJ4kZ6Nb93s7Q6100uSD5qocmJHUprRIPHvYcXO7whwYH0
         BCfAw5P96xkEPcopVq0boQOn1w5vWFJrH4nngAx2+iJ/4ygUaf2QtvVgVOYOWgrCEJ
         iV9hW3XFBRCwu8loJn9c/VUbnVanXrhTwtroh1Y0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604402306-5348-5-git-send-email-abel.vesa@nxp.com>
References: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com> <1604402306-5348-5-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH v5 04/14] dt-bindings: clock: imx8mp: Add media blk_ctl clock IDs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Adam Ford <aford173@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 04 Nov 2020 17:05:54 -0800
Message-ID: <160453835430.3965362.15050022321038301001@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2020-11-03 03:18:16)
> These will be used by the imx8mp for blk_ctl driver.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
