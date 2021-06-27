Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EC4C48BC2
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jun 2021 23:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B487E619BE
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jun 2021 23:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhF0XoP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 19:44:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0XoP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 19:44:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CB40619BE;
        Sun, 27 Jun 2021 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624837310;
        bh=yVClVrTdz3lzx4DmIeW5Zg0YylkOi1VVUKLNfEuseC8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=u1foarJjARmTcl88tRY7T4NFC3Zy7Fb8PdwCvS06ElyqvlSXCCPKgk4sdsIYPAxVi
         34AaGoappvOxkCxk5eHGJQcUEOG+thFGkOwBJmr2uTrn3SFFrQQihF5eavejSbPi5D
         BA9ItEOqR3Nj/cI1JTX/+tGX2ed1NsFpHy36lNH9qO4XLGV94nGKtlx6ZdD1OqIiOt
         RxTcYmPR5774gya+CKxXABsXoPI6be5sjJI1/En9f1lb7BuEtyRNsTNC8Pqv15N/KM
         VSxVZpPnP83BYSj04Y7rzxQ9J3yRP9+BizjPIvVbUIzf7nTIFS4BvwHDzDz3k7JW23
         XG7X/EmhjRyxw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210611025201.118799-4-dinguyen@kernel.org>
References: <20210611025201.118799-1-dinguyen@kernel.org> <20210611025201.118799-4-dinguyen@kernel.org>
Subject: Re: [PATCHv3 4/4] clk: agilex/stratix10/n5x: fix how the bypass_reg is handled
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Sun, 27 Jun 2021 16:41:49 -0700
Message-ID: <162483730931.3259633.14903714674010552556@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-06-10 19:52:01)
> If the bypass_reg is set, then we can return the bypass parent, however,
> if there is not a bypass_reg, we need to figure what the correct parent
> mux is.
>=20
> The previous code never handled the parent mux if there was a
> bypass_reg.
>=20
> Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the Agil=
ex platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
