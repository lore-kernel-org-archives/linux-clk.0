Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE677C46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A547220813
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:02:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqJ3pcSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A547220813
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbeJWXZq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 19:25:46 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34820 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbeJWXZq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 19:25:46 -0400
Received: by mail-io1-f68.google.com with SMTP id 79-v6so1076602iou.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Oct 2018 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=XOEYL3G9ePUZCdNDLYV93d8TIhxq+PXe4Kb0fkotKyg=;
        b=QqJ3pcSa2MwDKGRdHA9oCBGqnWOuuaNWhWvzkjGEKX6CvoLGJlZoMQ6EmK9EcRHEQG
         vFXpSybeJs8q/4D36OtndtM8aqapsk7PK55I9oGBVnnmmxycS672MQjXqXMBduWX15U2
         Q4MwReTjSU1ciL+VErA/JLHHc0mSpbYVEvft8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=XOEYL3G9ePUZCdNDLYV93d8TIhxq+PXe4Kb0fkotKyg=;
        b=E+q+VkK+a3ZQ6pxm5IkVBhlo63j60oI5X3k50/3+ABTQT7emvlRF9M69sjN9v66yKJ
         ExloBdhN1FWaB+x8257bmUYOKw2d1aOuI0Z9R0SlL/yXdq9D73oQlMXUhkIbZ5djy2tc
         BfQjZ4ero4JhLtIWugYd1VmWrW9gf1yXH9qOK3w4GhTHDYYCefBuSvVYDSkERcPK7WbH
         uy+pGKdFB3zkW/cAaAKURAKxrHVFbI0nAaNhrUKIvG8cJVzjB36/+9UtEWX2jt7jlise
         8IrjOXnDtSCt8FwTbDScTTvUifLm7USb1ia5bI6u7eYzkhnRX+JbefFQ33dJBr4i0avI
         TqOA==
X-Gm-Message-State: AGRZ1gJz20COCCfgrYYJg879cN7C3V4qcyxdS0PrfJLhRznKk4UOoDeW
        wNoSC4n5u0gXxOj0ra/sWTgoJL32vb7WU8vjaL5VZQ==
X-Google-Smtp-Source: AJdET5fSHpeGjKkk+MYfaPWkJ1xRd51ar4auYWvGwWa3JZ9HTZEvOeqcZ9AihHVNNEtEy/ZXiNi/eLhd4XvoLAiP1BI=
X-Received: by 2002:a6b:8fca:: with SMTP id r193-v6mr7846530iod.266.1540306918868;
 Tue, 23 Oct 2018 08:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:3941:0:0:0:0:0 with HTTP; Tue, 23 Oct 2018 08:01:18
 -0700 (PDT)
In-Reply-To: <20181012122924.5543-1-chris.brandt@renesas.com>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 23 Oct 2018 17:01:18 +0200
Message-ID: <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12 October 2018 at 14:29, Chris Brandt <chris.brandt@renesas.com> wrote:
> Basically the same HW block that was used in R-Car Gen 3 is used in
> RZ/A2 (with only a couple small differences).
>
> Not sure if you're going to like the Kconfig change or not.
>
> Chris Brandt (3):
>   clk: renesas: r7s9210: Add SDHI clocks
>   mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
>   dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
>  drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
>  drivers/mmc/host/Kconfig                           |  5 ++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
>  4 files changed, 36 insertions(+), 5 deletions(-)
>
> --
> 2.16.1

This looks good to me. So unless someone objects I intend to queue
this up for 4.21, once 4.20 rc1 is out. Or perhaps the clock patch
should go via the clock tree?

Thanks!
Uffe
