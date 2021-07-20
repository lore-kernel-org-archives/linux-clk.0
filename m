Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2851AC636C9
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06BE261106
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbhGTU3c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jul 2021 16:29:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232187AbhGTUWa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D2DE6113B;
        Tue, 20 Jul 2021 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814988;
        bh=PZPoCfULm3By98GrtUDOVVc/ixFxQW8VJ8v9StcC/yo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dpEI9Up/YJe1OLi3BDioGg5m7qKBMrkwAyd3M3B/Koq6EbYIbRvsnlY3fSXSt5k8I
         ZIRJXQMxa+zKSJhTNCJA7qUTVUckaHYvb6HEPas4plANh0jNJgH7KMfe+EOw0ktiws
         JJUvECjO/7JGCYXXasJ6QcOfp0dQc/+/7GjZmx6dcvJkSQblu/WigHiTyNe2eFzP5D
         AsM8SXQtidtrfJx8tvo+miDNWtA85p4h69W2/gdqqHEZwtvn71uJ8B4ZECUL4FpyiE
         QrKX4OA2NExtGfZNYDkPGW3h/F9AfYSI5CP3Bq1DiLxctD7vFkCtBsDIlIegt5LgSu
         PFliuJoORdw/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-8-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-8-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 7/7] clk: qcom: Add video clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:03:07 -0700
Message-ID: <162681498748.2679160.2849949270953036728@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:23)
> Add support for the video clock controller found on SC7280
> based devices. This would allow video drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
