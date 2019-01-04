Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A3FC43444
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8735D20449
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="OsawmI3u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfADDHx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:53 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13628 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfADDHx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:53 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecdfa0000>; Thu, 03 Jan 2019 19:07:38 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:52 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Jan 2019 19:07:52 -0800
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:52 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:52 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ece060003>; Thu, 03 Jan 2019 19:07:51 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 19/20] arm64: dts: tegra210-smaug: enable DFLL clock
Date:   Fri, 4 Jan 2019 11:07:01 +0800
Message-ID: <20190104030702.8684-20-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571258; bh=8bHpy2UvE3uagU4xsnuJEO4hMPhhMFCZBz8QBb2LPsg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=OsawmI3uK4V+9Td8GRdvgrKAyCDSJ0ZDDMyidGuijzYKL6vMrw+4h26nQ/nUsMvpl
         7MKNIplIZjtInnKBq+onBzsJs+6YRBYfKbcfF+mWDexkbUUfnbyDUL/nxEw0QX0FeA
         ovGfStJPO4+3gPDbPNjYEiffDe9upU4XsM5IBLQtwRz6i1adLJ2TDwNjpgSS6MqB6Y
         AP+pLihfeG8iHA1fUdVbQo7+Sc/m8ICXJaf932gX2oLPI/Tc+sPbZ4yUke9PZfVVW6
         nISeVWXwbZ+HZ1bfgfzkV43i+yvByRo5ZsWXIHcK90FBRenEDMcaUPq3U/VnFogvlJ
         10S8aeG713+KA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DFLL clock for Smaug board.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V4:
 - no change
*V3:
 - no change
*V2:
 - add ack tag
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boo=
t/dts/nvidia/tegra210-smaug.dts
index 79cfcd5b7e62..c08c5471b974 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1698,6 +1698,18 @@
 		status =3D "okay";
 	};
=20
+	clock@70110000 {
+		status =3D "okay";
+		nvidia,cf =3D <6>;
+		nvidia,ci =3D <0>;
+		nvidia,cg =3D <2>;
+		nvidia,droop-ctrl =3D <0x00000f00>;
+		nvidia,force-mode =3D <1>;
+		nvidia,i2c-fs-rate =3D <400000>;
+		nvidia,sample-rate =3D <12500>;
+		vdd-cpu-supply =3D <&max77621_cpu>;
+	};
+
 	aconnect@702c0000 {
 		status =3D "okay";
=20
--=20
2.20.1

