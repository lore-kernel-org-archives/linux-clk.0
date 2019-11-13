Return-Path: <SRS0=K/Jc=ZF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F624C432C3
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 21:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C015206EE
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 21:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573681208;
	bh=M+nipflJymUR7+6kjYIKQWkkOgtmFWX20qEyoriHsD8=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=EXw4eHN5Ir1lEmtIJBQVLGVCU2Ik6f0HNqQENoR8m05e/3asTPgEmWPBhUlg01gV0
	 GF8/rrUMOalB/8NHydg7gezMM7bOB2KIikoKDwjLznoLNxA3HvZmHSJIz4FFTG10ZV
	 7G9cFhK6WZ2y6uTbOtNy1IBmH/mY4HYeRVsGW7uE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfKMVkG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Nov 2019 16:40:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:39544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMVkG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Nov 2019 16:40:06 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F826206E5;
        Wed, 13 Nov 2019 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573681207;
        bh=M+nipflJymUR7+6kjYIKQWkkOgtmFWX20qEyoriHsD8=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=OnDe1A/nWN7+PYH6RwHPZdT674aBQCp3OhjCKTHwbOZj7pBeQxyAwlQL57Q3MAI0y
         5yVZ70DGtBIiuiEX07mxJIHR4GgE+pqDv3jyXXhMwl9JnrLXCf7aWSwG60+P5xz3sC
         yJayvNgD/sav/rrTsEQlBGuO3xQCGGxq+7swd0+Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191111140420.36092-1-yuehaibing@huawei.com>
References: <20191111140420.36092-1-yuehaibing@huawei.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     gregory.clement@bootlin.com, mturquette@baylibre.com,
        tiny.windzz@gmail.com, yuehaibing@huawei.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH -next] clk: armada-xp: remove unused code
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 13:40:05 -0800
Message-Id: <20191113214007.2F826206E5@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting YueHaibing (2019-11-11 06:04:20)
> drivers/clk/mvebu/armada-xp.c:171:38: warning:
>  mv98dx3236_coreclks defined but not used [-Wunused-const-variable=3D]
> drivers/clk/mvebu/armada-xp.c:213:41: warning:
>  mv98dx3236_gating_desc defined but not used [-Wunused-const-variable=3D]
>=20
> They are not used since commit 337072604224 ("clk: mvebu:
> Expand mv98dx3236-core-clock support").
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

