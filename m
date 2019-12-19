Return-Path: <SRS0=J300=2J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED672C43603
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 06:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B061F227BF
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 06:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576735355;
	bh=ewI27VhHwdRnR0z6OQp2g90lBzpnaQJEXVkveXDDi+U=;
	h=In-Reply-To:References:Cc:Subject:From:To:Date:List-ID:From;
	b=k58yNUuodY4t1bsnmySoA0t10+3cvC0d/xjk1EAHIx8cPRX64Fy8kLd3EDhsRjefH
	 VoSRgJjBT846izaFItO4JK9c33fziqnHMoFHzjKp4BHeP4CzA9/ks14+bPj+NMO67m
	 Euo3Ou8cgSg03ZmMflupeieYK10KPGg579b/PA5A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfLSGCf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Dec 2019 01:02:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:54954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSGCf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Dec 2019 01:02:35 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20F222146E;
        Thu, 19 Dec 2019 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735354;
        bh=ewI27VhHwdRnR0z6OQp2g90lBzpnaQJEXVkveXDDi+U=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=ivoP3i11o6MluZu/xr7wlmoDqy1fUWnWT/c8mZF5eQCANRB5XVqNit6qlgGbvk4Ya
         g8RPZhh6kwL9MRPWLNzlwMr7oFid1kbvjEOi+/+pPdGQJDvAulABdGIvPep07lEfZF
         GMP9DXjWg0C7i9cHAx9XrxJ06dl+AyCevKS8oqqQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191217171905.5619-1-jeffrey.l.hugo@gmail.com>
References: <20191217171905.5619-1-jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] clk: qcom: Avoid SMMU/cx gdsc corner cases
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:02:33 -0800
Message-Id: <20191219060234.20F222146E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 09:19:05)
> Mark the msm8998 cpu CX gdsc as votable and use the hw control to avoid
> corner cases with SMMU per hardware documentation.
>=20
> Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC)=
 driver")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-fixes

