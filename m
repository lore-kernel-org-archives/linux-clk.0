Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC2EC433B4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 00:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33DA061154
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 00:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhD1Agl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Apr 2021 20:36:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhD1Agk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Apr 2021 20:36:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 714B661402;
        Wed, 28 Apr 2021 00:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619570156;
        bh=V9JXvGRNOedswhyMXA4l/r3YLbqKuGnw2SqrumNCfYA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QrVjdUNef5TUDv/i0n3YhvovSQzvoy6lsIzDna30Oui0yvP9Z8XI90oTBEqVS2YWk
         5Jn1juFh4gwBpzAqXRrDYhqTfrfS28qpiSOsdK1CWFCx2gihtlG8OSRYqqvfNqrWRb
         TnBL9W86+9vlMbWjFX7MV70hHbXK3471gqKIVdvTIj1Vk+Nuqyi1c4R/GCGZlFSDKG
         mJ4JKeiILdYEZKyFRlbgDGrLwQUhLjiJjBNahqef5h1cKOBW2EGmB9zRCPpRIXAZtK
         vvMNlVUrU1OKKgLa9aNP+HlWikVC+F78TxzMKyNC14nWE7bpCYUyAERVdv+8UOZskY
         AIIzHkM9BWMLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1619521932-18973-1-git-send-email-tdas@codeaurora.org>
References: <1619521932-18973-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: gcc: dd support for a new frequency for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 27 Apr 2021 17:35:55 -0700
Message-ID: <161957015504.177949.13285002036192713660@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Is the subject supposed to say "Add"?

Quoting Taniya Das (2021-04-27 04:12:12)
> There is a requirement to support 52MHz for qup clocks for bluetoothe

s/bluetoothe/bluetooth/

> usecase, thus update the frequency table to support the frequency.
>=20
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SC7280")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
