Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA699C63697
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 21:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76CD120A8B
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 21:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEXw4AZq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgKNVCp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 16:02:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:37032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNVCp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 14 Nov 2020 16:02:45 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F055920A8B;
        Sat, 14 Nov 2020 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605387765;
        bh=YNXWuXI0eLDAJI/QKVrRtP8MlOIJT+bczmN563kD41Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EEXw4AZqOVbItj+7UrZ9uhUglmU5VhnMbY8SfvbshQfzc4gn2EQ2qLCDM2+rjOJ/6
         BxVkfqdNAEmgJRe/VQls30hgCEntaGTdMrEhYSTwidqZIyesaRR27Gm9ET69DBznGZ
         eyrZAIN1WivaYtSCeotcaqCJ+3v9k4VQXFSxwymI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200519170733.295100-1-jbrunet@baylibre.com>
References: <20200519170733.295100-1-jbrunet@baylibre.com>
Subject: Re: [RFC PATCH] clk: rework clk_register to use the clk_hw API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 14 Nov 2020 13:02:43 -0800
Message-ID: <160538776372.60232.7084881096431627810@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-05-19 10:07:33)
> This rework the clk_register/unregister functions to use the clk_hw API.
> The goal is to pave the way for the removal of the 'clk' member in
> struct clk_hw.
>=20
> This member is used in about 60 drivers, most of them in drivers/clk/.
> Some cases will be trivial to remove but some drivers are hacking around
> it and will be tougher to deal with.
>=20
> This change is sent as an RFC because, until there is a clear plan to deal
> with drivers above, there is memory penality when using clk_register()
> (struct clk is allocated in __clk_hw_register() and clk_register())
>=20
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Do you plan to resend this? I'm inclined to just apply it and we can
sort out the memory penalty problem later. I'm not even sure what the
penalty is quite honestly. Drivers can call the clk_hw_get_clk() API you
introduced and generate clk pointer so we should be able to fully hide
the clk generated in clk_register() from them and not even allocate it?
