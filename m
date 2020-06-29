Return-Path: <SRS0=5xJ2=AK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B06C433E2
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jun 2020 21:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 229D620720
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jun 2020 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593465344;
	bh=OdIEw/I6XjRn2q7lfeju3B7URR0/9lhFPMhXLS+TvPs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=n34Oc56zuwAPfl6zju/932Ilvrb1NOZ+J9JkXqSitQ6OVBY4/YYAs+dzjVtMh0QQS
	 PZOQ79BtUsYeQYcJoudx9iFiCuJEAfo6nJGD7sCZWGPyv0JrTG4trWWtQ75oVK95Gl
	 PmmufPWbaBhIXrVlGGm8XU9+LeaGivMmYzEz7B1Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388650AbgF2VPi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:15:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732303AbgF2VPi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 29 Jun 2020 17:15:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AFD7206F1;
        Mon, 29 Jun 2020 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593465337;
        bh=OdIEw/I6XjRn2q7lfeju3B7URR0/9lhFPMhXLS+TvPs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m6NY+7/VerlVfjB2bNmk0y5ULlvTos4ODieZ99Oa6tkik3B29fxbnxNbRBU4rCI1S
         Sydk5w+jU44A5SluaGzr4H269zwbci7d2lFrrwo/2ZIMMIqlCuT4gaugeRYfnmExgk
         vtW8JeSzhJEpY6BCB7VBoOz5XpLpMmmqVoV9r8Co=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200628023055.50608-1-weiyongjun1@huawei.com>
References: <20200628023055.50608-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: Fix return value check in apss_ipq6018_probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Wei Yongjun <weiyongjun1@huawei.com>
Date:   Mon, 29 Jun 2020 14:15:36 -0700
Message-ID: <159346533636.62212.17293772427230982378@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wei Yongjun (2020-06-27 19:30:55)
> In case of error, the function dev_get_regmap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>=20
> Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next
