Return-Path: <SRS0=Qq+g=ZB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9D2C17441
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 224F42178F
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573259975;
	bh=IrKF+ln8hSNqEeML5+58gfJzl6ywn/EAJy+eDVYBJMY=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=dNZJ59NGBhvNa/kmjIj2vByim7cBfQ+idI0P8dHd/lQ8Z4GtlK4N/ZpGf5DpYr3/w
	 MUFJ06LX1IPu6DcDC1ZgGfltqUeTExnUE353QWZWDb8whUJyQa9KbGUd1l5a4zP3sy
	 G99GZTIJSDqgbKOrgVHFhx0r7lri6k4e9cfjvmIQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbfKIAje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Nov 2019 19:39:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:55644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfKIAje (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 19:39:34 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EABF2084D;
        Sat,  9 Nov 2019 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259974;
        bh=IrKF+ln8hSNqEeML5+58gfJzl6ywn/EAJy+eDVYBJMY=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=zWssj97jnd7ZTYrSaaBsd8O8C13EHv7wxk95MvWXmDuc7XsS+begRZVzYdB0qcoBs
         3nzQXgBKpJE6RRTUItFqr4/SYheDgezUlKTOANqpQGyHEKA/EG0ENuJ5sLuI9xSIoa
         b37Z7W6nXUbRqeO5avGgKI2d7gV0mrNorz7+UTgo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016125919.1773898-4-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com> <20191016125919.1773898-4-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] clk: tegra: Rename sor0_lvds to sor0_out
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:39:33 -0800
Message-Id: <20191109003934.1EABF2084D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:17)
> From: Thierry Reding <treding@nvidia.com>
>=20
> This makes Tegra124 and Tegra210 consistent with subsequent Tegra
> generations.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

