Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647CBC48BD6
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 18:16:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 399E621726
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561573009;
	bh=ngfloKnnEljm5koGJ5y0rZ8cyy4BPg9KdJZKx/SEddk=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=CHk9E29u8sWNptKfuk0FIt8BOzc0KnXLOSBBnrCCaSPUDNKFHd4y0+cNe+V+UICtG
	 N8KEMvJ/4oAX0Knc0v0b1n8D8yZcopFXGhbJUL2VWrR0714V39g1ZlCEByaj/GDzQL
	 eRF2kBBlWjyHR2EmYxlDv/yrZU5I3YXihyuMILnM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfFZSQs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 14:16:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726223AbfFZSQs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 26 Jun 2019 14:16:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 993C221726;
        Wed, 26 Jun 2019 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561573007;
        bh=ngfloKnnEljm5koGJ5y0rZ8cyy4BPg9KdJZKx/SEddk=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=2rBqUqBZkbNa47oKYmqOlCjsXw7fvrPVeaLx3mkT665MfNL2CP8LtDZM1AaGPICRt
         TphgoDg2KmGK3cMU/FMdW3vXX+c2+D+CUS4nQkjeQThHu42C6vpRTp0cDyh8xN7GzO
         QtzeTx5T3Z7Nig2Y4fx7qYmoUSfRnLTC7iOIK+3s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190522011504.19342-4-zhang.chunyan@linaro.org>
References: <20190522011504.19342-1-zhang.chunyan@linaro.org> <20190522011504.19342-4-zhang.chunyan@linaro.org>
To:     Chunyan Zhang <zhang.chunyan@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/3] clk: sprd: Add check for return value of sprd_clk_regmap_init()
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
User-Agent: alot/0.8.1
Date:   Wed, 26 Jun 2019 11:16:46 -0700
Message-Id: <20190626181647.993C221726@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chunyan Zhang (2019-05-21 18:15:03)
> sprd_clk_regmap_init() doesn't always return success, adding check
> for its return value should make the code more strong.
>=20
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> Reviewed-by: Baolin Wang <baolin.wang@linaro.org>
> ---

Applied to clk-next

