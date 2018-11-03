Return-Path: <SRS0=gl0N=NO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11C7C32789
	for <linux-clk@archiver.kernel.org>; Sat,  3 Nov 2018 01:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B16420840
	for <linux-clk@archiver.kernel.org>; Sat,  3 Nov 2018 01:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="abQO6ANr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B16420840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbeKCKfX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Nov 2018 06:35:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbeKCKfX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Nov 2018 06:35:23 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED330204FD;
        Sat,  3 Nov 2018 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1541208353;
        bh=+twmcdsnZ8OYM0Jd/yV/Qi12hom3HJuqBblUVJLRa/A=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=abQO6ANrlsl8p36irS/Jfmo2CzW/VWpD7sQ3s3+9j6NvTUVqdBlbN9jTnx3iO7AMs
         s6Fd5PkEyjD3IKm7XQSJftvLss2nfHEKxVvwXRhdUirpuiA/J7tbUIQVqckDcqHAv4
         nmbYp6q1ewMIg7AG6rmy/ENDOf1nztb8sTX4AY5s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Ivan Babrou <ivan@cloudflare.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
Cc:     trivial@kernel.org, mike.looijmans@topic.nl, mturquette@linaro.org
References: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
Message-ID: <154120835220.88331.11131007130802849581@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: cleanup Kconfig to remove duplicate help tags
Date:   Fri, 02 Nov 2018 18:25:52 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ivan Babrou (2018-10-24 15:27:16)
> Before:
> =

> =E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82                                                                =
=E2=94=82
> =E2=94=82 CONFIG_COMMON_CLK_SI544:                                       =
=E2=94=82
> =E2=94=82                                                                =
=E2=94=82
> =E2=94=82 ---help---                                                     =
=E2=94=82
> =E2=94=82   This driver supports the Silicon Labs 544 programmable clock =
=E2=94=82
> =E2=94=82   generator.                                                   =
=E2=94=82
> =

> After:
> =

> =E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82                                                              =
=E2=94=82
> =E2=94=82 CONFIG_COMMON_CLK_SI544:                                     =
=E2=94=82
> =E2=94=82                                                              =
=E2=94=82
> =E2=94=82 This driver supports the Silicon Labs 544 programmable clock =
=E2=94=82
> =E2=94=82 generator.                                                   =
=E2=94=82
> =

> Signed-off-by: Ivan Babrou <ivan@cloudflare.com>

What kconfigurator are you using? From
Documentation/kbuild/kconfig-language.txt it says that help and
---help--- are not actually different, so I think you should fix the
configurator you're using instead of trying to patch all the triple dash
helps out there.

