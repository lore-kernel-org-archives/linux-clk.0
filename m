Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418CCC4332D
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 19:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06B2364DC3
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 19:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbhBHT2S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 14:28:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:39978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236249AbhBHT1z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 14:27:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9567364E85;
        Mon,  8 Feb 2021 19:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612812434;
        bh=lQzNDGvScztY3AioxUvdDXqZgv85hKfFs5OO+tKskOQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DBqfmZVP97d47yn6vrx2fKMYayA8lKLc9UXgNm6LHPiaM3AQqPMM7ExxaCfgO3RBH
         PjfFWvcgvMa6d+TbBzFzWdLxq6pCw9ibotLXOinwBnZZE1HTqcVpRdL97UK+qFwQyU
         m+1an9pvMdQHDl0D/O7XWrrvU5zEmqsPFJgiDaMxA/pUYAzjWwp0uwCi6ptQLA3tts
         l/umJd0gwC7s7I2nQLQATCTvRwD4vAsLAJyGPvpEYv1+mqVf+woBRDQfe3GIHJWvuy
         PXfLWRqaz17qdzV61b3Yb3n1uf+EGJGR+kSwPpezTBE1w2UONyBxea6XoMbMVL0DGt
         WK3SJxM/h9g+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1610542388-12078-1-git-send-email-abel.vesa@nxp.com>
References: <1610542388-12078-1-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH] MAINTAINERS: Add section for NXP i.MX clock drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Mon, 08 Feb 2021 11:27:13 -0800
Message-ID: <161281243302.76967.13559736813671271895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2021-01-13 04:53:08)
> Add a section for NXP i.MX clock drivers and list myself
> as the maintainer.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-next
