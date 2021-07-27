Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F61CC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E824C60F59
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhG0R5p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:57:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231646AbhG0R5p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:57:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F217660F11;
        Tue, 27 Jul 2021 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408665;
        bh=5cUItSKNY7My1Xb2E1xIqPoOyGo+qDqMej4tCbwu+W8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=giIJpAYE1XdQedoK+o7DsDyxVBTYSYra1WB0MzRJ3CtcXDbUjDKlS9riFpMZV9Fob
         v1NmoJMlHWjtxH9mZEGJNSiI8AsuWRGi8WiWBdwPxJ6pQkWy/V5w26aIF5ijTR2PM3
         G8HBRXKV49VMBwWb7xxlcycYQUWFWSC2PxaM/wqnBuqLcw/dC8JUUGV22U2FW1qsWL
         wrS6FZrXhD7gt3BXe4aDB8FKyQFdPFKXJzfdhl7YZ9uINE8iUd2++TOo2A+B/ARYpm
         WvU8/8ZbFOndYNWEsyGs8gKbyASpj6heKD5pPqQiHhm5AzrNp4tYoCtURmcIiLlwfa
         sQRor+EuoIUFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-21-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-21-chun-jie.chen@mediatek.com>
Subject: Re: [v14 20/21] clk: mediatek: Add MT8192 vdecsys clock support
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
Date:   Tue, 27 Jul 2021 10:57:42 -0700
Message-ID: <162740866297.2368309.11459298909476761003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:18)
> Add MT8192 vdecsys and vdecsys soc clock providers
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
