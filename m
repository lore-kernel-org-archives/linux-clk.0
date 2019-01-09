Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E75EC43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EC2520661
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547059383;
	bh=u8j+i9RvfeFAFcHetRUzoudivZRenpBOrN8Uv/W/5yc=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=W2wRGky0IFc59E0owmVJQ8I0rYJ/fNoCdj+gLe2q+8kGxyTUCz26Fr83XxRAJaADE
	 lX5N+m4IcoVYjUCi9TF8miiYT3UL9R0rC4Z1Vd2yiA/YjnpT46lK0ISyAkAgUZn5Lt
	 5JPFt2hVIm+q6NFVt5eii7lEgSgOOd5P1VN/ry+c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfAISnC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:43:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:46010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfAISnC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:43:02 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2129220685;
        Wed,  9 Jan 2019 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547059382;
        bh=u8j+i9RvfeFAFcHetRUzoudivZRenpBOrN8Uv/W/5yc=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=M6N+lDAe6QSehC9Hq+CSMnMviDUy1VRTN+xJlxv3nhA+fJzS3vm/xOoXlDeShmFoL
         LyF8xo4Pwj0/jkOmTX+6WYprWYyB/gD+gmB4dJLy/xxXGXVq80qCHnkA7Bgm7P0xF+
         +FdiHyihDvMgeTSDNs/1ShiZNlQJgykY0kUElTe4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] clk: meson: meson8b: fix naming of the APB clocks
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        jbrunet@baylibre.com, narmstrong@baylibre.com
In-Reply-To: <20181223235836.12466-2-martin.blumenstingl@googlemail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181223235836.12466-1-martin.blumenstingl@googlemail.com> <20181223235836.12466-2-martin.blumenstingl@googlemail.com>
Message-ID: <154705938114.15366.1098954164811397084@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:43:01 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2018-12-23 15:58:36)
> Fix a typo in the APB clock names by renaming them from "abp" to "apb".
> No functional changes.
>=20
> Fixes: 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post =
dividers")
> Fixes: a7d19b05ce817d ("clk: meson: meson8b: add the CPU clock post divid=
er clocks")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Can I apply this directly to fixes? Or it's not critical so we can punt
until next merge window?

