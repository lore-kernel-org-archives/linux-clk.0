Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FA1C001DC
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 03:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbjG1DbA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 23:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbjG1Da5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 23:30:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD58C26BC;
        Thu, 27 Jul 2023 20:30:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D7D461FBF;
        Fri, 28 Jul 2023 03:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A27C433C8;
        Fri, 28 Jul 2023 03:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690515055;
        bh=/ZVv652svSCo0L6bO/XsHs+canFT5Mf8LoxscdDUnqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RyKFWjVP86xtA4FozPZ2U5JiD7AF3MszxVpvGbcNRSmy3FS/og8h7NYbSYC8GWboa
         +cei1IAbiIgG7PiRO7C3+lGeoY3/+cqcYYqkHcYAUGWxwLWjaptDT5PrFlu2me3wTv
         FwXRyLwGkPzFZEfYj1XYR4RIGHRWyNa7ndxW5vE6dTHYwjYBnZYOmcQAWpSFVOhbUv
         iJyrpWgo22a8uFtZFlITcFhAfYcFbYx+tNGhjKhduZvnTPAJcNiysh7HVfUdFFXMuy
         N3x4j7gQBjYnGUMgU4ZivPT7LhjhH1iOlJKupvYj5a3AhdmTYsN5ikhTSP1bvOlnK3
         eR3C766TGnTng==
Date:   Thu, 27 Jul 2023 20:34:06 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: reset: Use the correct type of sleep/delay
 based on length
Message-ID: <ht25x3d5uer2ygtrphtyxgfp3hdu3wjsywrzo6xw3mhxeda6ya@pbgrbe6tbwui>
References: <20230726-topic-qcom_reset-v2-1-4a6e1b1d0439@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726-topic-qcom_reset-v2-1-4a6e1b1d0439@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 27, 2023 at 07:14:52PM +0200, Konrad Dybcio wrote:
> Based on the length of the delay (see: [1]), use the correct sleep/delay
> functions.

I believe this comment was good in v1, but there's no mentioning of
fsleep() in the referenced document. Now I have read the code and know
better, real nice.

Could you please improve the commit message to make obvious what I had
to look at the code to understand, and to by-pass-educate readers of it?

Thanks,
Bjorn
