Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB20EC433DB
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 20:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99E4A64ED1
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 20:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbhCMU64 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Mar 2021 15:58:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:40944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234331AbhCMU63 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Mar 2021 15:58:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82CA964E99;
        Sat, 13 Mar 2021 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615669108;
        bh=eOxb6i2eiQLuIs3xBLFm2d74piMq/JM2zbepFvbw4VQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O6TSXBb3zvPCtGMNuCn35Uzdu+qI6x7PuSYZ+SaibI4OpHpCMfeja1GV2xnH3wKts
         XTW+kMtdIlDK9CBntM5PGeTKrAnnWZ6dZtp6IwJ3Ua3pv6gLkHHdVel7IZf1i/4RaZ
         8s+VC95dN+4GB2izpUEpJR24OJOYQK/U7ZgLZz5NrO8ujV7zhkttfNuVHgFlFTaIy1
         Ca8BA3QCORyi2tpvkPsVKU2yKt5eYB5+zeXpn7Qlbj+/Kr6NyQXbptuhlqGBTzJaCd
         CqpZrHymQjchZXfpvK/FUU61f4odJNPnhdDEX91EmE8k5uU6363Qn9FddQOYBuVIjF
         sk0Q6OJzpQZrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615400283-20100-1-git-send-email-tdas@codeaurora.org>
References: <1615400283-20100-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: rpmh: Update the XO clock source for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Sat, 13 Mar 2021 12:58:27 -0800
Message-ID: <161566910713.1478170.4881967524115069645@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2021-03-10 10:18:03)
> The bi_tcxo clock source for SC7280 requires a div 4 to derive 19.2MHz
> from the xo_board. Thus update the same.
>=20
> Fixes: fff2b9a65162 ("clk: qcom: rpmh: Add support for RPMH clocks on SC7=
280")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-fixes
