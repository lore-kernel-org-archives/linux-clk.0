Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395DAC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 20:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEDFE2084C
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 20:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544474803;
	bh=v6KLg2JHl6yFVWM2TxvKndCENnlqXCmnWe9h0/GyjtQ=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=PeR3Q7K44hhw5KwTylmWnV5lOl+PZMZsxPf9b8OnvWm5js2kE1dzcoQs6BK0mVdHx
	 N6gcei4nj/1TpYy9kjNpPmZM6xK461cv+x423gvEg9e9sJmVs62Vl7NfE6IGTbNgnz
	 3oSGJvOKvdnAsWfzi2qhQ0VmiY04TJ+fCxdRLcak=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEDFE2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbeLJUqm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 15:46:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbeLJUqm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 15:46:42 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C262B20821;
        Mon, 10 Dec 2018 20:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544474801;
        bh=v6KLg2JHl6yFVWM2TxvKndCENnlqXCmnWe9h0/GyjtQ=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=hMYKMAvoXQbnTILiEMIbaG0Fo4PixP7wzaVsJ67DgrgySou+D+A/i+YpsR6lqiVL4
         Tt1j8DOR0268vnD8CxFhTDE2oMj4HdvnqdbL6tPTYouUGXz822rhFlPeWr3lu2Ty2c
         cxh9YSPGlX4uRaULe0jlhAPHtzSpIFnNVdSnuL3w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154447480107.17204.18337865638259063687@swboyd.mtv.corp.google.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
Subject: Re: [PATCH V9 0/7] clk: imx: add imx8qxp clock support
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
Date:   Mon, 10 Dec 2018 12:46:41 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-12-04 06:39:18)
> This patch series adds i.MX8QXP clock support which is based
> on the clock service provided by SCU firmware.
>=20
> Note: It depends on SCU driver which has already been merged by Shawn.
> So this patch series could go through Shawn's tree as well.

Which patch series?

I'm having trouble applying the first patch, so I suspect something is
wrong.

