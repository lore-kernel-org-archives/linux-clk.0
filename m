Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C71C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 17:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3E5C20838
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544204523;
	bh=L/zKYikxn1Liy5InOp2BEvja1eaiC9ZvxKmj6gjp/2I=;
	h=To:In-Reply-To:Subject:From:Cc:References:Date:List-ID:From;
	b=rbpwB6LlwQvsvJ0I7GbnCK/WdQuM2R6wOmYAimxizh9b8SuLYD7hBVfLT181Wp1eo
	 3CUo0Lr5dBOwnrz63NSodJZSojj3V/SC3TcPCsOM0zlHNrHljQyVC1sU7obQrKbqUv
	 sHgh0MIDGRtLwkjPvnRJon1GYiNeo92SUIMZv1C4=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E5C20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbeLGRmD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 12:42:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:33420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbeLGRmD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Dec 2018 12:42:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7220F20838;
        Fri,  7 Dec 2018 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544204522;
        bh=L/zKYikxn1Liy5InOp2BEvja1eaiC9ZvxKmj6gjp/2I=;
        h=To:In-Reply-To:Subject:From:Cc:References:Date:From;
        b=NuIytuHnXewCa4gZ0iry2vvTuRID3LeGzkk2L/GS1kwKakfB0DWOwZYBO2Od9ySWt
         7bLnndTMZD85sSQJzLmM9jNWB7n5hPv+XDYD3lPLbW0ANJZBAjbi1iROUhMWWdU8J8
         /krtuP0FRuiwXuA5NnYFYwJJamin7+S1twNDw7mo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20181207142119.9574-1-thierry.reding@gmail.com>
Message-ID: <154420452153.57851.10805463686191930083@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.21-rc1
User-Agent: alot/0.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20181207142119.9574-1-thierry.reding@gmail.com>
Date:   Fri, 07 Dec 2018 09:42:01 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2018-12-07 06:21:19)
> Hi Michael, Stephen,
>=20
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d=
2a:
>=20
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-4.21-clk
>=20
> for you to fetch changes up to d14ce174ca02ee2a9f390b9e279663b3a848a48b:
>=20
>   clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC =
(2018-11-08 12:47:18 +0100)
>=20
> Turns out that these were not build-time dependencies for the EMC series
> after all, but since I already have them in a branch, I might as well
> send them out.

Ok. There were other Tegra patches on the list which I guess I can just
pick up on top of this tag?

