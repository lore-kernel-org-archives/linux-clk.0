Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5103C48BC2
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jun 2021 23:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEE2361C35
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jun 2021 23:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhF0XoC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 19:44:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0XoC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 19:44:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2E90619BE;
        Sun, 27 Jun 2021 23:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624837298;
        bh=w1TedU4bM5dxs/mqR2SyWc9ZlmZLeuhVPyU34b8evR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QkE7vADdlvdef4E4hhMzU3gLvgRIQAeloH8OEA9CKxHFH4i16w3dT3ofek1T8EcX3
         0ecpETqDbXJyHx9woK+Pt/GY8JdV/Mdsl+hXbppm6/ax6C8+ETOfwXesKEOqMi3IYu
         A6sVnrO1esisblBWLS26pvDfUnnJvbl4K/1gwyAbeh6OJOzuCTMmNxd+ukO44RwoSv
         dOgw2sYY91vuda8Bc4tQFcwAk3YeAGcn5dQd304Wq84N8pUkQhBBMCQFD7T8N9sryk
         eKjLZ0+NWwl2WSGQuT+8xXET2tJdoAWWwsQ37r9N/Sp8yv9QkB+1d1JVktM01rB/F+
         2ed9IznpVpO9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210611025201.118799-2-dinguyen@kernel.org>
References: <20210611025201.118799-1-dinguyen@kernel.org> <20210611025201.118799-2-dinguyen@kernel.org>
Subject: Re: [PATCHv3 2/4] clk: agilex/stratix10: fix bypass representation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Sun, 27 Jun 2021 16:41:36 -0700
Message-ID: <162483729679.3259633.8105679115527544683@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-06-10 19:51:59)
> Each of these clocks(s2f_usr0/1, sdmmc_clk, gpio_db, emac_ptp,
> emac0/1/2) have a bypass setting that can use the boot_clk. The
> previous representation was not correct.
>=20
> Fix the representation.
>=20
> Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the Agil=
ex platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
