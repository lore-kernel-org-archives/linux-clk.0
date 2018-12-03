Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754E9C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 19:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 371DF2145D
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 19:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w1NdJlux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 371DF2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbeLCTpj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 14:45:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbeLCTpj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 14:45:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A9BA20661;
        Mon,  3 Dec 2018 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543866337;
        bh=EnsLlUJS5JUjIDKghxe/fBp0WmyUxMckPGNZhGOKOOo=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=w1NdJluxhs2dLFoHIWvt/yDZ3vac+2Jsix8TdB0fUgwkckl1d2lyLlrw9ePLJ+gdR
         zSHuHTEiSPmdb2SfuX3FBNDkJo3d1/9VmyaYDbvHN3d9OguDq6tAu/ZhId1o4IuDwZ
         i7jhiHdBW8drVef9+P0jRFOG4cLYUxBp6N7K4cIQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154386633644.88331.14352445218056608664@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Date:   Mon, 03 Dec 2018 11:45:36 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-11-21 06:12:16)
> This patch series adds i.MX8QXP clock support which is based
> on the clock service provided by SCU firmware.
> =

> Note: It depends on SCU driver which has already been merged by Shawn.
> So this patch series could go through Shawn's tree as well.

Any patches I didn't make comments on look good to go. Only a few
comments to address and otherwise it looks good.

