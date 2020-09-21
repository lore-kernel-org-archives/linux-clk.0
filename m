Return-Path: <SRS0=TK4h=C6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8D1C35257
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 21:20:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1E5023A62
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600723206;
	bh=S5rXMAPkeuI72fevPfth+hRY+RVoyHNtw2jeQyry0IE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=0ET4GzfAl0aIWfcun8e8aAwqgnRx9Q7pxXqCCkqAJj4hmU94vA/PFQJIOgdunCvgg
	 6uwk4HK5sg161PE5xP9A19mOspBVokUwVwwgLuc3ZNOL+h25b31fTIaB5VRL2rfPFd
	 gBcVBz4MWZDUUoyHUDJ664+RZg+LwVNUTnmLTtbM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgIUVUB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Sep 2020 17:20:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgIUVUB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Sep 2020 17:20:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB40823A5C;
        Mon, 21 Sep 2020 21:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600723200;
        bh=S5rXMAPkeuI72fevPfth+hRY+RVoyHNtw2jeQyry0IE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rYwfyLO9v0Ap+xhu7KqfsfQovdwzpNLc7X1FlqsjAPc8V1ZSW1/KDtGeM+4qqUeRD
         1v4WH9COGraNN2uEuLPzOBBKaSaFaUogCAWKVde0eEje+5ghp+gH1izbFg3G3zxNLu
         9qQokqOX20lO5Kpt94UtSFnwN+8KUxPQ+oDfhsL8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598621996-31040-3-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1598621996-31040-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1598621996-31040-3-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v6 2/8] clk: clock-wizard: Add the clockwizard to clk directory
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 21 Sep 2020 14:19:59 -0700
Message-ID: <160072319955.310579.4256832010356165092@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2020-08-28 06:39:50)
> Add clocking wizard driver to clk.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Can this be combined with patch #6? And then use git format-patch -C -M
when generating patches? I'm trying to see if anything changed from the
file in the staging tree or if this is just a copy from staging to clk
directory. Would also be useful if that was stated in the commit text.
