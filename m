Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE74C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C45B561A2B
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhF1ASp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:18:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231750AbhF1ASo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 20:18:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 412B661A2B;
        Mon, 28 Jun 2021 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624839379;
        bh=/0G2PuHl+IAQAIu1YGgX7SlAUJuV99Syf2dy8Lq2IpE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ou9ulDUt2MX25/21PRUP7qqp3gPLX1wtbmxKFmmoWUWzr6pMPqHjIvR/ONEEuduKE
         g4X0m8dwlWYp06v7BbI0PNdo7vi8WdOldhqL0G8Od7s20hdTsOTtz8ea6CrjQB1j+p
         pAVTPMP3UriRBFLs7cwHGfaNaOLRAvBAaMbZVo+fc0UtekNImHyRlMGRg303Zs8042
         NHTZ6SemB/xCZeMD650q86v5ZxGPQ/sAWSKIivMM0CN8Q4T9q5wKUrbqh7ToqW7Tzr
         gtnIJW7UY5OTTpYTFR2cJ30XL3VIWYi2WIW30TO2DmF6Ki09XoDGU17Zdh8nDxpwUy
         +2VOKRND90nvQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609022051.2171-2-jonathan@marek.ca>
References: <20210609022051.2171-1-jonathan@marek.ca> <20210609022051.2171-2-jonathan@marek.ca>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:16:17 -0700
Message-ID: <162483937796.3259633.18251974331290202893@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2021-06-08 19:20:46)
> Ported over from the downstream driver. Will be used by SM8250 CAMCC.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
