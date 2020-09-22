Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC07C4727D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 18:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00B26238D6
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 18:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600799679;
	bh=FcLn853R6RtVnvApzbiEz3JuyQXN+VMty+9sQAWpDkk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=MRHVaLswzbfKiozBMS44NEUWBi11ZYUK0eec6iFyDtzZ5lWyDackyJTzPUZASD7hp
	 jzAi8+zuMNc+RgJxRi4KhULI3ZMjBjHrVXj4LxAdAETl9O08IeolaxEx2Y5tN05LG0
	 hN8DrEn7d/CzZdSmPxRq/fhoAkkMfs0zZWNpKhYQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVSei (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 14:34:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbgIVSei (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 14:34:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 237412065D;
        Tue, 22 Sep 2020 18:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600799678;
        bh=FcLn853R6RtVnvApzbiEz3JuyQXN+VMty+9sQAWpDkk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=az8CtfEOinQ3t3Fxc7JgvJ1E2hFYW0A2ClppqS29hI4Mw8u9tynSwUZlbLPmfSqOD
         1nhzBiYYg4nEeR/2CCELwE650Pz8NuimgeBJiTmCRXhagkK23KEZusawu7MH0cEWzc
         OQm4Q+kB0YnbvbJSXYgLZ2oEhQd3OXme8e6UqolM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921142750.875142-1-yanaijie@huawei.com>
References: <20200921142750.875142-1-yanaijie@huawei.com>
Subject: Re: [PATCH] clk: qcom: ipq8074: make pcie0_rchng_clk_src static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
To:     Jason Yan <yanaijie@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        sivaprak@codeaurora.org
Date:   Tue, 22 Sep 2020 11:34:37 -0700
Message-ID: <160079967700.310579.9529850040408888513@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jason Yan (2020-09-21 07:27:50)
> This addresses the following sparse warning:
>=20
> drivers/clk/qcom/gcc-ipq8074.c:4325:17: warning: symbol
> 'pcie0_rchng_clk_src' was not declared. Should it be static?
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---

Applied to clk-next
