Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35774420471;
	Thu,  6 Aug 2026 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008324; cv=fail; b=SnSTWV2SFeEt/sXEgbEmZi3vZxllxkcCXrOtVf4NUyJMS4lGAAZH0sOBJXDdodmbPZnI8glnOZ8SOZI3n7vZ0APDULDt934d6VcGSK6BgOvwbg2ylHqQnV8CE18pjrvdP0TuHWAPmjIakBOVt+ThHf3wTjukEG2KgIZoIW78C0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008324; c=relaxed/simple;
	bh=9ubd151bz4/D2IjIXyqBxYeyfWCr7nRURpXtPzlAdU8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=scMfuL5fBIPcDtDKXjxOaWVaoPgt+brD5xIZISmNsGOHJfcZhYWmiGU/+0BSZX5Aq1XsCESNBcx7c7/O+u8pm/T/t/4OlZykBmg0VcobQ/PN7SPupXYyiSDX8yF8wHRsbqn9BHS8wMMbTvCuYxiC9EpPEabcEYp9EEx5LCgrFlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=geo/qlyP; arc=fail smtp.client-ip=52.101.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="geo/qlyP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8eSNM6wo6AUEyRAfk73HFNq6/VQWpCUCF4Af2LwsSHaKT1mFmI/qHK6bhPMrzN1N5s6zYqhQILTNxpqI3M/aSfyVRtxA8UIlTmFAlxRwaGnwVaWQrC73NyYJ11ikRhhVmGSxqCOtVWZebVVO00oHVjdRTmoAtGIIFX/V3RwP5EU+5TmtaGF8tuIPHBRHhY1nSppneZLAGqRvZG75p/cfQtvP/zDKuOeBpD94xrEtBjWRS+GcJ3Dw4gQ/ebOg++deBHXL0BOjxYL9XXR9J0biYkOm6ttpmPgYc39ZSg2ZBP+2uIaCnQxoSmyfLEqXmEHcJi6KQd7txsgOPmulLdupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCPKAXA5pZjC/J9/rrc5HuPeOg7Ct14LFr5vsI2CFG0=;
 b=ChIHJHg/e1YEWAPy+2k9PoZkOYTFVDFx7c6Wu3CalUk+19K20imK8vANU/Wt3QsiR/xqsPvTCtD+Dg3aW/wHlmZ0s/pveuLe3W3CVe0kOeGUZHjEgD7CLVV8/hFTIZbIavHQjwfgzy6uCO36zywbsflD0L74WhAiMBgB/ji1nQ+QOkhjUixcFwPnpd+YaqdlblzubDnCRniSUP4NkwMuX0hGiTBirKsLm3/HU6wqGNzGO7gRqqvA6pv47Avjr14CfB3f0OWOPO/o8MbxkuGf1UXexmeFWOhxx2FZATF/F670o7Fi0U5lPrW9NirY3LHAri/IEM6FJ/4ntY/6nBMfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCPKAXA5pZjC/J9/rrc5HuPeOg7Ct14LFr5vsI2CFG0=;
 b=geo/qlyPIJHTLpsneG5MC4bwOwX2vEc/jqJIu4kH9pcwZ901Pzy6TGmm2jTeB4Z4ZDz8wyafQlFKU9LazeWIXcDqtaVb7UJUTYnaC16HEWOrfDLxucdMygUO3+9Ea+ZBD/kMgtJtCal27cR8WrkvtD0Vq0m/4W5GtkpgUkgjyc8aMt5bD8CPdZ3liKY2axk1S8xNY9mtUXg3vgWJRt+wobtBFLoLcWjJBu07TyLDadmYHIVT67PSex9TmfOiiR+dFCjTkSklRaNf8hb60R+rhgGb5VlG1J6/fL+Avc2ybsp+ZjIHwjPdLnEqElroWlGh373Y8kLOaxAy+FvwU59gBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:25:19 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:25:19 +0000
From: evon.chiam@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] clk: socfpga: add Agilex72 clock manager support
Date: Thu,  6 Aug 2026 17:25:00 +0800
Message-ID: <cover.1786006669.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|CH2PR03MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 02db8ba5-92aa-4e6e-0e18-08def39ca207
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	7o5XRjYqOojYHwUn1xe6gYYQoEZQ+XeahYXE6D/hbuAUwkzzaU+k39wTRMndPvpufel20GxE1UtxxS8URYTTzRrJcOsbTChpCNLucts0GM1cxMAjsiG8oICD2bR5+txcOKkHjsEO2uGUjZ1l/NkkfvFy8oBDxrWxKnK+HKrh5naoTB4pFYh0IEc9FcU2o02vnhui7sVggeCQLQ3qG/RbpGNERzqpKaSGztA8XHuyeT2FBdBqP6TjoSppWL2Q0CEZkDQwIL+h3XtCZgxuFThx2EZleIJa+ywZnUtZ2K3s4NtLL6w71z4cslFaWhMjM7qi7W70ZFJRaNwh6ODZkiHGSsDUw8ZrnBPi3QFSYq1cMbCOLzYuGnRb2Yw77XH6eo0ynSFjO4ksD29t1FJ0M9QYxHrUhw6ZmCI8DpJ0AJ6lmDoQUopRrIadKRUe6o3+JnRP6cateSvQYdH3U+trUUKPRI2b7gwT1ICl3/TbJlZ8YZf8esrUyIGXxWnw9XaenJ+9wuxlPzpSyNv0O5tlEhd4C8JvAw706FoI1SdtsIm/GOAabovuhFLM7HX1U5zM2tv8X6RECvaYUvwaKd/W7aFFAqWVPkiL8zX4AF+9hB5yvicpW31Q+LY0eV2FsKo9mkJEGuF4t0H1R457HqGJoyM57BG8FasN3zjkpsxhh8qVJm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GOpO/RMyhbTaaUUBemqTiXzRahiGBt7flxZ8qWhCsfJPKGCWm6UYHsLEByNc?=
 =?us-ascii?Q?FjJODMDVNZPCAJmNN4NZ8RtkaNZEuFS9nazOdOZaQEvBxMel2wTw/CyMunwP?=
 =?us-ascii?Q?2MEMTYSG25lFf7sxGoP3p2EdFcMATEc+lbEnhtrNMVHlEQhb2oFIDlXtwlys?=
 =?us-ascii?Q?Cwa2yWtj/Hc5RhxJdW7nV6ozCscPwbGdozHalc06oiNsT8qB0L/17/5zn0au?=
 =?us-ascii?Q?7HFvaf3a9BE+TU/TvC055sEWfSnS9KwdFrmrU68Aa2YmG/ggdgglM5w4yUSw?=
 =?us-ascii?Q?IxyGUkHANNuoSe5zRW5aGF0+uwh8SfH/9C1q6Z9/eqava7EsvxjBs0viTsHq?=
 =?us-ascii?Q?IK51Cr7Vnixmp49/PJQ3oVTCUJGy/WLJRz0IwN+ddKv+HBZ1LAnfDqa53ue/?=
 =?us-ascii?Q?ymQVVTx5e83kgyBy9NKN7/iiStkRb+bqh+SMKPNbxQFrmGHgYliiIB/+Ll5Z?=
 =?us-ascii?Q?YwVYUJGHnuWNfZf+yrJDOE1+2wcQnxOnEoT+uWNzfnu6ZFHSkypJ33jkOvAu?=
 =?us-ascii?Q?eQsiC11zUMVrIg6ilgozCIGke2RIACGX2VPK8ePbnoihBlRvsBO2itxbyahc?=
 =?us-ascii?Q?BmX9/l7RrRsIZEpLWVfhTOi0RHZPBV5K5HYs69J+rPKSjGZxCvpJ4DnnMfOt?=
 =?us-ascii?Q?LPtWVnBCQ5CV2VFrqFI5IZeLTZvxf9bbO4R+BhqqnE7eJ49nROUtbMr16MKi?=
 =?us-ascii?Q?xOilS5p2LO9I1F0RtNBiBhhFhWQFAuFefJZjcD5m+U0NdUojHx5ejf7OIPEX?=
 =?us-ascii?Q?bAUFP//xzFSpa4MNlj6Pf6dP8VKKYg3kX4p55vvHXEImQdkGvJlbQ/13H4H+?=
 =?us-ascii?Q?e+dO8dwv4WfRq98Xqn9c5Zbnkn2ofuRYMv+vHd2JCFpkADHYYdcFEsCP5WC0?=
 =?us-ascii?Q?Ti/BNdThRoDwFXyA3D0uaQQcI47gen2hpR5dCpJmyQ7vZJuk35Uf+AHMYq/F?=
 =?us-ascii?Q?9/qm8oJ+wEiMhyyvyggwMniOo9RMGYmwKbdzE2+L2ERDfdncNpOIbqh8yRBR?=
 =?us-ascii?Q?KCub/Qu8Thtyh/eZlCkm1MJX/HH3uNSHpFkdJxfrSufcsRZdx4V785Mphw8J?=
 =?us-ascii?Q?jWfLNJysjYGnxQm+IDIW9BtydKwTi0JRDGI9+i9nQiCwHYr4ovEnLESZ+5d2?=
 =?us-ascii?Q?6EYAFlzhpRu/Wya+IVlt8+6gmzT3rJy3jDQRT/fAW+PHpoDqYRtK6FmPR2B3?=
 =?us-ascii?Q?vaPD8KgKevQl3giA31NLV1z2Q4/MIXcHIUWlc6cn6u/KDl6XDFB4zLLoXQ9u?=
 =?us-ascii?Q?ovKLiQ4OZ6OVejWT92B8mtdyfEUnjrpYkwo4MyrEvuFkPlFC9Nj7Waxa1tdt?=
 =?us-ascii?Q?se1thyAvBOpvhaY7iUd7W+Xe4H10ieSFWpqusLOSguZvZHpR/MF0Mess+We8?=
 =?us-ascii?Q?IahkaQi7m+TKZktUU8lRmDifpabKH7oQ4vetqIrhcJ9kNFN6b+7HRaCcbetH?=
 =?us-ascii?Q?phvs8sDTJUqbLSmp2W3LiA4R1a6+cNYxHRU15s5IOtJaA6HkAScSx+azzme0?=
 =?us-ascii?Q?gp5i9LLPh3WyRsdOp/k87THpQVsp9Kpgmu/yeGUqfYR2EEf9bMDpZ1trPi6u?=
 =?us-ascii?Q?7jhKRmSIVdFLslFOx+bs5Yv46Py1GergY5BC1Emrh9vjK0hOQCruv9itXTlK?=
 =?us-ascii?Q?uZ6prK2MgrQK/v2HzfYj7LUzESq7wep048OFuGU4vIeplouEAVsBgA4F+ZtR?=
 =?us-ascii?Q?zi745abGeWBA0NKYSG8E1Qj+USGn4dmKGwNGWxMHkntZ8Fq92OWdG/IEHIbI?=
 =?us-ascii?Q?TOJCgKbI0A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02db8ba5-92aa-4e6e-0e18-08def39ca207
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:25:19.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SM2ubeo5VWiF41W1DFkhxMmZXS7Q70VnoGBvz9ypekPCnymgNvLOkCIHcpshHUk4Litl38R0vh+MWA0bhtbtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285

From: "Chiam, Evon" <evon.chiam@altera.com>

This series adds Clock Manager support for the Altera SoCFPGA Agilex72
platform. It also moves the Agilex72 device trees under dts/altera and
switches the board/SoC compatible strings to the "altr" vendor prefix,
matching Agilex7m and vendor-prefixes.yaml.

The Agilex72 clock manager exposes multiple register regions (clkmgr and
three GPPLLs) and provides the peripheral clocks used by the SoC. The
driver registers the PLL, peripheral, and gate clock tree, while the DT
describes the external input references and the clock manager node.

Patch summary:
  1/5: Fix Agilex72 compatible strings in the altera DT binding
  2/5: Add Agilex72 clock manager DT binding and clock ID header
  3/5: Add Agilex72 clock manager driver
  4/5: Move Agilex72 DT from dts/intel to dts/altera and use altr
  5/5: Add clock manager and input clocks to the Agilex72 DT

Chiam, Evon (5):
  dt-bindings: arm: altera: fix Agilex72 compatible vendor prefix
  dt-bindings: clock: altr,agilex72-clkmgr: add Agilex72 clock manager
    binding
  clk: socfpga: agilex72: add clock manager driver for Agilex72
  arm64: dts: altera: move Agilex72 DT and use altr prefix
  arm64: dts: altera: agilex72: add clock manager support

 .../devicetree/bindings/arm/altera.yaml       |    4 +-
 .../bindings/clock/altr,agilex72-clkmgr.yaml  |   86 ++
 MAINTAINERS                                   |    5 +
 arch/arm64/boot/dts/altera/Makefile           |    3 +-
 .../{intel => altera}/socfpga_agilex72.dtsi   |   48 +-
 .../socfpga_agilex72_socdk.dts                |   14 +-
 arch/arm64/boot/dts/intel/Makefile            |    1 -
 drivers/clk/socfpga/Kconfig                   |    3 +-
 drivers/clk/socfpga/Makefile                  |    2 +-
 drivers/clk/socfpga/clk-agilex72.c            | 1181 +++++++++++++++++
 drivers/clk/socfpga/clk-agilex72.h            |   91 ++
 .../dt-bindings/clock/altr,agilex72-clkmgr.h  |  116 ++
 12 files changed, 1542 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (74%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (63%)
 create mode 100644 drivers/clk/socfpga/clk-agilex72.c
 create mode 100644 drivers/clk/socfpga/clk-agilex72.h
 create mode 100644 include/dt-bindings/clock/altr,agilex72-clkmgr.h

-- 
2.43.7

