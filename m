Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5C4CDB465
	for <linux-clk@archiver.kernel.org>; Sat, 14 Oct 2023 18:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbjJNSUL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Oct 2023 14:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbjJNSUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Oct 2023 14:20:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F73CC
        for <linux-clk@vger.kernel.org>; Sat, 14 Oct 2023 11:20:07 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso4476781a12.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Oct 2023 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1697307606; x=1697912406; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fOl+bxIlDqRdabWV4eMcPga/r08+UAl61pbyIP1Fbo=;
        b=CI/R2blfT4aj3bZA7FuBTBeCrJ5D1W2lHpUTuttuu2icJ7h6uiub6248pm+8c6M8NM
         m4fTxS5O9ojlGfEH93efaSgq3rTL5da5LiMNZQ9hT5+pw4kpUh1onmnSTYXxF7fk9MxP
         ThSlg1PWRHIKfB1jpIjpZHj28T/6vhLCDNLMiU6OPcD6dI4Pfsvee4yf1RDiapfdjs9q
         CAcuvii6W0pfYj11QwCEoNmtkPN2WBeGshP5tbkHqa7ZhomYk86kzPx98Z/DJJkx4HGH
         afxqRWLjuDPK0DbK1nbItP9BVuxmWK9TJaBHX+48xzzaLXjty4SHHz1Reoc6SEnnRn6O
         kMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697307606; x=1697912406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fOl+bxIlDqRdabWV4eMcPga/r08+UAl61pbyIP1Fbo=;
        b=tRSFw+FSaTBv3J4T+dY//vagQDwwn4CuZKJBd1d7tjLWvCKvo+2EUS/h83I+pS8ST6
         M5p4XN+XWxt1Fz/eqGv9C8YrVzLCsn/db5IsDR5iBmKl9NnCBpbwJFs5hDNMAN1bX+TV
         LZ+RMQSGX5JhDm7FzIURckdR6AwqIgy+7sp/CVc5IIWPATWrz0l0Vwbh+eEQ0YkCpKoj
         l06cxOYG6XahEvXzRmSZJrOIeBVLYZTG2mAt24Vzl3bZzXIgcb1BcfcDV+fb5+ntvy0P
         np12yQLYuGSJCK68xF4B1Hriaf7SFMW+aJaqWDMhLcKon1xWiV3RgjuL9j97mn9qpNfY
         u4ug==
X-Gm-Message-State: AOJu0Yx4icORZ+LDdsdi4vOxaxNl1o2TK3Ds9jDU1PZPZ3IlFByZIpCj
        sZO3hvgHdgnoMQgrhpUaY6RJkQ==
X-Google-Smtp-Source: AGHT+IFR9nQTum39uWgT3lfCZqNdApJtGkGJUxCRS85dC01cenjmbGl9KKwCRplUainYK5xaGtAtLA==
X-Received: by 2002:a05:6402:241a:b0:53d:bdd2:3d62 with SMTP id t26-20020a056402241a00b0053dbdd23d62mr11762343eda.30.1697307606118;
        Sat, 14 Oct 2023 11:20:06 -0700 (PDT)
Received: from capella.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id i13-20020a056402054d00b005231e3d89efsm13032574edx.31.2023.10.14.11.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 11:20:05 -0700 (PDT)
From:   =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: [PATCH v4 0/3] clk: si5351: add option to adjust PLL without
 glitches
Date:   Sat, 14 Oct 2023 20:19:40 +0200
Message-Id: <20231014-alvin-clk-si5351-no-pll-reset-v4-0-a3567024007d@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALzbKmUC/y2NQQ6CMBAAv0L27JJuoQY9+Q/DoSmLbGgKtoRoC
 H+3oseZw8wGiaNwgmuxQeRVkkwhQ30qwA02PBilywxa6YoU1Wj9KgGdHzGJqQxhmHD2HiMnXpB
 db52yZ2OUg9yYI/fyOvr3NvMgaZni+9it9LX/smqIqNJ1aRptLgbpN7rNz5jKboR23/cPER/K6
 a0AAAA=
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
 .../devicetree/bindings/clock/silabs,si5351.yaml   | 269 +++++++++++++++++++++
 drivers/clk/clk-si5351.c                           |  47 +++-
 include/linux/platform_data/si5351.h               |   2 +
 4 files changed, 315 insertions(+), 129 deletions(-)
---
base-commit: b7c08e5d3824bc57182b308c1e158ddfdbe4cd00
change-id: 20231014-alvin-clk-si5351-no-pll-reset-ecfac0a6550c

