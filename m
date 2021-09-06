Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52ECC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  6 Sep 2021 10:05:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4BA261052
	for <linux-clk@archiver.kernel.org>; Mon,  6 Sep 2021 10:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241502AbhIFKGa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Sep 2021 06:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241394AbhIFKG3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Sep 2021 06:06:29 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F78AC061575
        for <linux-clk@vger.kernel.org>; Mon,  6 Sep 2021 03:05:25 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C82FB1F4B7;
        Mon,  6 Sep 2021 12:05:23 +0200 (CEST)
Date:   Mon, 6 Sep 2021 12:05:22 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] clk: qcom: gcc-msm8994: Use ARRAY_SIZE() for
 num_parents
Message-ID: <20210906100522.feqo3z45lraqmuov@Marijn-Arch-PC.localdomain>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
 <20210904183014.43528-9-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904183014.43528-9-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-09-04 20:30:13, Konrad Dybcio wrote:
> Don't rely on the programmer to enter the name of array elements, since the
> computer can compute it with much less chance of making a mistake.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
