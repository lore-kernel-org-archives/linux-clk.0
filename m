Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1D6C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B780061028
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhDHAQC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:16:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:42220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D279261178;
        Thu,  8 Apr 2021 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840950;
        bh=8Iffjz/PuMggNlUCZR7YZ1ybD6DtLmH4QilJSKb3pyg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DOxgBhMGjHXG8Qh/oTOG3vZwqPisbzeKa7gocQO3fAwUCSQcBIW4rlZTHSBePRF8e
         JU7rmwROmJ5vQbCaWp2c8bIXh4tgj6hKqOvNxDG75sWxu0o5wD0cXTIysO56pE1toM
         wXSxPUEt1VMjMUKkOIl5kcnRpjJVSCbcQXoeUFrxn1BxaSVrXIEu1tza6EEPPqZNP8
         03DDlhTr4hixUJRkE5T3qvESZfXKdlAyQJJLPm31UVZN8lZD9taNlilzQKAj+/BqQ4
         fMA1D2iDdVHuuGTITMOZj+hM1VPCWpLkTVG47cSG7fUv1N6Mk7rMVRdkt8M+S+GHfV
         8tL3+TgBsQg4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-13-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-13-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 12/33] clk: qcom: gpucc-sdm845: convert to parent data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:49 -0700
Message-ID: <161784094974.3790633.5005622961186696617@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:22)
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
