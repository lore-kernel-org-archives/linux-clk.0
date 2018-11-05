Return-Path: <SRS0=vj01=NQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FDCC0044C
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 06:40:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40DDD20854
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 06:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnG6HikD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DDD20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbeKEP61 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Nov 2018 10:58:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:43538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728985AbeKEP61 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 5 Nov 2018 10:58:27 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27ABB2081D;
        Mon,  5 Nov 2018 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1541400020;
        bh=4EDPiZJxqmB771Ka8kf1MGg4jjpBesdWdImH+yrmntM=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=XnG6HikDH/QMfz0Q1gXXos7YfBh7rRTA1AGc29XCT7quimD8VKdZAZ13QAC81qX/5
         6G6lDPFQtwqdfzcs0g5AB/7H4XI2bYsnVPSVPEcrZhphLTe+TbxOoykeD619kOnukM
         XrHghJG1TSiN1dY94YQXGovYs+6knv+tvIDc0UW0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Ivan Babrou <ivan@cloudflare.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CABWYdi0Jwy5z5ieqEEUDw5_-723ZzqZFTrgoNhdQBa2iPy8UbQ@mail.gmail.com>
Cc:     linux-clk@vger.kernel.org, trivial@kernel.org,
        mike.looijmans@topic.nl, mturquette@linaro.org
References: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
 <154130022584.88331.11328574821722290484@swboyd.mtv.corp.google.com>
 <CABWYdi0Jwy5z5ieqEEUDw5_-723ZzqZFTrgoNhdQBa2iPy8UbQ@mail.gmail.com>
Message-ID: <154140001950.88331.5359899040910108167@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: cleanup Kconfig to remove duplicate help tags
Date:   Sun, 04 Nov 2018 22:40:19 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ivan Babrou (2018-11-04 00:07:28)
> Correct, this is just for consistency inside of the file.

Please resend with just the parts that are relevant to the patch subject
then. Thanks.

