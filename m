Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E523AC2B9F4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 21:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C53096128E
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 21:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhFVVVJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jun 2021 17:21:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229625AbhFVVVI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jun 2021 17:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 892526100B;
        Tue, 22 Jun 2021 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624396732;
        bh=fFEjKRcRcGszK9lr5dIK3HHaQ6Ctdsp7ASaoihkoHBQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mHPFYLxCo1slmDPpzKzcF0VaagL9+cQRGmejoF8WkHqOrbKR//93MUa35MiKKES/H
         kbDTpq2Io6Y7mMbVLfws90DOTvEydHETuT6+Old9WAxKZUk8e8oRsPWHUMpFmbLF/6
         ukVJ9PWPGjFJ5e9qh6VMoMSSQyRy5avYMydSEhE1LwFSb94bfkB7bF3cvuOX097Mpj
         MWA9H9QUBVgJEeNfUfhWlD2KFW2Y0h3elA/qkCxRlVig59pzXavq6iRS/PjsgdXuDg
         cQGTu2L2cG7Fm/u424t4DrGR//ke9KllW5gjzrNzo/zoXquimDEhp/5fVFfnAkgv4X
         u6XoE0m8bQWQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210528045743.16537-3-lokeshvutla@ti.com>
References: <20210528045743.16537-1-lokeshvutla@ti.com> <20210528045743.16537-3-lokeshvutla@ti.com>
Subject: Re: [PATCH v2 2/2] clk: keystone: syscon-clk: Add support for AM64 specific epwm-tbclk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        ssantosh@kernel.org, Vignesh R <vigneshr@ti.com>,
        linux-clk@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh+dt@kernel.org>, mturquette@baylibre.com
Date:   Tue, 22 Jun 2021 14:18:51 -0700
Message-ID: <162439673148.1026800.11837112097844717167@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lokesh Vutla (2021-05-27 21:57:43)
> AM64 has 9 instances of EPWM modules. And each instance has a clk to
> Timer-Base sub-module that can be controlled by Control module. Update
> the driver with all the 9 instance of clocks associated to
> ti,am64-epwm-tbclk.
>=20
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---

Applied to clk-next
