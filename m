Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE8EC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:41:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 979C12075B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555015275;
	bh=VIJaF5iMyA0bRDij67sU4vR/qXYs69tiIJoCsu/GcSM=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=pcFbr0j5OgJbxycmcxyAw2j0SpbFwLCVx7h8UqjoqFZ+ur8+Kx89r3uOEFWJoAUHA
	 nJsuY8k+knmlIgNK8i1P/xocrFipSy2vDUCZC1Ltvsi85CGLUtRP4cBZOFDQTAo3f1
	 50XIslkFSlv84J2kA7Y8109DCuVfLO229uAFbXi8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfDKUlK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:41:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbfDKUlJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:41:09 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2329B2075B;
        Thu, 11 Apr 2019 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555015269;
        bh=VIJaF5iMyA0bRDij67sU4vR/qXYs69tiIJoCsu/GcSM=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=zwbJVxG5QspFYoxtho7MS+s/aNqdyPdTC0ZqHfefazKFt3Uq1yKFSuOCgpO2KGBbO
         +ipITYkF2Y2TLbVcEu5voON4b3MDteaiymQ7cweszf63fR24jK9liTqtEv8lp+arjQ
         El2gqa0nlmeSrA81WxiK9J7HZNLMCCEl8HecMcKU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319140536.27945-1-paul@crapouillou.net>
References: <20190319140536.27945-1-paul@crapouillou.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: jz4725b-cgu: Add UDC PHY clock
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>
Message-ID: <155501526838.20095.10825453915225262289@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:41:08 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2019-03-19 07:05:35)
> Add macro for the UDC PHY clock of the JZ4725B.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next

