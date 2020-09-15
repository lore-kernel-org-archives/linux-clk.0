Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43C7C43461
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D56E221E3
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600130514;
	bh=uxCPfJNVgMohbUsHKkLu93CrrC8rl/5bWo2Jsljjnso=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=eINrd9zhO3TTC+caLN9Jod/Sf9KYQvJtvXJTvIs5uKD57g3UVD3euaD3z4vOldgqB
	 ezn2UXripjCrTha1WscZ+a6lq1T47OyV1OBJtMuCYRW4Vi1wFDO6rL4YRm/z64xp5D
	 ubosUCbkqv8QhsSREemr6OVvJGAWqNCo6S9dbUfs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgIOAlt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 20:41:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgIOAlq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Sep 2020 20:41:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38E61212CC;
        Tue, 15 Sep 2020 00:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600130506;
        bh=uxCPfJNVgMohbUsHKkLu93CrrC8rl/5bWo2Jsljjnso=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=A1e9GEM7+UQyGoPeKHeVcScMwYaIHNqDfSfbTd7eEpHzlVR9trnqZIJw16D4SCxZ+
         vd24TRd0YtIaquOqEcc4kfXgWzcpzRhnL61m3EXW5PIWkdPE0CRRZxMRx+tGeXl/y3
         XgVctsY13wUpy0C+IiSmkz+Xim/brzRqZYBNXAt0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200914022225.23613-2-zhangqing@rock-chips.com>
References: <20200914022225.23613-1-zhangqing@rock-chips.com> <20200914022225.23613-2-zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 1/6] clk: rockchip: Use clk_hw_register_composite instead of clk_register_composite calls
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de
Date:   Mon, 14 Sep 2020 17:41:44 -0700
Message-ID: <160013050497.4188128.14223866096412684497@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2020-09-13 19:22:20)
> clk_hw_register_composite it's already exported.
> Preparation for compilation of rK common clock drivers into modules.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
