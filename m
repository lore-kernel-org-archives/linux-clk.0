Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B03EC282E0
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 22:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E600C217FA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555712444;
	bh=9o0eg57klUrxSb0Uxoe68sc5OdsQl4MM9t3UxeUCTaY=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=PGXlQ27xHP5iZfbTwWcDWOZKJ1laECHkyKtVb2m85WBSVepjSxANm6HohXRMYkuXi
	 DPJ4XlpkTbqzvEz6KtH+3Oc+eSn4HLpPHJn+gqVhQ+tvxXMhUlEaUvYBJ5JD+1fzYi
	 i8eD/93uWzFa2hRvv9xzFVzB3c9k/iV281YurdfU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfDSWUn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 18:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfDSWUn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 18:20:43 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5C9921736;
        Fri, 19 Apr 2019 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555712442;
        bh=9o0eg57klUrxSb0Uxoe68sc5OdsQl4MM9t3UxeUCTaY=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=msjACs6dQaYagDYWM3R8ww4vsBkGgUnH+N0a22fMuAKguh3b//iH993DMPNlwKExN
         2SoS7hRZYChMXHKIESfqEy/HG0FWTkv6FUMiLErB5i3Cg2q/GbD08eNwM2Bo+xU92A
         1zu+G2COkfBR1oVTh0rEU9dhhpnedy3V8V4YdQGM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190320100508.6950-1-leo.yan@linaro.org>
References: <20190320100508.6950-1-leo.yan@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>, stable@vger.kernel.org,
        Zhong Kaihua <zhongkaihua@huawei.com>,
        John Stultz <john.stultz@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: hi3660: Mark clk_gate_ufs_subsys as critical
To:     Leo Yan <leo.yan@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <155571244214.15276.7318614591453533548@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 15:20:42 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leo Yan (2019-03-20 03:05:08)
> clk_gate_ufs_subsys is a system bus clock, turning off it will
> introduce lockup issue during system suspend flow.  Let's mark
> clk_gate_ufs_subsys as critical clock, thus keeps it on during
> system suspend and resume.
>=20
> Fixes: d374e6fd5088 ("clk: hisilicon: Add clock driver for hi3660 SoC")
> Cc: stable@vger.kernel.org
> Cc: Zhong Kaihua <zhongkaihua@huawei.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
> Suggested-by: Dong Zhang <zhangdong46@hisilicon.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---

Applied to clk-next

