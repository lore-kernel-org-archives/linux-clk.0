Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B43C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Dec 2021 05:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238809AbhL2FhQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Dec 2021 00:37:16 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:37892 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238799AbhL2FhP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Dec 2021 00:37:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CDD56142E
        for <linux-clk@vger.kernel.org>; Wed, 29 Dec 2021 05:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93379C36AEA;
        Wed, 29 Dec 2021 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640756234;
        bh=u7HeXVQ7X6/ggTFYD04OE8L886f8vPPm3iyEK/btKOk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qySJByNF6NoGa74uHesJ8nFYeVw4WpkckfEyPAVF2U+xvLCQqudw29h9g39626Ya8
         jwpCKqIYAki851dSXZzd1EG206cYld33zcjfaNGSVRLluklDEkIa118mAIxuY6NIJb
         tDt+mAebrBLhWMnim9W1JJPTP77hVTfIrISeepDea/ktq7aAvqlgb7O+0qBLCdlLwU
         iM9CfSSXoHDSc4mwZ334Klwnjq9Vef5P6CU9zMOfmfOlo7902RylCvcSCP2pF3XRmz
         GA/fXlXy70t7bv0Syimyy58Lpn46ahWRdBXODj3uNKXj/vZs/+VWkembMUYtkAl+F1
         eLvL4KGkdFJzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1ja6gqhy52.fsf@starbuckisacylon.baylibre.com>
References: <1ja6gqhy52.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic update for v5.17
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Tue, 28 Dec 2021 21:37:13 -0800
User-Agent: alot/0.9.1
Message-Id: <20211229053714.93379C36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2021-12-24 06:27:48)
>=20
> Hi Stephen,
>=20
> Here is the amlogic clock update for v5.17. Just a single fix this time
> Please pull
>=20
> Happy Holidays
> Cheers
>=20
> Jerome
>=20
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0d=
bf:
>=20
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.17-1
>=20
> for you to fetch changes up to ff54938dd190d85f740b9bf9dde59b550936b621:
>=20
>   clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB (2021-11-30 10:2=
8:52 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
