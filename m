Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6055AC43467
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 01:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 250DB21D7B
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 01:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602638248;
	bh=1+ufx2dVbw5H5+OU1t5SAcxb9t1vby1/0Lm7k7kpZjc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=uEl779pPhBnFXWRkCcFFJlkF5bsqp7mDOd4qgiUb3HP0V2fI6jzFvg9qrtq73CaQ/
	 fo5Fm/Aj3CEeStOIEybx81zeDhqCnQWt8TEoC7D88NYkgdrid+QzQJuCNN8HmFqh5y
	 5xPvBbKg1Y7n2GzEzllp8uFkyNhitXcBrokf0+DA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgJNBRZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 21:17:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:39550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbgJNBRZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 21:17:25 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1BEA207DE;
        Wed, 14 Oct 2020 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602638245;
        bh=1+ufx2dVbw5H5+OU1t5SAcxb9t1vby1/0Lm7k7kpZjc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vZfon3ORqZ6cseqQkCzmJ4uU1EKN8zePjW7i1+8B1mw0ZGRXaBs7GZbK2CP2lv0R6
         Q4eB41gCKDYVE8k3WUr6fc0uDkoCOvx+BZEYnO7R7gp0F+4N+2+fhefnnDG6nLr6RB
         wpeTdhPAKCiYCoIwli0aLbwMGCQTclyxvndhkt/Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923160635.28370-2-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca> <20200923160635.28370-2-jonathan@marek.ca>
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: combine qcom,sdm845-videocc and qcom,sc7180-videocc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:17:23 -0700
Message-ID: <160263824364.310579.13465535264907588273@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:06:27)
> These two bindings are almost identical, so combine them into one. This
> will make it easier to add the sm8150 and sm8250 videocc bindings.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
