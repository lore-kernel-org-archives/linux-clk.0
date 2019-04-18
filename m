Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E868C10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 20:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6A87217D7
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555619948;
	bh=frPbHUImEuYLlJfqGDf/IAYDgZT4GvaBakjVI0A9LUg=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=KUC35f/afUwPS1qTGn9Uem+RraceUvFp60I34quUFnhHihVlv1Jxen2jsyUG3Fjtk
	 BI2uFj9F8ge8JK1ha7X+gi0zIGkawqrBcUrVBLxSRWk4/JXwYLy8NrFw0NoTqJ7aLU
	 ZarR++ea3aVmV0F07TaRNqs8pMgMjDkyDRJoWUuc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfDRUjI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:39:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728531AbfDRUjI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 16:39:08 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 861D0214C6;
        Thu, 18 Apr 2019 20:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555619947;
        bh=frPbHUImEuYLlJfqGDf/IAYDgZT4GvaBakjVI0A9LUg=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=AFP5YQ7rQAfptl0rRTVlnj3CHvxs4NTQnSTMvLofREM2jA0F/zXr/UFzu/KyAZ5Nz
         tSSmGGK4FS+w0c8bZNjYiiDwtpBsL2DV20Tlb3l2Y+luXDclP6CpFaLw2aEqAmKnNZ
         H+FvzX+MyLFGcxe3u4kJyYCNQUS09BuDez3vnSZc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BYAPR02MB5992D239360C649F9CB0EB7EB8260@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190412095220.22855-1-m.tretter@pengutronix.de> <BYAPR02MB5992D239360C649F9CB0EB7EB8260@BYAPR02MB5992.namprd02.prod.outlook.com>
Cc:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michals@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH v3] clk: zynqmp: use structs for clk query responses
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Jolly Shah <JOLLYS@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Message-ID: <155561994675.15276.10692297233973568559@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 13:39:06 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jolly Shah (2019-04-18 13:01:32)
> Hi,
>=20
> > -----Original Message-----
> > From: Michael Tretter <m.tretter@pengutronix.de>
> > Sent: Friday, April 12, 2019 2:52 AM
> > To: linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Cc: kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> > Stephen Boyd <sboyd@kernel.org>; Michal Simek <michals@xilinx.com>; Jol=
ly
> > Shah <JOLLYS@xilinx.com>; Michael Tretter <m.tretter@pengutronix.de>
> > Subject: [PATCH v3] clk: zynqmp: use structs for clk query responses
> >=20
> > The driver retrieves the clock try by querying the ATF for the clock
>=20
> *tree
>=20
> Thanks,
> Jolly Shah

Is that a Reviewed-by?

