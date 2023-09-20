Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B28CE79CE
	for <linux-clk@archiver.kernel.org>; Wed, 20 Sep 2023 14:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbjITOE2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Sep 2023 10:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbjITOE1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Sep 2023 10:04:27 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF16DD9
        for <linux-clk@vger.kernel.org>; Wed, 20 Sep 2023 07:04:15 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so3316889f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 20 Sep 2023 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1695218654; x=1695823454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwi8Aua8Y+P9FZKHN1BFMedplZvBD6+gBTVYLrMGWT8=;
        b=I/W9rChcbKcMpDEMcF4CNOqLmCVxw5+l22F78DmIxzRxPNgW2RYLfFRn3ltbk8S1s/
         cTSFdu13qGu6IS/A3ZlN6f80S4vYh4Q0Kh667W9Ob73KfBkr6Yp7PZz+1YmpcWRx/ntO
         1qkP1G+8dXzeiAoLVEQ/Y/qDf7/DT5PNNh7DwGM2tbcitmzjjw3Q6NAI/d9wXrEKd5Th
         7gUXld1/DOIuQo6BpVu6i8DJMum5nsX4Midu3PXuCpoCW7yHcZvuikOZtEsLIcGJ8Yp6
         25uFo0Cbz+/JdePLGUltVyvLUXhHRjkIpujbWU01jc13rpjECoqCCgc7p6xaZwXKdN5S
         YINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218654; x=1695823454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwi8Aua8Y+P9FZKHN1BFMedplZvBD6+gBTVYLrMGWT8=;
        b=kqxq7mR/fQ50kqflPm8Ajp1YRWSKDtMcA25q28i2wzkkOcVjqyWmtJObyUROgLzRah
         E3QAr+htmAJJr+XGVj+9gtz9igpU7YXrvwdNvrrL+KzAC5HhmFJ50GXz2tT6KkpIhcqr
         7nH3r63cMkcln0ij1yCwY7HkY+YKcxE7Tbv/czYydm0itjMgjj+8RtdeEmanB9PcqkWC
         Jlz4POjZZ0t2Y3dzeD73uYG7ic0JWXqLhLNhS047mFUhS4ILdZsmyLG3CPnwPVAgDRWP
         bv0qZHv5P2kDHoGQrEkqQo7IjWO0z8VOpZvdc7/S1z4FqFtNZ8zb+Urf+JuetfvP3sMG
         TOYg==
X-Gm-Message-State: AOJu0YzClmSAaS5QXSm+CDWvXGcpil3scw0LChs90r6c+YCb1m4miCwe
        MmMOXjcwOnm+XTW7ZlySgnenjQ==
X-Google-Smtp-Source: AGHT+IHTJNOjPaxtCMEhcXl924Qdc/tQizDwoWDkol3TLylbsbucUit0glZlNiGcAG4UP+pOmxG/Xg==
X-Received: by 2002:a5d:60c5:0:b0:31f:dc60:13b5 with SMTP id x5-20020a5d60c5000000b0031fdc6013b5mr2391311wrt.25.1695218654230;
        Wed, 20 Sep 2023 07:04:14 -0700 (PDT)
Received: from capella.localdomain ([193.89.194.60])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906341a00b00993470682e5sm9397761ejb.32.2023.09.20.07.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:04:13 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: si5351: add option to adjust PLL without glitches
Date:   Wed, 20 Sep 2023 15:09:52 +0200
Message-ID: <20230920140343.2329225-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

This series intends to address a problem I had when using the Si5351A as
a runtime adjustable audio bit clock. The basic issue is that the driver
in its current form unconditionally resets the PLL whenever adjusting
its rate. But this reset causes an unwanted ~1.4 ms LOW signal glitch in
the clock output.

As a remedy, a new property is added to control the reset behaviour of
the PLLs more precisely. In the process I also converted the bindings to
YAML.

Alvin Šipraga (3):
  dt-bindings: clock: si5351: convert to yaml
  dt-bindings: clock: si5351: add PLL reset mode property
  clk: si5351: allow PLLs to be adjusted without reset

 .../bindings/clock/silabs,si5351.txt          | 126 --------
 .../bindings/clock/silabs,si5351.yaml         | 270 ++++++++++++++++++
 drivers/clk/clk-si5351.c                      |  47 ++-
 include/linux/platform_data/si5351.h          |   2 +
 4 files changed, 316 insertions(+), 129 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/silabs,si5351.txt
 create mode 100644 Documentation/devicetree/bindings/clock/silabs,si5351.yaml

-- 
2.41.0

