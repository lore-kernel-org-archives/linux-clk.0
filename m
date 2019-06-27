Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC25C4321A
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 21:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 902BC2075E
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561671462;
	bh=BhvTO9iM0Nsao/9cTaXxE5CBmVbZ+tgky6uuV5SvCsw=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=lRD8ZUfqXC2aULT1wDfVwRRW2rpLzT2pUeB6VXrfez4/DCt9u3CogBpPynOriKNow
	 bLgU202668DbgW9XgZHeT9ogjbMgDSyMQOQRSPLS/EdzMGV/pqHGkvWemwI0LeTccU
	 kL9u7FOWk5SrONcM92odewJVESqzuzy94Awv4vkw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfF0Vhm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 17:37:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfF0Vhm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Jun 2019 17:37:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BEFD2075E;
        Thu, 27 Jun 2019 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561671461;
        bh=BhvTO9iM0Nsao/9cTaXxE5CBmVbZ+tgky6uuV5SvCsw=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=sIh+t5btWI1aeDdEsYnXH/Z10Zp3bKUsTsPdQIzYHZJxOUprvI6BjYUqs3/GCxOf2
         iYn53O4dAW8ENyJ0DXdirvejozK7cLnmPjsdezvumYPsbIsZfM/KXglFdOf20hvmEg
         6umpGCJHhIgeDvTKssKsEbVRh8oPz7J7aOLsjHS8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190625063140.17106-2-vkoul@kernel.org>
References: <20190625063140.17106-1-vkoul@kernel.org> <20190625063140.17106-2-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table checks
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 14:37:40 -0700
Message-Id: <20190627213741.5BEFD2075E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2019-06-24 23:31:38)
> We want users to code properly and fix the post_div_table missing and
> not reply on core to check. So remove the post_div_table check.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

This doesn't apply. Not sure why. Can you please format-patch with
--base=3D so I can know what baseline commit you've based your patches on?
Helps me avoid needing to ask, like right now.

