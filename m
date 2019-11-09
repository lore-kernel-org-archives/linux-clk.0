Return-Path: <SRS0=Qq+g=ZB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5111AC17441
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 215A121019
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573259988;
	bh=SdwbtpZRnvE8baSGCJOnGpOXwOFt+DFMSrY3Acug3X0=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=qUr3FxI2lWfyCfWVLQg9FVNPNnbj0TbE84vBiCHGoJZcvPx4EYHjlAZhAf7Z/BleK
	 K44HaINBTbCsrsZ/CiZtnkEVFD3nQ5zZ9oh37HRrM6n7OmvFbpF6OuESkgtMhcMUt/
	 Kn1QIDYY9+rcmVvvrls0tyWhp1rvQmJt/oSQkx2E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbfKIAjr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Nov 2019 19:39:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:55784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfKIAjr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 19:39:47 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11D492084D;
        Sat,  9 Nov 2019 00:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259987;
        bh=SdwbtpZRnvE8baSGCJOnGpOXwOFt+DFMSrY3Acug3X0=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ysOQ560FGTWIKdfmJ0zMlmZ46dWkWVLvLuWsZi7xEy8GevfJABFFg2PiY/lBQKruN
         DnuRymkOEaYW/sPcewK2EcUOt5BRlYDWOwtcfXhYqZc1JQgLo7fpFV/ZypIkaUSSeF
         CCaVfZ83kmzfcKT0+YoDle7PalfcG2Fmt/cH6AAM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016125919.1773898-6-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com> <20191016125919.1773898-6-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] clk: tegra: Reimplement SOR clocks on Tegra210
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:39:46 -0800
Message-Id: <20191109003947.11D492084D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:19)
> From: Thierry Reding <treding@nvidia.com>
>=20
> In order to allow the display driver to deal uniformly with all SOR
> generations, implement the SOR clocks in a way that is compatible with
> Tegra186 and later.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

