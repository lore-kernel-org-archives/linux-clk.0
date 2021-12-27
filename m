Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C2CC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbhL0NcJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:32:09 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54426
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234008AbhL0NcI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:32:08 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 904533FFD2
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640611922;
        bh=DQgu+c4s6Y8JybTg+Dkanjn2+HAERoucENiRdMztxAI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=AB5CxL2Tv006+n7YL0/Sj8CjOlhCEFIpZ3yXZIfmOviIi0IgabgpnNVSnWn13H4XD
         umxrzjIL19yDaEdFwocaZtrl5ZZ2DL+9gWpSKUKDWKlwBmw57d4DF4pGyKL8+Aws66
         HsaO9oHJzUBVCpmFL5mmkgeqndJEhbJxKba+LBNMqgovyRsAoV5do2r6iETSsZg/Pw
         rQvjMlq5DjMCetDRxAMThODI19DhVv75cuJhQTYEYVv0/mK8yiUWGZDTUnXGA/bJ/r
         ZYHqivllWI797plJ0oogHyJ/TR3HCUW/rco87q7QtyHXMtTJDIcymudNJx8tLxEVIJ
         5o1Mm80Jy3Tjg==
Received: by mail-lj1-f198.google.com with SMTP id u8-20020a05651c130800b0022d6dad0418so4968990lja.11
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQgu+c4s6Y8JybTg+Dkanjn2+HAERoucENiRdMztxAI=;
        b=OL00VorMG70KsRGJMRZ5mu13oWWL89wwLVUDycvILNb45yiBPhOlkUuTEBTaA0NnO2
         VvvENtjGdwUXp7+KdNCPYtWQaChuULE0f+Sh3cHqMoW6R2rhCYa17zlP3DDerqxYOdmg
         4BS0tQ46WbkqnH+m7Cs+5ajV+H/hw9Gk/Qx5dCj9QYx1SFpAViqdBtMNuYmPVToXHXHM
         J43EEM/0dPnmOVJKkDjdRUfUuxqmenY3OT8iTi/9fxscCJL2qBFz7uXFSqv+Z5ZDj5Ki
         E6nfx+f+1FesORGswSzBGccOJEj5Bi9wZWidUMPCfRfZ9eEOgno0avrrsZusKVdwXrNW
         tmcg==
X-Gm-Message-State: AOAM533XXyiX3GtIKchSajZPDkqoZNgASk5tRZVkvVOrAa/dqVRf8Zaj
        axCkwl0HCBEW0OKh9H5r1RmjGSd4nH64Q6V2im81DaCbfo2cfcAKcN4kitsqnI1p0L8ZmXM81hQ
        0qF897CfPFV6Ub8bbBuCHqTm1wtK5iFVhhsrGUQ==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr8236564lfd.169.1640611921853;
        Mon, 27 Dec 2021 05:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0Q4U7LIWpMdBq7LHQ60Uwk0l50gaJJ6gA+g47QhV12twTncFZtNPYDuX5cQQqf0Bn6AzCCA==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr8236549lfd.169.1640611921619;
        Mon, 27 Dec 2021 05:32:01 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d14sm1433510lfg.18.2021.12.27.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:32:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 00/19] arm/arm64/dt-bindings: altera/intel: fix DTS and dtschema
Date:   Mon, 27 Dec 2021 14:31:12 +0100
Message-Id: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Partial cleanup of Altera/Intel ARMv7 and ARMv8 DTS and bindings.

The patches are independent, unless touching same files (e.g.
bindings/arm/altera.yaml).

Best regards,
Krzysztof

Krzysztof Kozlowski (19):
  dt-bindings: vendor-prefixes: add Enclustra
  dt-bindings: altera: document existing Cyclone 5 board compatibles
  dt-bindings: altera: document Arria 5 based board compatibles
  dt-bindings: altera: document Arria 10 based board compatibles
  dt-bindings: altera: document VT compatibles
  dt-bindings: altera: document Stratix 10 based board compatibles
  dt-bindings: intel: document Agilex based board compatibles
  dt-bindings: clock: intel,stratix10: convert to dtschema
  dt-bindings: mmc: synopsys-dw-mshc: integrate Altera and Imagination
  ARM: dts: arria5: add board compatible for SoCFPGA DK
  ARM: dts: arria10: add board compatible for Mercury AA1
  ARM: dts: arria10: add board compatible for SoCFPGA DK
  arm64: dts: stratix10: add board compatible for SoCFPGA DK
  arm64: dts: stratix10: move ARM timer out of SoC node
  arm64: dts: stratix10: align mmc node names with dtschema
  arm64: dts: stratix10: align regulator node names with dtschema
  arm64: dts: agilex: add board compatible for SoCFPGA DK
  arm64: dts: agilex: add board compatible for N5X DK
  arm64: dts: agilex: align mmc node names with dtschema

 .../devicetree/bindings/arm/altera.yaml       | 46 ++++++++++++++++---
 .../bindings/arm/intel,socfpga.yaml           | 26 +++++++++++
 .../bindings/clock/intc_stratix10.txt         | 20 --------
 .../bindings/clock/intel,stratix10.yaml       | 35 ++++++++++++++
 .../devicetree/bindings/mmc/img-dw-mshc.txt   | 28 -----------
 .../bindings/mmc/socfpga-dw-mshc.txt          | 23 ----------
 .../bindings/mmc/synopsys-dw-mshc.yaml        |  5 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  |  2 +-
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi  |  2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts    |  2 +-
 .../boot/dts/altera/socfpga_stratix10.dtsi    | 21 +++++----
 .../dts/altera/socfpga_stratix10_socdk.dts    |  3 +-
 .../altera/socfpga_stratix10_socdk_nand.dts   |  3 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |  2 +-
 .../boot/dts/intel/socfpga_agilex_socdk.dts   |  1 +
 .../dts/intel/socfpga_agilex_socdk_nand.dts   |  1 +
 .../boot/dts/intel/socfpga_n5x_socdk.dts      |  1 +
 18 files changed, 129 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/intc_stratix10.txt
 create mode 100644 Documentation/devicetree/bindings/clock/intel,stratix10.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/img-dw-mshc.txt
 delete mode 100644 Documentation/devicetree/bindings/mmc/socfpga-dw-mshc.txt

-- 
2.32.0

