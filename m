Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081CAC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 08:00:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C012C2145D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 08:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="neStxoe3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C012C2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbeKUSeV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 13:34:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:59208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbeKUSeU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 13:34:20 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FA7C2145D;
        Wed, 21 Nov 2018 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542787252;
        bh=W4A9KaAiMgAKnnUauMywSXZGcM3sbAsFuXn92MTtGRU=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=neStxoe3Df+KQXd973j3NLTCDx5EzUI4ddE6np3GUKpNJSs9vGE2vac41ZVXrB03q
         1emhhDfxAGurnw1umEG9PoLFBxepTUPGEmz2R76zw7mI9EfT41cougiVGRV5IBCs6x
         4CLhcZITx/Ww8GTxkARbeuuTyMEMSQdKXbvqdCsU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jordan Crouse <jcrouse@codeaurora.org>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181119234706.5821-1-jcrouse@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
Message-ID: <154278725155.88331.15446251904707712061@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [RFC 0/4] msm: clk: Define a special power domain for SDM845 GX
Date:   Wed, 21 Nov 2018 00:00:51 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jordan Crouse (2018-11-19 15:47:02)
> The GPU GX domain on SDM845 is nominally managed by the GMU microcontroll=
er
> but there are certain circumstances when the CPU needs to be sure that the
> GX headswitch is off.
> =

> This RFC series adds a special modification for the GX power domain
> that always returns success for domain power on and uses the default
> gdsc functions for power down.
> =

> With this, we should be able to remove most of GX clocks from the gpucc
> and have a relatively clean way of handling the hardware workaround.
> =

> This is based on the series from [1] with some slight changes for the
> current for-next from Andy.
> =

> [1] https://patchwork.kernel.org/patch/10563887/
> =

> Jordan Crouse (4):
>   drm/msm/a6xx: Remove unwanted regulator code
>   clk: qcom: gdsc: Don't override existing gdsc pd functions
>   clk: qcom: Add a dummy enable function for GX gdsc
>   drm/msm/gpu: Attach to the GPU GX power domain

The clk bits look good to me, and would simplify the gpucc patches
sitting on the list. Can we roll those into or on top of the GPU clk
driver patches and split them from the GPU driver parts? I think the DTS
will be blocked on everything coming together, so it should be OK to let
the DTS bits come in and meet up with drm bits and clk bits all from
different trees.

