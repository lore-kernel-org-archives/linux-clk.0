Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDA6C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 531C820851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Uc/V1bHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 531C820851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbeLDJ1R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:27:17 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4090 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbeLDJ1Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:27:16 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0648760000>; Tue, 04 Dec 2018 01:27:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:27:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 01:27:16 -0800
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:27:15 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:27:15 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c0648720001>; Tue, 04 Dec 2018 01:27:15 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 18/19] arm64: dts: tegra210-smaug: enable DFLL clock
Date:   Tue, 4 Dec 2018 17:25:47 +0800
Message-ID: <20181204092548.3038-19-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915638; bh=rJyx7zXRuTxfbnU7n2PuC6aW6kvPz9uE39dkSEuq+7Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Uc/V1bHXazMNlld1T8Iasz+oXxBWIQO/tf8Mvzc5no5GZhUviu9D6y5GaiEfjHfjF
         Qtx2+poKe2KR+52zaCljgavwlECJJSAVi6GJCRK6ESzvADGmfVL0JpXYJdnYwbsUQY
         rJzikITvJYC55UwsWs8oj13peNJOsKuYFJMkozq0wSi6qg/njvKLCV5az3a1mTXuq7
         GH0VKslbIFE6iUoz9EZiO1cvXiP8krwLpm/rI+9hfxZIan21+ZVLask+HYJKr2bind
         jdRPbKniz7aXzNHTDaCCYBGt3F0V+/6FKHJqNdcLoLy5TB0+Nrz1g7lybLWXK2v1mj
         ZjxYTlJzWwMcQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DFLL clock for Smaug board.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boo=
t/dts/nvidia/tegra210-smaug.dts
index b3930a9dd139..beac7b0bf436 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1698,6 +1698,18 @@
 		status =3D "okay";
 	};
=20
+	clock@70110000 {
+		status =3D "okay";
+		nvidia,sample-rate =3D <12500>;
+		nvidia,droop-ctrl =3D <0x00000f00>;
+		nvidia,force-mode =3D <1>;
+		nvidia,cf =3D <6>;
+		nvidia,ci =3D <0>;
+		nvidia,cg =3D <2>;
+		nvidia,i2c-fs-rate =3D <400000>;
+		vdd-cpu-supply =3D <&max77621_cpu>;
+	};
+
 	aconnect@702c0000 {
 		status =3D "okay";
=20
--=20
2.19.2

