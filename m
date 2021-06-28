Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38E3C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8775461A1D
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhF1Btq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:49:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231941AbhF1Btq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:49:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F80C6197F;
        Mon, 28 Jun 2021 01:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844841;
        bh=9UWcelME6HNUHo/LUeiopQ21mfUm+/LUxXKYKgFbOKE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TlOxhg9EeANo6em1qO9GNzosd8YhlX0Y7IAd2m68VZcYoJUTAiHlyDo29sCnoTKYi
         eFt+u/1xxvoDNGQ6/nOGavp6gX1eD4Q7uxr+cwXmsVF+A7ujizRQTR/PhEwk4XQpqf
         aWl6qE4MZwlSXD+qZ0qAoGg3F/P63HaXrlxwmAywrTgGcdsBGvNjIBUPXbgB/cGrDG
         t3RggEpDC+ZgSfykPDUmhxWwlffXbTtSoXUWNQlpx944UOP9cMA9izi1SuRF3a96gX
         AY4vRxcltKPrhZHvUEJl6pqjQTKCeU7wlJ5astVnZEOBhzxSkafxlOEFlnL79Gr6Cs
         TdQNY6Mtugxzg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1d0902cf073f76a1a602410061481ccb3fc36a72.1623354574.git.cristian.ciocaltea@gmail.com>
References: <cover.1623354574.git.cristian.ciocaltea@gmail.com> <1d0902cf073f76a1a602410061481ccb3fc36a72.1623354574.git.cristian.ciocaltea@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: clock: Add NIC and ETHERNET bindings for Actions S500 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Sun, 27 Jun 2021 18:47:20 -0700
Message-ID: <162484484044.3259633.9017324320289060933@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Cristian Ciocaltea (2021-06-10 13:05:25)
> Add the missing NIC and ETHERNET clock bindings constants for Actions
> Semi Owl S500 SoC.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
