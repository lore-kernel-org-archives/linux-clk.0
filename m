Return-Path: <SRS0=Bq/F=27=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF4AC33CA3
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 05:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55C7F2080D
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 05:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578634585;
	bh=JX47puHrq+wv87woEDGXvVPyKrIfBPEHa2Qj/JfjHxE=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=z/d06yx9hJ8IMw9HlmcJ043nKhKN92dD1ekIX6wsRrYQw3s9k+QonzG5ZBTWG7mNi
	 VZ0sc2P8Iepf3k/RuPTrkXWKldDzpEDIYTK1hUYupfBOheBA+MrLOXwoKVDohMyP6o
	 QfBFMd3f5Gl8xGtw748SKqAoZyP0ynzuCnUr55Ms=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgAJFgY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jan 2020 00:36:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:50530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgAJFgY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jan 2020 00:36:24 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1E1A20673;
        Fri, 10 Jan 2020 05:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578634584;
        bh=JX47puHrq+wv87woEDGXvVPyKrIfBPEHa2Qj/JfjHxE=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=071fleckTZ0x2fe+GMNZkJdDwgCijiovAjIMrUC1n5IIqXTpGAfGgP8CLSKvXwEhw
         I/l5ReHV3c3mEFcA3u09JZGFlnSdFOhn2zDsjOydhSdlaUHx3Gvf30s5m4D9K7cvdp
         NmKGgEWnikDXUOngtn3BzgshuQ+fpnUv4aKdE27Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200108091027.5773-1-geert+renesas@glider.be>
References: <20200108091027.5773-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.6
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 09 Jan 2020 21:36:23 -0800
Message-Id: <20200110053623.E1E1A20673@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-01-08 01:10:27)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.6-tag1
>=20
> for you to fetch changes up to 8040bf4091cdd13b6d0f9ab00e621ae6eb29174d:
>=20
>   clk: renesas: Prepare for split of R-Car H3 config symbol (2020-01-08 0=
9:52:43 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

