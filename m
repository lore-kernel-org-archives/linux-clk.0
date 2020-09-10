Return-Path: <SRS0=OvdJ=CT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98AFC433E2
	for <linux-clk@archiver.kernel.org>; Thu, 10 Sep 2020 20:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BB83214F1
	for <linux-clk@archiver.kernel.org>; Thu, 10 Sep 2020 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599770646;
	bh=j+p+Inr+01436rceX6HgIBOmz1/CWOcyjjR8EinR1do=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=eiN5oUqBS0ibCyx+DVWBJBymWsG7aikVbUicwBtm3F1GUbLnh6QSHNA0z/n1KYTSj
	 sqrXAA6jPRkjvfuQ8J9yH+ismU7TglWxQFmunANRD5kfupUy4waWfRfm1KQL59bgix
	 jD+j975fmgzBAQbXhzMTzV3r2U62ev+2nxFzvcZM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIJUn6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Sep 2020 16:43:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:35984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726996AbgIJUnn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Sep 2020 16:43:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B63520829;
        Thu, 10 Sep 2020 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599770621;
        bh=j+p+Inr+01436rceX6HgIBOmz1/CWOcyjjR8EinR1do=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=P6YCTEGxTcaZP5txtO2xc3RkgLSV1D/91twidLjbvrsAcHLzP4Xco94zzyBeQxFAO
         f6x+2dYA7bUxehdbkzD5QF1wwD8+4AnxUo7StqDdbJHXu8l9y7sRBUckYFoRxSkgI6
         SdDk//PFpVAOmT6hQiFZv0jGjNkigaz2FMY5UNxM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200827141629.101802-1-jingxiangfeng@huawei.com>
References: <20200827141629.101802-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH] clk: qcom: lpass: Correct goto target in lpass_core_sc7180_probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        tdas@codeaurora.org
Date:   Thu, 10 Sep 2020 13:43:39 -0700
Message-ID: <159977061963.2295844.8449018539561172651@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jing Xiangfeng (2020-08-27 07:16:29)
> lpass_core_sc7180_probe() misses to call pm_clk_destroy() and
> pm_runtime_disable() in error paths. Correct goto target to fix it.
> This issue is found by code inspection.
>=20
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---

Applied to clk-fixes
