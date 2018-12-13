Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C45C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0806A20873
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544687962;
	bh=Qo/MgbIVaC0wDOxMNfQU7vmvvzhViSVeVTXDbO8r2+g=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=LznJUgbr4YEAZWvTg/sW7mOCSzZ3sqZ+bVQv6fRt2dcdBKWWC3a1pN2kJQ8uMmjvF
	 +DIz9c8QuhOH/aQDnTWs858/pH/V+ccKIUFYR2sS4fd3Nlyg4bFMvwbmBMWCc4xjnU
	 j4GtrZjd3TTuP4ROF3M1GhlodQadoaBcGffb76ws=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0806A20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbeLMH7V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 02:59:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:42840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbeLMH7V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 02:59:21 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEB402075B;
        Thu, 13 Dec 2018 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544687960;
        bh=Qo/MgbIVaC0wDOxMNfQU7vmvvzhViSVeVTXDbO8r2+g=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=t1h8RCTYdPinMSJgiRdCObWeISpSkTl840Nls+JvvfpGsQj+cKh5b2rT22qfMOjv+
         rYC08BQykFJ+YLm9waUr+DDAGsrVUHpl2/I6Xw7Al78PVkHkHmnQY6thhUIa2pEqz+
         1HAh35XHW/HoAHDRzCuVmvCm5hf83R21JXRJ5QYs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544662938-5020-4-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V11 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-4-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154468796011.19322.4309575824691854273@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Wed, 12 Dec 2018 23:59:20 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-12 17:07:59)
> Add IMX8QXP SCU clock IDs.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

Please send these at the start of the series in the future. That way
platform maintainers can merge the first few binding patches into their
tree and not drag in the driver code to their arm-soc pulls.

