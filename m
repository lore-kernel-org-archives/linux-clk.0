Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EE9C4363D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:04:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1ECB23600
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600801497;
	bh=4+a97TEFTL8Ui/E62HTylJNTMr2hyxwIHdDxIMr1+No=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=W33XAs/PQqHjHUsT2yAng6Lie78xaKV1zwDEkpdzaJwU0pqrOAJ9W3jlMpRuaENMk
	 VNaq5Wbc7XEQfYF3N3klNnB68Z2HAs+DbglJ+zDn5yf2Z5eXzDitDmjjW4HtUixU6x
	 dx2Z1LiHAmjs5/Jzfu5BeAiwtYEaKDOIXsxTtN2g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIVTE5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:04:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:44952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVTE5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:04:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8D202311C;
        Tue, 22 Sep 2020 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600801496;
        bh=4+a97TEFTL8Ui/E62HTylJNTMr2hyxwIHdDxIMr1+No=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CA1G9jneTexNOCk/1jxpR71DTk/JQzbR7hoy0xz1uN6tacPvUo1UjAkgYfQbxUDS6
         wrisuapns7EzfLOaPvKL9zBu4RR18f9D/nmylDowpJk7NDb6u93SYROwfxMyG/bdD5
         3IA6NtkO7/4DtsrFSoKDF3gTNVdCrMKN8xpqMJ5Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911153412.21672-7-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca> <20200911153412.21672-7-jonathan@marek.ca>
Subject: Re: [PATCH v3 6/7] clk: qcom: Add display clock controller driver for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:04:55 -0700
Message-ID: <160080149549.310579.17453759593211612997@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2020-09-11 08:34:06)
> Add support for the display clock controller found on SM8150
> based devices. This would allow display drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/clk/qcom/Kconfig         |    9 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/dispcc-sm8150.c | 1152 ++++++++++++++++++++++++++++++
>  3 files changed, 1162 insertions(+)
>  create mode 100644 drivers/clk/qcom/dispcc-sm8150.c

If the bindings are the same for these two drivers I wonder if there is
anything different between the two. Maybe the two drivers can be one
driver?
