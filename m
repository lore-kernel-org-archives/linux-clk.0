Return-Path: <SRS0=Qq+g=ZB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB71CC17440
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 766A9215EA
	for <linux-clk@archiver.kernel.org>; Sat,  9 Nov 2019 00:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573259968;
	bh=Zoy+Jor0H6I7/s2IE2TARJT4+Ubh8LGgJ+gtSJ+8LbY=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=Nf924FoZm0kCgVfgYgRjwJAjSqe6bR4ruqov5dHlfgYUqnC+EtgfxvOA9TnHz506k
	 kkfL7XcyzQBEwALwkZ7cmg+psc2PVi4QbDL7mBTLpWEonMySdeLq/EIm9/l0NWMdtH
	 EboKIwdzaJ0Ez8BePDXPxvop03XQWtAQsXJyIhzo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfKIAj2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Nov 2019 19:39:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:55570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfKIAj2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 19:39:28 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B2522084D;
        Sat,  9 Nov 2019 00:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259967;
        bh=Zoy+Jor0H6I7/s2IE2TARJT4+Ubh8LGgJ+gtSJ+8LbY=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=nyup2dHU9/Ot1e1cVH2wGG5dNaYe8A0krkENP84atRDzdP7txwC85ZNonphd7QlPN
         Ya3tHHs3tYbSjre7QAiDCt+PFvoAz+MtT+JJTPIPVQXMu1EdJODEvOUfVTWQ+HqAM8
         FBcCFv1Iu1LYQHLFfac3wa4rfPewn7sGfKHnlTlg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016125919.1773898-2-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com> <20191016125919.1773898-2-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:39:26 -0800
Message-Id: <20191109003927.6B2522084D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:15)
> From: Thierry Reding <treding@nvidia.com>
>=20
> Later SoC generations implement this clock as SOR1_OUT. For consistency,
> the Tegra210 implementation was adapted to match the same name in commit
> 4d1dc4018573 ("dt-bindings: clock: tegra: Add sor1_out clock").
>=20
> Clean up the remaining pieces by adopting the new name for the internal
> identifiers and remove the old alias. Note that since both SOR1_SRC and
> SOR1_OUT were referring to the same device tree clock ID, this does not
> break device tree ABI.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

