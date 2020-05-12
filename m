Return-Path: <SRS0=sCEi=62=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BDDC47077
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 23:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 577EC20784
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 23:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589326061;
	bh=Y9+FnbQlpSb4RPN2aukkia02/1PIeKWilIaFdtihQx8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=MpAmfdnv+a0eZbeg2zJAS6QAemebCmxkvlOP/T7H3F6n4aQL1srNBb1gZrqxTn1S3
	 dseXlyE1GI/Kii/gR6YuKd/qtmXmLU/2hv4t2CMvCisv+NYbcq+tR4H/ndp31EhSjG
	 BWTWdbOKdcakoDxS0h6RRJ2m4RDoy4WAq/q5oU3s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731598AbgELX1l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 May 2020 19:27:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgELX1k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 19:27:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6765620753;
        Tue, 12 May 2020 23:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589326060;
        bh=Y9+FnbQlpSb4RPN2aukkia02/1PIeKWilIaFdtihQx8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MzGZmwzsR/TZHjURU5ETxm4UO57HfQ9OfDho0RnroKPSeIHVybIqvUozvfHhbwJ6D
         z+G7URbyv1lM0TfcEp3Nay4gUOLINeXwouTv76djoCubzl+e8+hVNgshY/tTkvxFZJ
         EeZ700gGcPiyhV/47y1OUuQY3egTq6sbrZCy9HiM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200507075026.31941-1-geert+renesas@glider.be>
References: <20200507075026.31941-1-geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Convert to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 May 2020 16:27:39 -0700
Message-ID: <158932605967.215346.579509459834719291@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-07 00:50:26)
> Convert the Renesas CPG DIV6 Clock Device Tree binding documentation to
> json-schema.
>=20
> Drop R-Car Gen2 compatible values, which were obsoleted by the unified
> "Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
> bindings.
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
