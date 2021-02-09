Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9163C433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 08:03:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 780A364E50
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 08:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhBIIDG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 03:03:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:39496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhBIIDF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 03:03:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22AA064E50;
        Tue,  9 Feb 2021 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612857744;
        bh=p0z6FPgvjAs+ABkvFB/FTOpUTXoVh2JiB8TV564mbtk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sqwUkGuZDDVc8s8WcmUL/VTwemTYa8QExSJ1xpHYmPAqkNAvcMoOJvr6hIVejYCS9
         OJgD7lbLQKMo1pYB/DaV8YxRwPWSVEJPJOsyxyAOjLMJbP0ijSpcbeHlRBFz4CjjvG
         Rl/KQiaY9kT29RzontKTh/JK5MZAHvwlnBKfWl962KfVzMfffWQoyiBhV+EkJf0omE
         fm+kH9P3X2S1tjsSaqwKTslwa+XmBsAUvxQW5Hox6+99BeyYsEL7pGxXzXVVp6XnKE
         9CktxDjYrAPtIgvtfFwj4vlpo4Ztqa54EDP0QTrGwa1hRs8G4JPlvwhbTT+L3vVrr6
         Lmt+9b41gFT3A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210125170819.26130-2-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com> <20210125170819.26130-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] clk: mediatek: mux: Drop unused clock ops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Phi-Bang Nguyen <pnguyen@baylibre.com>,
        linux-mediatek@lists.infradead.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 09 Feb 2021 00:02:22 -0800
Message-ID: <161285774277.418021.4963625642816224543@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Laurent Pinchart (2021-01-25 09:08:18)
> Three out of the four defined clock ops are unused. Drop them.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Applied to clk-next
