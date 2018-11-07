Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C4CC0044C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 18:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EF262086C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 18:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF262086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbeKHEWM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Nov 2018 23:22:12 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:40711 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbeKHEWM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Nov 2018 23:22:12 -0500
Received: from null ([172.19.246.153]) by mrelayeu.kundenserver.de (mreue106
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1MkYoK-1ffKaU27J8-00m0UW; Wed, 07
 Nov 2018 19:50:08 +0100
Date:   Wed, 7 Nov 2018 19:50:07 +0100 (CET)
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Chris Boot <bootc@bootc.net>, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, Martin Sperl <kernel@martin.sperl.org>,
        Florian Meier <florian.meier@koalo.de>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <815844594.141792.1541616607053@email.ionos.de>
In-Reply-To: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
Subject: Re: [PATCH 0/3] Fix MODULE_LICENSE of bcm2835 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev39
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:mBTcsUsjJPVaeC4nXfMhweyIbEwlZ6cnMBBTrL8n61cfVNqr3j4
 bfUy1Z++RpPGBcZbrAEP1plQCpe+Pw1M8y8u0i+WyOX40KFSfgTU1c9lyE3nahjnC0dgeVm
 jSawLWj+13iCaGFI1Rw6lYSE2DoFzsIqp8Cw9KsG5NHyw46CPUgALVXTYUeTI8rQUR/Nqcx
 3WRd4jxMVDYL4Gq4CvAUQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wvpIYgcAOrY=:AwFcIbhyH9z+8cPNrwJ16R
 R2ePiRyFE9+1gL3Z4D6JY4+K8BvRGINQhqLW+4LAa1fCPKKlIOsWvj80msRWDZdMUPhJu83vG
 PaTdr0bZ2cJR7oT9xZMW8tcpHnj92ha0ieqjGnovPtZjVkexWyE3JKTylqGfb3iA9Jthg/8Hk
 tk1XDaX6Le/A+Gz9PbGsyzL4QNKMgQM1IHn7h6eDYF6EK54JytG5SGaxrGv4Z0ThdhSNbB8Wm
 nLgRWjqSa840utt2nLajSfjG94SOOCzrhuHid1IN3w7rnQ71+ybuCpyxPCSbAnBIQnEo8rLIv
 HCm3SFeRVyurYrR7ibo6XPAk1P3/Z+MjdDUwZGcW+72ohKYrnuRPJmuDxcGCkaG0g6g6fcSlG
 t4vDEm0Irk7A0GVqFXJfXg+/BWFGicgcR/hSrj5BPOXqc70NreQOq7YQODMmXod9NIsWqhpBy
 q7TRJZXo1VLB7QGvekHkjnTZ1Jzd+l3T6K0LYMGjHFNW20q997GLDWJd7qH8iy8PVlpezx4xj
 S4mYFx9mMZX0SAioiJqRnzhiCxJ3/jpBlE9Vsxr89LfcaQlSfeQZg+YSY3fGgNyqbpFmUI5xo
 Zyz4z93BP7JmNJQcQU5zmC8vsXFKSEU89mGUR7DzCFRAKlFQH7zMewRvGDuOD+cTPN84fLo59
 xZW+ZBZJQKHwGU48IMVvh8AzwsV7PAVqLRJMny1jgUBWCd9Jpaa0z4NVnHjyrf++SxWXsZUFi
 BHwI0a39aecGe2SQFTZxicavyRvN1Mg+55RLsQ7ELfMQWcaaHsRBmqHWxthmlwAO1P/BJqeUv
 UMJahqH8TCE8rdcLvJjzKJTZ6EXvtm0UMhiOZIr9FAaOYPaiLg=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mark,
hi Vinod,

> Stefan Wahren <stefan.wahren@i2se.com> hat am 23. Oktober 2018 um 13:06 geschrieben:
> 
> 
> In preparation of a treewide switch of all bcm2835 drivers to SPDX tags,
> we need to make sure that the license text and MODULE_LICENSE matches.
> 
> This series starts sooner than usual to have more time to collect the authors
> ACK.
> 
> Stefan Wahren (3):
>   clk: bcm2835: make license text and module license match
>   dma: bcm2835: make license text and module license match
>   spi: bcm2835: make license text and module license match
> 
>  drivers/clk/bcm/clk-bcm2835-aux.c | 2 +-
>  drivers/clk/bcm/clk-bcm2835.c     | 2 +-
>  drivers/dma/bcm2835-dma.c         | 2 +-
>  drivers/spi/spi-bcm2835.c         | 2 +-
>  drivers/spi/spi-bcm2835aux.c      | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 

since i didn't receive any objections from the authors, could you please apply or should i resend with Eric's Reviewed-by?
