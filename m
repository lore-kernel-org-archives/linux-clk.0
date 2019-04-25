Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26216C43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0BA220717
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556216119;
	bh=CUNNtusMGrVMMOqATtqQ/9bmfIyJmOObsRbqasJfaKM=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=ZVCYIwdgFiWIGZ1ERECIhx4uPUdPUY5O5zymrM71SZRwsyrYWofRB24EmDYLnBuiQ
	 da8/yECQeo/Hft6dp2IrIdUI6tiMJY+lJhnC+5CO5yAc4dR29mFjlpAYxKSL7YvEFI
	 1ZllE/5TzCBcAm3BB5jCBds42ehyIUQe5Ej/thgc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfDYSPS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 14:15:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:36578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbfDYSPS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 14:15:18 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8862B20685;
        Thu, 25 Apr 2019 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556216118;
        bh=CUNNtusMGrVMMOqATtqQ/9bmfIyJmOObsRbqasJfaKM=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=AiTmT20XwypjA+aRF4fpb9wsQJMs2xMHewHosvQbLw/4fFohsaYO7HG1zal5w5ROU
         wTSslWTQP1nuf6044Gcd/ItffBtc+CkAIEOyeSokUZBPpn5q68M9uzIBgnUsCfZq06
         /yPWE5LTEK2TN2WYgSpyfnal242XjPBJNcsaQUzs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1554365467-1325-3-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com> <1554365467-1325-3-git-send-email-t-kristo@ti.com>
Cc:     tony@atomide.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/6] ARM: omap2+: hwmod: drop CLK_IS_BASIC flag usage
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com
Message-ID: <155621611722.15276.8125440343895023286@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 11:15:17 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-04-04 01:11:03)
> CLK_IS_BASIC flag is about to get deprecated, and as such, can't be used.
> Instead, the API call for checking whether a clock is of type hw_omap sha=
ll
> be used, so convert the code to use this.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next

