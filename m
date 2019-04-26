Return-Path: <SRS0=YBHQ=S4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301C3C43219
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 01:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 013EA20878
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 01:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556242721;
	bh=d7Ir08bBi4TxEsMumxprS2fXxUkfiMgE/kM9QWPr980=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=AOBxXNE6D+rGEIQD17bFBZSE1Ar55No+Ix9U46fecoOlmitlt/UDJAlOJK8dg1XH4
	 AvO0cuw7Jip2ErTZ2lILFZCZLi9HwrjR7iYGT6fzIkz1Z/4m6ha2SdxjeorN9xZSGb
	 MRDR8um3rAmOSePwtjyfVrSDZyAj9pKfWilITpOI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfDZBik (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 21:38:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbfDZBik (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 21:38:40 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9950B206BF;
        Fri, 26 Apr 2019 01:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556242719;
        bh=d7Ir08bBi4TxEsMumxprS2fXxUkfiMgE/kM9QWPr980=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=sj5suOkRDhCCYxAvrgjb1iZT5s/Wanay10AblXBH01zNZ29HZEPhYQGo6JfxbVdJV
         s4tkKeb4pV7vS+80pITct4vvjYvKfcB785xQnG7eAN8Yk8s616nKvMCNyHAIB9sSVA
         V2353gHuQqL6RSilh3guUfmi8uMSOeN+DxkBlt94=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190411082618.3502-1-paul.walmsley@sifive.com>
References: <20190411082618.3502-1-paul.walmsley@sifive.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it controls
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        mturquette@baylibre.com
Message-ID: <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 18:38:38 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Walmsley (2019-04-11 01:26:16)
> clk: add driver for the SiFive FU540 PRCI and PLLs it controls
>=20
> Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
> some device reset control for the SiFive FU540 chip.  Also add a driver-
> independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
> the PRCI driver to monitor and control the WRPLL instances on the FU540
> chip.
>=20
> Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
> open-source FSBL with a mainline-focused DTB.
>=20
> This third version incorporates changes requested by Stephen Boyd
> <sboyd@kernel.org> and Rob Herring <robh@kernel.org>.
>=20
> This patch series is also available, along with the DT macro prerequisite
> patch, at:

Can you please send the dt macro patch along with the rest of the
patches? I can't apply these patches and build them without it.
Typically the macro patch is part of the binding patch and Rob
acks/reviews it as one change. Then I pick that up and the clk driver
parts and they get pulled into whatever SoC tree is using the bindings
header with and those defines get merged up through some other path..

>=20
> https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v5.1-rc4
>=20

I suppose I'll go and fetch it from here manually.

