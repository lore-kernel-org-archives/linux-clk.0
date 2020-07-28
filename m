Return-Path: <SRS0=wiJ0=BH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E2C433E8
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jul 2020 08:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4FB920A8B
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jul 2020 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595925023;
	bh=Xlb2BnceXzYTzAXktueoQAA5/ZPhfqE2jgNZ4DMUODM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=eUC0cTdyngsF/+LNo9+B3i2D01Z7dOszgIzvLsBGnb5ulKbeU6KG9tKbnYTU/R0i8
	 EdF7yXCUQH0K3wE40QYuoYsnMkc1dtgOTtzMd+al1Lnf0GuJKgPyV1VpXDEHDQBhIJ
	 YzODkFXPycU7f/z7+f5x5yvBVN8ZddmY48FyYL2s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgG1IaX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jul 2020 04:30:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727808AbgG1IaX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Jul 2020 04:30:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDCF920838;
        Tue, 28 Jul 2020 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595925023;
        bh=Xlb2BnceXzYTzAXktueoQAA5/ZPhfqE2jgNZ4DMUODM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WFELDC95drZFFISnYKMQaUnapZi9f6SxkbmHoy61ikQli6d21/2So8X5nqLZFOUod
         T77avNcXK6xNoNKKptgVWK48bBnCGPwkCT2wSIneECsvLYEOOWmzSmm5JfZcqoWkRZ
         EzVlv6EpKl2Oi/c/PJYZLHW6tGzZHitMI/qiFjR4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595904889-30811-1-git-send-email-peng.fan@nxp.com>
References: <1595904889-30811-1-git-send-email-peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] clk: imx: imx8m: avoid memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com, Anson.Huang@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
To:     abel.vesa@nxp.com, festevam@gmail.com, peng.fan@nxp.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Tue, 28 Jul 2020 01:30:21 -0700
Message-ID: <159592502171.1360974.3210900566276289684@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting peng.fan@nxp.com (2020-07-27 19:54:48)
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Use devm_kzalloc to avoid memory leak when probe fail.

Please add () to functions in commit text.

>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
