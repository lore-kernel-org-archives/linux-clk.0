Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98AF2EACF9;
	Thu, 21 May 2026 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327032; cv=fail; b=ZA7YteT9s6Cti83sz+gsF4QZUB+O0KlpOmEA0IQSwOi34NlLKlrfdxcJ5V9prbfTOxliRN8q2avVyzXzowunfVAdebs52QH6rtX5/Ui/pmNyZSjrohmB1T3sCCsh+bsWiX37HEeyf3Ch4vmCUKOtYbrfcLA3wb4VQAeTqo3tAAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327032; c=relaxed/simple;
	bh=ko8yUEFHehT4TqDlsflVqL6grfoWaKVgbAO/PZgourQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZknGFQVMnu2yYOIFWCV9wX/gSCb+aviheQIC3T+GVGpCvPmM0mnDGQDZAneI1VXPhZWvmTMxWqgC6/wwc0I+W/8zvo+ulKDXHqHCoRnqWJTkcydxNnjRZjVLdiYtI7aQJIPZbfaTjjSBNlDz+rw39AEiA4+1AE1PoTMgiV87FEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR0XNh3RvHHxCrMs/DfdnGgGNlUPbXHthGAAV22qVTma5gM7CGIohhL7sP1qFPejyUgEU3VxeSPT7BbvE8WWikJtWuBuNPjpwbTix7mazDj2rBZFREUgoMq36d3sWloj9mjs9005mqLK+FZYf93x8ufX3UZtQNBjlCFgiRUKxYsmPvMREemAmKOUQfG8PwngK+wtNAPKG3aspOUfLP9pryNB1GfOaSxUWm3KdPovCR/VUmbJCWfBTqjj+OS2lNhPQe7VyUXTH/WGHGRl8cWg2zTWTaad8NPtH1JvJ3Jv3Kr6mJYu1SHqeURkQsAWhylPzNq1qWrEApZ7Yy+HLVIN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3s7NRKVTV96UArsQWaj8CWg4YNBsiYVibAuvTpcN0Q=;
 b=Ci+dN14nO7vrUMwpSxORFqYREWLQnYZyNjoQqAXuooa44PoW0TDKYRfBl4pqRj6/RsZwprA7WKT1H+78EMDCX44zdYij2klGgzLk6emPwlz3FDlKmaf7IeeTNu4W4dou54UMsy7GKqyuczTGjzdR1bcB3jMCGq3/U/Uelf2GpfNooB8bHPym+Ou+JXhaNzWPNxXmjZmQ3KxHAp2YD7PpPqtkKLxLlCmMb8e1F5lnO4at70RE+ywm9VaXwWZJYEYTBUJGdLuWrWAtyJVAg1B5BODb71tSdlyanCkywYbpMVOigsDFtSnRvY73u2tNGcFBIpQD2doBa4qMvkMhhifbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:59 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:59 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 8/8] riscv: dts: starfive: jhb100: Add syscon nodes
Date: Wed, 20 May 2026 18:29:32 -0700
Message-Id: <20260521012932.24163-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c45451d-7f56-45ca-ae7e-08deb6d87911
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|22082099003|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	r3s+DaCJ54i4yDxYvO824Q2dgL03CMiEpax+O7rsbCu9xU7iFtO8Uix3Y5EfEeqOwmfo/LFwU2TGQpD6PTeNYuGOmkw68Cj2onIDWErjt1FEVsV0s65/igCjSXtPggNrIA+MEdTe/bqgkxX18EyuPaPVzlXhRj78m4LHQ7PUHRbMtCNSkvJfFdeeGl7PceH7N3wZKiwmfntT3FLU0IIDb8sY9QzTe4qJqdEaLxvvESnMJbiwfvu0eb0PoKz5+RkosnqLSc5NkNs4jG/0soXguam+kCwvr8D1zVjSawifsRBbS0oewb6+dDUkhDPDf/2RoaEeLWOyIM+Q+Kn4/g64bUwlN5FVG55aIzo3h1U9WUm7bOWvILjnuAs41YsgsvSfniMYDQVKg5GD0jFnXAiN+zO+xcrd5HMzeOIKlhVnmUquMuLh2sGOMWntFuFPWQLnuJOo/rz5GUJiBd5ZbX/ZgLIP1eA3ae2pNVL34o3E6B5FhQl4VO9HjeNn/iPZYzoB3j8oT8BupgAgg46Ao9vjl757HYqaURfOk9dSSZHmz5ryYbkQ9tDMrodr1/fZoOEPnDv8tSsA6hVZwxdcghiDJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rSgr7O2bc8tPusbwEZEzggxgy4g3MAKmzFRXabx0NhjAxmX2xd0HGlnnB0vw?=
 =?us-ascii?Q?sbnBvoJC7lroclNZoFlsdkLPciCsld+BcHKEdqmNT/bV3jRn3FBWUEhH8jGk?=
 =?us-ascii?Q?bB/UFqoXOkuadd+EBxSBSVIdQEeZQzOKxVDHTfuhq9vAIuaoVLTyn23DMyX5?=
 =?us-ascii?Q?GKGDNCE6ZTNSrCiKkGmTXvwxrMbZGOf9w4GAz3au3ib922JbAilZp/9E+a65?=
 =?us-ascii?Q?wzeZYEyFvcvyA7M6nWAX85wJBcp58JoU/HATHtyk7rDn1h9d2HzgbRR5GepQ?=
 =?us-ascii?Q?RHPp4g8gl3u80PbMmTVKL8p9gY9VIU//LOau9dicEGdgyfVP5GdnPNTKbSFr?=
 =?us-ascii?Q?9ZW6NXwm9m95G8frTm9y4Fkkk6PgrODP9AAz4i0wEpreuLu3tPlWeBvjpZ7z?=
 =?us-ascii?Q?AgMzgidBJlc7ezHGjFXprMM8S+yYud29WGA0dRFlhU846vTn1WpCkw83Hl+h?=
 =?us-ascii?Q?mHK9QriiSWBWRJflcQyT5hWNn2GwxhgtIIKTlDq//pLB/7/EpWcTLYIFpAba?=
 =?us-ascii?Q?2dc8ti+r8H7eMUEQMZlpdn+QfQyKUUtCuL9CoiCvKEWqYzsXFBF5BpfctiWC?=
 =?us-ascii?Q?VjqUUIH+PzAFn15gZ1j6wDQPCKwA+YLyVeLbIdHPeGMm3JXq+8UfRFb1xbRh?=
 =?us-ascii?Q?10Ijv5mc/xM2Z78xJX+Mr87Umm/QbjKagw53hRv1+XuCFFoAATdOaECKR8po?=
 =?us-ascii?Q?kkYyCRtOENflY3GIue56334kuOKB0ZQoEypLeaGE8+Y2s3it2NuZkiqusFQk?=
 =?us-ascii?Q?5/NQhFgMpiZOoENOcGD+UQUsdLG4UezweLaKZikua21G7hlVBxdpD0h6wPq4?=
 =?us-ascii?Q?zVONgyLh0sjtJAb7QdLOkjAR6Yt4YrHPhQBSnROwt52WEodaqZuPzHXyFuW3?=
 =?us-ascii?Q?FsAaICYE3tXe3Nsf8G2pvi6QGoUrmDUv1OJZpxnF4p82Auj45GRSdJ0po0PV?=
 =?us-ascii?Q?KOpDX4/nDe4Ptcl/m55QTTUYxLbJchxyLXdcJU7bgxur43JEQ5s+WKtXdV47?=
 =?us-ascii?Q?Pt/QG1fCdKBTzSqwYxeac0DABsfKCFtRGfMMy3FKtV/Ckenoja0QhZ2DF82Z?=
 =?us-ascii?Q?f+esTLpJZ6hKhgOY6oOttSu5fOP5woHJuRyyb2BCacyqq5fCxDtHfRJfo7vv?=
 =?us-ascii?Q?LInstRKCurwOZP+XeU7fv+ViAeA54nr1rcFOau2DhLEN8NLgYLhlxsHl85o3?=
 =?us-ascii?Q?lbteWAhSxLRf6WM8d2x3dXhJ8C7JHu37/ZzPhayCEvSkeY1cZ/rmgFszcKf/?=
 =?us-ascii?Q?7Y/e/JUQUm7PI0P1xYmAoD7RJu436vwHdX7ha15/8lknC3bpYrFIJgfdAe0B?=
 =?us-ascii?Q?6Qf0vk18PbgIIE3YtOfgbeGD+WptTEV/ip+qMLDmcV8VFR10CnF4CGawz8g5?=
 =?us-ascii?Q?IQo3d41c0ZAtsSF0t8Y6aJghFrboBbNNNjuWPKePnmFI7MGJpUVjQegiwEfe?=
 =?us-ascii?Q?WpGWuLZ/K6n+7ZTdYnZ9AAUj/DOYPw2gQdwm/2cy4LYX39XpSJfkRTfzi8vf?=
 =?us-ascii?Q?JF5DuNsAYta2YWgF0EaQvur6pHS2djLF5HCwPOmnR+qz7hdB4BsRgf4kGm8U?=
 =?us-ascii?Q?drK6m7puOgcXvqc+4SpM0C2AlnvCMJqo4I7P4Y8HFR8FAAg5z3qJq+hYezVH?=
 =?us-ascii?Q?IuHU6FUxc7u/MNun1tuP75DvjBqdEVVrgkOcG7zSMhXrjUpHV8ma9EpRfnwT?=
 =?us-ascii?Q?gg5sqc7Y4siID2kgQO+9j0TcpPW5n5wtjrpVQg3h8AVYjUvtALDw+vbB4tB6?=
 =?us-ascii?Q?iFJReUmpNw4VJaDtQLrITrDd7ejH6HxiJagyPtl7IvhIUczqz9W0?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c45451d-7f56-45ca-ae7e-08deb6d87911
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:59.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vrnQCv9TFGydWMe4SMTY01WXl2pCob6JH8sdgcbDehrYq5wtwyrslTHlM0j89QY+uc3XN8WIvSRCt5QM2THdV+dCUwkMq+NIXUoW0q+ZxaLZf/AedvC+RPMCa7S14rt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330

Add syscon nodes for JHB100 RISC-V BMC SoC. They contain
pcieep0_ecsr_syscon | host0_syscon | husb0_syscon | husbd0_syscon |
pcieep1_ecsr_syscon | host1_syscon | husb1_syscon | husbd1_syscon |
gpu0_syscon | gpu1_syscon | husbcmn_syscon | b2h_syscon | h2b_syscon |
vout_syscon | pcierp_ecsr_syscon | pcierp_syscon | usb_syscon |
npu_syscon | per0_syscon | per1_syscon | per2_syscon | per3_syscon |
sys0_syscon | sys1_syscon | sys2_syscon | strap_syscon.

Also update the references of pll nodes.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100.dtsi | 180 ++++++++++++++++++-----
 1 file changed, 145 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 943324b3b2fd..bbdc717399e5 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -288,37 +288,7 @@ pll1: clock-pll1 {
 		clock-frequency = <1000000000>;
 	};
 
-	pll2: clock-pll2 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <903168000>;
-	};
-
-	pll4: clock-pll4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100700000>;
-	};
-
-	pll5: clock-pll5 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100700000>;
-	};
-
-	pll6: clock-pll6 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <2400000000>;
-	};
-
-	pll7: clock-pll7 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <1950000000>;
-	};
-
-	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx {
+	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx  {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <125000000>;
@@ -399,6 +369,97 @@ bus_nioc: bus_nioc {
 				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
 			ranges;
 
+			pcieep0_ecsr_syscon: syscon@10511000 {
+				compatible = "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
+				reg = <0x0 0x10511000 0x0 0x1000>;
+			};
+
+			host0_syscon: syscon@10519000 {
+				compatible = "starfive,jhb100-host-syscon", "syscon";
+				reg = <0x0 0x10519000 0x0 0x1000>;
+			};
+
+			husb0_syscon: syscon@10695000 {
+				compatible = "starfive,jhb100-husb-syscon", "syscon";
+				reg = <0x0 0x10695000 0x0 0x800>;
+			};
+
+			husbd0_syscon: syscon@10695800 {
+				compatible = "starfive,jhb100-husbd-syscon", "syscon";
+				reg = <0x0 0x10695800 0x0 0x800>;
+			};
+
+			gpu0_syscon: syscon@10745000 {
+				compatible = "starfive,jhb100-gpu-syscon", "syscon";
+				reg = <0x0 0x10745000 0x0 0x1000>;
+			};
+
+			pcieep1_ecsr_syscon: syscon@10d11000 {
+				compatible = "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
+				reg = <0x0 0x10d11000 0x0 0x1000>;
+			};
+
+			host1_syscon: syscon@10d19000 {
+				compatible = "starfive,jhb100-host-syscon", "syscon";
+				reg = <0x0 0x10d19000 0x0 0x1000>;
+			};
+
+			husb1_syscon: syscon@10e95000 {
+				compatible = "starfive,jhb100-husb-syscon", "syscon";
+				reg = <0x0 0x10e95000 0x0 0x800>;
+			};
+
+			husbd1_syscon: syscon@10e95800 {
+				compatible = "starfive,jhb100-husbd-syscon", "syscon";
+				reg = <0x0 0x10e95800 0x0 0x800>;
+			};
+
+			gpu1_syscon: syscon@10f45000 {
+				compatible = "starfive,jhb100-gpu-syscon", "syscon";
+				reg = <0x0 0x10f45000 0x0 0x1000>;
+			};
+
+			husbcmn_syscon: syscon@11045000 {
+				compatible = "starfive,jhb100-husbcmn-syscon", "syscon";
+				reg = <0x0 0x11045000 0x0 0x1000>;
+			};
+
+			b2h_syscon: syscon@11135000 {
+				compatible = "starfive,jhb100-b2h-syscon", "syscon";
+				reg = <0x0 0x11135000 0x0 0x400>;
+			};
+
+			h2b_syscon: syscon@11135400 {
+				compatible = "starfive,jhb100-h2b-syscon", "syscon";
+				reg = <0x0 0x11135400 0x0 0x200>;
+			};
+
+			vout_syscon: syscon@11135800 {
+				compatible = "starfive,jhb100-vout-syscon", "syscon";
+				reg = <0x0 0x11135800 0x0 0x400>;
+			};
+
+			pcierp_ecsr_syscon: syscon@11711000 {
+				compatible = "starfive,jhb100-pcierp-ecsr-syscon", "syscon";
+				reg = <0x0 0x11711000 0x0 0x1000>;
+			};
+
+			pcierp_syscon: syscon@11719000 {
+				compatible = "starfive,jhb100-pcierp-syscon", "syscon";
+				reg = <0x0 0x11719000 0x0 0x1000>;
+				#reset-cells = <1>;
+			};
+
+			usb_syscon: syscon@11820000 {
+				compatible = "starfive,jhb100-usb-syscon", "syscon";
+				reg = <0x0 0x11820000 0x0 0x10000>;
+			};
+
+			npu_syscon: syscon@118e5000 {
+				compatible = "starfive,jhb100-npu-syscon", "syscon";
+				reg = <0x0 0x118e5000 0x0 0x100>;
+			};
+
 			uart6: serial@11982000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x0 0x11982000 0x0 0x400>;
@@ -416,7 +477,8 @@ uart6: serial@11982000 {
 			per0crg: clock-controller@11a08000 {
 				compatible = "starfive,jhb100-per0crg";
 				reg = <0x0 0x11a08000 0x0 0x1000>;
-				clocks = <&osc>, <&pll6>,
+				clocks = <&osc>,
+					 <&per0_syscon JHB100_PER0PLL_PLL6_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_400>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_800>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_NCNOC_INIT>,
@@ -428,10 +490,17 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			per0_syscon: syscon@11a09000 {
+				compatible = "starfive,jhb100-per0-syscon", "syscon";
+				reg = <0x0 0x11a09000 0x0 0x1000>;
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
-				clocks = <&pll7>,
+				clocks = <&per1_syscon JHB100_PER1PLL_PLL7_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER1_NCNOC_INIT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER1_CFG_800>,
 					 <&sys2crg JHB100_SYS2CLK_BMCPER1_NCNOC_TARG>,
@@ -443,6 +512,13 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			per1_syscon: syscon@11b41000 {
+				compatible = "starfive,jhb100-per1-syscon", "syscon";
+				reg = <0x0 0x11b41000 0x0 0x1000>;
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -464,6 +540,11 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			per2_syscon: syscon@11bc1000 {
+				compatible = "starfive,jhb100-per2-syscon", "syscon";
+				reg = <0x0 0x11bc1000 0x0 0x1000>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -483,11 +564,16 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			per3_syscon: syscon@11c41000 {
+				compatible = "starfive,jhb100-per3-syscon", "syscon";
+				reg = <0x0 0x11c41000 0x0 0x1000>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
 				clocks = <&osc>, <&pll0>, <&pll1>,
-					 <&pll2>;
+					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>;
 				clock-names = "osc", "pll0", "pll1", "pll2";
 				#clock-cells = <1>;
 				#reset-cells = <1>;
@@ -497,7 +583,9 @@ sys1crg: clock-controller@13004000 {
 				compatible = "starfive,jhb100-sys1crg";
 				reg = <0x0 0x13004000 0x0 0x4000>;
 				clocks = <&osc>, <&pll0>, <&pll1>,
-					 <&pll2>, <&pll4>, <&pll5>,
+					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>,
+					 <&sys0_syscon JHB100_SYS0PLL_PLL4_OUT>,
+					 <&sys0_syscon JHB100_SYS0PLL_PLL5_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_NPU_NCNOC_INIT>;
 				clock-names = "osc", "pll0", "pll1", "pll2",
 					      "pll4", "pll5", "npu_ncnoc_init";
@@ -517,6 +605,28 @@ sys2crg: clock-controller@13008000 {
 				#reset-cells = <1>;
 			};
 
+			sys0_syscon: syscon@13010000 {
+				compatible = "starfive,jhb100-sys0-syscon", "syscon";
+				reg = <0x0 0x13010000 0x0 0x2000>;
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
+			sys1_syscon: syscon@13014000 {
+				compatible = "starfive,jhb100-sys1-syscon", "syscon";
+				reg = <0x0 0x13014000 0x0 0x4000>;
+			};
+
+			sys2_syscon: syscon@13018000 {
+				compatible = "starfive,jhb100-sys2-syscon", "syscon";
+				reg = <0x0 0x13018000 0x0 0x4000>;
+			};
+
+			strap_syscon: syscon@1301a000 {
+				compatible = "starfive,jhb100-strap-syscon", "syscon";
+				reg = <0x0 0x1301a000 0x0 0x2000>;
+			};
+
 			intc: interrupt-controller@13220000 {
 				compatible = "starfive,jhb100-intc";
 				reg = <0x0 0x13220000 0x0 0x80>;
-- 
2.25.1

