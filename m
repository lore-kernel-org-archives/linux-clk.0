Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA27C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD1F720836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781859;
	bh=5yQhSBabw2eOAgliUMzLrkIhxkqZBQdNeRy3D3awaLQ=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=vYN3W3x+aSRxR+jx198B4plNks0pjAVywKNJ7JiIZEadomqD/TDDoLLQ6Rq1CWaLa
	 2loTSeRLbm0YI5qUUDdDq3FNj4ZOTS7Y3ZNPINloxWRi3pmM1WZgFAFnAKgNwYf9lP
	 0vNnH3kWTuef1EobHTPAGxis4MynUxxOLdEa2cEM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfBUUoT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:44:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:45338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUoT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:44:19 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6688206C0;
        Thu, 21 Feb 2019 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781858;
        bh=5yQhSBabw2eOAgliUMzLrkIhxkqZBQdNeRy3D3awaLQ=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=hP1yHl0q4c95LO9ofSitKsQSpo/Vf+zkXgmRDkKPemY4uM8UqNb8j73hn7XiBdll+
         WYpZugKspUncC24hkHOahmKFd5Sw7zlfliBafSFwWpI/uNcOL6xVWiPZkF5kLLbnN8
         i2IKnlyTzNvLaRkY+fy5THVkRU1aVl93WucvDHW4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx5: add imx5_SCC2_IPG_GATE
Message-ID: <155078185794.77512.9942043032261092251@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190108162115.1998-1-l.stach@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190108162115.1998-1-l.stach@pengutronix.de>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date:   Thu, 21 Feb 2019 12:44:17 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lucas Stach (2019-01-08 08:21:15)
> From: Michael Grzeschik <m.grzeschik@pengutronix.de>
>=20
> This adds the missing clock for the SCC2 peripheral unit.
>=20
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next

