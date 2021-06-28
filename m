Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C548CC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5FCB619F1
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhF1AHL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:39646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhF1AHL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 20:07:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BABE9619C4;
        Mon, 28 Jun 2021 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838686;
        bh=jnrU4OqHHUR7T+feCy/mtShGxn0Hc7wAnUaJsntkUn0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l+U179oYqSPu6GZwntHJkKrFfXdZI6kirjJKA1DaVXQft2NaNcmTfcDy0l+mp3KDW
         bsgkzLquvezikn4WTxXWprxQ5ve09NWODzogDy5PQootixEiyMI7l1k6ELG41p0gzQ
         MlHbfzukyM+Tg7aYA8m325ArJpPCi+MWNgnO9T9ygVAJbzccroc1gFKFNqLWkB4WCW
         4Ea3SbwiMnWSPJpSQJy5VZFZ8eOboXmZ/XRVun6wq0OKXHB0VjJ+xVtq8oN99on7c5
         rflne5eFLlHcDXSKSW32kRh07+RBdasAiYgsrrLuESTIkNAw1+DDMvWPZohUnH3qA5
         FBQqrHyoAtqHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609061848.87415-1-pulehui@huawei.com>
References: <20210609061848.87415-1-pulehui@huawei.com>
Subject: Re: [PATCH -next] clk/qcom: Remove unused variables
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com,
        zhangjinhao2@huawei.com
To:     Pu Lehui <pulehui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 17:04:45 -0700
Message-ID: <162483868555.3259633.6909021362342403973@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Pu Lehui (2021-06-08 23:18:48)
> Fix gcc '-Wunused-const-variable' warnings:
>=20
>   drivers/clk/qcom/gcc-mdm9607.c:122:37: warning: 'gcc_xo_gpll0_gpll1'
>     defined but not used [-Wunused-const-variable=3D]
>   drivers/clk/qcom/gcc-mdm9607.c:116:32: warning: 'gcc_xo_gpll0_gpll1_map'
>     defined but not used [-Wunused-const-variable=3D]
>   drivers/clk/qcom/gcc-mdm9607.c:42:37: warning: 'gcc_xo_sleep' defined
>     but not used [-Wunused-const-variable=3D]
>   drivers/clk/qcom/gcc-mdm9607.c:37:32: warning: 'gcc_xo_sleep_map'
>     defined but not used [-Wunused-const-variable=3D]
>=20
> Let's remove them.
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

Applied to clk-next
