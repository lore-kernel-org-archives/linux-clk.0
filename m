Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B70FA373D
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 00:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiJ1ABD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 20:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJ1ABC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 20:01:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8C57287B
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 17:01:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D0BDB827D3
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 00:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05FDC433D6;
        Fri, 28 Oct 2022 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666915258;
        bh=Icxwdoywzee+I/TtVUn2rIb3m972dkwkQUEpTb0YOso=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mTK4hKEIwJhmnZCQxmchEvd7ETRFXXZUfSC9qfU9x6wttL/rqXK7hEVRWY8XVABqO
         opd7dRath+dtHRwsQUPui4e2SfWCb2zxUsCRtw+BZtmM9YNs7JxKNREF5r9rR+yKam
         KQX72VEPFXgAOfvldRg782n8lsXd4e6qbPkEvkYoP1e8bXYVHVe7PDZsDxdLr8xcTm
         nLmWk6Awmyni4EZQczkhmpHN3oxchaqLfc02oWNTtUrZIqPiRCIL58U2RWP27au3df
         nHOwLafyh6suLfKTXm+W4tiooKl0TahELEW2MjcwS+sTvHYkxINxvKmYSl8b2tXpoC
         uuk23GjSLbBHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221023164607.556118-1-marex@denx.de>
References: <20221023164607.556118-1-marex@denx.de>
Subject: Re: [PATCH] clk: stm32mp1: Staticize ethrx_src
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Johann Neuhauser <jneuhauser@dh-electronics.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Thu, 27 Oct 2022 17:00:56 -0700
User-Agent: alot/0.10
Message-Id: <20221028000058.A05FDC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-10-23 09:46:07)
> Make ethrx_src array static, this is local to clk-stm32mp1.c
>=20
> Fixes: e9ed1ef18a37a ("clk: stm32mp1: Add parent_data to ETHRX clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
