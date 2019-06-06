Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71539C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 22:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4430C20645
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559861843;
	bh=SbcmLhRUMEcKE2G1wyLK7KO1wG+abbZtFt5UzD5yYPM=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=duophrlSkLSvwidrjsR5gfhB96fz+UfJ/gYdNoQh6BkgcpGsLeZ2X6N5URjPsQ6xJ
	 DjZzes4f8VO1zw9hh7YpQ8Nqs+mSNQi1NKYrRdNw2V1knFS1c0v92kONrs81SblpWi
	 yenQVa8vamUAJY3MD0/Cwe6Jk1xf4xQHyovem5iM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfFFW5W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 18:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:44948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727021AbfFFW5W (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 18:57:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3F3A2089E;
        Thu,  6 Jun 2019 22:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559861842;
        bh=SbcmLhRUMEcKE2G1wyLK7KO1wG+abbZtFt5UzD5yYPM=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=fLZhLm4O0ZRtATNhW6LC8DXAUlbFw6Hdz13pkrUZtvPnELiNLq2VReUt+CngNwlGD
         knziL1f0OQGfjCRdXxjd2806IfTPb5FK3Bqi+Iypc9kJPU2k3iD6SJOu/EVG9uOHqL
         /MBIOc9pI1yZaqRGKB3VCU/QwOE9nbYVyujz1y3E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502121843.14493-2-fparent@baylibre.com>
References: <20190502121843.14493-1-fparent@baylibre.com> <20190502121843.14493-2-fparent@baylibre.com>
To:     Fabien Parent <fparent@baylibre.com>, mark.rutland@arm.com,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org, ryder.lee@mediatek.com, sean.wang@mediatek.com,
        wenzhen.yu@mediatek.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: mediatek: add audsys clock driver for MT8516
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 15:57:21 -0700
Message-Id: <20190606225721.F3F3A2089E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabien Parent (2019-05-02 05:18:43)
> Add audsys clock driver for MediaTek MT8516 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Applied to clk-next

