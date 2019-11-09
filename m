Return-Path: <SRS0=Qq+g=ZB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4459BC17440
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16361215EA
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573259964;
	bh=a4IHuZ61Ijn02rgp1IVvNjlu4o9WcpWH0qgKMKOhXEs=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=Js7uxkeVJrspXDoEc1GOb5xPs3/cVnnuJyK3T1x3fejBCQFFBMKZVsb7tY4FZY5mw
	 kdF/q1AESky8MXuFisTD2gZOxL2w9J2bCIuKc7r9G2G1z58eGr0dne5F3VQJQkOstO
	 WXq3dDqMvrjVbJZAGpe8MBYQ7w/L3SpueGjV6tR0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfKIAjX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Nov 2019 19:39:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:55516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfKIAjX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 19:39:23 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD2502084D;
        Sat,  9 Nov 2019 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259962;
        bh=a4IHuZ61Ijn02rgp1IVvNjlu4o9WcpWH0qgKMKOhXEs=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=F+QVh3FPu2f6iuZdfwfen7v/CoZqm37zXzLStBKSRV46FSCwCO6wf8KtP4g/c3Ik2
         9vFJtd8UhMVNg5ZwXUZkWUS1UX40mLJdRkYrhZs+83BwnWYPkskIsC/U+0T26iHmYw
         xclolNxKAcwP9hbjblTV1/xFhlpMrYv2JqedjsJc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016125919.1773898-3-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com> <20191016125919.1773898-3-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] clk: tegra: Move SOR0 implementation to Tegra124
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:39:22 -0800
Message-Id: <20191109003922.CD2502084D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:16)
> From: Thierry Reding <treding@nvidia.com>
>=20
> The SOR0 clock on Tegra210 is very different from the SOR0 clock found
> on Tegra124. Move the Tegra124 implementation to the Tegra124 driver so
> that a custom implementation can be provided on Tegra210 without
> clashing with the existing clock.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

