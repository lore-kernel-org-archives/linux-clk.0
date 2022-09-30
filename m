Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16570C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiI3UoE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbiI3UoD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:44:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363201F0CF7;
        Fri, 30 Sep 2022 13:44:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE96CB82A00;
        Fri, 30 Sep 2022 20:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E56DC433C1;
        Fri, 30 Sep 2022 20:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570640;
        bh=V2R+7mNDRq8ccqMNFcNroSgwGWeNnc7AQ6SqD5Ji88o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N05zwJMomv3oNsjGQwDOUkzxJHQ+Ql1Os4JOvQC6p9nJpmpS1Yp/1T2BiD4Qp00pI
         xWprLSPXJE9bjWjWjMPurBFC9Jc7VWXXDaj1dmfH5nH0sRPTYzXwtOM9zPHXA9fhBm
         Js7FYpVTgtk7wK8hDpXgPRfRfTpjGKDD1XkEqUZCuc2QU0mEDwPBNTpFUbJPA/Z1+Q
         kiRRkv+S7FZLRD96GsIewuGHV1t2IwP1OTKz5xykcymxCEjztyTe8T0bcLXDnMaY6P
         l+7tXlqt87dRT2OjLkf0gVB4Vv6r9Bq1PN48l9oJU5Cr74/ZGT8mhypnWCM4wvzhyj
         IDI4nRR+Z1f1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-5-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-5-doug@schmorgal.com>
Subject: Re: [PATCH 04/12] clk: mmp: pxa168: add new clocks for peripherals
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:43:58 -0700
User-Agent: alot/0.10
Message-Id: <20220930204400.7E56DC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:29)
> This commit adds three new clocks that previously didn't exist, but are
> needed in order to match the clock parenting as described in the PXA168
> datasheet.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
