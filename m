Return-Path: <SRS0=rluM=64=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524B0C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 14 May 2020 20:38:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CE29206D8
	for <linux-clk@archiver.kernel.org>; Thu, 14 May 2020 20:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589488703;
	bh=wlKFaGzVwZ/3rez4I2+/tTMDXc6y/uZGTWOGy3YUAvg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ueFaBjOgwYnt6QsYfaTQmirq1tCDBQUGemi0M9OA6h5eES5FXr+4ULIqpRbdKBVwc
	 dBoCUv6k/U+6Ev8yTdI4gW4jWGtrAk8/S0uYc5muqhtGzquvS3Jl8YJHhA98+mAhcq
	 itPzKHNzX39VpB1SjTopGF4h17RfVksPw4p3iOQY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgENUiX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 May 2020 16:38:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgENUiW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 May 2020 16:38:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B82F2065C;
        Thu, 14 May 2020 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589488702;
        bh=wlKFaGzVwZ/3rez4I2+/tTMDXc6y/uZGTWOGy3YUAvg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i3G7+NW7NEcLm5mQboiGDrno9C76EbdUie9rga0T6obvStbhmjktdM8IKsAihJekp
         UFMPwKTBlfYL6orrMCKcyKxbhZ96Sj6Z+yx6EoNt3rtsWuDqZeU6qVNc7lnIv91pqD
         f9IAw96QfVpbK31cEta+aKf5WMotMDI2/k0WaPzw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
References: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v5.8
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Thu, 14 May 2020 13:38:21 -0700
Message-ID: <158948870165.215346.4232024088167170021@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-05-11 02:28:45)
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v5.8.
> Nothing fancy, please pull.
>=20
> Cheers
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.8-1
>=20
> for you to fetch changes up to a29ae8600d50ece1856b062a39ed296b8b952259:
>=20
>   clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers =
(2020-05-02 01:53:32 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
