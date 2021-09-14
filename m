Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E57DC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DD3C61166
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235793AbhINWVM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:21:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:55404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235826AbhINWVG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:21:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9923D61164;
        Tue, 14 Sep 2021 22:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657988;
        bh=RR6owkjzqfzaYjUSBCJsCZ4wzMipMq56ZneU/JSBVK4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ItEWaWireo9M3pR5RqDNIyv7udtH0zGCkVktgobeeXQAoqX0KN5YkNtbAmYoE6/1Z
         UP6rCZHNC0L8kr0LDBq9DF0Wki3iH/FCnaMcdCsJl418wO0IqMglQorxuSopSyrIgh
         wu4Ljutsr+2PwqklYRDzhpHNBt9xORritGrrl0zOWvcuUP4R/fqXGj6F0E5DkTTtJU
         ua+kGan9ZoDsskEVTSNUYvgIDIulKa6sOI7YXwQkVUwrOXNeEvjYXaiDwFMK2yQJF5
         wlli5m3wREeA7sWKbQYwYHt0hYyKzhOq0TpuRXeNA9DljVyDSG6rD3THkMdrTEZHNW
         LzYJh/xV1J/Vg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-20-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-20-chun-jie.chen@mediatek.com>
Subject: Re: [v3 19/24] clk: mediatek: Add MT8195 vencsys clock support
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
Date:   Tue, 14 Sep 2021 15:19:47 -0700
Message-ID: <163165798747.763609.1936057627703630875@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:28)
> Add MT8195 vencsys clock controllers which provide clock gate
> control for video encoder.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
