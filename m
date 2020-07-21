Return-Path: <SRS0=lm+m=BA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D587DC433E3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 07:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B589821702
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595318268;
	bh=pvNrWK/Ix8g9M9ei9fs+4+uAjBm4YdpanX1u3TPtoQk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=sGoF/FBRoc2R5A52Jv6+YUPVAzMK9DmAMwu+Kfr4U4eCy4ENzaQWLpPqWLKR4AvUk
	 t00TZKx/shF5zB+AJsCdVXssXPQpnX3wFZPZAgjLLmhPBfHCO29Lwu7/ynbWuXq/oo
	 2DpGhLAMyI71dBq0900D12JaFR4JsUrqxpHzArOY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgGUH5s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jul 2020 03:57:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:35134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgGUH5r (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jul 2020 03:57:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7924A208E4;
        Tue, 21 Jul 2020 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595318267;
        bh=pvNrWK/Ix8g9M9ei9fs+4+uAjBm4YdpanX1u3TPtoQk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gJuJU13hrP62nM+Y0tYnDc2wuj7NkLGhlni3QsRpTXP1HZwXb8YBGv53Fi6Z4TrOi
         aYZGcR3tLBNPYWAtj4p311uAe5qSBzQ3+MhximgZvh2K0bsxiJpqNf6txEMRtTXDzA
         cwZmME+L+KsNQRDmPks5vgR31IygimQnNvh1FDQU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200717100931.15885-1-geert+renesas@glider.be>
References: <20200717100931.15885-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.9 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 21 Jul 2020 00:57:46 -0700
Message-ID: <159531826675.3847286.15574631250824369251@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-07-17 03:09:31)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 52bc5ea6edde35bc65ed6ecd7639534e78002c=
74:
>=20
>   clk: renesas: rzg2: Mark RWDT clocks as critical (2020-06-22 16:54:32 +=
0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.9-tag2
>=20
> for you to fetch changes up to c8a53fa1d211936ddcabf82ff991c18672b3d63a:
>=20
>   clk: renesas: cpg-mssr: Add r8a774e1 support (2020-07-13 10:36:33 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
