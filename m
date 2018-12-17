Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2C4C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 23:37:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF32821841
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 23:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545089865;
	bh=gj2hFrDV8DBl78DLxZork6C8cH4ex1vTohsBODmQ0JU=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=gYCP4Ae6iqHp4qSwksUf8FX+XXC0mfe7yjrCjPRmgTgmW0g6vFgyECB1Uihnnp9cs
	 ugMcYnyAaw9CBgQSNAMI/MU4jAE1rUTnnA4p0nEd5JEpUUWwB220yXA0DZsVyaTgS+
	 oXSScIs0FLAEJPfcWavNL71Z1xzCMrHZuRv5+iOc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbeLQXhp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 18:37:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:55034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbeLQXhp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 18:37:45 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7192121473;
        Mon, 17 Dec 2018 23:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545089864;
        bh=gj2hFrDV8DBl78DLxZork6C8cH4ex1vTohsBODmQ0JU=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=cskX/z7A7WlSRutBJVE83hoZcdL6zoW4sd0uDAO0cXF7/AoEbRQrX8PAPCPBlSPVP
         9hyiCSMnGQU64803+1H8yHZqRPK/cEpT5X6+K5eu1G4cciu5T96gzPIcdpwa1Gt04I
         Awzux9xrXIoDexxku2y0jq9ZfbHpctGznXzl3lrU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names from DT
To:     andy.gross@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
Message-ID: <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 17 Dec 2018 15:37:43 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:22)
> Allow accessing the parent clock names required for the driver
> operation by using the device tree node.
>=20
> This permits extending the driver to other platforms without having to
> modify its source code.
>=20
> For backwards compatibility leave previous values as default.

Why do we need to maintain backwards compatibility? Isn't is required
that the nodes have clocks properties?

