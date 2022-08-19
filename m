Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9211C32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 21:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiHSVzO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237616AbiHSVzN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:55:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FEBB7EDF
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:55:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 84777B828FC
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F47C433C1;
        Fri, 19 Aug 2022 21:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660946110;
        bh=w/dp97fo6vLZwg7+uq2AqRGvyabB1DKGwmNtF7cwD4Q=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=jtEAgb4ByGtg6+6FPlxyEYHF0p/wrUx7V+DQt07K2JKiYH4TRNeqLyTkPz8uBeV5t
         p5Rl81SOOQzhhccsyIBnv0Rexbo40WeX8pplQ1Rf8QxaKwhOB8EVl5IPnAccQpbiDB
         DUYPxjggTxmDVQtqzzUt9ogHJLdpz9W1fY42VSPSn+LqNCOXzYND9BUrgCkq0gmbkf
         r8kl32ZNtkA+JQdhAir5Q4w2+fylvrEMYHvb1M9Q6z/cN7Clnwt2Al9g7N1htRneZ/
         jQ9ResbYb/HXM0fjb2tkKyOdoQkX21aDNzKCyphIecDTxXMURZeXQdMXrqkNe+3egH
         RKeFUI6ZfbxXQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220704004729.272481-1-windhl@126.com>
References: <20220704004729.272481-1-windhl@126.com>
Subject: Re: [PATCH v5] clk: sprd: Hold reference returned by of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     baolin.wang7@gmail.com, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, orsonzhai@gmail.com, windhl@126.com,
        zhang.lyra@gmail.com
Date:   Fri, 19 Aug 2022 14:55:08 -0700
User-Agent: alot/0.10
Message-Id: <20220819215510.27F47C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-07-03 17:47:29)
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>=20
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
