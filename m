Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36451CDB482
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 23:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjJRX4F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 19:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjJRX4E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 19:56:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8AAFA
        for <linux-clk@vger.kernel.org>; Wed, 18 Oct 2023 16:56:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF50AC433C7;
        Wed, 18 Oct 2023 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697673361;
        bh=chjIoI3/HmiaBDvhJLFWJeHklVVsHKeBC8ixad4G+40=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZYgnEHz6dgLYUWMMmYc7vF77k1IKzT7DuHHErwxhZTJ6bl+GKm347D1LAuT+KNcry
         j5WocECxLtuRjBhVp3Sr5AqECHh4tneDuRS28Zt155Tgqx2mV6sjCrZ0O0sNd0ttwR
         8kRU4Ne83oVmL5WVvAjt2uM+xC4FDucrMZFQ6m+xPZz6BJojAahSAVvQVzdKavaCXu
         5o7hat+EoYO+6/a65mCJREiTBR0WQn8eCBaYfTY2bg2l2grFiu7NEFl5OzI/B4MRbn
         N76ND2QaPdf2hUssflimdsoIkOSc/31qr6UxIelJAZ+K1TWPMCIeb0aRS6QsKVvQdy
         +e15xR9kq3whQ==
Message-ID: <6ef51734c407d1bc5c91fa79e2f5207d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j1qdux4rt.fsf@starbuckisacylon.baylibre.com>
References: <1j1qdux4rt.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Wed, 18 Oct 2023 16:55:59 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-10-16 02:58:26)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock updates for v6.7
> It is adding 2 clock controller drivers for the new s4 family SoC.
>=20
> Cheers
>=20
> Jerome
>=20
>=20
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>=20
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.7-1
>=20
> for you to fetch changes up to 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239:
>=20
>   clk: meson: S4: add support for Amlogic S4 SoC peripheral clock control=
ler (2023-09-27 11:01:03 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
