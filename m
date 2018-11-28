Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC74FC43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 00:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B726E2086B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 00:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8s5RUps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B726E2086B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbeK1LyC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 06:54:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:49212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbeK1LyC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Nov 2018 06:54:02 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92DEF20645;
        Wed, 28 Nov 2018 00:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543366459;
        bh=CIv6Os9HEx5OXan/Sw+0i/MeQM2R227Qzw9HCVZglLs=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=i8s5RUps8EViLXBeraYAqfF6ITcTn24fTKQobFn5zE3PyYGVnEGGc7/SMGLAmovnC
         awpnssK8G+3yWH58FqPOQu0Gm2O3IpnNCXk5UmupEDxEhfNqqYNqC1VjcFzHg5Hyi1
         Gme0s/FQdChFm6eyTh8KQhYMVBo2f5Dd6mnH0Lqs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jordan Crouse <jcrouse@codeaurora.org>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181126172032.11567-3-jcrouse@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20181126172032.11567-1-jcrouse@codeaurora.org>
 <20181126172032.11567-3-jcrouse@codeaurora.org>
Message-ID: <154336645902.88331.5166325909428492975@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 2/2] clk: qcom: Add a dummy enable function for GX gdsc
Date:   Tue, 27 Nov 2018 16:54:19 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jordan Crouse (2018-11-26 09:20:32)
> Most of the time the CPU should not be touching the GX
> domain on the GPU except for a very special use case when
> the CPU needs to force the GX headswitch off. Add a
> dummy enable function for the GX gdsc to simulate success
> so that the pm_runtime reference counting is correct.
> =

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---

Applied to clk-next

