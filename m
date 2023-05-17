Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D9CC7EE2C
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 07:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjEQHfU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 03:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjEQHem (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 03:34:42 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F4E19B0;
        Wed, 17 May 2023 00:34:31 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34H7YHFd129172;
        Wed, 17 May 2023 02:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684308857;
        bh=q/SFmzYhjBJLA55MxMPvGUOzW2FoR1LTN7CN6R4bpuM=;
        h=From:Subject:Date:To:CC;
        b=ZWJVJBcZwCD4D91xNGFuJ9gxMmRAasVH5izU/Q1oknJGKL00sozvTeNU5F8Eb+155
         hDfnEnlVGifEpVi2gBTI36Lcy3YLVbAvwJNvRwJKoiFXFIllTGKwtw6J5nEmcjP7ru
         TlyKGuj0GjnWUTvo1do9t6nNjEe2NjCbrw7YP4h0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34H7YHSN013715
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 May 2023 02:34:17 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 02:34:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 02:34:16 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34H7YG2L103469;
        Wed, 17 May 2023 02:34:16 -0500
From:   Jai Luthra <j-luthra@ti.com>
Subject: [PATCH 0/2] clk: keystone: syscon-clk: Enable audio reference
 clock
Date:   Wed, 17 May 2023 13:04:04 +0530
Message-ID: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyDZGQC/x3MSwqAIBSF4a3IHSfka9JWooGPW10KC40QpL1nD
 f/Dx6mQMRFmGFiFhDdlOmIL0THwq40LcgqtQfZS9UYYnnD2+8aNM1oHJbSXChp2NiN3yUa/fjx
 iub75bJzK/z9Oz/MC74WpkW8AAAA=
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=/0cUZo86/f53s3JQ6WfEz9sn4ePUwoM0/fp5Dviv2R4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkZINyTqYcN2XUOj8v3yDQWPEGxR17RGVT+pqLT
 VidUy0YOgKJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZGSDcgAKCRBD3pH5JJpx
 RcgqD/9E9BOAmyaI06N441eNhGq4LdMc48I0vYbhWg2GkZJJhw/0GEemRqoF6FnZJQqp+5Y70Oj
 mSvZQ5iU/GVBDQ1dEgTeGcVKQUSEYKb3al+Bvq6Pp15dRLE+u9YtXjG8zV9Vbsn7ZPx9fCPSP2d
 T3RAeJ+YQzU0NQ1yP0iUBQ+4q5JCU41GUUucoADzPQZ22eIQ4lTNlCkIXW+yqa1lJYrvvklYyzc
 PaxUo1seX5YTNekT5tyMbn77UuRIXobNiKw6N5BDhU3as0Je/XYtYoXjuFt3upmvozIYPQPYGvg
 3iiaLwUxdk0rKoS7hyjOusLZE0FZK4yWJ1wKWDJyX9ObhjVZbUSH8wSvzeHyb+6XxHPskNgzxP8
 m3v9CBcjW5Xx11qHG9KoTC7ouoKGoAd9HZ7aflB6mprRF6S+O4UxXm9bZkJLBE3/PomXbx6c/zI
 8raW6EmwcBoVa2lAB8NbNXUskw28J8BkNb9OhW6yh534bMqyXfEMeviMni93QdBm1opgaoaEgS1
 kAG7wQe+zvPBScUdcp9umBDREE1DvVrf0t2xI8W/fbcoQXvpdJwljUt2L8RD0JAPcEXLz3pKKlX
 ScodvdzbA/UZhx5RjAMDmzTYps9/dNkUMQHqcfS1yEGU4bxSXozbpju3zveFwpkEOoVRTp1aT2t
 FZI24B89+qS4oBA==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TI's AM62 SoC can optionally provide two audio reference clocks
(AUDIO_REFCLKx) to external peripherals. By default the reference clock
is looped-back inside the SoC to a mux that goes to McASP AHCLK, but can
optionally be enabled as an output to peripherals outside the SoC by
setting a bit through the syscon (CTRL_MMR) registers.

This patch series extends the existing syscon-clk driver to support
the audio reference clock, and also adds new device tree bindings
documentation.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Jai Luthra (2):
      dt-bindings: clock: Add binding documentation for TI Audio REFCLK
      clk: keystone: syscon-clk: Add support for audio refclk

 .../bindings/clock/ti,am62-audio-refclk.yaml       | 44 ++++++++++++++++++++++
 drivers/clk/keystone/syscon-clk.c                  | 43 ++++++++++++++++++---
 2 files changed, 82 insertions(+), 5 deletions(-)
---
base-commit: d3a08193ebf4220a69f1f13087f150429769f911
change-id: 20230515-refclk-5b544d314c23

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>

