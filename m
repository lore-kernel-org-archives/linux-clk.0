Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DF9C11F66
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 18:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0918B61480
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 18:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhF3SWB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 14:22:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229991AbhF3SWB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jun 2021 14:22:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98665613F5;
        Wed, 30 Jun 2021 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625077171;
        bh=gM2G56OHPtb+lnaJGuybdz9Nn9bAhMTZ6gHWsBNL9fo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q3aV1GQQzpvv3Yq5jNEXAe2hqH/C5+LmM/+B7BDkU7639TbdsV0BcTVEuaSVFerws
         S1riqp7AUrdOPOiXQdRpxTM8BuRQPVj//D7J7g7njrpsUPGlzqDeuRXJDSaxFBqmbA
         rStXyG0OotfhdEzUdJoAKel+Gb/R8QYw3BaOhmv4Ftjr1mL9AGmfdGpPfDW/7nKJ5s
         ax0kM8adT+RogYSupBPXmbztDBWxJWMoh+iCfWZyt4Ch2bRR5KCSKPFKxILvD+LaNJ
         vPmn4qvnA9vB714SGFB9jkXo4z8NhxlOMjMu5cNpjEKWkoWUFP+/lDKUSCl17zKAjj
         Zmz7hlW+cgo/g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629102956.17901-1-colin.king@canonical.com>
References: <20210629102956.17901-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] clk: lmk04832: Fix spelling mistakes in dev_err messages and comments
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Colin King <colin.king@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 30 Jun 2021 11:19:30 -0700
Message-ID: <162507717033.3331010.14528343099609777307@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Colin King (2021-06-29 03:29:56)
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are handful of spelling mistakes in two dev_err error messages
> and comments. Fix them.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
