Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78283C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 588F961178
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbhINWxj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:53:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235083AbhINWxj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F3AD60F23;
        Tue, 14 Sep 2021 22:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631659941;
        bh=4m/IdrSQ9D6qGjp0csWEv7EPXSz91sbeMuP+EKogDIs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DZDFPnYJTaAtxQbwEegRQtA9D3cgDZkXqUIApe9915XPmYE04GMLbbIpyzqtFpXO5
         uuWlMgoYN1uOC/d3UK8SPwYaOPcQpxk64eZ6S7wCTpvyLhUzcbXWJcZ2RI3vG2G5kd
         4pMCpnzvu1PxHON1kQuaMblk5/Y37rghgb9f9QOV3Q/6ZfrK5LWPyD0LO551eCXfVk
         oLtbKTr2WsaFu92hEw0GESrdpjS+SkTLcblJq96Yb17NqBLoGXuo1aNBIUzclxEngG
         EWt+FS6U4hn9w0x8oeLNKs/RmiF2j70noyJEfVD2W0wD/NIpvWKh9hNtts0CeCJsKN
         rIGzq+TDiIkvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914143201.1062947-1-dinguyen@kernel.org>
References: <20210914143201.1062947-1-dinguyen@kernel.org>
Subject: Re: [PATCH] clk: socfpga: agilex: remove unused s2f_usr0_clk define
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, kernel test robot <lkp@intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 14 Sep 2021 15:52:20 -0700
Message-ID: <163165994004.763609.1083395743857820430@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-09-14 07:32:01)
> Remove unused s2f_usr0_clk define.
>=20
> Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the
> Agilex platform")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
