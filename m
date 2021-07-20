Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACC9C07E9B
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE7C560C41
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhGTU33 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jul 2021 16:29:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234978AbhGTUWM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 790F261029;
        Tue, 20 Jul 2021 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814970;
        bh=gAB3+UKygDFzxi0s1yX+QGrG9nW61aCks8eIjN/wdZM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PyYqeN6Gc5zFyLig/IhAzo3axExedqkc0hoV2iRP5+ccTpcFghvoBjOMTt2OVVwP4
         8Gb+I7AXFmqb/z/h1FPuWrgzpGsTvTwzT+2QV70DXThS1+DSm5dgT4RRJSiWfnMM0c
         AJN1QI2Hx2Brj+hbKwz0uvFc9VhpQGzoeTXtFm7uKbbPHEwWkhm5rV4gROz37sX0Br
         Vugc0bBnbZXVLb7chwh/BnKouyDGor8swdSVMGP2gLb13mnYeydVL9+oSZw3AouYag
         qTwOsbV4D/KBkcVy4qAabRFzban7SqVN0NG0DpNRfalv3JaTm8bngBR/gp41D+v3Df
         hrqTkMaWQQ9FQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-5-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: Add SC7280 GPUCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:02:49 -0700
Message-ID: <162681496902.2679160.8651833803321760631@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:20)
> Add device tree bindings for graphics clock subsystem clock
> controller for Qualcomm Technology Inc's SC7280 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
