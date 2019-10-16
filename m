Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F809FA3728
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 23:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11B0421925
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571268805;
	bh=e1UZeiwY2lbbfxx44BPnbP+uIIxBxoVbV2hFkhQyn80=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=Xzv8KFnk2RB6vANA16VMfEe8Sx8IiGgtJ/uor97lDkE9/SY+9D2vfdLiQE7L3IZ11
	 s50aJYSNZpg8iYlm9M2Ud9Wj1ltZPqGmI7nywCw25Sjq8Mxd8AO1iiviAWJ/Mlmc3w
	 Ssg1THDg4scgS4Hqqi0cxpBNJ0YHcrJ50RsMm4qo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438337AbfJPXdY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 19:33:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:55258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732849AbfJPXdY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Oct 2019 19:33:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBBE121848;
        Wed, 16 Oct 2019 23:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571268804;
        bh=e1UZeiwY2lbbfxx44BPnbP+uIIxBxoVbV2hFkhQyn80=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=GpN2mL9gAVPl8dsDafr3tS21dkA+xKvTc0mGewMa2w0JdNrt1+NZJvBD/371y1tOE
         Y6/i8NNhKYTgy/ncpy1QdZZxzsOzEkyUElDwAIFvjipMxVdiDu7npCQ7NafYpFfjQr
         uxb0qibunv+vYZlLPBYTgvmj0TSgogPi9OzTkYIE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191015121035.24736-1-yuehaibing@huawei.com>
References: <20191015121035.24736-1-yuehaibing@huawei.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>, matthias.bgg@gmail.com,
        mturquette@baylibre.com, wendell.lin@mediatek.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] clk: mediatek: mt6779: use devm_platform_ioremap_resource() to simplify code
User-Agent: alot/0.8.1
Date:   Wed, 16 Oct 2019 16:33:23 -0700
Message-Id: <20191016233323.DBBE121848@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting YueHaibing (2019-10-15 05:10:35)
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

