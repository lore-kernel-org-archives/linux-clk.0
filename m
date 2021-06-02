Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA968C4708F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 07:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3602611CA
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 07:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhFBHhe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:37:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231691AbhFBHhe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 03:37:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 749EE611CA;
        Wed,  2 Jun 2021 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622619351;
        bh=ftzDwaOy0sxRHX6ekhRLJmqtgcxhig76vvFUrqtfoIE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i15TFj5Ne8nCsZ3Cga7imA5nwBEBOIWOHBpclHwVR5qoBXIMrRF0G4C+y/jFpAOCY
         2nRqtaDqztQFsT1EePEe+NWjtKmM1DRZ8dCahU2Cb+FQzUaRnNQY7lErs/59BRMHgs
         qoCAEaLP6Cxe8wYHfb0tMfnSLOug9CCgizLRoTEHr+U7Gs6KCOp43093B7IxnaXcYl
         tlbsSDIScpZiXFTyvE+8IeIgDPnQDjinQTj6ajSTUsvhmlQymhju7UAmGya9wnrqtQ
         TuTloIMfKqa/VwzC4NK7w7Yz4aaASOs8UGviSW5SKz23S2+5ErEEqIQtGQnBVPoX95
         Ez6yZs6w8UENg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210511041719.591969-2-bjorn.andersson@linaro.org>
References: <20210511041719.591969-1-bjorn.andersson@linaro.org> <20210511041719.591969-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8250: Add EDP clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 02 Jun 2021 00:35:50 -0700
Message-ID: <162261935030.4130789.15818700013791031660@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2021-05-10 21:17:19)
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
