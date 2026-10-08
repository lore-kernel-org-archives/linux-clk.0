Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2098.outbound.protection.partner.outlook.cn [139.219.17.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFFA3B1ED0;
	Thu,  8 Oct 2026 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463749; cv=fail; b=cWQq1PNj18336QmOs1WUq3t3j/6Eu/cgxQZ2NGTyk0GVBKGnUJeaO610NnVHfbX/6QoHvudJjErkg8TtLcENsaq5A5fv6+f0QezTHpnE3901hoJxcbgwmmf0WbbQOjstxJRbPD62y6Xv0dyl8dAVpsfycYAecorZQGFME+1dfIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463749; c=relaxed/simple;
	bh=C6k3sJ8jb0lFA0XjIMeSm74qfWQB+xpQABSfq9l7SJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tK6rq42HZ+Jj9Xuv39FgtYV9nIdeHyn+h5lcThR8Odq8PLuitdnc3bf0BV2uhC4ykOdYmf+5J38EyN/CZHtDDTxOYRm2k/2IbsX2XgY5rMJDP3ss8mj10kwUr902Atqdo/EkJvYSJmTKa0W1Ee5ZP5XhlR6w2Z1An7dMQNYNWME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWtb7COhZge3LwDh3rePaidPfnHjZbwymTaaaw3jR9n4m2cBPSVthyWE3XLJ+Dh12w8iJSDqTG2joQ7Rdh84+dAxIJ62xchRkbPkJNOuvySrPJdYHSyLRGTxfH1LBxC30bWVD/Y72ivt0L3DhSnqt7TDtn8u9JdxyphFIQUlh70+7x2MDFS8QB6cF/vyWuKLrXH+DRbmNxkta9JH8Gw5U4qhteH2ikAEA5ScG48IuosaeAmWdidtl8UH1rpDIwUwpkrYTKSyqu8Vo2auadaDhRHiouc1rC0Z8ON6RKCvqy/S4ukqhw+Vlaqw0dcVf0clpKTNncXVCW4nnPugh1DBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFQBehvpGkg6Ibwftzvq/hAGZuFGKCLctIg4/y1brHg=;
 b=PmK+GRAMNQeMRJDUpN7ljbLgOnp90u96bVJdD8lJiQBtujOc6iH8xxsI4j+Le+vKDcdk693ZXkEyqG+w4rt1bK2Afio6dhJEYJePUdOSF6Z6s+WCYUWTWIiafYRraJqWauxU4Z6lRKRC6W4j1rJ6Rspdaxn//EHdIx0NDCra21/hqV88aLCOKmCNvtkdPefG0RTPWXX4vXPIW0LPR1HWvkyY30G27l4XQ3yiUTajA3N4OG+GtaH6AIsizfuk4QAt2ZT5+FK9Ai9lktTFDdlJuVxZHU7uZgi24gbMn0zzxACG+A9GfG3eilFr2kvmUSVPZ6Dz5auDKSmhDgX6+fGKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 01/15] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
Date: Thu,  8 Oct 2026 05:33:24 -0700
Message-Id: <20261008123338.11081-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2efd53c3-ed77-4d1b-cf19-08df253867b3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	QLL+9VZqZ45PmLMqQHqZplsnwDNElwT7obNV4pd8Yo5w/pibQgXTIsHwaQnzNHVdModgQNmHMUQW1pZyLroGR4CBBZsX0TMXPNQBWqEMS0mhkKmkmQlFYvw2Xf29/BzZsgZUtI+RTIFskwzpAQKkKuritiYLfi4yL7thCMPzLHISnWswtyCdFoYP9KJ9hVUgLSFThkCiRoLpirKdLDS6YZoAHnZtLb6pttXJeRwZCNC0oUdE5Dj3ESEufcX/z6ce1Dmcp/TYoeEUWQRHKnnil+pWXUrdJ3BeiBppKSywkjHK5PMwPwe6xLDNLeFKvFcyFd/ZRBTC8pfY6QSZi1N5onjZVqM6N3FjAeFIip9qqJ47rGDt3T4SIgNXUotxGWVhoTnGZqz6oHvKNJxhPoreO6AjFOzt0T6FioJZmoK/BjmmIJiVzttOKRFoPVxYLml18d2HTiluaCuwBGMLaK1ldniLrC+QPhbQ0IBEf1lKC5iM5llFJv12KSocjpTp2tgyDotxn5p8lzcGlVVWoTo1Khx/akDboGgIQMci6BU0EJvh+U7SAG9CF82GE4JENug4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kMfj/YluWseLkeR6/VSiiYeYFwV3mprWVtDzThsIVbWdeRphSA6M8U0YjjdU?=
 =?us-ascii?Q?DEj+plz4jS4wdsJ96tMRtxjdH+1PXWg3FtYEQrhFq3MxKN/+cemblviZJsRx?=
 =?us-ascii?Q?ifQQQu9J7jG+4C0O3dwAw51lmrNNNwjBgRkE3zNdNAzBuHOQawGZ6UXwwbnK?=
 =?us-ascii?Q?rW6Cfn8Tuf1SBUQPG/GQUMF6LkjS1r5xjfmKfStBWYPRHuj00NVQX7qE1cGh?=
 =?us-ascii?Q?Wk0db0LXCY3IgoNVeXK3PqbylSRqdTrwTs1rs9u9TAzUOvRKaImZH1oQCfNE?=
 =?us-ascii?Q?T9i/s3jfKLHiUuGYfgn0wQ9W1ELxeeJaj69jEko82GbhvrVYXFGMNA4BrUP9?=
 =?us-ascii?Q?qXTadE2EHDZgfvQTVZ3TnodZYQmYUi6PY4etsWi0i7ZBLjel3iib7B0RVTUP?=
 =?us-ascii?Q?lzKTUW2O2Qg8/1s+7KvB0zWO2UEokjf/0Od9yviW0q/O3fNL+LEoWdINXyxA?=
 =?us-ascii?Q?R0xG5DeorFu4xM+64vWa/ggVHbL0e8hlv8trzgFnpqxh1sfkQr/Novsijn1J?=
 =?us-ascii?Q?2hlywLMMSIwodZByQKJ6xiJTg8/6KPWplXEIvk2zaOCMSXcml99oZVed3rHw?=
 =?us-ascii?Q?eSHXsjLJRC7l6KeN7blQayOOvGkpsl0Wx+/2KVysnFNzzJUgqy0DQVa8r4vk?=
 =?us-ascii?Q?/47JiBf3qdwTcxtmjehBbXGpeCzRhCe5pUr+9kJjAJrVjwwZcuT0B3izC6jp?=
 =?us-ascii?Q?vMnsV7CxcY5sPYYhwA2xkftfpcepTToDQatAiN2TnHoro/JDWNLgA7DV6AH8?=
 =?us-ascii?Q?saWICh6UxIOH6fNUMymOPtI6EmYgkYdWtViptovLO0lleJOHu7RqfQT+pODo?=
 =?us-ascii?Q?zGcJSpowsa2yXV/oteSVx8pbLB4NC1A8FdxltkiI0Uh0Ce8PrHDwdO05IoP3?=
 =?us-ascii?Q?GLr/EWOG7EAAZC0TUglT6CRf3hA14v3zWO/TLbpvOyCkyOI2OJb2dWtS+s6d?=
 =?us-ascii?Q?AdLvVP8nUAM/3tf3qQtwA/IB4CD4zO2Zz8yELf5NotW2FvnSNqs/4RhXDoGn?=
 =?us-ascii?Q?bdFEK1AFLNjEwutPfee+O5xJhWKPf2MnKI/IN855PiV92KKtpojy3WjO92RR?=
 =?us-ascii?Q?wh54gRqIWkAUVAGOmJ980mpTd9wF+RUb8grrhsFe6dS5L5b5swRjcb2Qwqnt?=
 =?us-ascii?Q?+0SN6HToZ0BYsTkoFcVw4NuWCf+4pXhDqN0IEp8OKBueOAoRIon8hybDnAOs?=
 =?us-ascii?Q?a1FdaMXlWwbM7KTUhG9YYqUbsmZj5ameXwNSMmhfWoOz16AO/BC5UQ14N+5y?=
 =?us-ascii?Q?emd/bgm8xfytOwTKjntJlt/6wUfDC7HRwA/cvdtjxcI55vzcIiHs/jEcBkWC?=
 =?us-ascii?Q?w6Zf0DNckv4U2qpPpXEMbVtwyRQSaMabliOV7mLTBWHaQmlsfbqVK70cQODJ?=
 =?us-ascii?Q?TCUvUoIAuQpj8XPrTpUhL4olP1N/i9ziMbGD5aYvvTFOZS09us/9nuMoXThX?=
 =?us-ascii?Q?o07bwgqXTsuAKw8KVFVv9Il2pqOE6QgQa0GjpYWYbUPYzC4QMhFdNZ3LsylX?=
 =?us-ascii?Q?V4OxxCGkV4doKR7hkXrEqBNmObHtEeJdO5U+98Zh6DyG9h4XytfeXFC4xxkb?=
 =?us-ascii?Q?2AHZBX4lEUZnehDx88kKZRTV8JoTaROFw7KNgEEr1xM2caqmFK2RLk3bvVve?=
 =?us-ascii?Q?YUqeRRQtYfopI+FLWwjxydoLc2ZeC10W3tQ0Zf+oQl5XoOcUd7r1aZoaUwOt?=
 =?us-ascii?Q?tfX+hVSN3b7LCZTekNPCx1aAdZEgIwKgecjtwxskrASU5XC98yTTtptEkIvC?=
 =?us-ascii?Q?WIwQIlUVf2tKDoqDiNkLOKKdjCWryxrN21t3las7OkQbBBLy6SzN?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efd53c3-ed77-4d1b-cf19-08df253867b3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:49.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ou+eV+Pd0sRz7Ixc01p6v9lk9Yc4A2JmRm/tULZ/N7S7S+DWTzRWyQVl9yaZ+DyYoSiwh9X41/XmebI3CqFg0GL09bCnwlke7Px83LSPYpixtC7pmdWUHHvmJGd2usVW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

auxiliary_device_init() returns an error before device_initialize() is
called, so the release callback never runs on this path and the rdev
allocated in jh7110_reset_controller_register() is leaked.

Free rdev when auxiliary_device_init() fails.

Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 847c0a39e5ab..1d460a03f936 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 	adev->id = adev_id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(rdev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
-- 
2.25.1

