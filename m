Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A97C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3CA160F59
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhG0R5U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:57:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:46878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229607AbhG0R5T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:57:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34B5960F4F;
        Tue, 27 Jul 2021 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408639;
        bh=a9AtedpsVUAuKM+1BFYeJHoM9kXALSnQx6b95mRzxr0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=crtnuMuVQtXJT+Dqi9SEAFT0Qqd2xh+phX/7i6EBctBM+InMqfTed18hsjWBFoYIk
         C+z+DvsgUJtVcdMhZYNEuXGzkS7mSvhRGcwy8gmLLCw5LPXyjrg7vK5KChezBxyUHt
         tZpDa3vMrUYd/Wyl09Vax8ZqVjGQayZRczoMJfL9As0tkICVsluu0+KJGaluCR0Vkf
         mWUjtEJt+ttHoTUd6NaDbIErl6cnAQ8js/mXvSWUBef9+IDT2Jd5gRwf2QljbCDd7l
         5ewaMVjFeJ1veb1hbtlw1011SuL6k1dzBs2gG2VamVhZwq2bEm/idtM9I5wObyFdVL
         gOevpWNZVwmcQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-19-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-19-chun-jie.chen@mediatek.com>
Subject: Re: [v14 18/21] clk: mediatek: Add MT8192 msdc clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Jul 2021 10:57:17 -0700
Message-ID: <162740863716.2368309.17172525283851255354@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:16)
> Add MT8192 msdc and msdc top clock providers
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
