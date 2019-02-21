Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE0DC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:18:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 589CC20818
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550787502;
	bh=/YYYYphl0vonbsz9Y9uv/Tyba11Y1KFYWqqHBY7GSp0=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=QckCHE6dmvDkCz5lFhTfoNaqJhVboeZIfflNsjKP5eaeMrcQwv0F3231d5V/JO2MP
	 CPKJEM2MXC4GAa0Ab9TLChhzr3+/iUq/IbEpmgs+GaNn3fQgaO1Zb+6Ial52vhsB/7
	 JMSzLXNDwluRBHJ2+Q/HHgkjKKQNLeCz2hoZPRwo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfBUWSV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 17:18:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:48084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfBUWSV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 17:18:21 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC23720818;
        Thu, 21 Feb 2019 22:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550787501;
        bh=/YYYYphl0vonbsz9Y9uv/Tyba11Y1KFYWqqHBY7GSp0=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=EBtsYCTzEp4eP5vVnCYZ/6wSe3Xiw0IubHeHdVz4uwIV2oAs3DgxnfB0OkqopfoRe
         buYUqVN6RJVVZYuedreZP0Dmy6RJD/NOZQMRpOZicwEa37zjZ7OJd3ph2cvhqA2wxB
         50jm4twX4xDI4dZhZj0vCkVuL1HmTlUjhEpGWaVo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] clk: qcom: remove empty lines in clk-rcg.h
Message-ID: <155078750023.77512.616266988533522444@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190211073928.20456-1-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190211073928.20456-1-vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Thu, 21 Feb 2019 14:18:20 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2019-02-10 23:39:26)
> Remove the redundant empty lines crept in.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

