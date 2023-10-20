Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8B6CDB474
	for <linux-clk@archiver.kernel.org>; Fri, 20 Oct 2023 11:34:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377113AbjJTLeb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Oct 2023 07:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377060AbjJTLea (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2023 07:34:30 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CB5D4C
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 04:34:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9936b3d0286so111957966b.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1697801665; x=1698406465; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/lwy8WHjVXC6iZ/BJfjFekCT6EMOppAC3IWeHaAw3M=;
        b=B5HxzUyX0e7cUREKt4T5c16c+pnDkb2FQ7ELlc+pLDarGoIgrKrVQG6D31bm6cV00g
         bj3duNFg2cPrp68by4ThHBq1MxoJXfmbjBSl1agAy59Gguixj1fJxBy8dS0f1dF/NRro
         HM5TAGIq6+d6QckEOVsrmELVXnFa+rY+UZtCyfFtHStZdT52xaAycvyDSzfpr5lAqRFd
         0CSs1uEHnf68pmmGeVhtuJehicK4YQQ/A2JOypTE9hU8Td7wb+LWgcypzCMvoetWrOky
         9jLW8kKnoaTl6jxC39WIWsHPcS1Eg36yPcj1kU5OtBmbQ9TwLeiCsalP8RLJiq1MnLuI
         E0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697801665; x=1698406465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/lwy8WHjVXC6iZ/BJfjFekCT6EMOppAC3IWeHaAw3M=;
        b=qEyofEf1cWU7dvfhHQZF67u6X4s4ENC+MEg0xWQXuMGSPWYnRkNDU5IHXDXp398FdD
         ljIz6hQrq66XBMe01t4HxQ2OQShCKfZUAp135xKcfaIxLB6j/gGpzcgxbsTYXySxgsCC
         +jMZQTw8nYZkjcoIP6IY3LRjtCGkdGeCgNAA5TT895A7JNdA/oK/F2hstwnZEHHnSR//
         H32HMzg0ikrt5dccnWS29F//GUfkNLi2rEGL2LYpdkfoNIedi6/O6cjDKwYR0KzPsQ8E
         KlZNamjU+46k/TbJ2TZbHXmpIb6XndU82BMdOYzHkatzwpN6ouhmezaEMD9XECzZv6hV
         PufQ==
X-Gm-Message-State: AOJu0YzsznyFkm/Yew5glwDDGEhSJYKc/pFnJpo5YzCFVz7sstX3SI2i
        zS5LxxkpP/JlzkrDF2oTg3mfrw==
X-Google-Smtp-Source: AGHT+IEc8GT5EtFnLsJhmGBlj0etNMKoCfBRUju6KuKZeg3Dj2iO+BlaE7KYpMmCTiCevtHie4gT5g==
X-Received: by 2002:a17:907:d388:b0:9bf:4915:22ca with SMTP id vh8-20020a170907d38800b009bf491522camr1032497ejc.45.1697801664707;
        Fri, 20 Oct 2023 04:34:24 -0700 (PDT)
Received: from capella.localdomain ([193.89.194.60])
        by smtp.gmail.com with ESMTPSA id ce10-20020a170906b24a00b009b654751c14sm1300320ejb.47.2023.10.20.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 04:34:24 -0700 (PDT)
From:   =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: [PATCH v5 0/3] clk: si5351: add option to adjust PLL without
 glitches
Date:   Fri, 20 Oct 2023 13:34:13 +0200
Message-Id: <20231020-alvin-clk-si5351-no-pll-reset-v5-0-f0c1ba537f88@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALVlMmUC/4WPyw7CIBBFf8WwdpqBMr5W/Q/jAulUiYRWUKIx/
 XdpdeHO5bnJPXfmJRJHx0nsFi8RObvk+lCAlgthzyacGFxbWChUtUSpwfjsAlh/geSoJgmhh8F
 7iJz4Bmw7Y9GsiNCK4hgid+4x+/eHwmeXbn18znNZTunXjBspZa10RRtFWwL5GWqGa0xVexFTO
 eufwt9TsgYEU9NqjUojrtvmWP6B3t+7xGF2juP4BqsNVZQBAQAA
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Jacob Siverskog <jacob@teenage.engineering>,
        Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series intends to address a problem I had when using the Si5351A as
a runtime adjustable audio bit clock. The basic issue is that the driver
in its current form unconditionally resets the PLL whenever adjusting
its rate. But this reset causes an unwanted ~1.4 ms LOW signal glitch in
the clock output.

As a remedy, a new property is added to control the reset behaviour of
the PLLs more precisely. In the process I also converted the bindings to
YAML.

Changes:

v4 -> v5:
- address Rob's comments:
    - min/maxItems on top-level clocks:
    - remove unnecessary else:
    - remove spurious |

v3 -> v4:

- remove spurious | per Rob's suggestion
- simplify conditional clocks/clock-names per Rob's suggestion
- remove mention of clkout[0-7] still being admissible in the commit
  body of patch 1 - while the Linux driver still tolerates this, the
  new dt-bindings do not

v2 -> v3:

- address further comments from Rob:
  - drop unnecessary refs and minItems
  - simplify if conditions for chip variants
  - ignore his comment about dropping '|', as line would be >80 columns
  - move additionalProperties: false close to type: object
  - define clocks/clock-names at top-level
- drop patch to dove-cubox dts per Krzysztof's comment - will send
  separately
- collect Sebastian's Acked-by

v1 -> v2:

- address Rob's comments on the two dt-bindings patches
- new patch to correct the clock node names in the only upstream device
  tree using si5351

---
Alvin Šipraga (3):
      dt-bindings: clock: si5351: convert to yaml
      dt-bindings: clock: si5351: add PLL reset mode property
      clk: si5351: allow PLLs to be adjusted without reset

 .../devicetree/bindings/clock/silabs,si5351.txt    | 126 ----------
 .../devicetree/bindings/clock/silabs,si5351.yaml   | 265 +++++++++++++++++++++
 drivers/clk/clk-si5351.c                           |  47 +++-
 include/linux/platform_data/si5351.h               |   2 +
 4 files changed, 311 insertions(+), 129 deletions(-)
---
base-commit: f6abdcb2444f6ebe06e19cd9eee767c7c46612ae
change-id: 20231014-alvin-clk-si5351-no-pll-reset-ecfac0a6550c

