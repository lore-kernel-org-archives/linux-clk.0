Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34178ECE599
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 23:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 063A1218DE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571267820;
	bh=zirAnIqC/9yz2gPtuufIs13cXwxMvCqnY5qApb41f+M=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=VZ5nDu8zfQbnY/A0EDXS80ad580M8EGM5ImSTzzrAC0DpNuLk/iTWIjf9F17bdFIO
	 gjy9aGeObJ9kV3WlrQIE3pTMH9Zwn68R/jzm4XRp1QVVSP0c7PhsSi4Xcm3lqBaOKH
	 iUMNKnNbCB6PPFDf1VfsEK4OTsZlWHb0yvOtQcZg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391244AbfJPXQ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 19:16:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:53212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729316AbfJPXQ7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Oct 2019 19:16:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC61820872;
        Wed, 16 Oct 2019 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571267818;
        bh=zirAnIqC/9yz2gPtuufIs13cXwxMvCqnY5qApb41f+M=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=SaQGqpiLQgeR98Z05PO57/QW0eAM5ELeTAxUZFHS3ii0Oq3gWZkOhpRfJIynjgkeD
         fc8awSBNLZlD9W0zzTLo5OlzG8eb7jKrx5mrJ6H2l6WSqobT3S29gblenIA0BzAUxg
         fF2fv21XF4md2j1/KsDyDhRGUDtn+p+4qwQWEN0w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191014143642.24552-1-yuehaibing@huawei.com>
References: <20191014143642.24552-1-yuehaibing@huawei.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     broonie@kernel.org, eric@anholt.net, f.fainelli@gmail.com,
        heiko@sntech.de, mbrugger@suse.com, mripard@kernel.org,
        mturquette@baylibre.com, nsaenzjulienne@suse.de, rjui@broadcom.com,
        sbranden@broadcom.com, wahrenst@gmx.net, yuehaibing@huawei.com
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] clk: bcm2835: use devm_platform_ioremap_resource() to simplify code
User-Agent: alot/0.8.1
Date:   Wed, 16 Oct 2019 16:16:57 -0700
Message-Id: <20191016231658.CC61820872@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting YueHaibing (2019-10-14 07:36:42)
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

