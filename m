Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F620C4740A
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:22:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 265D621A4C
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568024563;
	bh=zm7Ckb3vJm7XZDwNVWawHvJy7QPdMobeLyOttafsdbA=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=Y5US/u//F35E+8KgH1zPJ77NzPyrVO4/nEG/7GMnfYm4Uj6IWGpoKIItZ7hIRG/X7
	 8g9HnWps+yRYUYbJo7aBlqSKJVTmG1ngmt6nNI42huKjOJOOtrysNUZK4ZIySNiacq
	 GKy62JWXm6VtarULAj/iOCsTwhbffsHd0mO5fTTQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730282AbfIIKWj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 06:22:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730276AbfIIKWj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 06:22:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62D4F2089F;
        Mon,  9 Sep 2019 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568024558;
        bh=zm7Ckb3vJm7XZDwNVWawHvJy7QPdMobeLyOttafsdbA=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=Lc/9rMXhFFZyzrgkKlm+Z13XbyrHRhwnKKVo8TEFR3w1/IF6IlGVGjm8/JzXGmCdP
         481liLE5b8AFoUGcNbqMfKTVnShBIBZnYRWTZrikhOlEbj0wTnBrW++9tiKX3UTVPk
         SMzY3O87W5+B8fD1qoq0ufpaNqme8Nn8Fq1BlhM0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826164510.6425-4-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-4-jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/5] clk: qcom: hfpll: register as clock provider
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:22:37 -0700
Message-Id: <20190909102238.62D4F2089F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:09)
> Make the output of the high frequency pll a clock provider.
> On the QCS404 this PLL controls cpu frequency scaling.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Please move this earlier in the series.

