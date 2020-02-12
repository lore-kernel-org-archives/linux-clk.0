Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8078EC3F68F
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 20:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E2DD24671
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 20:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581540784;
	bh=6ByRKh4qPfwdZtML99PqRdeqCqinAqO+PB9ijUbWD+w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=BeNCg0Q1PgUx1PyUTcd5INziawQTDW1NmPg4mHAPXeAttyMnOCq1BHt/OdhcKVMp2
	 iegaZL73lC9VIU1WXUhdX200avU7raLsmvBs57CdFK/gajuImhvxNJVrQtdfGEhtfQ
	 6NoLOaUqZsV5CkaJEoBEAijDYr7u0uiYBVAHG2Cs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLUxD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 15:53:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:36208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgBLUxD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 15:53:03 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DFD524650;
        Wed, 12 Feb 2020 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581540783;
        bh=6ByRKh4qPfwdZtML99PqRdeqCqinAqO+PB9ijUbWD+w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2ITXeWYiTgCAL8vc5o5/07vchG8uB57T5vX9EftdeyMJjo0Bmb5u6wSah7OITaoZo
         zuekXcFceN2MoLIcmlTSzoRG21P/S62AsqK5DOTXcs7lxmxn74l0ElNO94HBA7Unpv
         y6tY87lVuVlb9Q0B+fjWmcOvLw8obmpfJ5ygorCU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212101544.8793-7-geert+renesas@glider.be>
References: <20200212101544.8793-1-geert+renesas@glider.be> <20200212101544.8793-7-geert+renesas@glider.be>
Subject: Re: [PATCH 6/7] MIPS: Pistachio: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        James Hartley <james.hartley@sondrel.com>,
        John Crispin <john@phrozen.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>
Date:   Wed, 12 Feb 2020 12:53:02 -0800
Message-ID: <158154078234.184098.1584461443861585444@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:15:43)
> The Pistachio platform code is not a clock provider, and just needs to
> call of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
