Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E377C4361B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C71E723715
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgLPUVy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Dec 2020 15:21:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:37894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728803AbgLPUVy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Dec 2020 15:21:54 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608150073;
        bh=E6+S0iH7JA6VSioCcRQNsQtNX73hr73AJHCOek3qQ2U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i8ELWSJXsO/nvyD3rEMIkiZpJ4FaJ8R6rvUnukYchKNLenDvb7MAnP1Wc8X48UBhA
         HKBT6liNXbsbYY4IFcH3+wQAJLe/JLdvH/4xkUb1k7eJWHIlveQJ6I5ZdMNPV5Mard
         uiVgwDb0dc7XOWjgW5DfLCDNhsfjjIGSXiQjXsv9xp3Odu4xMx7gR6t00nElfk3wmu
         Tq1br+HoRo1Ew2hispa81r9iNWU20hE47XMtSCKZbAu1ucGyxBQCYyVWeEF5eUDTIi
         ZedmPDoyxPFIes1cmB5KZCRMOVrcDbw8IVWeS1Y9D3UAKiIvywrCQVx4PLhnDdTsnD
         X93r0EneG75tw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209094916.17383-2-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com> <20201209094916.17383-2-zong.li@sifive.com>
Subject: Re: [PATCH v7 1/5] clk: sifive: Extract prci core to common base
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zong Li <zong.li@sifive.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
To:     Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, mturquette@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        pragnesh.patel@openfive.com, schwab@linux-m68k.org,
        yash.shah@sifive.com
Date:   Wed, 16 Dec 2020 12:21:12 -0800
Message-ID: <160815007240.1580929.5097103153471981375@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2020-12-09 01:49:12)
> Extract common core of prci driver to an independent file, it could
> allow other chips to reuse it. Separate SoCs-dependent code 'fu540'
> from prci core, then we can easily add 'fu740' later.
>=20
> Almost these changes are code movement. The different is adding the
> private data for each SoC use, so it needs to get match data in probe
> callback function, then use the data for initialization.
>=20
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---

Applied to clk-next
