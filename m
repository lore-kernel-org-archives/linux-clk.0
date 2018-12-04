Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16237C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D281A2146D
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eFM3SH/p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D281A2146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbeLDJ0g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:26:36 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4045 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbeLDJ0g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:26:36 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c06484d0000>; Tue, 04 Dec 2018 01:26:37 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:26:35 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Dec 2018 01:26:35 -0800
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:34 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:26:34 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c0648490000>; Tue, 04 Dec 2018 01:26:34 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>, <devicetree@vger.kernel.org>
Subject: [PATCH 02/19] dt-bindings: clock: tegra124-dfll: add Tegra210 support
Date:   Tue, 4 Dec 2018 17:25:31 +0800
Message-ID: <20181204092548.3038-3-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915597; bh=c0gDJI0oagMAfW/bVTl/FY193pIwoFOy3oJkr8g4I14=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=eFM3SH/plzlnauZ0/4IHgLk4dAjZZkrD1IY0W9PrG5a8kOrd9+C+RmkZOZKZT9Y56
         +mnuwypoffFbjTh9yYmV47mX5SG0Xb4J4MPoqHjLOQk5iVdP9szVAlqUkTWO2102fQ
         MzT73SvwyWxk4LyLbflrHTuiWN7p7TlOw7W+/8zhDR34z6FjmI46wf0bZ9au7mZExF
         VLU2QXrZVXYRqmTJrXX4+sNhR2YdOTN/f7cDrbdGGCL5rC5ZwXfmBGjImBBm7PQgM6
         MatPM14skGSUfqZ4AN/DC5cMcA507uCBcWUFM2NCUJ4KUEWodWhuPn0i+FaxYIm/dE
         FHLF/++V7JCww==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add Tegra210 support for DFLL clock.

Cc: devicetree@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 .../devicetree/bindings/clock/nvidia,tegra124-dfll.txt        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.t=
xt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index 8c97600d2bad..4bd44dd7ec1e 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -10,7 +10,9 @@ control module that will automatically adjust the VDD_CPU=
 voltage by
 communicating with an off-chip PMIC either via an I2C bus or via PWM signa=
ls.
=20
 Required properties:
-- compatible : should be "nvidia,tegra124-dfll"
+- compatible : should be one of:
+  - "nvidia,tegra124-dfll": for Tegra124
+  - "nvidia,tegra210-dfll": for Tegra210
 - reg : Defines the following set of registers, in the order listed:
         - registers for the DFLL control logic.
         - registers for the I2C output logic.
--=20
2.19.2

