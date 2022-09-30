Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73193C43217
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbiI3UpS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiI3UpL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:45:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EBF275D6;
        Fri, 30 Sep 2022 13:45:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56885B82A01;
        Fri, 30 Sep 2022 20:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC16C433D7;
        Fri, 30 Sep 2022 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570707;
        bh=Oq/NQlOKRP9ZgsSht/4CpuZNrGFYEC/5ufZHVN9EC6Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HRZvyhDqpLhQnM+W7+jYTo3Mf9WWfnI9iMHewmkrJLSNHZxfVOURiNi6e3O6O5Izt
         zgG+C6+Z+TsqfX+o+cmKAthohHFnF2uCQcXfnK6lkJ3Kxixi6jQouARqyjhPQrPi7b
         f52FVbYJMT9JRwN3cRWIk53zcA0JeModezUkB7rjntte83LCGZZyjtPvow/nbxkJbk
         qGWSmNyRQ6mjRRcPi2dNoAwEvtgjHW5Du2q2AzZVKAwp3fRvW04gy0b7npaGPwCP33
         F8b+V7XtUjSPWIOoiv5cSEEF1UYHd0HqGsTwvrMEP5dTq68xtaugJOj3SRCWvRY23S
         kH+R68djMsoUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-12-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-12-doug@schmorgal.com>
Subject: Re: [PATCH 11/12] dt-bindings: marvell,pxa168: add clock ids for SDH AXI clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:45:05 -0700
User-Agent: alot/0.10
Message-Id: <20220930204507.0DC16C433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:36)
> These are clocks shared by SDH0/1 and SDH2/3, respectively.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
