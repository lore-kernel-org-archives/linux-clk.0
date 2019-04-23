Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A5BC10F03
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 22:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C10C4218DA
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556056916;
	bh=f48hXzxEsKQENT6tQt2fFbQfn4nREsw3jOwewvnC3kc=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=l61RZkiD433Dx7TpM7PHJy89aBFszFmWL40R1QC73NZd7y+lA0G64xcMtLFKzk6YA
	 hyje+UAYTe4wX+fBPL5bLdok5EBnwEj7x4+h2k1hQfIMC14gqpT/ip782h4d93Ot+t
	 N5IRoKJuhehOFVN2330o2ajo4Vz+WTB4yVEczp8Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfDWWB4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 18:01:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:54354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfDWWB4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 18:01:56 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 848B82148D;
        Tue, 23 Apr 2019 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556056915;
        bh=f48hXzxEsKQENT6tQt2fFbQfn4nREsw3jOwewvnC3kc=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=T9eph+1h1SCT+7VBACg6ohXFCYx7gwSZvlqp7T58fg3uquNCfSzxSwyGc+5ilPJve
         qaOt/rjiXjauD4Cup5XYdYxH7Z+r4o6tFREMup7m3zMgqwxvnxiPuDXUXFMcpuqQiW
         5EYYhFPjBVwOtkNYtmSgIm8gbHce2FkFX+i/cz3I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319133700.23878-1-ckeepax@opensource.cirrus.com>
References: <20190319133700.23878-1-ckeepax@opensource.cirrus.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v7 RESEND 1/2] clk: lochnagar: Add initial binding documentation
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        mturquette@baylibre.com
Message-ID: <155605691465.15276.955226327818728380@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 23 Apr 2019 15:01:54 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-03-19 06:36:59)
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

