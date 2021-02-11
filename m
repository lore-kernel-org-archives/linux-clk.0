Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D84DC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C43B264DEE
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhBKUhF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 15:37:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:49060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229849AbhBKUhF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 15:37:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D862964DDF;
        Thu, 11 Feb 2021 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613075785;
        bh=s6MK6AyHiNoTAcSPwsbFg/BT3aG4WkFax9HWorC7jXI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iLcHnCs+ioTDI5dxVpm31eMs90IveMF2b7IkPgBT3Rwn1SHdVcM4p92Q+R5VJ7Bd3
         mEMcF11/QlxhBF0TXZL1zSKQpx6VGY5Tb2Jlb6yeilM/ivhr+KTGLGfw3qTNvsLYTu
         DyW6WuR1JXVJ5opcXulv7iVKOfe/YjM4x5JWiqf4Ou1a3Io/Y6YiN0uwJkJMXUlMQa
         M94mUC3/mpLtKUSKrje3v2wOGV43Ej4DPUadui5vMuHuPrWT8sIdxAbe9cIjbbJ8Hg
         Ptu1Sdczvc5Rwuu1vwBBWrHkn/mjorCBz3qjmNux7s8MkB6t3OZsTL1y+/6h4OMq8b
         tIS6VlmtImmPw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210119061715.6043-1-ryan_chen@aspeedtech.com>
References: <20210118100813.30821-2-ryan_chen@aspeedtech.com> <20210119061715.6043-1-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2] clk: aspeed: Fix APLL calculate formula from ast2600-A2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ryan Chen <ryan_chen@aspeedtech.com>
To:     BMC-SW@aspeedtech.com, Michael Turquette <mturquette@baylibre.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>, andrewrj@aj.id.au,
        joel@linux.ibm.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 11 Feb 2021 12:36:23 -0800
Message-ID: <161307578346.1254594.3414342188074176198@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ryan Chen (2021-01-18 22:17:15)
> Starting from A2, the A-PLL calculation has changed. Use the
> existing formula for A0/A1 and the new formula for A2 onwards.
>=20
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

Applied to clk-next
