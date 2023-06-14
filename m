Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323EBEB64D8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 13:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244293AbjFNNBD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 09:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244789AbjFNNBB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 09:01:01 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302B110DA
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 06:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686747659; x=1718283659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QYouFulsPstGyoT5JJqXCtpyvwlaq5pc2C2IgBH4p1E=;
  b=Z1pEk1T2TUOdQ1WkB9T/jwbS+sRf2+a076/ze8Y/jVLJcbzs69Z9dQ/c
   aQbRkW1EJaluS2PZtl9PsiNLP59JGj9as65e3+Up95c3pKbnotmRXzb4v
   WJpQPZ0tMfE7eZNmE8eXa319sf49+JzN2hY9VxGmqMC56WKnrgwzGqlcI
   z+PJkVRLZFm7agozi9Fa3Lo/0JuL0qK58P8h3+4p1ro2ntlvqjMz9JMGz
   lL6e9KiQnzpiaxVA/r00kz5qFDhMr59NdM8rrr1VKIwibHkf5bTCMWaVO
   Ml/oAM9aYTqA6FhSZu7DTWt8cBJ9Sgl27dOyFreB4No2qjmUnBpuIHYyf
   w==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="216008756"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2023 06:00:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 06:00:56 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 14 Jun 2023 06:00:53 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>
CC:     <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock updates for 6.5
Date:   Wed, 14 Jun 2023 16:00:44 +0300
Message-ID: <20230614130044.499588-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.5

for you to fetch changes up to 9a7b010116a430d74dc30a214ea55a58a2863d71:

  dt-bindings: clocks: at91sam9x5-sckc: convert to yaml (2023-05-22 15:59:49 +0300)

----------------------------------------------------------------
Microchip clock updates for 6.5

Polarfire:
- new Kconfig symbol name (SOC_MICROCHIP_POLARFIRE) for Microchip FPGA
  clock drivers

PIC32:
- use of_property_read_bool() to read "microchip,pic32mzda-sosc" boolean
  DT property in clk-pic32mzda

AT91:
- convert clock dt-bindings to YAML

----------------------------------------------------------------
Claudiu Beznea (2):
      dt-bindings: clocks: atmel,at91rm9200-pmc: convert to yaml
      dt-bindings: clocks: at91sam9x5-sckc: convert to yaml

Conor Dooley (1):
      clk: microchip: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE

Rob Herring (1):
      clk: microchip: Use of_property_read_bool() for boolean properties

 .../devicetree/bindings/clock/at91-clock.txt       |  58 --------
 .../bindings/clock/atmel,at91rm9200-pmc.yaml       | 154 +++++++++++++++++++++
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml      |  70 ++++++++++
 drivers/clk/microchip/Kconfig                      |   4 +-
 drivers/clk/microchip/clk-pic32mzda.c              |   2 +-
 5 files changed, 227 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/at91-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
