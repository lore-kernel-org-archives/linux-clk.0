Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1A4C433E9
	for <linux-clk@archiver.kernel.org>; Tue, 16 Feb 2021 20:49:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF6B864E85
	for <linux-clk@archiver.kernel.org>; Tue, 16 Feb 2021 20:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhBPUt2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Feb 2021 15:49:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:36948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229628AbhBPUt2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Feb 2021 15:49:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3337164E0F;
        Tue, 16 Feb 2021 20:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613508527;
        bh=zZmKL1djXdA4c//4/vr9lV+wVxa1UGWM5vkEab0J5z0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M6IcjTeVhRVfviKg4loqXAFq68jEIi956pss1h0quOEe7YOiopV/RSLlF+JTvZ89e
         pfNc0Q8+vqpDnhmQKhLM8QEQAE7sON4ZVMyLw1lpmAwAJijgh6Dg93cEvDfnxMQ7eM
         pt2CukBAOHuPMScYhudAoAAVXXDWlb7sXjbb17Ufox1iuuTjolDbX14mkVACXAODL3
         tv4Y2qD+lDD77iqlJhMYgHV7roSg5zTZcbDJwPLbJ7gdtBq6nGMcAvKIju9NDDOLm4
         l+Tv+QIO3nD3JcZx5E9pbFy7KjWJ/WdvUAtAT7334N9ouEIL5xqZc983KvzFSC4vf4
         EMiDlFD94AOag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210215115710.3762276-1-daniel@0x0f.com>
References: <20210215115710.3762276-1-daniel@0x0f.com>
Subject: Re: [PATCH 1/2] clk: mstar: Allow MStar clk drivers to be compile tested
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>
To:     Daniel Palmer <daniel@0x0f.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Tue, 16 Feb 2021 12:48:45 -0800
Message-ID: <161350852589.1254594.4962376147076587739@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Palmer (2021-02-15 03:57:09)
> Allow COMPILE_TEST to also build the MStar clk drivers
> instead of only building them when ARCH_MSTARV7 is selected.
>=20
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
