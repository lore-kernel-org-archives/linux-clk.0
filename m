Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E5DC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 04:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 299B720814
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 04:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590726247;
	bh=fJMyAl90qtFQJpgC49iDk/YkbDfDSFgdM5htLAH8L0s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=vEDFEzK1YZa0Hcbk9L+cZSiyxjaFYAMU9J9hZWBsBToYfno8eYJsTrdZ8koFPKZc4
	 NXS5BtEo3gWsEnuvYP8aRTwLIOvcKzU9K8ZR28+AC7PftMhiOVRDd0h07nw4fsEh0D
	 QVIMiuV7vz4TAPq4Mln0Z/7XKsv1kkYRjONqoV2s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgE2EYB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 May 2020 00:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgE2EYA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 May 2020 00:24:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 960102074D;
        Fri, 29 May 2020 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590726239;
        bh=fJMyAl90qtFQJpgC49iDk/YkbDfDSFgdM5htLAH8L0s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ksbLVNLEgCpEH4uFaHGIKAFFB+HOJsWwn1by0Peh3uoQOTidhMUe+3sasmLqXxsiN
         +O1T9rzRkq12T+H0WOuH3DoDJEF2CpWKUGNAjO6bYhAdDlkLQDHExm1ArsLQL7FXAB
         5WDS9jqPpUPb/75I5UEQeqOy4/5OOzWZt9DzF1b0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582278742-1626-4-git-send-email-macpaul.lin@mediatek.com>
References: <1582278742-1626-1-git-send-email-macpaul.lin@mediatek.com> <1582278742-1626-4-git-send-email-macpaul.lin@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: clock: mediatek: document clk bindings vcodecsys for Mediatek MT6765 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Fabien Parent <fparent@baylibre.com>,
        Joerg Roedel <jroedel@suse.de>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Owen Chen <owen.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Sean Wang <Sean.Wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        mtk01761 <wendell.lin@mediatek.com>
Date:   Thu, 28 May 2020 21:23:58 -0700
Message-ID: <159072623892.69627.13469443589395570717@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Macpaul Lin (2020-02-21 01:52:20)
> This patch adds the binding documentation for vcodecsys.
>=20
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---

Applied to clk-next
