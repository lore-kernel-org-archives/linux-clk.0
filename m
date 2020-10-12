Return-Path: <SRS0=jyYP=DT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178DEC433DF
	for <linux-clk@archiver.kernel.org>; Mon, 12 Oct 2020 19:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6B5C2080A
	for <linux-clk@archiver.kernel.org>; Mon, 12 Oct 2020 19:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602530901;
	bh=PA3xQbEca9O5SzcO8HmQ0d07vRWF1T5LUbUmKfi5Er4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=02rAv7+sVssKIllBTkao6bNv5RNvTi2WwhxOErIiXVHz7EYMugVZVm3MNfj+M95pA
	 +NM/0wS2ApF2C4tBkrHbmwcNcld08vZp0m9AYdLZ+F8cLK826FU511DnG0tAbaPVhz
	 AirncRZesEIZqlSXR+2js6pFOpFX/AZg/44bTBUg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388188AbgJLT2V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:28:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387797AbgJLT2V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Oct 2020 15:28:21 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E38FE20776;
        Mon, 12 Oct 2020 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602530901;
        bh=PA3xQbEca9O5SzcO8HmQ0d07vRWF1T5LUbUmKfi5Er4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=L61xq78yMlm5G+WjXbFQyCqDMAq3oFe/Pl9O5JSJe4eft2+71QtWANZcm3HZ/5mxH
         JvuCag7Ld+ex/3NJecJkgG6i4FjKj9/76Sa8bwINnIT9kngPIyEgG/++QHq11TX2IB
         EU1LOtSVBuwvGonGtVsZGJZIQ6CflQvdj8WcOQkI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM6PR04MB4966AC7FCFB47A51A97D5C2980340@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com> <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com> <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com> <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com> <AM6PR04MB4966AC7FCFB47A51A97D5C2980340@AM6PR04MB4966.eurprd04.prod.outlook.com>
Subject: RE: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>, moderated list:
        ARM/FREESCALE IMX / MXC ARM ARCHITECTURE 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 12 Oct 2020 12:28:19 -0700
Message-ID: <160253089964.310579.15879711282194567508@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2020-09-26 21:13:44)
> Gently ping again...
>=20
> @Stephen Boyd
> Could you kindly provide some feedback how we can proceed this?
>=20

Hmm I thought Shawn was going to apply this a while ago. Did that not
happen? I guess I'll have to pile it in now.
