Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F12C2BBCF
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 20:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32232368A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 20:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgLPUWG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Dec 2020 15:22:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:37958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728803AbgLPUWG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Dec 2020 15:22:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608150086;
        bh=N+zhwQ+YfkBtvavMJpsqeEW9p7YZZNr6aOvmok4o4gs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UNjChfjfxsSDltNd7XCWDaMsNU7Vlki9M2oBfaWhJv90xpYc5kLp++DhXbwemADbX
         Hv9cXlfnlmCwFvVMGwWgFd8ygpDZcOu7zjr1chPA9FgnEPJmwhtr1VaypLDPE0X0aK
         HAviCPUgHfVjVYYGoWK0KeP1HDVAjZf954uNEmpRi8rnx0PhteTflLBMJiG5WCet4u
         48Bio3A6mO4B3dFfUxomPcVdLcsEj5aGqw50VfYQ0NA9CZ3g+25JywQqALzdngJPhl
         UuMD9CqiucCTru5p/h0Gw/99MMgoozENOj/f5s7M96G8DFsPGpvJMEH5uRVNkCNYor
         3eIvWZiz4BBvw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209094916.17383-4-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com> <20201209094916.17383-4-zong.li@sifive.com>
Subject: Re: [PATCH v7 3/5] clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zong Li <zong.li@sifive.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Henry Styles <hes@sifive.com>,
        Erik Danie <erik.danie@sifive.com>,
        Pragnesh Patel <pragnesh.patel@sifive.com>
To:     Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, mturquette@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        pragnesh.patel@openfive.com, schwab@linux-m68k.org,
        yash.shah@sifive.com
Date:   Wed, 16 Dec 2020 12:21:24 -0800
Message-ID: <160815008470.1580929.14197735214079508813@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2020-12-09 01:49:14)
> Add driver code for the SiFive FU740 PRCI IP block. This IP block
> handles reset and clock control for the SiFive FU740 device and
> implements SoC-level clock tree controls and dividers.
>=20
> The link of unmatched as follow, and the U740-C000 manual would
> be present in the same page as soon.
> https://www.sifive.com/boards/hifive-unmatched
>=20
> This driver contains bug fixes and contributions from
> Henry Styles <hes@sifive.com>
> Erik Danie <erik.danie@sifive.com>
> Pragnesh Patel <pragnesh.patel@sifive.com>
>=20
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Henry Styles <hes@sifive.com>
> Cc: Erik Danie <erik.danie@sifive.com>
> Cc: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---

Applied to clk-next
