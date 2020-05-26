Return-Path: <SRS0=OzFb=7I=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DF6C433DF
	for <linux-clk@archiver.kernel.org>; Tue, 26 May 2020 21:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACBC820888
	for <linux-clk@archiver.kernel.org>; Tue, 26 May 2020 21:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590530386;
	bh=CqEePuCnvpK/iCyz9I9YqYh+lBmX3OXhgdferK/hSKU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=bh4u6wSwO8fVOmKqOnLwogA3UP4YlACPWiJFABx8U0JMACmKdUcxGh2ZzRAXuUQ5H
	 1bVun9NuygEnYUiQQIxnAFPJ9tf8x7sKzajxBKod2m6AHUPetfuUlSXHAg/SSe1Mcn
	 gkr7ZObcLRM/TZ0yq9fDoHUTHLmdt0ackh1XSRAk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390380AbgEZV7q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 17:59:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389342AbgEZV7q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 17:59:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B875220707;
        Tue, 26 May 2020 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590530385;
        bh=CqEePuCnvpK/iCyz9I9YqYh+lBmX3OXhgdferK/hSKU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IU7kgLij8ZcqwO0sU0VmkMnUFKHYDUhquSIj9NpuV5pqZLLAIDxwcos/dxFWmR+5k
         8DVuM6xonLwwcWB8RGCYuz6/UIf/zjyFNyLxarrpl1BZ1U5/QMWm9NVOuMTmmk68JH
         pGptfBNUHy64Iii5FVkN27iU2FfcmC9bHY0ymHN0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200515142730.1573945-1-thierry.reding@gmail.com>
References: <20200515142730.1573945-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.8-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 26 May 2020 14:59:44 -0700
Message-ID: <159053038496.88029.2137294571210435375@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-05-15 07:27:30)
> Hi Mike, Stephen,
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.8-clk
>=20
> for you to fetch changes up to dec396322d25ca5ce2f307b6da897060fdf9a782:
>=20
>   clk: tegra: Add Tegra210 CSI TPG clock gate (2020-05-12 22:48:43 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
