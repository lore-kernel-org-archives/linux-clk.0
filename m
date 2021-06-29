Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E3AC11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 10:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B33BB61DC1
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 10:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhF2KaV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbhF2KaU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 06:30:20 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1131C061574;
        Tue, 29 Jun 2021 03:27:52 -0700 (PDT)
Received: from [192.168.1.142] (bband-dyn27.178-40-203.t-com.sk [178.40.203.27])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E7DD11F949;
        Tue, 29 Jun 2021 12:27:49 +0200 (CEST)
Date:   Tue, 29 Jun 2021 12:27:43 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [RESEND PATCH v2 0/3] RPMCC for SM6125
To:     martin.botka1@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <72LGVQ.D5B86EMT47072@somainline.org>
In-Reply-To: <20210629102624.194378-1-martin.botka@somainline.org>
References: <20210629102624.194378-1-martin.botka@somainline.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Sorry for sending it second time. Forgot to add To: as was previously 
asked


