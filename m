Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C051C43461
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 19:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5F4F613DB
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 19:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347996AbhDMTFw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Apr 2021 15:05:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343672AbhDMTFv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Apr 2021 15:05:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12CE4613CB;
        Tue, 13 Apr 2021 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618340731;
        bh=B6O7GNSXnJENfuzG+opf+qDAj5k4Mcr2r2Eijr/z5a4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tnQLhD8nNgWL2I7np/c3kJX3JsVBjqSNXwgJsMN5M0MKPBpl5H6qz0FKzvmg17x/F
         5QKCRarmcEZyXtLn46TWQbsqXCaD4JT3+3wkbKkQf/KiLN3xnotbPQAvTMmfqWIizf
         UV3iRDH0O4sHdOuyDu3ha8RykGHjIbHeqiEHrc9i0j+opjHVY3Wzz88LGZ5fqE+myz
         pxLkf+weILU4Hd1iHUlLsSfxqzlIXrNPOB2mLeb3yNLsls+haix1fAbV9LYphxX6Yj
         KSV4FQ3Sb1De4qifN7mraDr1UlsCbfvu9zg92Prxf+9l4mLNxe/Vb6WIjh42N2IBkp
         lpS9FvuSGgePg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210410055059.13518-4-sergio.paracuellos@gmail.com>
References: <20210410055059.13518-1-sergio.paracuellos@gmail.com> <20210410055059.13518-4-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v13 3/4] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 13 Apr 2021 12:05:29 -0700
Message-ID: <161834072975.3764895.14421546837704264769@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sergio Paracuellos (2021-04-09 22:50:58)
> Vendor listed for mediatek in kernel vendor file 'vendor-prefixes.yaml'
> contains 'mediatek' as a valid vendor string. Some nodes in the device
> tree are using an invalid vendor string vfor 'mtk' instead. Fix all of
> them in dts file. Update also ralink mt7621 related code to properly
> match new strings. Even there are used in the device tree there are
> some strings that are not referred anywhere but have been also updated
> with new vendor name. These are 'mtk,mt7621-wdt', 'mtk,mt7621-nand',
> 'mtk,mt7621-mc', and 'mtk,mt7621-cpc'.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
