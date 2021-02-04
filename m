Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA01C433E9
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 19:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EA6F64F45
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 19:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237699AbhBDTtV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 14:49:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:58870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238884AbhBDTtQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 14:49:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3FA464F38;
        Thu,  4 Feb 2021 19:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612468116;
        bh=5DNTH4Gc5ClduRVetfzJVkd0O81NnCc0tziytm+ok7o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FziFKT96tiAG1w4fD4qWdj16iToflIdTqhNcdqMhax3dxrVE3DHXkYYDDU+g0dcd+
         J+Jgt+FDrCiPN+Ok/XswSNfYWyJRkD0P89H0sCpkHjZIvQn65U3Lw6FlLkmGZSPRYq
         s8eW+bKqtMJIgrkBlUrXEw83fXtOqwh+RaKLEYLTxi6AO/Lk1BQlFojyQj9W197NBQ
         VPXu7lAeEAKuAVjbms5jjORkxrjln79Iq/QUU0dgHzsbspb1zYrxyNSYp1fBCeNnTz
         GeyC30eS0bDfRtNVvCMx8qGs/PwsU6PNuxSSzLr5/s9jyBqt45HHEfq83ZaR0f+vgl
         q4nrxy2aEsOeg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <83279f56-18ac-4abb-82e0-30f1fb8ffda7.lettre@localhost>
References: <83279f56-18ac-4abb-82e0-30f1fb8ffda7.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.12
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Thu, 04 Feb 2021 11:48:34 -0800
Message-ID: <161246811439.76967.5020842695036206779@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-01-31 09:52:02)
> Hi Mike, Stephen,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.12
>=20
> for you to fetch changes up to 88dde5e23da1a16fe9a417171e6c941736b8d3a6:
>=20
>   clk: sunxi-ng: Add support for the Allwinner H616 CCU (2021-01-28 11:14=
:35 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

BTW, I see this warning with smatch

  drivers/clk/sunxi/clk-sunxi.c:1093 sunxi_divs_clk_setup() error: uninitia=
lized symbol 'clk_name'.

which looks possible?
