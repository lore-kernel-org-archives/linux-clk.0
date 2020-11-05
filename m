Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFAEC2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:32:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E575020BED
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604539957;
	bh=NTATuFLHYj2P99gRlZRu8waWXMa4l9/N7AKPJHUN6t0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=tnwYxDiHqO2JtPzVHOAREHfYcQL/ZUr1eJbrHBy5T0/QyFTGPebgnSSoBaqeQ9ccg
	 F8n+M7qt+mfYMwrXPe4jYQZV+4MUoRYR+A4tbuaiLs+Zf0TEGy20slNo7tQrgLt6TB
	 kxOW3hx59kq9FTwylx/schxZcxwrfyAS53a9da88=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgKEBcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:32:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:59852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgKEBcg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:32:36 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EBA120825;
        Thu,  5 Nov 2020 01:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604539955;
        bh=NTATuFLHYj2P99gRlZRu8waWXMa4l9/N7AKPJHUN6t0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kf6U5uO4VtsCz4uzsQhedbDVzC78Uy/myzXWU2GY4ZzTA2Wd3OaFLYMBUaLlt3R8l
         WCZ47Xi7UL+f6z7vJ8z3SJWqde1tVwkbQGZDL27EH8V+Ob/XQyDEn6oVqkCY96QsPu
         9Bd4oWwpzVKw4/Obhw9M1foo27xIkhGQVUaUDgjs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604403134-32814-1-git-send-email-zou_wei@huawei.com>
References: <1604403134-32814-1-git-send-email-zou_wei@huawei.com>
Subject: Re: [PATCH -next] clk: imx: gate2: Remove unused variable ret
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Zou Wei <zou_wei@huawei.com>
To:     Zou Wei <zou_wei@huawei.com>, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com, mturquette@baylibre.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Wed, 04 Nov 2020 17:32:33 -0800
Message-ID: <160453995399.3965362.14567000960515993717@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zou Wei (2020-11-03 03:32:14)
> This patch fixes below warning reported by coccicheck:
>=20
> ./clk-gate2.c:57:5-8: Unneeded variable: "ret". Return "0" on line 68
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
