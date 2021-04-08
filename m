Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465FDC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E96C61184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhDHARG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:17:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 305FA61178;
        Thu,  8 Apr 2021 00:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841016;
        bh=Lfh7mov8fHiMg3ihW2nJlr3WazVtMqLUycC6iiiIl7s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Sve3V1FjMaXD9l+NFa+V9gL/wkOfvs8Q4ClMJIqiOhUv449b572YgjWfZ0AYCwtNg
         90u9cjr+oJdet1orsfT6yFx+UDsrhJmt+AlMU6HTSm5Aqc9nQJzY1PsbFcEYtu01pe
         PDmduXr/5nOn7LKqLAQHerbHDk0FV0Mb0Zfd0GqG8YelnHe5dsoIh9Wor05uX4C8NC
         yKupPrU5nuQeObxcMeBNHgTYoNYo8c5PNJksYxqMUL0G1dzUIC0AoXyQ/BJdOJThdQ
         AcPaD4Dn2fhk9ZzFCgm+zuIpR6yY+bHTlvNpL3lUdA82kK3BmA2YzwOOWjowi5ePGV
         5GOYMwzdFNq/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-23-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-23-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 22/33] clk: qcom: gcc-sm8150: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:54 -0700
Message-ID: <161784101494.3790633.7646927066386833704@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:32)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
