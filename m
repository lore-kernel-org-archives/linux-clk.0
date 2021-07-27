Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E627C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E56AF60F4F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhG0Rxr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:53:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230090AbhG0Rxr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB2DD60F59;
        Tue, 27 Jul 2021 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408426;
        bh=BY/TXrvnkbGZ01/1AG98R06TzvddjiYo8uxzL+mIFsQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nzlokk7MHArfhr6WtCArBQCmH6G65YWq35WF7bunTLrd8/SjYwgU/+XUvEVGYvp7m
         fI3wYPI0Y+fL3YFyFUXogY0WByB9W8OCXhXxl0D60YBWG21SI9VLdxNPtIER+kSni8
         cFF8aI7DF0L0U7kOHdbxsXbIY1Fqm+ii+LJ1SKPgGBp4BsArP73Ih/o4IkpL5Ww3aQ
         PXYeOgO3QJF6ZNv9SXpm5K5Ul4efcnyj+fsxZamzlzbVBwBWWRFL9mll3MqsTcW8sl
         TPbzcfTPdOrSpZQ00EdbRc2TaDak0188IvTVFMoWY5iHj9YI6mf6iCjimDqepyORYC
         2SbqArN/de/+Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-2-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-2-chun-jie.chen@mediatek.com>
Subject: Re: [v14 01/21] dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Jul 2021 10:53:44 -0700
Message-ID: <162740842455.2368309.639019751189620294@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:56:59)
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8192.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
