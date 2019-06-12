Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8D7C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 19:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E334215EA
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560368956;
	bh=KQxNa2M6Q+SAxSeTa/vGnxCfBi/kErM+MF+XegDdVUE=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=cXJE+IajOG1iKPHEPDbO6yD8WhR1DM85KuyQ9IK2sFaJ0TexbpPk62pZTHV2Jac+L
	 9bCuZY5qsBoaDP4xL9o6C00QgLuCo2YhioZjvKR4LB0tf+sa2SDVLrJhm259HVN+Wn
	 271gLtzvxybttXrLFx4qG797xqYe/jdSAh8hAFWE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbfFLTtQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 15:49:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:50634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727938AbfFLTtQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 15:49:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F5DD20866;
        Wed, 12 Jun 2019 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560368955;
        bh=KQxNa2M6Q+SAxSeTa/vGnxCfBi/kErM+MF+XegDdVUE=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=f2ZuK53r5QLNLUEFzsWoF9mvoPNGvZMGdpTDvzQXmRP2zZ5cn9fQT4jTJ/4iFZUOp
         Soh94OHdPOlCK3WFkO+nsV5GYUdYjIUtrWUSyZRbTeqEV0fA6jAyghhGl2HEig8WBJ
         RFbgngNzCFkvW1rF2uY8TFrTjHd6mUI/gPD4J4Ow=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190612191347.GE22737@tuxbook-pro>
References: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr> <20190612191347.GE22737@tuxbook-pro>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1] clk: qcom: msm8916: Don't build support by default
User-Agent: alot/0.8.1
Date:   Wed, 12 Jun 2019 12:49:14 -0700
Message-Id: <20190612194915.8F5DD20866@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2019-06-12 12:13:47)
> On Wed 12 Jun 08:52 PDT 2019, Marc Gonzalez wrote:
>=20
> > Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
> > we're building MSM_GCC_8916.
> >=20
> > Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>=20
> Not sure why these are default at all.
>=20
> But both drivers are used on platforms other than 8916 as well, so if
> anything a fix would be to rename the APCS_MSM8916 to something more
> generic (such as QCOM_CLK_APCS_GLOBAL) - but then the content should be
> updated and the APCS mailbox driver as well...
>=20

I don't see any use in being this specific. I'd prefer we just leave
this at the ARCH_FOO config level and not try anything more fancy.

