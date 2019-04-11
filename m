Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A2FC10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1194E2146F
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555013684;
	bh=qV8RhRbxWsJKfcCtRY0D+4QVTu3PDLHkBqm3nlCKKWs=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=e/4WzNWtfQaSsaIvxjhyjZYiOEtlScHEZ5/a0NghZebfbuJ8VCP7YapbU5i05F2uP
	 j05UaQf9YCOH7f0aXvF/xjN9bjEwgy06CxHNIf7DWOHalUZV+9944uz3Xe7SRMNY3y
	 JGyBdpRZvLmfoDMwU3IJNBz2b+e/UXvZJYdTklr4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbfDKUOn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:14:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbfDKUOn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:14:43 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6C9220850;
        Thu, 11 Apr 2019 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555013682;
        bh=qV8RhRbxWsJKfcCtRY0D+4QVTu3PDLHkBqm3nlCKKWs=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=0YCAe3CSrYg+OOuj1I1jSZ5ZxzRcnWie+m+z5gp+yNhceK9pmcRUx6QdpLFcS5E2i
         5XLz+TTufPjG3PKzU5g6IIfKPI2LsE+ipHKunecNNnb4CATHpfSa2XvNMmMs1k1tus
         jKGGMAo9bJlpn/vXfV01Ny1Ld8gVictalfluE3Qw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANMq1KDciN76ZRL7kLPWM--3sHNi3bbjV86Sixm4R=QUKwrx1A@mail.gmail.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-5-weiyi.lu@mediatek.com> <CANMq1KDciN76ZRL7kLPWM--3sHNi3bbjV86Sixm4R=QUKwrx1A@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/9] clk: mediatek: Add configurable pcwibits and fmin to mtk_pll_data
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        stable@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Message-ID: <155501368210.20095.61816680073374889@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:14:42 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nicolas Boichat (2019-03-07 22:20:27)
> On Tue, Mar 5, 2019 at 1:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > From: Owen Chen <owen.chen@mediatek.com>
> >
> > 1. pcwibits: The integer bits of pcw for plls is extend to 8 bits,
> >    add a variable to indicate this change and
> >    backward-compatible.
> > 2. fmin: The pll freqency lower-bound is vary from 1GMhz to
>=20
> Minor nit: frequency (Stephen I guess you could fix that when applying...)

What's a 1GMhz? Anyway, fixed the typo.

