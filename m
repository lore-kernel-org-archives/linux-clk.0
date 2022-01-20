Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A568CC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 14:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345981AbiATO1S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 09:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345906AbiATO1R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 09:27:17 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1ABC061574
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 06:27:17 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id 15FBF1F45277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1642688836;
        bh=Tpn1DvaJ0ytMrkzvgIimmDWyZ26VOxChjgD81PA36LE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YZdIBCvHy80MeHWM7ipMw7mSEwfCcgdNh1/HquNB7dZ3rzr0bv3r4nyCvfrkj1pSd
         PLn2DQNtnQOjXnpgjH8ra4udPCbphAZpWR3cntupUHvbOe7vXSAQtIPbfZVZwbZNyT
         9gnMEXwsgq0W5IhDWwz/xyzWrSpGAQ7OJnMvXLMFIN4PYyaR2zKCIHV7/5h+JN5exK
         E7TOwbXMnWpJiXnpJwl9nKVjV4zPaK1dCgxHLCnnrj0uTxnWYqxBpYgHz4Z+/P/DVZ
         FMQqNfzmgU+7BDYuQUa4eQsFWnE3zMw/6wTpzBi6Srk2NFbTDuI17pfTYFM+0pCzmM
         AauFeTw+YNc8g==
Date:   Thu, 20 Jan 2022 09:27:03 -0500
From:   Alyssa Rosenzweig <alyssa@collabora.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Message-ID: <YelxN/zpdkukBBqy@maud>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
 <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
 <20220119021844.3C225C340E5@smtp.kernel.org>
 <5d839338-6072-9c52-1893-2f804d937ea1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d839338-6072-9c52-1893-2f804d937ea1@arm.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> We also already have SoC-specific GPU compatibles because even without
> experimental interconnect easter eggs, people integrate these IPs in fairly
> involved ways and there's a fair degree of variety. However unless we want
> to be super-strict it's also not too hard to simply assume that if we can
> find a "mediatek,mt8192-infracfg" syscon then we set the MT8192 magic bit
> within it, and if we can't then we don't.

We need a MT8192-specific compatible for the GPU anyway due to "unique"
power management requirements, this is why the MT8183 before it has a
specific GPU compatible. So I'm not worried about the compatible.
