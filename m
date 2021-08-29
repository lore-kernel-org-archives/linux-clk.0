Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D901C4320A
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 06:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D5A360F38
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 06:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234701AbhH2Gos (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 02:44:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2Gor (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 02:44:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06880606A5;
        Sun, 29 Aug 2021 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630219436;
        bh=MAcZmF/c8VVOvoe9Gs8DZ/f45MJKAeHpkd03ylS+tc4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fPcVMqdOH3V5uUn0tUgtIAnXtWOjACuGqtBmttBgmGBCFNLcRPCiYHrU3gnMkmRkh
         H+0/daEO8FvSmO/pCryH5gLfe+5CgHy6LmG0QSy09+MsdrJAmgMAdWEcWD2LbtiBFU
         4b5AIGaUtyTuAJMKTw7g7ZJ7xhOlVOTQYmQB04tadmharZTZ6yWfSJ5wanJ32HQ8NS
         ZBSREPB4Uz7nrt1vgr4IRoigtSQ7IfOjnL7GmlhW7yHNCR8T/odMqp2ykfxARrgHn0
         +6/Ni8lC0uS4ENH4n7sgIk2/QyfxRTJ8ell6qer4EyfjAKsr4/KqZ+ihBLHgQG/DDL
         IOUgiFRZ3W1yA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <26526e144296373b2c75e75865dd023158f9bfc7.1629718424.git.michal.simek@xilinx.com>
References: <26526e144296373b2c75e75865dd023158f9bfc7.1629718424.git.michal.simek@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: Fix kernel-doc format
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To:     git@xilinx.com, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, monstr@monstr.eu
Date:   Sat, 28 Aug 2021 23:43:54 -0700
Message-ID: <163021943479.2676726.5453246267626627161@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michal Simek (2021-08-23 04:33:47)
> Align structure and function names with definitions.
>=20
> Issues are reported by kernel-doc script as:
> drivers/clk/zynqmp/clk-gate-zynqmp.c:24: warning: expecting prototype for
> struct clk_gate. Prototype was for struct zynqmp_clk_gate instead
> drivers/clk/zynqmp/clk-gate-zynqmp.c:75: warning: expecting prototype for
> zynqmp_clk_gate_is_enable(). Prototype was for zynqmp_clk_gate_is_enabled=
()
> instead
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
