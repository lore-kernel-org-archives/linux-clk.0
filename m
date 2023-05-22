Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FC8C7EE2A
	for <linux-clk@archiver.kernel.org>; Mon, 22 May 2023 12:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbjEVM0n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 May 2023 08:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbjEVM03 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 08:26:29 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82CF2683;
        Mon, 22 May 2023 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684758276; x=1716294276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xn6Sbd2vOZ1d1aJBz+nBV1P/3DRv4zUBXdD9oXRheJU=;
  b=uK/pmxRAC7y8JyYslzbsQbjmPeIpm6dGvhzdXd8V5HGw2YfDGRZZFZrI
   Z9kLfVXPMdlSit1kMpZH7QKiQ7B0fN1HF3eCefkqiMOfEtwaintiKYcNu
   VSMxSvYvbO26JGZRjQa+iYh6CHcIVulAd5wYMgdjZBZ38bdz7VSJtLjNO
   m+ibFdSk7ZCVRzA7IOerMc+l093V/n+VYqrX4URuVfOU7d0/DyGQtELrn
   BifHURvR7ETMeP9HnyqpigSiD0LywXfs5xyW5VrikMyjozSaxeglTQuY0
   tYZYNyHbYbFmKu5F6zL9NqDK2MwlA1YB1zt1bmqRNY0KKrMYx2NtMXlvx
   g==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="asc'?scan'208";a="216636251"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 05:24:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 05:24:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 05:24:11 -0700
Date:   Mon, 22 May 2023 13:23:49 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Jai Luthra <j-luthra@ti.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Davis <afd@ti.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add binding documentation for
 TI Audio REFCLK
Message-ID: <20230522-preaching-thieving-d0a983a5a058@wendy>
References: <20230515-refclk-v2-0-fc9ff08826f5@ti.com>
 <20230515-refclk-v2-1-fc9ff08826f5@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0HT54K5oO9Sb0rsX"
Content-Disposition: inline
In-Reply-To: <20230515-refclk-v2-1-fc9ff08826f5@ti.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--0HT54K5oO9Sb0rsX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 12:01:55PM +0530, Jai Luthra wrote:
> Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
> SoC.
>=20
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Well since I was happy with the old, wrong patch:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--0HT54K5oO9Sb0rsX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGte1QAKCRB4tDGHoIJi
0mSsAQC/7GtBW+66cZg+ZPxgaarqrI+Jztz+RIMxk70nhIIdowD9FXPLpWowhg1B
b9B1kbtSprJ2Ddas88ynkWtksM8xhgA=
=N1Sl
-----END PGP SIGNATURE-----

--0HT54K5oO9Sb0rsX--
