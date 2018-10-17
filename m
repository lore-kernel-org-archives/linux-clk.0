Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72D2ECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F44821527
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRtnOEW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F44821527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbeJQXXu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:23:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:50020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbeJQXXu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:23:50 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82B662148D;
        Wed, 17 Oct 2018 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539790057;
        bh=5Qw57Hcl5olk40h0NTOZ97rOlcSYrCPEsME449L5Lls=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=BRtnOEW3wfobXTxRGZCiOFJusOLkqChIb2cTxcrSqMAt//CWeLuoBvQUBKk0mlDiU
         i4Wxpk1EO95l868aNKBjkM0tKS3v9XZjDTQk2Dp3xiw9+Zlhh0MGZVmNDGpy0LQNGF
         /18qGq04nfBXYgmirjRQ9uPNsJli5uyIkwJcluE8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "oss@buserror.net" <oss@buserror.net>,
        Andy Tang <andy.tang@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20180919073906.34187-1-andy.tang@nxp.com>
 <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
Message-ID: <153979005694.5275.12929241736979814342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
Date:   Wed, 17 Oct 2018 08:27:36 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Tang (2018-10-15 23:17:18)
> Hi,
> =

> Appreciate if you can take a look at this patch set.
> =


I can pick the clk patches, but not the dts bits. Sound good?

