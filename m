Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB95C43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 22:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5643B2145D
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 22:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BklwkWW8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5643B2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbeJBEkI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Oct 2018 00:40:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:48656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbeJBEkI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Oct 2018 00:40:08 -0400
Received: from localhost (unknown [104.132.0.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FDFB208AE;
        Mon,  1 Oct 2018 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538431214;
        bh=SfFxf3mpKEt03qrmi5jPdAk2z/rRHCwiLqFuDVcgvcY=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=BklwkWW8VIjGNfCLJxkOSPXALR2iNIljlXzMw8WYQqMJOXsdpPtA1boaowZ58dUnx
         XQCuMzrCENu0Vp7tZFxwIodrJ/WbwcZkIzMKRsBfBmM9Qumw7EG7IUfGU4uA3T+OXG
         tFqQHN3dY39RtVqS5HDinLtFwPPsibU/oWg0GOac=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180929150127.aky3bijls3ncyunt@flea>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20180929150127.aky3bijls3ncyunt@flea>
Message-ID: <153843121361.119890.4708850852378442505@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] Allwinner clock changes for 4.20
Date:   Mon, 01 Oct 2018 15:00:13 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2018-09-29 08:01:27)
> Hi Mike, Stephen,
> =

> Here are our usual set of changes for the next merge window.
> =


Thanks. Pulled into clk-next.
