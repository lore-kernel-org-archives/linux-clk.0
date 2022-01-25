Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDD9C43219
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 03:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1323404AbiAYD2R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 22:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3419045AbiAYCP7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 21:15:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FFBC0619CF
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 16:54:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 747D2B810A8
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 00:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC361C340E4;
        Tue, 25 Jan 2022 00:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643072077;
        bh=+C+h5euVFwJEnfRdppa3tzVMb1Z2AHmtHRCN2LwWY3o=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=I/cb/YrcLbwwNRfUsoY4tfbTrPUw3FmnbO09+hTVdD6fk9NO0HzUcxt8/IDsolqGk
         C3QlAeYoVEvQ4rVCH9L26YXLJPFStarc3BxGWaI7DmzhUI/hNWHl73J2p+RIJ1va5y
         vgDjAJG8bPBeYueTnTVS3EprqL95GoPYQLaZPuth08NtbvjyLB6HwNAS0HKx4aOxjB
         QZcgN3TpmrCxXj7nc3SWYpmtZ1dFnbbxhk3GcWAAmbgJgVC8d/OjmLKXxXh4Lc0bba
         I/EhW2ULwzj1r1FYdmRF558VTjrBAxsulTbAaFI0XOpEbs3+dHHy4nMtEwWjoTrNw7
         wrdexT5ppHzAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220115183059.GA10809@elementary>
References: <20220115183059.GA10809@elementary>
Subject: Re: [PATCH v2] clk: mediatek: Fix memory leaks on probe
From:   Stephen Boyd <sboyd@kernel.org>
To:     =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 24 Jan 2022 16:54:35 -0800
User-Agent: alot/0.10
Message-Id: <20220125005436.EC361C340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jos=C3=A9 Exp=C3=B3sito (2022-01-15 10:30:59)
> ----- Forwarded message from Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> -----

Applied to clk-next
