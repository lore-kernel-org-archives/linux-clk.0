Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363EEC4167B
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23AE961131
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238932AbhJFN0I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:08 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37906
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238881AbhJFNZ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 09:25:56 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 55BC93FFF3
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526643;
        bh=V+hluEgRJjqVht5qKdWyp1/U0W3007gMbYlNxX8GigA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=kuq5PySsjuiejXpVvJm0fLE/sEE46kdd9+E0C7ySIae8QPFxzQaaj7MKguwORnS6F
         kDGmghdtuc/o4EjBctKNBXSMPQ+j3KlonNLKlji1SmIxbBcZQa1E87JjdF6QLsmzo9
         Yi+Nwq8cEoyCTCvAgzsfQ+cXj09hjF10xJ8ygLNvc4Wwi9EqCIU/SxbmXfHJ4nu0Z6
         UogvfphLBXaFp5owOibonjeQyJMYoLt6RucK5LjU0pTOnZG15hKCnDz+6WbjY3tYr7
         Jo38tIv2PgWkCDhfjtNVNgjIjGa5FwN9rJqRBwCcj5GdcnbWXtJN/2PY+m/Gu/aiY0
         ae77W7McdCk1w==
Received: by mail-lf1-f70.google.com with SMTP id i1-20020ac25221000000b003fd5769ca3bso837304lfl.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 06:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+hluEgRJjqVht5qKdWyp1/U0W3007gMbYlNxX8GigA=;
        b=w+pxlJM+IwWO/YILIR80ePIoti1/xMy/+4ApDpk8NnkoFfu1mYIWHyNtDFbaobKY6g
         W5WRKZs2DPgnoUXVPTITcUAHRzSZsaTpfnrRaJ5uD7PESXwsGRZw+sKEiU2P7J3xvtkx
         lHU3lp9//hx5RtUBNyhGrO1aMfKLy6S6G44Uuu3X7EVVGdrYHqZ9DUxMKerVL8+i860d
         rgf0gTrAPW/VDx8xOsvnow/URzCWB5/z4l5Bg5/UBzdvqhqSobZBM/ohVgwTsK7IB4vu
         9p7OUmPkqaZ73aVb2yn8XF+/z0Ezm/ug0belclyRY1si3WocQErsYQUc79MoDwMf0fnA
         dxRw==
X-Gm-Message-State: AOAM532PGcNI5piKXn8mv6s4WmW9pFOLiyO/djVFBVp4l5cHbqfbt9RH
        BYAGMOLvgMORgkjvUrR5KdYujLcoxxjnZ+ZnFgRi/rMCfjxDzTtQnyao9tfkDu3Bx/0CsIoxWta
        mm9x1ffH3oCEyOvcVjLftLz01KFNce/BsU3LkaA==
X-Received: by 2002:a05:651c:44f:: with SMTP id g15mr30072060ljg.396.1633526641814;
        Wed, 06 Oct 2021 06:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIYlWNEbj8/47t8HcXnaczo+J+CX9tbfMdsDZMuuvo+eey1DO0juu9idFhEgf4/NpOvbliSw==
X-Received: by 2002:a05:651c:44f:: with SMTP id g15mr30071906ljg.396.1633526640134;
        Wed, 06 Oct 2021 06:24:00 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:23:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M and S5M to dtschema
Date:   Wed,  6 Oct 2021 15:23:14 +0200
Message-Id: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi All,

Changes since v2
================
1. Add Rob's tags.
2. Remove "regulator-name" from properties (all regulator dtschema).
3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).

Changes since v1
================
1. Drop DTS patches - applied.
2. Fully remove bindings/regulator/samsung,s5m8767.txt .
3. Minor subject reformatting and few typos in text.


Intro
=====
This patchset converts all devicetree bindings of Samsung S2M and S5M
PMIC devices from txt to dtschema.

It includes also two fixes because later conversion depends on it
(contextually).


Merging/dependencies
====================
1. Regulator related binding changes depend on first two commits (the
   fixes), because of context.
2. The mfd bindings depend on clock and regulator bindings.

The fixes and bindings changes (patches 1-10) should go via the same
tree.  For example regulator or mfd tree.

Another alternative is that regulator patches (1-2, 4-6) go via Mark who
later gives MFD a stable branch/tag to pull. Then the clock and MFD
bindings would go on top via MFD tree. Or any other setup you would like
to have. :)


Overview of devices
===================
Essentially all Samsung S2M and S5M PMICs are very similar devices. They
provide the same functionality: regulators, RTC, 2 or 3 clocks and main
power management (e.g. power cut to SoC).

The differences are mostly in registers layout and number of regulators.

The drivers are built around one common part, mfd/sec-core.c, and share
some drivers between devices:
1. MFD sec-core for all devices,
1. one clock driver for most of devices,
2. one RTC driver for all devices,
3. three regulator drivers.

The regulator drivers were implementing slightly different features,
therefore one regulator binding for all devices does not make much
sense.  However the clock device binding can be shared.

The final dtschema bindings try to implement this - share only the clock
bindings.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
    is disabled
  regulator: dt-bindings: samsung,s5m8767: correct
    s5m8767,pmic-buck-default-dvs-idx property
  dt-bindings: clock: samsung,s2mps11: convert to dtschema
  regulator: dt-bindings: samsung,s2m: convert to dtschema
  regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
  regulator: dt-bindings: samsung,s5m8767: convert to dtschema
  dt-bindings: mfd: samsung,s2mps11: convert to dtschema
  dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
  dt-bindings: mfd: samsung,s5m8767: convert to dtschema
  dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies

 .../bindings/clock/samsung,s2mps11.txt        |  49 ---
 .../bindings/clock/samsung,s2mps11.yaml       |  45 +++
 .../bindings/mfd/samsung,s2mpa01.yaml         |  91 ++++++
 .../bindings/mfd/samsung,s2mps11.yaml         | 267 +++++++++++++++
 .../bindings/mfd/samsung,s5m8767.yaml         | 307 ++++++++++++++++++
 .../bindings/mfd/samsung,sec-core.txt         |  86 -----
 .../bindings/regulator/samsung,s2mpa01.txt    |  79 -----
 .../bindings/regulator/samsung,s2mpa01.yaml   |  62 ++++
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------
 .../bindings/regulator/samsung,s2mps11.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mps13.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mps14.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mps15.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  44 +++
 .../bindings/regulator/samsung,s5m8767.txt    | 145 ---------
 .../bindings/regulator/samsung,s5m8767.yaml   |  74 +++++
 MAINTAINERS                                   |   9 +-
 drivers/regulator/s5m8767.c                   |  21 +-
 18 files changed, 1080 insertions(+), 477 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml

-- 
2.30.2

