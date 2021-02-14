Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03541C433DB
	for <linux-clk@archiver.kernel.org>; Sun, 14 Feb 2021 20:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8BBC64D9A
	for <linux-clk@archiver.kernel.org>; Sun, 14 Feb 2021 20:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhBNUd7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Feb 2021 15:33:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:45556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229927AbhBNUbB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Feb 2021 15:31:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAB5F64E23;
        Sun, 14 Feb 2021 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613334732;
        bh=OPd7kWzl3sy3SzVt3tcpy4YL6NjdBtRZuj5FEvLrfdg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YVuOZ6CqazKZfyhOD3HB8SAFKW607RRrvs00Xbn9/RN0vVsghx5ZT01YhSxQGAorH
         9tCw6dRh8AdfPHrMenshyJubnJVOFSkJqK0+IcUe64ZG15I9wDh8oJMMhRHEsyJAJq
         wiw4Rao6uD1pGxM11KpfxyoExV859tPcKUVUr4RKt56/FKRJebYSjWHk7mAtO2hBtz
         uD8e5lkopN1TI5LqM1asgyWNFl4TVJbiMW+HpCQEzJAVeb479ItR3WFRcYYCIRw8k2
         cdADfPL58YCznpZpbhiKN7s7FPzm96HjyVBBIs+8ZkxGmg1EWwh+CQlZKk+aem/LX1
         oM+N8hYWAT7gA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210211052206.2955988-4-daniel@0x0f.com>
References: <20210211052206.2955988-1-daniel@0x0f.com> <20210211052206.2955988-4-daniel@0x0f.com>
Subject: Re: [PATCH v2 3/7] clk: fixed: add devm helper for clk_hw_register_fixed_factor()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
To:     Daniel Palmer <daniel@0x0f.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Date:   Sun, 14 Feb 2021 12:32:11 -0800
Message-ID: <161333473165.1254594.6998239834596963680@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Palmer (2021-02-10 21:22:02)
> Add a devm helper for clk_hw_register_fixed_factor() so that drivers that=
 internally
> register fixed factor clocks for things like dividers don't need to manua=
lly unregister
> them on remove or if probe fails.
>=20
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---

Applied to clk-next
