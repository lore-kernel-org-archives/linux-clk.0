Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112C6C48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4CAF2086D
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561504393;
	bh=plvHvWSMYmNfjFi5Zh+M1GHgDy/1IwQh1aM5HuOxu38=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=ukEk2XCfGlqWov202EW9ePmtyTfuLhEGFhVxjWm4K/TtT8e8VK2LCve4cHDY+W6j9
	 LHI57YKnpJFQYhC/ppq64cV3fHn8L2TT6ivS0ixSRW8/NRAydqcxMvXH1NlQi1xL6h
	 CejL0IpafvhxHxLbRDSJgkVX33b15gKGb1dxnkNo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfFYXNN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 19:13:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:54940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfFYXNN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 19:13:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9877A20657;
        Tue, 25 Jun 2019 23:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561504392;
        bh=plvHvWSMYmNfjFi5Zh+M1GHgDy/1IwQh1aM5HuOxu38=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=0kKRQb/4dcInp9ZgisNyXTCyIgsuc/EmfkM2BLZeMVDLZjy3HxujgyCvpq3Dl4chY
         o/uV/+DhmTPy7c1Xu1Mbr2AjPTWrZOzMf2HKmYRGi3h+eCTOW7wpCVwexGk5I+g2HA
         OeHFCdd9tfPTmcgDl3M9kxv9WA6H4m1SaSLCFkcY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190613161225.2531-1-thierry.reding@gmail.com>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] clk: tegra: Do not warn unnecessarily
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 16:13:11 -0700
Message-Id: <20190625231312.9877A20657@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-06-13 09:12:23)
> From: Thierry Reding <treding@nvidia.com>
>=20
> There is no need to warn if the reference PLL is enabled with the
> correct defaults. Only warn if the boot values don't match the defaults.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

