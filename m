Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982E0C4320A
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F59261184
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242200AbhHFBxt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:53:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:35954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhHFBxs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:53:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A845560200;
        Fri,  6 Aug 2021 01:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214813;
        bh=P2O5IdAFvpyNcmLz3uAuQrdegsZnkbld/HJJ4sKU0U0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hHTwfjbtEjZ/FJN1xsNi5WWoDbe+Xic09Yj3lKNJvJGd/+FEOIuyyLph9M3xoJB7b
         Oh/8PL7//rhER8goNANJ9vaipdSLRZAOFK2WUbqrZRQZWZwPUSzguKd9ShRdhw73WF
         fQoKgyadqtaJPL8rOJcg9j2nRDxYh4q9CkEYV8bPLkMG/34LhTCJ2Pc38cJCnAFLmA
         im81U/noF9egV9E856ce55ZSoiq7/oOT/TErDZnNytrqPC9YfbJm00GoJvtKBhf0tC
         6UdkcmmseTiUjRKjKqyx899XkqvhIOJPgqd+jj0F4yF+p/zhkpfK5Lb5uoJM4nfAbL
         srxgz8Ul7gt4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210704024032.11559-5-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org> <20210704024032.11559-5-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: qcom: a53-pll: Add MSM8939 a53pll support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Thu, 05 Aug 2021 18:53:32 -0700
Message-ID: <162821481259.19113.9779145389513383105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2021-07-03 19:40:32)
> MSM8939 has 3 a53pll clocks with different frequency table for Cluster0,
> Cluster1 and CCI.  It adds function qcom_a53pll_get_freq_tbl() to create
> pll_freq_tbl from OPP, so that those a53pll frequencies can be defined
> in DT with operating-points-v2 bindings rather than being coded in the
> driver.  In this case, one compatible rather than three would be needed
> for these 3 a53pll clocks.
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
