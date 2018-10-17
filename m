Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3734ECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97A6221527
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+xo8mcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A6221527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbeJQXSM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:18:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbeJQXSM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:18:12 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80F6A2151D;
        Wed, 17 Oct 2018 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539789721;
        bh=x86kSX3/ZqkTtcpBCPTVWZaWrkKvvVMPMXawP91vQSA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=e+xo8mcCStn53G1MB8QJQ81ml/x23RsZ+9D2ZWfInmN66e01HddwWd6CknS/kKBL8
         X4A1bJvsm03/hB3/faenoLUAeknZ2j4odV5jn1/tqAs+gr1aa/pwvizKOOC4GwKfwz
         12f8O2k2IE8wSMg46duPMy5Xe+aRSM8ijJ3xx5dk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Rajan Vaja <rajan.vaja@xilinx.com>, michal.simek@xilinx.com,
        mturquette@baylibre.com, olof@lixom.net,
        shubhrajyoti.datta@xilinx.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
Cc:     rajan.vaja@xilinx.com, jolly.shah@xilinx.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
Message-ID: <153978972088.5275.4505414322881956934@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: zynqmp: handle fixed factor param query error
Date:   Wed, 17 Oct 2018 08:22:00 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rajan Vaja (2018-10-17 00:46:32)
> Return proper error code in case query for fixed factor
> parameter fails. This also fixes build warning for set
> but not used variable 'ret'.
> =

> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>

Fixes tag? And I think this is going through arm-soc already? If so,

Acked-by: Stephen Boyd <sboyd@kernel.org>

with the appropriate fixes tag added.

