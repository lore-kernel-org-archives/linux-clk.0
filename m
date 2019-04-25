Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19F6C43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 23:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC4CB2084F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 23:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556236600;
	bh=niUs8URBz+ng/dwpjAeTrS8PZOQWc/In1kj5D/B5LU0=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=gPSXl75XuxEnQj9cCsZWYRxV/3TKZEv4TM/NRaOCsYCRqLru4CJDRHeMKk8B99OIg
	 7lZj4ME00T6KI+8y/Yf44qzkxM5rMcvY9NNOxAQzptqtTqFprGlK+BoQooNxUK524y
	 tIZtlhZGf5wSlgGiIp7SNzdwa0yd8bpuo5PbcZ/g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfDYX4k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 19:56:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbfDYX4k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 19:56:40 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8914A2077C;
        Thu, 25 Apr 2019 23:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556236599;
        bh=niUs8URBz+ng/dwpjAeTrS8PZOQWc/In1kj5D/B5LU0=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=UqqEDmvgQ/RYLXNhm3O782OGuRLicYe9L/E2aWGNtzBkX6aEREknJTbwmVUmYighR
         /dEA+31gzVoOx+igfZ+KV+fYdlGcsGMSE2yS/oNWt0w30M8dHdPewSZyRivzLW1L9A
         UKxvbYXbfwgz1PtF+EPIqzVMPAHHKpyP2MobWHhQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190425081454.3210-1-ping.bai@nxp.com>
References: <20190425081454.3210-1-ping.bai@nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx: keep uart clock on during system boot
To:     "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>
Message-ID: <155623659850.15276.16522575330550453078@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 16:56:38 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2019-04-25 01:10:08)
> Keep uart clocks enabled when earlyprintk or
> earlycon is active.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

Looks OK to me. Shawn, will you pick it up? Or should I apply directly?

