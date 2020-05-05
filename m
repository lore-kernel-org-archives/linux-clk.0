Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF4AC47247
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE2F820721
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588654255;
	bh=erGBCaHsr0zo8WKTzve0aFtt3qpHXyUGjorzfd6TdaA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=S4nr0+mj+DKMJiEIQNWqqfGvJtb3QBDEiwmMf/XWqYdGXehXL0BBPIKW+Nm8Jp+Dq
	 cWbsJYxcRlsduY6NiPgNtk2brAHOte+PywFkZ7Tf3Bt5Wha8xYrnJxx/3C+CNUlsDz
	 LJIGa4w3nd1v9MTH7SKh5R6xHmV1lD9yCtoHCep4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgEEEuz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 00:50:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:42844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgEEEuz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 00:50:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26BB8206B9;
        Tue,  5 May 2020 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588654255;
        bh=erGBCaHsr0zo8WKTzve0aFtt3qpHXyUGjorzfd6TdaA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JXuhaH0FIRcA/eTnTK+AQTq6eWY5y1umPQ7PqMPRiT3/WqMepb9av8Q8LvTyPKHmP
         newOngYozHULqLdaULBwmeTRhLz5e/+/6YdI0xIec69xV7n0eqabsE/6V2rrECZ6jt
         uqLzjhWkXU1hdBxYr/Bn3MeYzazTAeyd9n+p5aag=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-8-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-8-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 07/12] clk: imx: scu: add suspend/resume support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 21:50:54 -0700
Message-ID: <158865425439.11125.5040772855966406059@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:51)
> Clock state will be lost when its power domain is completely off
> during system suspend/resume. So we save and restore the state
> accordingly in suspend/resume callback.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
