Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47030C43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFD4B20717
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556216116;
	bh=im/KFGJ4nqVlsFuVMGNRjVFFOht9o7DnuJWPu4l5BFc=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=uuKwKmIwgLa7+XC1j21uytxzvSazL9vkPf5tUGf0OMyJn4V06Qz2/YwGuWZXSfEUU
	 d5zU8UHTDknNQjiDL7UV9/+d3vRdFd8RFKy8HD6889j/HxvSNqo/JNoIV9Zw96DnPK
	 e7o3D2eKW8eUVhZgxq/KO3XXO/EcgwGaewOL0MTc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfDYSPP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 14:15:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbfDYSPP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 14:15:15 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B194A20685;
        Thu, 25 Apr 2019 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556216115;
        bh=im/KFGJ4nqVlsFuVMGNRjVFFOht9o7DnuJWPu4l5BFc=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=lSU0Yq2LjCUQqVKfdEjykADdKbf+I92ALiZGaZD/Di4GZH/fRhlOakhxQSB3Eg3C0
         pn5QiFZaJveHzRy8nKXfh08BudE9SSIyR6aIi9ZP5h5LKUPP65/MP97Gnd/ccjLiIp
         SHZoJXQseTeGp3ac2BKXyNtqghXOtxUZcgpiG8Y4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1554365467-1325-2-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com> <1554365467-1325-2-git-send-email-t-kristo@ti.com>
Cc:     tony@atomide.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/6] clk: ti: export the omap2_clk_is_hw_omap call
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com
Message-ID: <155621611434.15276.12427746993062343706@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 11:15:14 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-04-04 01:11:02)
> There is one instance outside the TI clock driver that needs the info
> whether a clock is an OMAP HW clock or not. Thus, move the function
> declaration into the public header.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next

