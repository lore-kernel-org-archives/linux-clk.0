Return-Path: <SRS0=DzNW=5K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D2C54FCF
	for <linux-clk@archiver.kernel.org>; Wed, 25 Mar 2020 02:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2656C20740
	for <linux-clk@archiver.kernel.org>; Wed, 25 Mar 2020 02:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585103922;
	bh=REPPFvmAWeExSkY2NpzUI6zxo6aH5C1vRO5zrdUrnx0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=J3jEOyaWhi9ecbj2zTCWQZI2v8RogEIyttyyyTL1nKWInIY4ZtSTkWmf6G3GKKWGo
	 XfurrxZEq8fQ9SwEooYhbnRtHlG+J/4FEkxjXBvXVjoKMiLlPpM6FYekEaTB0Qfjyh
	 LftTxLwBfDD2vFDJL78DFyLxT728HcOyuU0eDtwE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgCYCil (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Mar 2020 22:38:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727262AbgCYCil (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Mar 2020 22:38:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DD8B20724;
        Wed, 25 Mar 2020 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585103921;
        bh=REPPFvmAWeExSkY2NpzUI6zxo6aH5C1vRO5zrdUrnx0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y0t3+bjTgmGfefRowdnStqQvqnUvz8jJU+N/Ly3V1x9mhvlL7LjZfygLAmtuI9yzp
         XytbQ5C5Hh6j3ke5Jl5QLQ8IKI1a1f6+rxlxwp1kqKkNeu5RHQDyWh4SFEkcnsRnX2
         j2hrDSxTP3xMrxHvfrq4lWdgtN/o1QWTFN4Fq0rI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200316064322.GI17221@dragon>
References: <20200316064322.GI17221@dragon>
Subject: Re: [GIT PULL] i.MX clock drivers update for 5.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 24 Mar 2020 19:38:40 -0700
Message-ID: <158510392026.125146.1277266093057110288@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-03-15 23:43:23)
> Hi Stephen,
>=20
> This is i.MX clock driver update I collected for 5.7.  Please consider
> to pull.  Also, 16e71d4da799 ("clk: imx8mn: add SNVS clock to clock tree")
> was pulled into DT branch as dependency, so please keep it stable.
>=20
> Thanks!
>=20
> Shawn
>=20
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.7
>=20
> for you to fetch changes up to b5881e8019e0d39c43a2da56c4ae616a50615e00:
>=20
>   clk: imx: clk-gate2: Pass the device to the register function (2020-03-=
16 09:38:30 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
