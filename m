Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A31CC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E816864E66
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhBKUTt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 15:19:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:45462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230382AbhBKUTU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 15:19:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63CEC64DEA;
        Thu, 11 Feb 2021 20:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074720;
        bh=dBdBd74td7Pi4h4WMiQX1zHS6/dDe+9OwhZJthEgIlM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JTjvVZgD6ChIT1lqZ2pVRTBkdu8VdL6hrw6ImOG979wBjKgwrLEHKqAL0xjPqv/lm
         CzlG8N3R7zS/CNhxPx3wFimTA6fVvGwFdZC4enlihDtWv33voxdqeJCWnpIZraV2Bw
         nfh6kRfg18o1FzD7hKoxG31A4EqT3asT2Kl+pS0EZ1d7iEapxaJmgZhhUdNgD0i/bH
         H3Kfy/e30z0cRxzuOSKg78NYt/AAddraggqvK14EHw14kFcKzK6+7nWbAQQ62E22hk
         nwd3WEn+PmM21YV67qGxIRyLN3eRkwRGG5sGJt00H7oVgcK5Dlg716bmLkLnqV95Hw
         sXu9V+anCQI6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-2-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-2-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 1/9] clk: qcom: gcc-sdm660: Mark MMSS NoC CFG AHB clock as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:18:39 -0800
Message-ID: <161307471912.1254594.16323754724259359108@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:09)
> Similarly to MSM8998, any access to the MMSS depends on this clock.
> Gating it will crash the system when RPMCC inits mmssnoc_axi_rpm_clk.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
