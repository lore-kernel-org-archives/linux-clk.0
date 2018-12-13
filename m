Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A65C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EBED20873
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544687288;
	bh=Q3r/jTCRwkDt0ZVETnTYMmZNfuTM51IOe1RFi0X0ARw=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=QxnIRpo89T8LQh7E81EGAA/t+rvX/1QK9h+LyNRzOyy4t5KHomayNT5jJkAi1BH4S
	 eMinXHNxaMYKoldkgJjohByVWl62xDnCOGplMeUIloYXX/tugJZHhoVAdtE4HUKZNf
	 JDUMA72CKgb0OZzVFeKUdGiTODY3hDSbK/Z7LJgw=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EBED20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbeLMHsI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 02:48:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:39460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbeLMHsH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 02:48:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B2D12080F;
        Thu, 13 Dec 2018 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544687287;
        bh=Q3r/jTCRwkDt0ZVETnTYMmZNfuTM51IOe1RFi0X0ARw=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=1Wkrxx3arIw1W6AJ2XRJb0I2Y8q0ABHHEfj/4DhC5IYVwIV/f37+j8u3qiqd8y1CX
         cvqrDYkDpH+XQr83UkH3f/CYQ3KqZZsbMzH4Hz3mTXg+UYoR0NjF+3DtQ4fZRUr7h7
         w2t5UetQSt0a0RvJukXEP1gR2TlGrTVs74vAHyfE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V11 2/7] clk: imx: add scu clock common part
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Date:   Wed, 12 Dec 2018 23:48:06 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-12 17:07:55)
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 37478ba..5c26f4e 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -3,3 +3,9 @@
>  config MXC_CLK
>         bool
>         def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_IMX8MQ)
> +
> +config MXC_CLK_SCU
> +       bool "IMX SCU Clock"
> +       depends on ARCH_MXC && ARM64

This should depend on the IMX_SCU config too, right? Otherwise
compilation will fail.

Plus, I can't seem to compile this driver regardless, because the
defines for the CLK messages are in some header file that is just
included in another header file, and that is all going through another
tree. Why?

Is there any reason why those defines can't just be written in the
clk-scu.h file introduced in this patch?

