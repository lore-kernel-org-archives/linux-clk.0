Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F720C74A5B
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 19:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjC2T7Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Mar 2023 15:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjC2T7Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 15:59:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEBF61AD;
        Wed, 29 Mar 2023 12:59:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6667961DAD;
        Wed, 29 Mar 2023 19:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE040C433EF;
        Wed, 29 Mar 2023 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680119957;
        bh=tucWIjvVAY6oYmk4WMzNkOOTjS2GDIhv/FrLw7TTJI4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=g84JxOb1v1QRnnQ3CSRXVAy8A5VZF5jYLQ2TE3FSXTjF6/z3gyFEjKCiLgzOr2PFQ
         i0O4QUT0rJoNRMiIEOZyYaGvV2p+/0YmJERhxCO+qiIRxbmU+nUzBdHs+4z5S3rYcX
         jVpIKnBVNq3HqnbbwjriwLP06JHLo4wIanEP7lxSmzP4uDP4WhqmqXj2ENZIg6UV8X
         5NyUOWJTuN9MyuW4cYqkm8yQlXVld6uEl/lai5PGMyiQ2JeI4x1Gm8I8i1YlfDFj4n
         Cqyr/9T7ztYJmjOUn0mPxxclaQ4/EzrUT/JCsSIxht8QzRA4w2IS6Wf2AXyM19rT0V
         ATrVCz2q0La+A==
Message-ID: <343f23076b328089f59820d98cd29dac.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230117135459.16868-6-ansuelsmth@gmail.com>
References: <20230117135459.16868-1-ansuelsmth@gmail.com> <20230117135459.16868-6-ansuelsmth@gmail.com>
Subject: Re: [PATCH v3 5/6] clk: qcom: clk-rcg2: introduce support for multiple conf for same freq
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Robert Marko <robimarko@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 29 Mar 2023 12:59:15 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Christian Marangi (2023-01-17 05:54:58)
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 01581f4d2c39..18f4f7b59f36 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -15,6 +25,8 @@ struct freq_tbl {
>         u8 pre_div;
>         u16 m;
>         u16 n;
> +       int confs_num;
> +       const struct freq_conf *confs;

This design is uncommon. I suggest you have a different clk_ops
structure and/or entire clk_rcg (clk_rcg_fm?) that does things
differently. Then we don't have to worry that all the other rcg2 clks
(of which there are many) could be broken by this patch.
