Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB00FC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2AE261184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhDHARw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:17:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:42810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F07161178;
        Thu,  8 Apr 2021 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841061;
        bh=HA6kLED8wwqSWeMiTY7629XPXqUzjw9X6l7Zzf1hiCU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QAcCcZw+bEftjFlHtlrzilRhz1p6hN3QQ8N3lXkGg6M7q19Bi/JCBYUgFUSDpRar3
         IP1VEMzRH0R/qaOlgoS3CZ4tePnhYmEIx9VOtgsw2ezm7lIvGew/r0fJa/vmfGM6Jq
         cx180+cVxa4tk2TjkwQHJnn6OYsoRFpNys5aEjCdFSIrh8wghuqabuIT15r0L11Y0V
         MlJ4AfSZ9ijrtd7VBRMm+ldh4AjrOjNMCc9ly3YFXUQi2b8Cjj5TggGRE/V9szKQSS
         zvIIO11T0eit4ISfGgR1Wvu0ZmcLt/9F5WbmHTD/DxwK2GjkAeB4khcGvbtieC421J
         +EtKwQOK6+Y7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-30-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-30-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 29/33] clk: qcom: gcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:40 -0700
Message-ID: <161784106038.3790633.12115556635329719145@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:39)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
