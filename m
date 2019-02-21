Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF777C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:18:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 938F220818
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550787514;
	bh=oc43sYWoXGP8rV6d6OmWQxB+e3eBasxUiph5ih0Aurw=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=XJKnadSH1/ibXaqqrKAbQxmtZ2kn7BADDSYzwbGkJuo08HUX6DJc9W72QyRB5QuU+
	 mj4piWsilbPtIne6tbXeSOP5pzKcw+ulC4DrLyQuaB6eY7oGKbycjhHtYOaXP1J4iH
	 ROXPEhgUV5gBIyFx16kVycMD3OgcIhw1ua9YM7hI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbfBUWSe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 17:18:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:48198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfBUWSe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 17:18:34 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8759120818;
        Thu, 21 Feb 2019 22:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550787513;
        bh=oc43sYWoXGP8rV6d6OmWQxB+e3eBasxUiph5ih0Aurw=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=nGDgSTWm83Bju70qZGswXPm4gEEmE7QQntQ3gdWaN+fDS0colMGzbJxCjnVeILPYS
         KLaAS7PiCBScHjt0vlgoGDmNIJXpeV73Zz4u2Ww3njsqiqsap2JZoT5qp9awaBDnQr
         NuG9YNNtd+mPDJUY2BShO8NZpfHAfOXJ/uqKSkeU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] clk: qcom: gcc-qcs404: Add cfg_offset for blsp1_uart3 clock
Message-ID: <155078751283.77512.1286511890162753559@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190211073928.20456-1-vkoul@kernel.org> <20190211073928.20456-3-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190211073928.20456-3-vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
Date:   Thu, 21 Feb 2019 14:18:32 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2019-02-10 23:39:28)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> The CFG/M/N/D registers are at an offset of 0x20 from the CMD register
> only for blsp1_uart3 clock, so add it for uart3 only.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

