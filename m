Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F4FC433ED
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 00:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3326E60698
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 00:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238500AbhDMAzx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Apr 2021 20:55:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:42746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238450AbhDMAzx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Apr 2021 20:55:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E01F60FEF;
        Tue, 13 Apr 2021 00:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618275334;
        bh=bjFwnGZX7ANps5jGpiGQEybJUe7i4lccDMCXAruQjbI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oJQvINg/E4BRVGPtzhdjp6foXXO4pQVNhckb9B/BMCyeti9nTiZEsauzwq4+WU8fL
         xVM35+Ae1VqfBOfXC8i5yZZCVjvhNmxGD50oMP37HofPYp/s9r1IhMIs2478yLL4SI
         bhcpQ5JBy8zBI0ebdCgDsatWyLdWJIK4Yyqd1pUXAwYeDtNzBv3O8rCmZ+LakUtQdn
         KlFDx/vFz3nvokvYcKskggg56Or8CzAstIGI1owV0j2VxkA5cTvHAkpJmlAlh2ubpn
         8RgvSlUgcRm0zXtLncRk6s+DwTJMsL8KuAREolVbFubuRkAo9bZf5u/zNE0RMzO2kT
         O1Bb+WeVy92pw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409134407.841137-1-elder@linaro.org>
References: <20210409134407.841137-1-elder@linaro.org>
Subject: Re: [PATCH] clk: qcom: rpmh: add support for SDX55 rpmh IPA clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Alex Elder <elder@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, manivannan.sadhasivam@linaro.org,
        mturquette@baylibre.com
Date:   Mon, 12 Apr 2021 17:55:32 -0700
Message-ID: <161827533277.3764895.9416052750422679980@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alex Elder (2021-04-09 06:44:07)
> The IPA core clock is required for SDX55.  Define it.
>=20
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---

Applied to clk-next
