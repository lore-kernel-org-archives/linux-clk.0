Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AA7E8FDD0
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 06:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241410AbjJDGhi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 02:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjJDGhh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 02:37:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A777AD
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 23:37:32 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c3c8adb27so327781266b.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 23:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1696401450; x=1697006250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpgW+gEag9qXZo1DXgsSo0SmTLeZysRZSApP6lP9jNo=;
        b=nYEZ4Zhn/h+N6FdpG7ZXSVc7yqFX70id39nZiBCBXvZUrozB0UIEdYNU243bhuCiZc
         ivSg0bIgaOJkeWRofPFsTo9Bi8nQ8E7qmZINCQXgVu3TFS+d/zGAhj/n4gddVX6eUcZs
         lLDm0YOdQm2tvOrdKay+dHpcMeOd/kuVBGZwbeendEMzuk2ySaEODIb/Bwjm0FNdbrsg
         dqo98IPlJxytO6uqlx2IFYQaTyb7afIav30UNYsUpi2iblZGm5/4aQTpTS5dhmdqjLLv
         +b77I//HJzClF+46J8y3jV/FPcy64bDDArLjdph5LbJBcyDTx2d62+Nnn0gsVJ7RInm5
         05HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696401450; x=1697006250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpgW+gEag9qXZo1DXgsSo0SmTLeZysRZSApP6lP9jNo=;
        b=eA0TCh+DQhZ40FCJU9vNygsdvhzC8xR0CVEnesnOWyNeoq3r3a1j1wYXa7G1WFmKMF
         r/T2EpXM/RabGvIk6IjzlCvrJOtDNmpXxiTLEN5dI0VmJPo+M4B4G/oW5TUTKkVoNmrk
         CUdah/N42jFHzlzWXw15vRPDcGG8JHYEOX13jPjihXjilCs9fP8izzOccME09lPmRWkH
         fC7SxkJAoteyRfRayhDvQrb1J339cHC4VGOkWjxXEcImxN86ZJ83Bu1OaGfKQIFqPFRn
         M3z6Ok3pubWQ1oHGRyxddrEV8A4UjL/ZrAvnMWp2TqPhvvXLiJ6na5VDCLlnV2ry/MwN
         2l6w==
X-Gm-Message-State: AOJu0Yz31bNhlJpcWqc2tJ5pIYb66LaLGlV2j0ZNqtGgVYpggReoORjM
        r6AgxpiIEgAOc5wym1a1nZI4RQ==
X-Google-Smtp-Source: AGHT+IFXko1HRNr/4Dc0L8fANl3BqcyCvc3Cn7PaDAryRcAoBLK0XQQ8Ui4NukV9CX/nSbkjj3V7xQ==
X-Received: by 2002:a17:906:217:b0:9b6:3be9:a84 with SMTP id 23-20020a170906021700b009b63be90a84mr1121861ejd.74.1696401450383;
        Tue, 03 Oct 2023 23:37:30 -0700 (PDT)
Received: from capella.localdomain ([193.89.194.60])
        by smtp.gmail.com with ESMTPSA id jx14-20020a170906ca4e00b009ade1a4f795sm2193507ejb.168.2023.10.03.23.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 23:37:29 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] clk: si5351: add option to adjust PLL without glitches
Date:   Wed,  4 Oct 2023 08:35:26 +0200
Message-ID: <20231004063712.3348978-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.42.0
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

Changes:

v1 -> v2:

- address Rob's comments on the two dt-bindings patches
- new patch to correct the clock node names in the only upstream device
  tree using si5351

Alvin Šipraga (4):
  dt-bindings: clock: si5351: convert to yaml
  ARM: dts: dove-cubox: fix si5351 node names
  dt-bindings: clock: si5351: add PLL reset mode property
  clk: si5351: allow PLLs to be adjusted without reset

 .../bindings/clock/silabs,si5351.txt          | 126 --------
 .../bindings/clock/silabs,si5351.yaml         | 277 ++++++++++++++++++
 arch/arm/boot/dts/marvell/dove-cubox.dts      |   4 +-
 drivers/clk/clk-si5351.c                      |  47 ++-
 include/linux/platform_data/si5351.h          |   2 +
 5 files changed, 325 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/silabs,si5351.txt
 create mode 100644 Documentation/devicetree/bindings/clock/silabs,si5351.yaml

-- 
2.42.0

