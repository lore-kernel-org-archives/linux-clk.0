Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C634AC43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36DB12053B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556217487;
	bh=+N1s/Rz/GLksjLm35o2/YFABKamCk5ClK7Sxuf/PV1o=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=tPBwqmzsiMoT0ue1M4xUa9O/qoJsBOQ33ugTSt4MDXZQFm+uEjiwTBeqehwXfggqT
	 SR7qzyudaXKFE/1M5c0yH6NWQjA2AQtvs8gRwh1u3aTr5RUdof/1BxBMBOiu5ORpPX
	 lEnqVHeucIsSuv4sgzOnXKBg4CykObv9D4Alegxw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbfDYSiB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 14:38:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbfDYSiB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 14:38:01 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC94D2053B;
        Thu, 25 Apr 2019 18:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556217481;
        bh=+N1s/Rz/GLksjLm35o2/YFABKamCk5ClK7Sxuf/PV1o=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=cwBN63Up/OHwhT2xxTigfsRx4qBs58CDTY8mUy2ArVsRJMkELOG7+uJLM6ZDiRm2f
         89TRWLOoTJgeb/q3egO8ZKb62QsArwSQUV+XOJMB/V90U6/Xlys/AfLQpERnbrY68g
         Wm+aOPXh9QpImTcv99YIfhG6jIOtHSgbjSIyXsNo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190424011912.2179-1-andy.tang@nxp.com>
References: <20190424011912.2179-1-andy.tang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qoriq: Add ls1028a clock configuration
To:     andy.tang@nxp.com, mturquette@baylibre.com
Message-ID: <155621747951.15276.7831904033728623994@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 11:37:59 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting andy.tang@nxp.com (2019-04-23 18:19:12)
> From: Yuantian Tang <andy.tang@nxp.com>
>=20
> Enable clock driver by adding clock configuration for ls1028a chip.
>=20
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
> ---

Applied to clk-next

