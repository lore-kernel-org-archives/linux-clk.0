Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4075AC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 113F720836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781907;
	bh=9S8mGznFfkpPmBMKuHBNi9DafR291+twnzDd/DcRW08=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=C1VEajRY4BzF92iLQM4KIqa5Nhy+jx1gAcHA4iAhzxwsbsYdxZxfRj6+uX9yQ7qtS
	 HyE1WX1ei6F9nORf+Ra+UPcYcVFlNgpyPiNZT9Hp6fG3eRRuYnJz24GBZZrUg1sl/u
	 C4i2yI8Hqq0E9SnQ38zHJlBmofQ7KGdRB7lvDdnY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfBUUpG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:45:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:45870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUpG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:45:06 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C175206C0;
        Thu, 21 Feb 2019 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781906;
        bh=9S8mGznFfkpPmBMKuHBNi9DafR291+twnzDd/DcRW08=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=Bt/85473672pCLOfULDIta0GgnLgYPH4RbOp0b0eL6qiR+Wb+sfN1UE7XEHiCITLY
         jlm5BhTKgXruGx0WHQuf+dq7hVD7rdq6qU/trhSZ5QRx4HbF/PzXmi3apqNi6XgnDj
         HEDWeBagI17ZN3j9YcKxnlu2yuRxtwSwoDDfGhxI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx8mq: Add missing M4 clocks
Message-ID: <155078190530.77512.6127881894366721461@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190130201725.18961-1-ccaione@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190130201725.18961-1-ccaione@baylibre.com>
To:     Carlo Caione <ccaione@baylibre.com>, festevam@gmail.com,
        kernel@pengutronix.de, l.stach@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-imx@nxp.com, mturquette@baylibre.com, s.hauer@pengutronix.de,
        shawnguo@kernel.org
Cc:     Carlo Caione <ccaione@baylibre.com>
Date:   Thu, 21 Feb 2019 12:45:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Carlo Caione (2019-01-30 12:17:25)
> The clocks list is missing the clocks for the the M4 core.
>=20
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---

Applied to clk-next plus all the fixes

