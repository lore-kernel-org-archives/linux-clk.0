Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5050C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 20:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbiK2Ucb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 15:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbiK2UcZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 15:32:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C5969A94;
        Tue, 29 Nov 2022 12:32:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3945BB818FD;
        Tue, 29 Nov 2022 20:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E4FC433D7;
        Tue, 29 Nov 2022 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669753934;
        bh=JyLkOv6qe8XoJmjUwZu4AkrIj/J83ky0BnWFQEsVcek=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=itasrGJ1a2etQH/UdTZXRLMvSnUofxXW2jFFfOUsmGEJ+VrPQiffHpiQa+U7sncKi
         P6TieZ8GBD7m8akhvFzJMnZyaZKGhcSo7ajhSAilVfvpRqtm025PoIVgWj3HiFyIj1
         zBOxOkeX416JvfWVul/VqHHN/xcqHLaQGxlXYg1obzDCW6BMYwXuclhIp3wGoB4Iw7
         7ACNRbqRcG+ij8OTUBYeL5iatD4VNtuUaWaeEzobRC3jKvk/zBXSumOTd+ASyZXmm3
         FYKI+UYytzXHj4JV1cEKEy0153JxokmDeEbXhlxcC3YkoUSDIhuSFbObT2NCLaG8Z6
         2JbaRRFt6Vx6A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y4WxN+u0nB4gg39Z@google.com>
References: <Y4WxN+u0nB4gg39Z@google.com>
Subject: Re: [GIT PULL] MediaTek Clock Changes for 6.2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 29 Nov 2022 12:32:11 -0800
User-Agent: alot/0.10
Message-Id: <20221129203214.B6E4FC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chen-Yu Tsai (2022-11-28 23:13:59)
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git tags/mtk=
-clk-for-6.2
>=20
> for you to fetch changes up to a46315295489933209e902638cd287aeb5f982ab:
>=20
>   clk: mediatek: fix dependency of MT7986 ADC clocks (2022-11-29 14:49:29=
 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
