Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1F7C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 263D264E74
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBKTwT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:52:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:36078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229961AbhBKTuf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:50:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5CF864E45;
        Thu, 11 Feb 2021 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613072994;
        bh=4c3MKlXhsOtiG9Oj6Oqk8T6TzpYMlcq+a7LsNrbH0Ro=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h6qXPGVlXr+t+Pmw+UxH/mlIK9CkiJAu0o3KASyo6QZy63rMfPD4Ubh5zO8n67zrz
         23hC0BSTqHNUvG0k0CBpiZV05ApuKpjR1jZhWpya2++2Ugb8rY+6XKrqzLoLtKsZMb
         rprfhEN+p9Wo/vZG+bVY5p2pCyBCmS1aE/cXHvfPsoyxZS+ULnUE3DzlWU66U9z9an
         HrqYS2s6yaO9CD3l2mD4+W+XMGXCPHIFcHVwNdYzWka2OWa2LOxMC8EjkbK5Wro3Kz
         z0pclVCGOK+k6X6ytZ1lE08ZKHbppZzeSoUHSbTJtjB+0GwnimZCVrCtpEQ4InJ1nN
         fwxHhOBGwUtjg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-7-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-7-lee.jones@linaro.org>
Subject: Re: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const variable 'prci_clk_fu540' where it's used
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>,
        Zong Li <zong.li@sifive.com>, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:49:52 -0800
Message-ID: <161307299270.1254594.13908235432213477383@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:26)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/sifive/fu540-prci.h:16:35: warning: =E2=80=98prci_clk_fu540=
=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  drivers/clk/sifive/fu540-prci.h:16:35: warning: =E2=80=98prci_clk_fu540=
=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Cc: Zong Li <zong.li@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
