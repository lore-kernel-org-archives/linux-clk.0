Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84F5C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 955FD2087F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544687975;
	bh=jY8c83G8UYF5xZLS6iclR+FfgL6lKU6OFikMYFTGz5U=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=Nu1Iid+KiQKpYcW/AESpm5EuH0xPOhPaM9oCLoz5yvWMIdm1ywoU5I2UR8zq81PTm
	 nJh3OkdGBbNBOMYensDQTL+fSL6BX3ZM3HpTzyGW+UcsZT6sZ5t348otMbtBvkNDl2
	 UPoW4JSFJAUH8C9y+jDx32EWeYHqyHK9K7oAO1bA=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955FD2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbeLMH7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 02:59:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbeLMH7f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 02:59:35 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A94A52075B;
        Thu, 13 Dec 2018 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544687974;
        bh=jY8c83G8UYF5xZLS6iclR+FfgL6lKU6OFikMYFTGz5U=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=pEHWTKjHS0uHq4mPOgJ7djuVS0WtvQggvKRI9y0hlUxqCx6LYjicRpDbvG7gFF3Zv
         KcYgotB7bdPR1x4c0Nm3JGANBHyYRdIkTzSX0LlzElNP/UpyFvy0l+PpCgMXn4ba3v
         f8sYMcP3bvaNNcpa3m2zdy/uASLM6fi938SVDDgc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544662938-5020-6-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V11 5/7] dt-bindings: clock: add imx8qxp lpcg clock binding
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-6-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154468797397.19322.8875653201083179691@swboyd.mtv.corp.google.com>
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
Date:   Wed, 12 Dec 2018 23:59:33 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-12 17:08:06)
> The Low-Power Clock Gate (LPCG) modules contain a local programming
> model to control the clock gates for the peripherals. An LPCG module
> is used to locally gate the clocks for the associated peripheral.
>=20
> Note:
> This level of clock gating is provided after the clocks are generated
> by the SCU resources and clock controls. Thus even if the clock is
> enabled by these control bits, it might still not be running based
> on the base resource.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

