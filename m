Return-Path: <SRS0=uYlR=DU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA47C433E7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 23:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB9C321D7B
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 23:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602631973;
	bh=JogoeWLSFzX4Avzq+rf0/Td6HukMkPftyoJlK2bZk8k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=rIfBcFASOjOU7yoYr335sjPKu52XYv659rjGxjOVj+NGhEgI7WO+Blgd82z2O3JzA
	 VE/CVnG7cSI3lULyybR9B2LeJamb1w38lAyRLSVgP5kEkf7tQRPssC98mNCw68Fwey
	 LlV5ZTyq7+ieumJHdkO4emnxBVyKpGjYNG+0Q6WQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387736AbgJMXcu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 19:32:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgJMXct (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 19:32:49 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C50921D7B;
        Tue, 13 Oct 2020 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602631969;
        bh=JogoeWLSFzX4Avzq+rf0/Td6HukMkPftyoJlK2bZk8k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TDpwI4pJRV8RYF/Ek3MQOf8UhsyZ8Iy0wFXhauf6nx02Du9bhLDpLrtOXhPp13oD4
         WiktTviOLyoBNMdLl3KuCeyIkZxfEq4AweEuj1K8AJ6LQDBu2QtUJX4lxPDLOo++2x
         EMuaNZLcfyTK1PZp6DKxf1UeeiXDj3OYcQieWdd0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600930506-394-1-git-send-email-wangqing@vivo.com>
References: <1600930506-394-1-git-send-email-wangqing@vivo.com>
Subject: Re: [PATCH] clk/qcom: fix spelling typo
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Wang Qing <wangqing@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Wang Qing <wangqing@vivo.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 13 Oct 2020 16:32:47 -0700
Message-ID: <160263196771.310579.16132118267794520801@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wang Qing (2020-09-23 23:55:04)
> Modify the comment typo: "compliment" -> "complement".
>=20
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---

Applied to clk-next
