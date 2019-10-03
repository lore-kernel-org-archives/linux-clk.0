Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B84C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A86A215EA
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570136304;
	bh=0iDlOgmGjzztdigEgQ07MSXz3nO8TInih+pR+YSPXtY=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=Lc4w/nmHZSnUFwSoaPYCpD+N3HTa1yCFqDJrATd5lGt+e+/Q5kkUO3I/uPCnBA2ox
	 9TX5Phegifz2zNiX2z9wsmZg8F8OTfL+A8mqkOzQL4cCkp8Ws9Iels52tJGv/ffcRx
	 HYxQaT5eQv88iohNczofbrDYly5vzpg2ABmxYBF4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfJCU6Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:58:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728503AbfJCU6X (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Oct 2019 16:58:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 697A52133F;
        Thu,  3 Oct 2019 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570136302;
        bh=0iDlOgmGjzztdigEgQ07MSXz3nO8TInih+pR+YSPXtY=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=RxazhiNOx3GXbkaYCrllAXHpuTE7EbsYuP4Qwrc6J9FQMwRguLvT0GeZA1iEmkyUr
         QExByLCnyzSq8LTcb3X79CdDy30B2i2uYSUo115LL0jxEVhfoIzJ0Wzr+La/h/LfaW
         fVw0adbZiB88+I6CewChClwu64j+GxPKaDpfsGtY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190925112347.14141-2-ben.dooks@codethink.co.uk>
References: <20190925112347.14141-1-ben.dooks@codethink.co.uk> <20190925112347.14141-2-ben.dooks@codethink.co.uk>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/2] clk: hisilicon: fix sparse warnings in clk-hi3660.c
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 13:58:21 -0700
Message-Id: <20191003205822.697A52133F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ben Dooks (2019-09-25 04:23:47)
> Fix sparse warnings of a 0 being used for a pointer by removing it from
> the initialiser.
>=20
> drivers/clk/hisilicon/clk-hi3660.c:336:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:338:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:340:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:342:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:344:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:346:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:348:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:350:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:352:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:354:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:356:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:358:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:360:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:362:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:364:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:366:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:368:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:370:69: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:372:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:374:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:376:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:378:71: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:423:68: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:425:68: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:427:68: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:429:68: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:449:70: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:451:71: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:453:71: warning: Using plain integer a=
s NULL pointer
> drivers/clk/hisilicon/clk-hi3660.c:455:71: warning: Using plain integer a=
s NULL pointer
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next

