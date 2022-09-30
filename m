Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609B6C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiI3UpN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbiI3UpK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:45:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15452B62A;
        Fri, 30 Sep 2022 13:45:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 571D8B82A17;
        Fri, 30 Sep 2022 20:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E143C433C1;
        Fri, 30 Sep 2022 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570699;
        bh=2yjOY8s00OS5OidE9ufY9pOSCwiRqrzvihjTgt8HKDY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uT4acoT5qzXKFcNGXecywxtkr8CmIY+YKIlZCB48rHdwK/Zadw7NUy6gYgr3AUbu1
         1yo4fWJCHgtKHLVY5x4j0UiNkw0fqCNTq9Hygjeal5pDIOVxBE+Mzbbjc75ib6gp3W
         QkFtnUEfOFkBVIByyaKo7DFPHpTygUH19z2iCeGmK+MqcSPt1VzTREX81TuHqad/Ev
         T6/3hTwnJ34M8ErYbgY5qiAVSvOeUsILAvigZt+jMW+itWbt3SG9/qNLqTnNq2Lw+d
         u+/ASwktS/Phek8LjOQNxNkPAyXRkgpivvifPjofsyr/R8eSeXrbdcU8bHL/TX3vDz
         ufwuC0Yy8CSEA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-11-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-11-doug@schmorgal.com>
Subject: Re: [PATCH 10/12] clk: mmp: pxa168: add clocks for SDH2 and SDH3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:44:57 -0700
User-Agent: alot/0.10
Message-Id: <20220930204459.0E143C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:35)
> The PXA168 has four SDHC peripherals. This commit adds the last two.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
