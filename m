Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5AAC43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 20:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0AE62147A
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550696236;
	bh=vpn7NTLU0mFoc6J6HemZvZelqXumCI5/eH1E1wTUOMU=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=i37vWjVKdsHLHw9BYPNK6/MPAKHQXbuRIFDT/MSKRUghLEHXUrBUK7nlFsK61tW+t
	 BupKGwuQAapSkI8b1lRNSFvJ4xjFCsE4RQ2ETMm/Sb6X3hdVaRyzDuMYOboPOFAXS8
	 S6w8O6R0bJIzaAXfdRh7NJU3aOQWnwS0iyVQAkt8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfBTU5Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 15:57:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:43148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfBTU5Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 15:57:16 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C37452146E;
        Wed, 20 Feb 2019 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550696235;
        bh=vpn7NTLU0mFoc6J6HemZvZelqXumCI5/eH1E1wTUOMU=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=xPU04B4TktydSrkKar8Gy7nm82tlMhxy6K+cKG/BXtply+htolIk5D6SxY3Yw2edh
         8HcSNRylKb6OS/pqpQlLjYR8OmSlG9M2RbHfYB5SZEqPVQDfqQjExA8/Bv/Y8Lqqkv
         1rnvmwkTAPpxz8qxJxF4zSWZl5MIMhZWw1SnnH28=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH V3 5/5] clk: imx: scu: add fallback compatible string support
Message-ID: <155069623505.77512.17191789640283789974@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com> <1548335800-6438-6-git-send-email-aisheng.dong@nxp.com> <AM6PR04MB42151CA6852C4EEA0FECC93C807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM6PR04MB42151CA6852C4EEA0FECC93C807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Wed, 20 Feb 2019 12:57:15 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2019-02-19 23:09:57)
> Hi Stephen,
>=20
> Can you help picked this one?
> SCU clock is likely to be common, so we add a common
> compatible string to handle it.
>=20
> BTW Patch 1~2 already picked up by Shawn.
> Patch 3~4 dropped.
>=20

Sure. Picked into clk-next.

