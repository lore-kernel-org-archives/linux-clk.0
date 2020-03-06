Return-Path: <SRS0=hB7x=4X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E107C3F2C6
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 21:10:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D0B320705
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583529046;
	bh=nwAeYQzaSTdGGkq1YI2necHCEfOqnhSRCORV74z6X60=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Q3hWx7HMEQVk0jUiE+CaUKYI7NVduKYKgdxgbZpSPPseL6h+Cl0Sa5k5cCzqkFcu7
	 kWIthsy1OMAK0JMTS0XZ5VK9Tas6hGb6Pr892slDjOT0XxhGY7MlBW4hI5Jg1hqciy
	 IWh1DNnGN7PlSAlQ8/gnbDuiTMOgGnWclp5qlcDI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCFVKp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Mar 2020 16:10:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:59320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgCFVKp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Mar 2020 16:10:45 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAB9420709;
        Fri,  6 Mar 2020 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583529045;
        bh=nwAeYQzaSTdGGkq1YI2necHCEfOqnhSRCORV74z6X60=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f4NbMDfbJk+2d7qCdmIbwYQOK5Mq4tda0rOMzbl9E5jhuiPZYrPSnHiHvZrlGl4xw
         9KVa7iEA/xy+RXrkJ4cwsICjIgSVoOQj3fhyOdf1a/Y519FGwWah4qdEX2Wt+Nsynh
         V9LQyK3dfGIN5VFTBZvsj1eed7IoksqJZ8fejSXI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200226104235.17367-1-geert+renesas@glider.be>
References: <20200226104235.17367-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 06 Mar 2020 13:10:44 -0800
Message-ID: <158352904405.174340.8240265341928981278@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-26 02:42:35)
>         Hi Mike, Stephen,
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.7-tag1
>=20
> for you to fetch changes up to 068e7f85234c0b56f55cc0259ad9c05f2c64b8fb:
>=20
>   clk: renesas: Remove use of ARCH_R8A7795 (2020-02-21 14:01:54 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
