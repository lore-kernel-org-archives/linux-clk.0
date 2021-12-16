Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FC0C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 00:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhLPApo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 19:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhLPApo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 19:45:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0653C061574;
        Wed, 15 Dec 2021 16:45:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA90AB82239;
        Thu, 16 Dec 2021 00:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B90C36AE1;
        Thu, 16 Dec 2021 00:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639615541;
        bh=XLa6Z7Uswt3SmbUskVnYcic5X/5o8XztK8bw/IC/jMI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=drWIPg/QnWUKvOG+h9lo4d5YKOp8Wo6Jf2f3VFvs+D5meEoeII41NUZ+7nWOptRSi
         HfvzdLevbKhhMCTuIElZgw8w1ZuNM3WJ+iKkqWVfhzUOZJsQ2VvmrZrOwEqH2BIqh4
         flZhrfheiZGx7O+BokOBcufGZovLT2BkZ/8CXdNyn83szefJeLMiv6c/s8nr7B4rXL
         GWugnvbWx4EPxCBllvCbKyhGdSgOLa4qiMJkDqaOrf4soLI+nXpB+hW4mRxe4jcasm
         uMB4MNVah5HBQeWKJBBmk3d6Bj9o5uuavwPb7PQJmllxz96b2oAZtGdMmWXtIXIKYF
         p88Xk3R8xstvQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215113803.620032-4-vkoul@kernel.org>
References: <20211215113803.620032-1-vkoul@kernel.org> <20211215113803.620032-4-vkoul@kernel.org>
Subject: Re: [PATCH 3/8] clk: qcom: gcc-sm6350: explicitly include clk-provider.h
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Date:   Wed, 15 Dec 2021 16:45:40 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216004541.60B90C36AE1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2021-12-15 03:37:58)
> Per Stephen, clk providers need to include clk-provider.h, so include in
> this driver as well
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
