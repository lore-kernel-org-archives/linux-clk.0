Return-Path: <SRS0=T1sH=7C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FCC433E0
	for <linux-clk@archiver.kernel.org>; Wed, 20 May 2020 10:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A1D5207D3
	for <linux-clk@archiver.kernel.org>; Wed, 20 May 2020 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589969640;
	bh=bzscWCamTKP633DohUL18ThPT4Suxkr+K04/JWo2SbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=pKpRIgAv9xmCXUjV9VpkhwCa8zJEpUQ6yZvzntadI4g0osce3YdxPhC2ZtzX5HBof
	 hlp3OoM2N3QEC7ee8NnnDiDf4SMK5SH5EoMTGp/YskidNOQ8TSOPJB4houfwq1pTZD
	 adR5NF6EDJEkkg0zKcVazORDZg4oAnQ2b5oYLYVM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgETKOA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 May 2020 06:14:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:59526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETKN7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 May 2020 06:13:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CC04207ED;
        Wed, 20 May 2020 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589969639;
        bh=bzscWCamTKP633DohUL18ThPT4Suxkr+K04/JWo2SbE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YjluWWsene3/m6vsco3Mtv4PIkw1xscptzGe0ymdkIHpGzOZCtRisn6YyccYIBqpH
         Lry9Djww0v4KqCk+PtbadD9Rh8o6rP8AC4K+wbmJXRsKL49n9XP6QktCIxOXjdFeq4
         Ee8+x2QxlAvfJ+SVUuza/QEyZfgOTUEAElhasP4A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200401201736.2980433-3-enric.balletbo@collabora.com>
References: <20200401201736.2980433-1-enric.balletbo@collabora.com> <20200401201736.2980433-3-enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 3/4] clk / soc: mediatek: Bind clock and gpu driver for mt2701
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
        drinkcat@chromium.org, hsinyi@chromium.org,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>, matthias.bgg@kernel.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        ck.hu@mediatek.com, mark.rutland@arm.com,
        ulrich.hecht+renesas@gmail.com
Date:   Wed, 20 May 2020 03:13:58 -0700
Message-ID: <158996963892.215346.7498020261398211458@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Enric Balletbo i Serra (2020-04-01 13:17:35)
> Now that the mmsys driver is the top-level entry point for the
> multimedia subsystem, we could bind the clock and the gpu driver on
> those devices that is expected to work, so the drm driver is
> intantiated by the mmsys driver and display, hopefully, working again.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
