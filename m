Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866B432308;
	Thu,  6 Aug 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008327; cv=fail; b=OGLHVOcOKI2fr8j53LXokhMYrIzQZgKcqMF+w+4ctB9EmNDBT1ZHQ8feG9AS5lfaDbxUJFyL2wCwzfFMcmP2TEi5EiKAWnjZxwCFsMBftboW5erp1w3hnEErF21KuHcm1NOH0TTl145DhM7oOVFqllBYELLzkm3HskKIpSIsQ+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008327; c=relaxed/simple;
	bh=EC79e9SEh+uH3KbwognnGcGp6lhMznF/xHNQ5CNpnzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fAbTSKfN7zfuJn3d5T100vSOBg0wnD8Jhv48Hg43K9OT2MmQoC5JFP2c/ICZAufQjh2PFey1NeNAzovbUpGYVYjTCu3Opl9BJAc+51PiALu3UYthkCTylcODWt1klF7OSAjH9SU06sLvqUBtC6axZLtvn49P0gNncIori8EShq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=S4SHrlnH; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="S4SHrlnH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfao1VZqMZAmN8tNXxmlqA6qVrSXRnBXxCYf9Q41fSMjscvGmuExQKuBhVLlEFKlvhbaWke1vMPkPZ2mtlbGGfs61lBljJMZhf/Huu1e2UHkn4kLlQ6czmiIiO/TIx2isC6hOBmz6k37WWM798iHVLlgHbk6sGjGAA0XtWrCbk2qXbFhB/QaCseHFTfiydicKwnuwxvsvQ0uM08O39imZP3c14hd0DAAGXqk1xsfpSOLkz8Idkr8UtPhyZZDp8jS7aV/YrDywBQnaSe5w5ouXbiGv8aYbGR2ha7+CAnRj63WMsoWQF4NOsTg7ZrAmWNxva/CGBSz9NuQDM2YQHvpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+7dEL7ddlpvmSGeQIZ/wmCQEyZb6c+BTWnPpZ7vjok=;
 b=K8UXV3VzKMwyo9iEc1nyi61DxtECZJHhK0IPBonjs/Z7v1tNsMQ7cFGi1sfp00TPnfrIElJL713A+JZBVI4Nx0yzLnA5KPhtzChABbGSIU7Ngtj8dcRFCI/XwPKB3OhX6V/w3esaIAVzT4jtBBBbCOdpX+Djs3usqFQxyKDbUlu3aHaQ5jB1gGLK4oPlXryoC7ezsiMaW6JMaC9haRAAqhUzFXyItkW9ownFgu8CWtUszWwMNAT9sEoYlzmRJ7TPdOIumef7qt8afm5V4m2+pFXahL3TcOVOYfxfhQoPKBboaJK6au7B34SC/Cvlk8GEMNSdjdo2IpkikLAQbim/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+7dEL7ddlpvmSGeQIZ/wmCQEyZb6c+BTWnPpZ7vjok=;
 b=S4SHrlnH2Iywad/j4wBk3LhtElV9LaA9lEp4MnWWVPWeQJlB+eJ5oGTR320ysiAzVfgOPg379vEXJzxVCUwqUye91JdkQjNxC7Zl900LlxfJvsydDB/UB00XZx7vpe/zjPPbPya/SPR+tyLimKGvK5qOJFTDJxoUryqVw+AtznKH7GMXM4cWL8xo1Wm2jh3w7tgSi97eUqa9ct4Ug6icaYr/DXf2yMzs8HhNdngvSa0N+HKLs3PXY+KezH6ecRV1/ri3AuvXRraxZnwuq7x1rY8wRfd7tY4RbU4W1DBHISUkmRGuHhqmS7PBcXrDFLSkKd0+uGGJ0FDibtwmqLpwRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:25:24 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:25:24 +0000
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
Subject: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible vendor prefix
Date: Thu,  6 Aug 2026 17:25:01 +0800
Message-ID: <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: b7274739-e6b5-4a9e-3e23-08def39ca49d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ldi5WXBzo6inshLE7EnQXWrddqdP4afAV6xw+VGzm+7YP2YVUZn6r0NdWs4HYbdSh8BslA4mruogTHiPvofC2A3OqjqNSDj/zU6q1vJiPiVhEjde9XH9RbiSVyEti3VoscZAOwhaCXSM9XMIR+GPC+6DZBPqjl68hwWLbuDb2jWaVHwzqqrfXphE3VVPy6JLl90/bdzHtIV0KKuOSbiJ48LtPj7J7cZ0ebLThe05a4G/vtGvv2YPG0o1IlVfgV3T7fYJLqXVgrsQn966TnSypVv+YqVzgaEQHYPC/RM+CJP92amIPjLWtIhoHlOxdOWE4HRtAe0sk/LkqmNdKFhWSWkIUzCL25QFlaA88tc5cYhWxXhhfz6LsYLU58luCDGzsNF2W1/nElav1vfyBip0dRqWb1jyNZNTJRHK1rnkirx//uWy1t1MplBO2hlGOAR+u/piNZBM7RTKWiqvjUWJkNajdVl4u/X7XQzRXKnShcwxQ1XmAPAU7G+Q73Kpk4x6Sx2XBZIN6p0aHlO8WeLPs4rKZItDXeilWY1yrXGkfDojsYTtMNiX2lgmgZgDZu4XDrq+mAUB/QhEviuBf4XZ3s+bTxEsNAUnNL62CWb2yJU/kQcfW8yo3cZm1A+no7jRTWpDtJyIWaUvVAZakAHPygU14e7E9h2WDATNFci4sgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ae87Ca/w31CdoA3SjrFDxSQw4f+1iAIncYQ/jeeBjajEYlVegM+p0dCwWeVj?=
 =?us-ascii?Q?ZRpTjQS9K8tCIkw58Nu/hQeYqtjYoBYHjAMSswyjiCk+XFFsn1wT2HHvq8zN?=
 =?us-ascii?Q?G8tfD84b6xHE4hC0uSEKuiCzITNUzkFTo46wsq+Ast8a+gy6L9zYuKc8qMoV?=
 =?us-ascii?Q?tpkhP0viSxpCGPtjomYOjQ0WPb1yV5Oz8e7bVAqJI/PT+ChDl7lR7l6/mb01?=
 =?us-ascii?Q?Ppm3dfus7RZIe+sSylLNdnAB5QXsnPxOFm0svIAxSI2zySvUcHOQjoSxWARJ?=
 =?us-ascii?Q?28fzLcv/O2oELmfxfcxULE5xNo0ECPt/eLcdgm9ecCGMikFVf0yWs9wDlNox?=
 =?us-ascii?Q?DQGa7QWUYJA2XcbD3Nuk5GbVBH5XJEApS7VNKqcm/jLCN5PDiQcBwgsDJa3T?=
 =?us-ascii?Q?vDBNbcuJnnMW/z+WsCUU+v8ckQTdmOuYA/rwYD2akQnZc2JP5xOjN6kb9eiY?=
 =?us-ascii?Q?DPhwrr6Yv6f62dCdgv4nShp1c+8bD7YVxNu6WBKtOD/x8pYoYCEuslgNZBk6?=
 =?us-ascii?Q?MabTKduYugec1jbnbBC0Uma2vZDM6LqcoXGz0ltM4EqEpWq4kYARKNd0pb17?=
 =?us-ascii?Q?FV9Ln/vais4rEe5A4qh9lI6WmAmT4VHt5Fkt+rDcHhNe9h7FjR0rrpAcQOxk?=
 =?us-ascii?Q?hyZYag8BcKKqSghur1hckyqDqCGRDwqcWM9UDDV8kXGxZjqFVerPsbZKiok5?=
 =?us-ascii?Q?NQd4TsWnRjPHd63xKz+61sS5RFLpVhiaVIRWlZxJyEHqbAK6jUGx2Lc1Q7Ij?=
 =?us-ascii?Q?Bn0mt81sr3/1T4wp/Q0sv/DBFYs58xtpALgMDLDUfHWEwfzPlmXjWlK9McUn?=
 =?us-ascii?Q?spcx6aXBhhH9VT47E4ZN0mGLdAXXWOF8jgjmgb13KjLEygktoQDMlQDono4b?=
 =?us-ascii?Q?BqWZYUb541vT6rsOIpgHTKcBzEWfynEpp9Svlf+rhiVLlSvO75+0Zoo7osHK?=
 =?us-ascii?Q?pGhRS4DQszHS3RXDkUwA1y2qUrM9VTymyXL1xgniYa/S6r5WzrK++BJEZrJy?=
 =?us-ascii?Q?9vuimOliQAfufU+ECL0XiBO+pEzogBUn5YmjF94k7FnlYsm9hJjPyYsyhDd3?=
 =?us-ascii?Q?J0CCpFgdGU3fbX0Jte/0TRaUu538dsWFWxPVmFS6GNmttP0QE8EvfLLWaqj2?=
 =?us-ascii?Q?i5YFTRtIHMBItSJbOdLxDVAonkzd3i5HNhw63+LvdghrRD28Wihp8XmJcSpF?=
 =?us-ascii?Q?BNm7a+ghifrhJ/SAGeqvq6/9dpsnNRz05csInsRnDuQtw6LZ3pFRg47Ht51K?=
 =?us-ascii?Q?b8fJirUeMmsMWtYJTgCZmgyE6PHfmbY9XvOKYgvLQJyqi2TNnMh8kJEKwHDX?=
 =?us-ascii?Q?AD/vROVJ2lLPOTSgAb9F3MLP05dhyPJFC2MNLNeg55YXOh6seRwD5WfMlPSG?=
 =?us-ascii?Q?Q0ls9WSKzDYUCdr2iEsJoAFLaCEIFKxEGlr2mRoOundZFcNCgrsUYPqzFlVe?=
 =?us-ascii?Q?9bYxSlAMu4ccEFTMeWolS+FYyPPPQzvGaWdYbe/Pkbfqn0LsDKtOc7Qy8To/?=
 =?us-ascii?Q?SMGC55vkOOZUCaFsmDfWEtnUffBdfR54qyqZNUBu4JyckKHp6b8g2VFLmXON?=
 =?us-ascii?Q?VcMmJHl1WDFU3ykyxC7wi998GiTswuw7yZy+5YtDExK+MiQxCeCkwlTP3Z9A?=
 =?us-ascii?Q?N29exyW4xnWf8ToxHpKSo2J1mQP1bH2HfiRCEraByvVSXzlCLmmR4/kb/ZQO?=
 =?us-ascii?Q?yOofVZ0kku/wHpPEjvvG7JMSxpVxD97SnkQxdo6lQ7JXNSeFQ4Ca5ZnuWUWT?=
 =?us-ascii?Q?WX/Jxw1R8w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7274739-e6b5-4a9e-3e23-08def39ca49d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:25:24.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgenDnztB+ScXpbNhp41QY2TSnMEAkgk7G4sM/DkjA1gRP1itaAga2SeKLzEPQXel3j510dR2LwxvxUdNf6Ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285

From: "Chiam, Evon" <evon.chiam@altera.com>

Altera has separated from Intel. Update the Agilex72 SoC and board
compatible strings to use the Altera vendor prefix instead of intel.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..2ab53cade2fe 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -119,8 +119,8 @@ properties:
       - description: Agilex72 boards
         items:
           - enum:
-              - intel,socfpga-agilex72-socdk
-          - const: intel,socfpga-agilex72
+              - altr,socfpga-agilex72-socdk
+          - const: altr,socfpga-agilex72
 
       - description: Agilex7m boards
         items:
-- 
2.43.7

