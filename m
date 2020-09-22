Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844D7C4727D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 329C2235FD
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600801455;
	bh=0zLj1Zp4yEUhXDoB1mS8o11AELdl52Ear0cVA46QZbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=CPDFmIIWhcPqMCSAY75+mFt7KOJM+DlcwarSBoALSreheJMGE6NUxL2I2d4vc1LY8
	 psAzzapMY9cm0VHfKhRdNg+TlRHURZX/NrSW8fISP658pc+IeAjc94iHbhdffg982z
	 lsW4zoyNrycl47KHrOskoOQHQz4gLPEvpkT9M7mw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgIVTEL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:04:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:44048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVTEL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:04:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B1F02311C;
        Tue, 22 Sep 2020 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600801451;
        bh=0zLj1Zp4yEUhXDoB1mS8o11AELdl52Ear0cVA46QZbE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OXVli7bY/RDb/mnAPBb9JlWQj04o+D3fAFZhltpmBDWgBqOpTLr6DDphvQES816cc
         Ac6++YKDfR/lOgXjA5jPLNeYvuEdCcwIItPFfDeX3GYm8H8PVH45YQTQxs5xF6N6so
         saefQbA5CqYrlr+C8OSiOIqKG0JszPI725AeoGEY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911153412.21672-6-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca> <20200911153412.21672-6-jonathan@marek.ca>
Subject: Re: [PATCH v3 5/7] dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:04:09 -0700
Message-ID: <160080144986.310579.10160142485491781485@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2020-09-11 08:34:05)
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM8250 SoCs.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Or it really looks like we should introduce an sm8150/sm8250 binding
doc. Who cares if it is mostly the same? When using git format-patch it
may be possible to see that it's a copy of another doc to minimize the
diff.

>  .../bindings/clock/qcom,dispcc.yaml           |  4 +-
>  .../dt-bindings/clock/qcom,dispcc-sm8250.h    | 66 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h
>
