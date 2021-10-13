Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0DBC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 18:44:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D2CF61130
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 18:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhJMSq5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 14:46:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229814AbhJMSq5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Oct 2021 14:46:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE4D0610E5;
        Wed, 13 Oct 2021 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634150693;
        bh=aUzb/zUoyFAyBoAbgovwC2Gjc0PbptvVB5g1p3j5Poc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=L0IOYOPZu16n2rCbirbAmux5slbVtjgbxJ4UmXsmUmGyNuKu14hgyUO59juUQxv+G
         uIs2eFUZXs5g+vZmlJM1DPUey7hgkluvPNl1iFhWZh+lRynkn8tnthIgHiIu4KBO4O
         4Ti+qrncyneWXokHb1Ksf+lGh9YW2LGNN9QwVYZswEhzKtv6OHDGsChnC/I8veKhzO
         ArnA2ItqDUWT5siT1PX5XaG9HGVmARICXAxZzmretykKYOFq1kzen9dHwDQpQL9YbH
         UDHDfEdXlDpQfMacP9DsORtjTa/WLqO0V8XmBGapYsfWCIjIm9P8fxYVJ8MzRWk3Y2
         ez7LgGDdI6woA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211007212444.328034-2-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz> <20211007212444.328034-2-luca@z3ntu.xyz>
Subject: Re: [PATCH v2 01/11] clk: qcom: add select QCOM_GDSC for SM6350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Date:   Wed, 13 Oct 2021 11:44:52 -0700
Message-ID: <163415069258.936110.15555683907111341137@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Luca Weiss (2021-10-07 14:24:28)
> QCOM_GDSC is needed for the gcc driver to probe.
>=20
> Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-fixes
