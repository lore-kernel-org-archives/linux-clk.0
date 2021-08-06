Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2519AC4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 059E861186
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240307AbhHFBKf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:10:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:56118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243145AbhHFBKe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:10:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD5B661179;
        Fri,  6 Aug 2021 01:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628212220;
        bh=nT9ry6c4LrsiJQ8cWoGAK0iM4DrJwicfZg25683t/dM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jAJw5sXxe5TUBzcneaByqTfHf2AH5PNzEHKBmReDMxB6a++i4z4KcTYyEn3JFz/K5
         fKXS4nDByIBt3KZUnW5bHEYU77xgzXFr8w3XRsdBvIg2+KKbrg29JC18pFtn5RKgza
         Mg/XrgRPpj8WSYML14ou9xUNIw/3+g+Hf+5aYGbalYoKB9jR5CGCIr4hluEzYB4OXL
         GQMKGE8uWEYMZ5HTuohCJcI+v8ZZYCHfaZpu2Km3zPRaLWh/fZ0/dUvqyonVd7wIwv
         92gCJiwBHsvpra+vfSDeoB1SJAms3K1dnXh/BXhDBvN9ZqpIhVPqt3ROzvccEw8RL1
         9sMFnMJZtho8w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210702225145.2643303-4-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com> <20210702225145.2643303-4-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 3/6] clk: bcm2835: Switch to clk_divider.determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 05 Aug 2021 18:10:18 -0700
Message-ID: <162821221874.19113.16738014912388895260@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-07-02 15:51:42)
> .determine_rate is meant to replace .round_rate in CCF in the future.
> Switch over to .determine_rate now that clk_divider_ops has gained
> support for that.
>=20
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-rpi-kernel@lists.infradead.org
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next
