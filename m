Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1921FC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:24:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D833D206B7
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555014269;
	bh=yUgGlPM323nWfQ1RxR7DzEaoa5/8oTOwoDn3WbnTXZI=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=BLt6tgDsurhrb2/N0eK8c24RyIH3UpVxyPrJKxB+zx4tW0NQJSiKqnfbvIEw8+9ci
	 dW9tGrejbE78aTQfGARy0NP3syJvFbj9//SSoxUeFGOCqPyK1ulVruWrpZ4g/XGelc
	 HA0y1zB6y9F2psplbtVYHfNOk0ker/buws2vtdN8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfDKUYZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:24:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbfDKUYY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:24:24 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C36C206B7;
        Thu, 11 Apr 2019 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555014264;
        bh=yUgGlPM323nWfQ1RxR7DzEaoa5/8oTOwoDn3WbnTXZI=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=Gu9KwLzaj/K0gPRADPhNgFd3pjoB47v26ZbnkjJ6nIjapGfpBFbeTP9vDXzUIO6WB
         ogF1KR2Ar4ANhlHJsanhiODSqNhhBPnX0orvOm3w/bsLLGQV4lHMphLCKaSaLMVbpn
         jrjK3/3LWLR9wcP5m/W10EXaqsS4TifijXRIOfdY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190305050546.23431-10-weiyi.lu@mediatek.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-10-weiyi.lu@mediatek.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 8/9] clk: mediatek: Add MT8183 clock support
Cc:     James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com, stable@vger.kernel.org,
        Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Message-ID: <155501426334.20095.8347473886227489542@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:24:23 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Weiyi Lu (2019-03-04 21:05:45)
> Add MT8183 clock support, include topckgen, apmixedsys,
> infracfg, mcucfg and subsystem clocks.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next

