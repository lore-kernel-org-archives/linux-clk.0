Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1077C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C1EE2086C
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550822838;
	bh=xkDpUe5jEGSFpbKRVg9CgjQYy+O817p/mwCbDRCtfvo=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=zIJGRap0vG89IGk/Uc8KYcaoHms1V5C+W5h9+iZS/0NyR5lC6eiPUsEBQ65moZ6Mo
	 a+TFSATxw9opYfmvvsPuibXobmCqWqDZVyqNueMgCLH68uEwLHjItCAhhQzfDeAyNj
	 h8YX6otSaBV+SGuYtsy8kOS9W50EMDK3umiYjaGo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfBVIHS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 03:07:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:46596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbfBVIHS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 03:07:18 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6893720818;
        Fri, 22 Feb 2019 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550822837;
        bh=xkDpUe5jEGSFpbKRVg9CgjQYy+O817p/mwCbDRCtfvo=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=eqmiJ7ZfhN8UC+KcdVaeCtAyBvebF3wN99P7ohRmDQ27pMNDfY4tCvA4ViaxZLK+u
         SEUNlnFuCDhAnxHKlehZ5SrlZN62R3K35i11FRrpG1si1HPeNW+IcnvyytT1axMMJw
         ntJHk3cYBVVNhi6+wxZKB3QTXNTRHyF2GGNost7E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: qcom: Make common clk_hw registrations
Message-ID: <155082283660.77512.10059723735671016353@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1549829645-24400-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1549829645-24400-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, bjorn.andersson@linaro.org,
        mturquette@baylibre.com
Cc:     marc.w.gonzalez@free.fr, andy.gross@linaro.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Date:   Fri, 22 Feb 2019 00:07:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeffrey Hugo (2019-02-10 12:14:05)
> Several clock controller drivers define a list of clk_hw devices, and then
> register those devices in probe() before using common code to process the
> rest of initialization.  Extend the common code to accept a list of clk_hw
> devices to process, thus eliminating many duplicate implementations.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---

Applied to clk-next

