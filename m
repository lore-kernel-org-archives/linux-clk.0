Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBC9C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33C992083B
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550787510;
	bh=GtDqI9FToe4tB71UIgILJuudFoI3bQlj+COGTPxZMFU=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=R2iQpn/t5b7fbBRGRg5jwYfXOdGIr3gpo6Sf36p7QHI2zU0A8Ou3YTr9az/Z55JTM
	 6FXnU1bPJRSnWesMcGZ6iFyptBTIUZ2JSo/tp42nuI1DFe3KosU4R+W5yaoAMX7VlE
	 uJejKlcO5LLFyhX2rZ2zmEpz9QAsLUXDD7BsfRlU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbfBUWS3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 17:18:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfBUWS3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 17:18:29 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0550A20818;
        Thu, 21 Feb 2019 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550787509;
        bh=GtDqI9FToe4tB71UIgILJuudFoI3bQlj+COGTPxZMFU=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=hzMYpte1tGWii9gFCOzggA58Id3HFo/I5MMMsiIoEgvVNbKZpMOk+HMM6xXqizZMf
         h0GKaAHcsC2+YFJaIlkDIlmifeLaTHj3BJnowyFTtPN+bM7gQJECk7Ayledv6ByJPt
         gmrlFH1f0wNS0CnoGVMuyW2xcr38tEQOtSFfQTKU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] clk: qcom: clk-rcg2: Introduce a cfg offset for RCGs
Message-ID: <155078750827.77512.2552020785756764089@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190211073928.20456-1-vkoul@kernel.org> <20190211073928.20456-2-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190211073928.20456-2-vkoul@kernel.org>
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
Date:   Thu, 21 Feb 2019 14:18:28 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2019-02-10 23:39:27)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> The RCG CFG/M/N/D register base could be at a different offset than
> the CMD register, so introduce a cfg_offset to identify the offset
> with respect to the CMD RCGR register.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

