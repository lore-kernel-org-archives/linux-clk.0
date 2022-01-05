Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FC0C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jan 2022 23:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245458AbiAEXlO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jan 2022 18:41:14 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:59038 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245471AbiAEXlF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jan 2022 18:41:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D50961849
        for <linux-clk@vger.kernel.org>; Wed,  5 Jan 2022 23:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D597CC36AE9;
        Wed,  5 Jan 2022 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641426063;
        bh=G4C3FTeEqFCchis4B9Pm8AP/vx5kPQjerC9GFilM3Ys=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=UYcBnuwUd8aT8AjjP9i42BD2hicdUpwmKWBIl1cYJPSY9jyU1WoQYU2dtevex1TPh
         wlOqh1tWBswUwMUDFQU/pVTxRe57bGfJZ7V5piP9rYovC7zux950WC2LTUmqnYtSoX
         knrjDG/fVNjSNJ0+GoMFDkSHOZkbX/bYmtkvLLuFKCbK9QM3V/YZnNzr9mQ/Yt1Ba2
         LWRDih5XzQIDW6YJUs2csyGjWE67O8sz9AEFzcBNMhX7YxHo/Vy2ovVBQ/zXV/Cb2p
         6SISQGDPo7N4JBp84SaVuO+JYuKdwEfl7EShy1QrOK4TqISuzo38QQUH4hee1MNoLT
         LcOXDZmizQYLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com>
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com> <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Date:   Wed, 05 Jan 2022 15:41:02 -0800
User-Agent: alot/0.9.1
Message-Id: <20220105234103.D597CC36AE9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2022-01-04 20:24:28)
> On Wed, Dec 8, 2021 at 6:06 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
>=20
> ping

Please don't send "ping" at the very end of the mail and trim nothing
else. It wastes time.
