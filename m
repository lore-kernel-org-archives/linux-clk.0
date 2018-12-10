Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAAFC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:09:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D67720870
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544468942;
	bh=4vrFejbQmn/ZiodCrIBAx1mr0zTiHmnphWnj65qMGmM=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=CPAQTnXpJFrbsFWcw1NAyqGRe5hocSrSJsnmW11xXIxHoEBsay9J96/BZRjx6JEzv
	 r6m5fFyc4rGOToUfvw+RtCPIfrl+H6jHYqYqfbrbZOWWo528v2/veR3xNpsg4vezXO
	 O8DpMrBj/aUEEN4waiM5imjXuMCdebgQNLsfffPY=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D67720870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbeLJTJC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:09:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727880AbeLJTJC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:09:02 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 459A92082F;
        Mon, 10 Dec 2018 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544468941;
        bh=4vrFejbQmn/ZiodCrIBAx1mr0zTiHmnphWnj65qMGmM=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=C7SHr5c4ktO8GxPshpCeO1p0SYuynuRN8D3HyBOG/FeWviysTGLz7AG6B8n70E3Bu
         vF4k80Nbx/0NkrHu5nekXNOL7r9uHMZK8hKWudcOskfjzNS2Q4NTO+ul2M7o/E6BN5
         2I4w9GyfVR+rjHrXOiERcEaqnp0RjpT/PYTU8b5M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181207142119.9574-1-thierry.reding@gmail.com>
Message-ID: <154446894048.17204.10517957191437318424@swboyd.mtv.corp.google.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.21-rc1
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <20181207142119.9574-1-thierry.reding@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Date:   Mon, 10 Dec 2018 11:09:00 -0800
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
>=20

Thanks. Pulled into clk-next.

