Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCC4C352A4
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 23:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 476072168B
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 23:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581548737;
	bh=Q8remgjc6BJfSrw0fgvMPAOY8vBJxMRbmu+2Os3kgvw=;
	h=In-Reply-To:References:Subject:From:To:Date:List-ID:From;
	b=H4BkFVrfRv1SwuTLJudFNXyitP8NMyX50qztDagzBdkMOAXrxOgPo0o1jiWPjqK/3
	 AhVSa1rd37OxYIrN1PwUrz5XQRI9T8jqEJOEyJF7mkM6LQdccPuOCh3q8pSihgKzia
	 cmH2TO9EBrR+6j5lPBBMCQ3yOQeKpG6t0Ok/BaHc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgBLXFh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 18:05:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:48158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728674AbgBLXFg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 18:05:36 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34E9E21569;
        Wed, 12 Feb 2020 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581548736;
        bh=Q8remgjc6BJfSrw0fgvMPAOY8vBJxMRbmu+2Os3kgvw=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=X3zWwdVfdK2Snryjzfd7k41UICO/rrHlitsqdJeg169LZuwibp27/WpzryqWKhU7b
         pOsLSLOTbvI8e2cQeaBKhOha9j0j7s1/bS/mJ0rMdMGReolL2En4eh0I4KUsthZACF
         sso8/RjnkjlL/kcM/l5tOFRqYEt/bAHqlDdX3kWg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-3-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-3-git-send-email-vnkgutta@codeaurora.org>
Subject: Re: [PATCH v2 2/7] clk: qcom: rpmh: Add support for RPMH clocks on SM8250
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
Date:   Wed, 12 Feb 2020 15:05:35 -0800
Message-ID: <158154873540.184098.7134666264772145812@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:22)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> Add support for RPMH clocks on SM8250.
>=20
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---

Applied to clk-next
