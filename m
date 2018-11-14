Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65803C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 22:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E8A5208E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 22:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhYPAgF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E8A5208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388228AbeKOIfK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 03:35:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:40350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388161AbeKOIfJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 03:35:09 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8C7320868;
        Wed, 14 Nov 2018 22:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542234604;
        bh=3DDWmkbleSpdse7vBIPQuKKnFL2bZNrKkq9noydK53Y=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=qhYPAgF6+JvIxbsWlkRxhXbcch88RPIhFhwd2VdtGbX659/KKp/ZNEQX3g0H8UjLv
         QLK52fSUJSV9FrYebFeZ1mif0AtOJ82r7NWLratbRQRUACsFZ6XQI0++7SLRhrkADM
         sVP4jhh7KWXJLM9FffTNVFVy5bp/N40KskISxlDY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Rajan Vaja <rajan.vaja@xilinx.com>, michals@xilinx.com,
        mturquette@baylibre.com, olof@lixom.net, shubhraj@xilinx.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542181609-12189-1-git-send-email-rajan.vaja@xilinx.com>
Cc:     JOLLYS@xilinx.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajan Vaja <rajan.vaja@xilinx.com>
References: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
 <1542181609-12189-1-git-send-email-rajan.vaja@xilinx.com>
Message-ID: <154223460319.88331.12722047207173915744@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] clk: zynqmp: handle fixed factor param query error
Date:   Wed, 14 Nov 2018 14:30:03 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rajan Vaja (2018-11-13 23:46:49)
> Return proper error code in case query for fixed factor
> parameter fails. This also fixes build warning for set
> but not used variable 'ret'.
> =

> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-fixes

