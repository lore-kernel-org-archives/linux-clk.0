Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9312EC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B1A61178
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbhINVOl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:14:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234298AbhINVOk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 17:14:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 894A9610D1;
        Tue, 14 Sep 2021 21:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631654002;
        bh=7HE77BXEi8gZJx5D5W1KRYRzBxiyfZmcZVuVI3cDdZo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rAQU2mMJ1Q7/yfgtA5H+wMnmxNfTWLwzvHsPfZPfwtHZFkTM8PtoQ0w0iNrYUZpsP
         BWkC31E0wD/wROa1k6pJIyPH8uXNJTsNyxQRkpRhEQ3CJYK6gd8xc7a3WOMwfC2aLt
         J0/Ge4yxeofKqMry48WHKVdzOS1bX7o74G0H4NzDnbbn9ws/OqNZ428z+tJLUOI8IG
         AvW5wJv0Gc9SzgVcfOs5j9TZXxUzZA4ZZ9BUnBwurptEdqTNDZ94nsgA45aIgjovqz
         EVWNOhgqafVKxnu/+83bPLzYjJnqb/93/H/5Itw3U7nHaRIju0DVqc+Z2TY/tBtG7T
         D3rAT8SSCyprQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829204822.289829-5-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org> <20210829204822.289829-5-marijn.suijten@somainline.org>
Subject: Re: [PATCH 4/4] clk: qcom: gpucc-sdm660: Remove fallback to global clock names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:13:20 -0700
Message-ID: <163165400096.763609.16224534023728394535@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marijn Suijten (2021-08-29 13:48:22)
> The necessary clocks for this driver are already fully specified in
> sdm630 DT under the .fw_name, and do not need an implicit fallback to
> their global name.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
