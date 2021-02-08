Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C894BC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AE0C64E84
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbhBHSYN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:24:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:54368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235694AbhBHSXV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:23:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E90CC60232;
        Mon,  8 Feb 2021 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808561;
        bh=m+d1CMPcVEjxEOH68w4+gwDF1jsY07r6dUy2czHRJeU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MG7sM8rw+xzQRquW7TWeyPv06nOT9hUygmnK7AXIi09Zaqq94YhCnRAtopYRpb5yA
         sbiEtRC9cNJpxSMu6I00425+SBS1NHGj0RwNnq4kPzVBX04CxnUZc3CAK1bWEFPWdL
         vFcDa3UBXs3mgbqmeetFoYmD3kPNv4/DGv3GNq8B5pfhc7A8Nozg6UyNEoRo0POtYT
         RAn4EZ7qL3cxrrBIMi2E37TfMXUUcJuJWSf/FJ7WZ/EgbE/EVYL6d3265hDdYHddNw
         //JrIWOuGDFLlJGS3je5K8Bx07uYid2tMJbyDUOiNDGwVbAYCw8aZ0eIfnxhfTThOp
         MrgSlpmHIAwhg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-11-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-11-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 10/11] clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:22:39 -0800
Message-ID: <161280855974.76967.14566908373250985342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:58)
> The GPU GX GDSC has GPU_GX_BCR reset and gfx3d_clk CXC, as stated
> on downstream kernels (and as verified upstream, because otherwise
> random lockups happen).
> Also, add PWRSTS_RET and NO_RET_PERIPH: also as found downstream,
> and also as verified here, to avoid GPU related lockups it is
> necessary to force retain mem, but *not* peripheral when enabling
> this GDSC (and, of course, the inverse on disablement).
>=20
> With this change, the GPU finally works flawlessly on my four
> different MSM8998 devices from two different manufacturers.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
