Return-Path: <SRS0=MMCI=QX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22343C43381
	for <linux-clk@archiver.kernel.org>; Sat, 16 Feb 2019 00:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDD41222D9
	for <linux-clk@archiver.kernel.org>; Sat, 16 Feb 2019 00:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550276109;
	bh=+oODPZAYHVsPfIQyFWnNzL73TjSmut9tV/U0m4Y9KCQ=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=KzMQWt9dPHK16OhgU8WmCh8vGVocLicugIe/GM0OAsLmD9B62qyrCMsNBzAGQz+y8
	 xAhg+lGSPybCg3aQCqtOKsmublu4PcxyPbOG10oPjKz+RwwV7U4rXeFIlAl2bIDSPK
	 yr359whzYWSVpL7upyK9jCT1Hv55ugx58m3hKwXU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfBPAPJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Feb 2019 19:15:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:51884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729617AbfBPAPJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Feb 2019 19:15:09 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95CEE2192D;
        Sat, 16 Feb 2019 00:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550276108;
        bh=+oODPZAYHVsPfIQyFWnNzL73TjSmut9tV/U0m4Y9KCQ=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=ds6zTJaIlybOL9jN4IXWMhH6yOBr9R7FiK7p/x/bGGi1rGbOt9xGPdK53V0/BStZx
         f8J6rAV2Oz7prVpW5FIeu95vUOYY3v/9M1LsVRm0CHboNuYyd/PXgKGg8QWzzX4Sr2
         DTedHUa5rUYJL0x3vehiOMtKjncDTobrL5JDJNzo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
In-Reply-To: <e115449e-085c-8f82-b345-f610b5e735db@baylibre.com>
User-Agent: alot/0.8
Subject: Re: [GIT PULL] clk: meson: updates for v5.1 round2
Message-ID: <155027610778.115909.3881497720700465134@swboyd.mtv.corp.google.com>
References: <e115449e-085c-8f82-b345-f610b5e735db@baylibre.com>
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Fri, 15 Feb 2019 16:15:07 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2019-02-13 01:11:37)
> Dear clock maintainers,
>=20
> Below is a request to pull updates for Amlogic clocks for 5.1, round 2.
>=20
> It adds the G12A Always-On clock controller and a simple typo fix
> for a clock name on Meson8.
>=20

Thanks. Pulled into clk-next.
