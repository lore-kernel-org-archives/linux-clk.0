Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F46C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A525217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="EjQtGUdy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbeLRJNc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:13:32 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14315 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbeLRJNc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:13:32 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba360001>; Tue, 18 Dec 2018 01:13:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:13:31 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Dec 2018 01:13:31 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:31 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:31 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:13:31 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba390002>; Tue, 18 Dec 2018 01:13:30 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 20/20] arm64: defconfig: Enable MAX8973 regulator
Date:   Tue, 18 Dec 2018 17:12:32 +0800
Message-ID: <20181218091232.23532-21-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124406; bh=ykP8OoB9JkHuihTzpYFCTZull/BQmlXeBp0deKyNQvk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=EjQtGUdyMbUelRia4px38h+BFZlfHmz7Ba98p2z5TQsGuZ7+pgPLZs+Xes0XbpBwg
         eJ/CV/2r7w9kmSreD+bvk3Bsr0Z3EKloBqQWpK2fLQxER/uPDy5qeor+bmQZg6pOK/
         J7+ZWf+ktZ+uGEyKj86KrMIWec+F0Gh3yF1+ORqnVXEXUHhzh7bKuHh5ymNlXxEdE+
         MXfsO2Z//SRImEi7uAB3fF0MS3iPw4FNEteMM2PHoH4vhw3XG0Mm0L+8OA22pIFYQa
         WJLqjpAjnuBNdsvJT/LfkWOm08RqGNVg/0C6ZMb19NLmVP14xNatu5O94OIWM1iBG2
         0MS08bqI/ee/w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Tegra210 Smaug board uses MAX77621 for both CPU & GPU rail. Note
that max8973 and max77621 share the same driver. So enable this driver
for the PMIC.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - no change
*V2:
 - add ack tag
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 80c742549a53..66db5ffddee7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -438,6 +438,7 @@ CONFIG_REGULATOR_GPIO=3Dy
 CONFIG_REGULATOR_HI6421V530=3Dy
 CONFIG_REGULATOR_HI655X=3Dy
 CONFIG_REGULATOR_MAX77620=3Dy
+CONFIG_REGULATOR_MAX8973=3Dy
 CONFIG_REGULATOR_PWM=3Dy
 CONFIG_REGULATOR_QCOM_RPMH=3Dy
 CONFIG_REGULATOR_QCOM_SMD_RPM=3Dy
--=20
2.20.1

