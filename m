Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D726CC43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 19:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A113520859
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 19:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547060549;
	bh=HKY+0/Mvue+pIndTSVHWY2w4U4rcfB6DoLZ/5X+QSjg=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=ikmdR9o4uYkYOMOBsDCIcZY5wNGDkb0hw02u06LAqJpdGOhrSwn0TH0noLKGuU30u
	 LddzYV3fwnsY2Qy0URin7EKtwLYgwxCE3x67OlJzNbYg6XfXqMp2jJgb11VSNJKHT3
	 m5bGFlHoGYj1OCF4dGIchrKReEkjacsZ3HhD/h7A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfAITCT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 14:02:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:56108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbfAITCS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 14:02:18 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADF3E214C6;
        Wed,  9 Jan 2019 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547060537;
        bh=HKY+0/Mvue+pIndTSVHWY2w4U4rcfB6DoLZ/5X+QSjg=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=bxCFirH/GMRWi6iD/NqroF98DQnPQmyDfYQIni0cNtfm1vqldgBIw9AWrfMkVehb1
         yaCI310qxM/eQUooq1qFFgB4mpT6eh1Guu0IqpwEqqBnamUKzjR/wIJovcasVFJ+/W
         oSashi0/45FoMjTlfqi3N62vqQ9R3s/6Fi2tS5rE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] clk: imx: Make parents const pointer in mux wrappers
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <1544801400-18951-3-git-send-email-abel.vesa@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <1544801400-18951-1-git-send-email-abel.vesa@nxp.com> <1544801400-18951-3-git-send-email-abel.vesa@nxp.com>
Message-ID: <154706053698.15366.8527146760442125222@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 11:02:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2018-12-14 07:30:10)
> The parents needs to be pointer to const pointer to const char.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-next

