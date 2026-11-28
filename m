Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795854982;
	b=eQdOeFHpAQa7WmIh6Jnu+VWQb94SzEjkqu5F8HTfJXjTarg/vbqzC+2VnfupIl6m/qea
	 91QDWoAU3y9IFVWlQdPbOHbfAJl5CjEIha/zz6HifXygdG2LKfS17h4bVvw+4z652nOZl
	 x0uBpfdWu1GE7uo6C3gsnldLrWb8J7iqDc9PSkddKGSicZjzkQVhb+PMjQX0qE4k8X4vs
	 yz16eMkKcZbYPMQnslIoRk0UEUABn+SpZx2Q9OBpFE9i11aLCsqdg6kDNmFzcy0c4JIy3
	 P4AGbWchkH35uX1Fm6JEVptWjeOUnLzlNG+f86yCuH8anbNWqo7V3f5LkYutmMgdPvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854982;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vVuvxwlBfAns3j1d44irwuIfzxDRstMnXTiBMIi4ZVI=;
	b=qQ5pyDmDZiHD9vtf8zWjAnGrtq5ChVVxlJU0vTgK4eStxY5t+Jp+ZuinHTsLvJ2Ix71j
	 5mRf91PwfmPK3VMkK6StSdZjZdx0TX+xPF8w0paAiSgmCrG7ULGJqt3PsV2hWT+wSxUwd
	 38tLnBpLuoLHKrYExbhs9865btCzy2T+toyEIkc7X10vtYDEkgkzzDhI3gwJhhpZdHMqY
	 x3cEoo8ueq9kdAT7I61NhYycq9YGPaHc0zxRzeVST/Ui9awuxUBzI+P9Tqhlzo8L4fcQv
	 UOowsTLSx2ex/+3/yLygzQ3ZBPbGejHKfrjdF5UwTJnhk626i9vhnkuLbYfTX7WMA4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.97
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5237606A321;
	Sat, 28 Nov 2026 08:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5237606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfGKaGLjT6zMS+tU6r6HUA5CWkli9qMjyBRYwWPR4qKKCK1rz+uqUjboFA8VZV7XAd6zg7xv1wNF+LlYx+uCJzB7oqtgKg9w694jdtepOvHcpCc9dmoY5CHhU6ealT4VIo8royR8WRzW5pvNSwjTE/dXoP2UAdpkhHkDnugXcnAG4lbWKuLSnsQ1nR0Ne/ghGoGvJRHPPbx2qLcIz7GYoCFTGolirsMGMteYKa5fMMJnbZAx8ffsV0lw5fv9yOppQFGsB862IQIS84rsMxqIlvzL2pSh3eGgPfzW8KCTRdgmHzDFIp7c5UIIsskAbcBOc+frnb/ZXs1z9SsxdroLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVuvxwlBfAns3j1d44irwuIfzxDRstMnXTiBMIi4ZVI=;
 b=myvV9wsAG9q5ov6RoNG3m0JT9Go+7SMidgTisc3429sh8kBLCm9u/k0VTHnhRogfEQvN4tSoT5Z2SDdG+Hh2wssNtywDLRufOqE+vP4OoaqWYZRLgYPT0ryyt4pvbWSLPPC8rbYQYl1n7sYBxlZ7JwXgNfHcqnTASrST6JvVY0hT6pZce562GlyR8xJAhToml3ttIfkQVMbr3oxCuNbTcd9NrxY3YPMJpotiUC1eyIMQx8L/pHd6vd6XC8CVHztdhfDJMfw1jWWBrT0bh63FLo2cibdWoJMWxrhu4QyA5+5DGRC9UDTCIeTf8M76BzCtj7k62Eft2cRYYfXMtwm//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1313.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.17; Sat, 28 Nov
 2026 08:36:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0639.015; Sat, 28 Nov 2026 08:36:07 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 0/2] Add System-1 CRG for JHB100 SoC
Date: Sat, 28 Nov 2026 00:35:52 -0800
Message-Id: <20261128083554.2993-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6796f8-6796-4bf5-8dd0-08df4d2aa58c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|10067099003|56012099006|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261009221227099003|261009223327099003|261009221727099003|261009220027099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zDX9pocKGrkcEWF8oxW8ekqwCQ8zZDMeKUnfCa3wZcEBOIcRXYJUWhiCcnK/gzoR+A7ZbPXcOy9pPNAaQjkAHl95twmwkhRrkVdskaN5iKpVjGPrfsW4RmMSttBtrjewWvnDRziLcwxCFTvA0cbo8qU+CJSCy7DfCriNmdNJFZ03EbZOdWSvVUd/jxfdro2mIADDwXoebOflWQ2VVtmMRH+9F3J5iHbqLsUAVChtXy92mwAzSilbQbWcdb24wCa84pT/9yinivWjQjPFivG5jO86GTIcSGyqC08eHPyUsbOL3irB6fnvBSFDrww8zbniAJ6du+VxBKwsZt4AkPQnO9E/OxUctnVBXXnUJpRW1x5icitI0XpoB83mZH31JpHIe4OcRSaG5IHt0mLRyULtJjAO9KOQLDTmvExHZ3oxiRBMUn0lqQOE5DXm+W7ywbvWRIrIChhAqNBpKLXSqh22vMu4pozQdf3wMC5ilxTEHRjPbSAfF0OiTRLFXileNgd/WQ39abc38mafGYIl6pYhOw/DGU9dN0QwSqJQoLwJGBqZh4hlVd0MODlqRRTZOXqn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(10067099003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009221227099003)(261009223327099003)(261009221727099003)(261009220027099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TONFBQ9Kg3sIiMaeRt5CKyyhEir9CRc5xeSZtr6HvjJ6GPk41qfJuRuDHZqX?=
 =?us-ascii?Q?kRpC81BmT/dhbJlr3DIR+LC0DksR7AmyEhBh62AiaUKxTn0Z5Y6cxMDkDUET?=
 =?us-ascii?Q?74oCYgN1UFs24ZLh0IlgqByjuREJo5z7ziHTi/D9012XvLNApoexECDCV98D?=
 =?us-ascii?Q?kT3zs7b0Ag50m3BR9qucHX0YvrQJFewmOJ8ZcEyp7IhKjaICM+GuR6CJRQXh?=
 =?us-ascii?Q?RBiJQzw+EFJpf7wOBJBu3qrH7/fLi/IelhQahFrAE5xqXEZMGf8gcy+rQZmx?=
 =?us-ascii?Q?xu6YjT+xKAIdx7jcWCtOHPDZNEe/CWVuFULZP6dyOqq/KaMl77ubFo0LKwuM?=
 =?us-ascii?Q?ktzb8r2G/ZoX4GfCLSvr1aREZOKYAx5h8+Sf0mjvyC8QakEfcu0cHSR6Wz3n?=
 =?us-ascii?Q?haI3PVIuMvUCJFBQ2RbihWDbWgS1Gle9007WIVpH9US8fo2Wg96hQS9S6HHU?=
 =?us-ascii?Q?LJiPS9ZAbw4ta+awzCRr8d0Dbp9+HRxn1EEYTcF8o91j/sn5UMYzUCJaX21D?=
 =?us-ascii?Q?Gk76iXeLRJktpdLUVuwCLFV2pIN73vIZVaRHiko/OqhYkSG9gSmY04wG7yYS?=
 =?us-ascii?Q?8G0XLNdfUlvOBO+k0p4d7noo19/6X8dMMiUaAWKFJeMJF3uODEiMLsTjKQ4o?=
 =?us-ascii?Q?Xoqzt3OGxA4JKILh0AlgaPQiqmWyZc3OfWwGLKTrYazA5ZkAtjGLN6P8zPK9?=
 =?us-ascii?Q?ikewNipkihzK5qxkvgVz0YAaFRYB+VSKj2fzxxWa3INPma5aqfKSBrg9cZ34?=
 =?us-ascii?Q?BWTjkysIA8+GmMBtBUUNH1QtxB+KFJ49z7blRgMq3LxdvpwU16xn7wQTZZq9?=
 =?us-ascii?Q?8rXwL+9UWvaGOZwiiKME6EIAmw6bxK47CWm8BzYBf8T0KeywiSx4vsoNfd9x?=
 =?us-ascii?Q?4AKPknKXzrlzfAJX4alh3xe0FcIbjUJzy9a4QDnfgsWtOZG22cH0oAyb5y0/?=
 =?us-ascii?Q?dMV6zFpWtDRfwq1mXfgiCK0veLoQ95i6ZF4bdLYGm/HbKL2Re8sT+lYmMdCd?=
 =?us-ascii?Q?VVTWjhzuFwgeO0Fyv/bnhY88pa6nGNcUaHlJ821WVE/3Xo9aPyg3O3gDqnUy?=
 =?us-ascii?Q?6W4BMfwKuwV+9BcPB27QG250C1dRIq+uGGlTjFlK+AMFZqh7gRF6U6/6rh6x?=
 =?us-ascii?Q?at8EZ2zMfxXQVn7Cc7dtOUzMKIBOI23xwzLZPBrTVHN0KJ2oVPllgn5TrY3F?=
 =?us-ascii?Q?Ac9XKy87/roIb2Kz/maJ4x5Pk7aNHytNYPbXBXGLkdq/BapjmnQ5cqVPoqnd?=
 =?us-ascii?Q?Ry/3BzQs42wM1I5Tw3X/So1IxB2zTbJXzeT2ZNujRV3gg3UQDs74RPn27U3o?=
 =?us-ascii?Q?XS2eLL05LQyaqiVJvDeemBHU6PkU9YIzGOlaBHai+/bilLHRneJMY++2AXmy?=
 =?us-ascii?Q?S9Jx+gRgrEIG3ljWTh6D6WbgsA8s3VJEYNrv5vJHd/gQQB8tzVyD6ipMGsr/?=
 =?us-ascii?Q?il+quKaKhPnxLR6RpI90ASVLBqOQgOPugnV1CqMWqbSqVVU+aMvBa8oio/s9?=
 =?us-ascii?Q?q1Lo4AXThXxVfN7oNcmZXFemIH1szxr6qLoEicF6wMGgRaFAlXg1jUZHWaiL?=
 =?us-ascii?Q?4m4ABGoocvd0EmENsvTUhG2CuarPLDjbVwvDermqioLINhGCKFclZZ+vbHMS?=
 =?us-ascii?Q?54p4Nw2d5MPiWuYL04ApAA8jVuGslCw0DxwLJKpN/aWHTVf1L92gP4w+AlKr?=
 =?us-ascii?Q?+Hsj3N8kq4maUIV2j50rdDyZnFpXOY+6WilfOLfZg7unKDzM9sYV8ZH/QJVv?=
 =?us-ascii?Q?1O11hU+7FaV9xuNDv8fYN7Bt2+WNCfmIosR/GjuSxvqqHAHzqSLB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6796f8-6796-4bf5-8dd0-08df4d2aa58c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 08:36:07.3255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVs2rAfBJB3xW75fQvmI5mv07ziLEBrMfyZcGss6PSX6RYjMGy5cO14dAm93mRimZIAwtS+J7q7Z3bibIxOZ2K/F1ED52W/Y9dUA+OHZf7vChMFymUtsFLkt4oyHVNgA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1313

The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
subsystems:

The JHB100 SoC is divided into multiple subsystems, and basically
each subsystem includes a CRG(Clock and Reset Generator):
 - sys0crg/sys1crg/sys2crg/
 - per0crg/per1crg/per2crg/per3crg/
 - voutcrg
 - vcecrg
 - gpu0crg/gpu1crg
 - cpucrg
 - usbcrg
 - host0crg/host1crg
 - pcierpcrg
 - husb0crg/husb1crg
 - husbcmncrg
 - husbd0crg/husbd1crg
 - npucrg

[1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

This is a split of the previously sent large series [1].
The original series had too many patches, and there was a lot of
similar logic among the patches. To reduce the burden of repeating
similar comments and reviews, the original series of patches was
split up and a new series was established.

This series is based on the clk-next branch.

Changes since previous submission:
- Change RESET_STARFIVE_JHB100 from select to imply.
- Describe each clock parent with a struct jh71x0_parent_data. The clock
  table is now made of struct jh71x0_crg_clk_data entries, filled with
  JH71X0_EXT_PARENT() and JH71X0_INT_PARENT().
- Drop the ext_clk/num_ext_clk members of struct jh71x0_crg_domain_info.
- Drop the CLK_IS_CRITICAL and CLK_IGNORE_UNUSED flags.
- Index the reset map by reset ID and drop .discontiguous.

Changhuang Liang (2):
  clk: starfive: Add JHB100 System-1 clock generator driver
  reset: starfive: jhb100: Add System-1 reset controller support

 drivers/clk/starfive/Kconfig                  | 10 +++
 drivers/clk/starfive/Makefile                 |  1 +
 .../clk/starfive/clk-starfive-jhb100-sys1.c   | 89 +++++++++++++++++++
 .../reset/starfive/reset-starfive-jhb100.c    | 23 +++++
 4 files changed, 123 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c


base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
--
2.25.1
