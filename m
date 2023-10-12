Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62420CDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 07:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377913AbjJLHi7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 03:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343616AbjJLHix (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 03:38:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CF9E7;
        Thu, 12 Oct 2023 00:38:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4782C433C8;
        Thu, 12 Oct 2023 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697096332;
        bh=CsaiPXVs+zUR0bb0Jyu/YD3MxKJLDO6cfeyazYsZ2B4=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=fPsyBEgSlESduxNrNv0pBjPfQ+6YybZF1KLufACbji07ZLl+Xz7OyoRqcntdy8Nex
         wqxAjfAP0eyrqH1gJ3PH9Qf52dAXSRJpKkWvr932ULtx/qZXxNiEUXe6BxtKsoy5aO
         9S/6I1bBuy7PyraInI/6g07RllstI4dYxekaEWuEYz0CTvplFNwTwYbTB61dIRrz3Q
         m9d9yOmDhXOF1MZpUzldJFLwoVbA0PfUvhsVJB4P+ADUUgwo2zBJhaiE2lEI4yQv3p
         FX/9lWUJ8jVC7FqNN2TkbhzEtAeisxEJWa+581o0tS2PVeAzCWVo6VuiGB+QF5gucl
         KauvbFYfnjqTA==
Message-ID: <a60be34c2b196782fce6c9b622cf8d33.mripard@kernel.org>
Date:   Thu, 12 Oct 2023 07:38:49 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Dan Carpenter" <dan.carpenter@linaro.org>
Subject: Re: [PATCH] clk: stm32: Fix a signedness issue in
 clk_stm32_composite_determine_rate()
In-Reply-To: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
References: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
Cc:     kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 10 Oct 2023 16:35:28 +0300, Dan Carpenter wrote:
> The divider_ro_round_rate() function could potentially return -EINVAL on
> error but the error handling doesn't work because "rate" is unsigned.
> It should be a type long.
> 
> Fixes: 06ed0fc0fbac ("clk: stm32: composite: Switch to determine_rate")
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
