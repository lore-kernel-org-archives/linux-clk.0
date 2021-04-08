Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D537C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 20:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CE1C61107
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 20:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhDHUar (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 16:30:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231897AbhDHUar (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 16:30:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EC0361159;
        Thu,  8 Apr 2021 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617913833;
        bh=J464dW0AKWMholSo1mjYDCNx096zmLCksHQ0LL/pQBc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sqV00UvbPo40W7FCMs6d+SrLnJD1arFSp0D3+CFTnIw7C7uMSnTK5aQ8khrFEPQBZ
         JcfgAGOhZJqhOIQc7o4B3WlR7q4BNvOC0+BOTLqYVYz6Q/JnIvMBGug5biRlbTAjzr
         kLpynLEpAO0vsW7xfZtbuPNSmX4BQliItwfEL4Qdcm7jEQDURjaY+FbPKHlYM0VhEF
         GVxGcntBxsNUkvccUL6zcnWRs50Jv+obOrXZ7XjoFtwn2X9LMEckMWwmRKew0nPMwr
         OINjslNg0HXyhDOaTQCUpLMA/5bmPMnAC1VeLEJ227IYQMZd3UJ4OnIU9fuC8LCH/E
         hMNCdT1PMzw/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210408135509.208921-1-clare.chenhui@huawei.com>
References: <20210408135509.208921-1-clare.chenhui@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: Add missing MODULE_DEVICE_TABLE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Chen Hui <clare.chenhui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Date:   Thu, 08 Apr 2021 13:30:31 -0700
Message-ID: <161791383177.3790633.17835417455437133606@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chen Hui (2021-04-08 06:55:09)
> Add missing MODULE_DEVICE_TABLE entries to support module autoloading,
> as these drivers can be compiled as external modules.
>=20
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>

Any fixes tag?
