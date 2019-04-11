Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3519C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72F472173C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555008060;
	bh=GvSGqS7IvEPvkCpowl4tv8OBEVOYgkwvw3E5eSyGqKY=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=cbgad1HHfyqr5KrDPrfZyK5N9ztUn6SuT6PoTE3Fik6OsHiilkt77opfTeiLcZ/1k
	 09Eh2M0DQPvuvZaWij0sOntq4QvKKqS5NnM3MtRjZmHMBVeeUvmsTm3XzV3eqfSR3a
	 Ep+c/NzoXnKW7TaIaUXlOTXaaZg5DEKPPUuQoGGI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfDKSlA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 14:41:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:54066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfDKSk7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 14:40:59 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 412792083E;
        Thu, 11 Apr 2019 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555008059;
        bh=GvSGqS7IvEPvkCpowl4tv8OBEVOYgkwvw3E5eSyGqKY=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=fsBe2RBff6rHsqR8lYHVkpqVQHaWU46kTpPoJcFpH6meCZpZg26BlzgR6UHb192tK
         12MNbGuWtIDUtjK2uBdg3Vy19x8Ivo1nw6pbn/uKQc4n3TrAQxEUdmJVuJoPZh3GY5
         BjwaPed6o6zPE50Dl1eUdA+7B0q5cyBHW6Z4LAoM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190404101621.7b88337c@litschi.hi.pengutronix.de>
References: <20190319100147.4178-1-m.tretter@pengutronix.de> <20190404101621.7b88337c@litschi.hi.pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/4] clk: zynqmp: fix CLK_FRAC and various cleanups
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155500805844.20095.8423821269571777766@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 11:40:58 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-04-04 01:16:21)
> On Tue, 19 Mar 2019 11:01:43 +0100, Michael Tretter wrote:
> > This is v2 of the patchset to cleanup the ZynqMP clock driver.
>=20
> Gentle ping.
>=20

I could apply the first three, but the last one didn't work because
Jolly Shah sent some changes that wrecked it. Can you resend the last
patch reworked on top of it? You can use clk-zynq in clk.git if you need
something to base it upon.

 https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-zynq
