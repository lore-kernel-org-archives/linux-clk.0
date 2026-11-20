Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191999;
	b=IvcdbtWrIfyi5AYFRFNX3b8TPb6sQrk82SIhVu3an8ZfEjmf27xIGwR4gu6a6QOkCEWj
	 efrDDF6vcpAF8bQxaPOULNKu/6ihc2WMMIJFcTaRLWZqKe7/MU3OvtsEh8I5uVhzLYWJ5
	 9bycYdMQUfCLAJDjAbyKZhtj8EKpGfpLxkGlu8c9nWPrr0cLLH+zfl0+Bc36pvIo+lmkU
	 WhkoM1Qz+wRbuc/8VqZqimYsXFM+H6qoLVYMlUTbd6Puhse5KsrIvtTFOkrDc4KXP4jUa
	 NWkzMss3bzu8/hODcDAuoGwgGIFc0nFhRqtqXiU/kmQZclgtsGeL34QgGtesNAaVVlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IDAEflmoJvjukjuVAL+vhvrNTdZoW12ZcDvC3b2rxgA=;
	b=UQEBIQbsx6VNU4PSIsmljw7Dufu18qRvYbpGks6u6uTBh3RVV06i82lGMhT5GobfXUc4
	 JSrbMCI27oTZ3jib0oTHTEDLhtbJ8ZQl9cBcKrEC8ErSp5A92DYujASf9zDi8fOAhviTm
	 fX9EC3ZeBY4CCKABu0DOH7Q4XKOOGKB/Et+u+tXR/1WS7mucIBXYQODBKG1aBmOUM3laf
	 chVrLbDm+2c3FuAfgV5JC0qrPUptB6SIVT6mPWGspEJFYgdA6n1SHP8oCgLmCm3IPic/6
	 7PG1gSUKTOawpnwscH/rVdI6+NKshmWJvvONRN5xp6laSB/AFnN4RKlCqinwsKaBXwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ZAuik8Vo;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=S7PGv4OY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAD606A32C;
	Fri, 20 Nov 2026 16:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ZAuik8Vo;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=S7PGv4OY
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEeM9I525859;
	Fri, 20 Nov 2026 10:26:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=IDAEflmoJvjukju
	VAL+vhvrNTdZoW12ZcDvC3b2rxgA=; b=ZAuik8Voqw4IHf5mBk1YDJn1CuZd7Dt
	1OU7InKGTMmLKWfaCsl1ntRpwB7mk32c6yF5kpC7o0OvLx+Y3OT/zExRxqN+svZX
	i+aU3cb1EGcWEAUns4hQCgyY9UBB4dur2bkZ3Tf8IQBzLN7DeB0SbD1e6mRjTz3h
	NK//sSHTatKtcStg1tIHO+0+36DcWfoIyONCp/C98lckSRCryNil9Js1r9ZF4W64
	3rOczknaBQIpgjH0CQuIjWIg+/cprTIcBl+ee9q+8tYOMtr5lTzW5h+F4ccMycih
	r+gjrGTrrQkJLlwmVrygt8msBtNEh78ofq0NczNVAYZdwd6Ln/2RSgg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j2d6m468r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:26:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ0/DBKp0ghPMsQF0EBekyFKHiRrz8mf+73oXXNulIANHmNlNPRVEUX8c+5F6QUK7l3RDEl1cpDDlK31PVhxByTXedb9/EiArYbtk3UGzJK79IdJx5xVKxehxPgD0PQv8SvpJvKxF28JTnUjBv84eJXUwxLktGbHQ9Z9Djz3XlZR/fQ5S4Kceksy593Cs6XI/nfuQpYNdgXtr+u0D+2yoDIn2/C88nMB4q2pjc6XCjThLIxdc3Mx2xQDqq/286uTxiGHdyC1r5LvAhY2cQI3vKBpjNYKUS/xWCPL52p0HEEMSmzknew0z7INCXF6Y1DJVc2ZJ/Ss2E/UtbLYA8fCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDAEflmoJvjukjuVAL+vhvrNTdZoW12ZcDvC3b2rxgA=;
 b=kmtMKxKd13VbJTr4CFzmxQ9C2Medvh9I2aB+rSfmGGRnRC0Kz25E0Z5kMsFt0DSfCJETtMTtESEAgMwFklt53gLDrR4isKFC1tDFZGCP79e3ttRc5NLGknNF9VQGfLoTPVKJ+S3rTJDCAGPClvbSeiBceq51xnSJVDiuc7WtMoH3sZKVAwAp4xGvkK11NVFAj7wVGyQnT7jOSwx0nJ9sz7+4Wc9IZqh0yZDfM4Wn0SCqAwsW7eOMAjB/ydZtf2G5L+OsECK4WfaACNqSmVivJanJQThETQC6iF9a10NR+hiqi9RD+jrtIT85WI036oBJpe4aJrJRfKDXrl2RVtN1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDAEflmoJvjukjuVAL+vhvrNTdZoW12ZcDvC3b2rxgA=;
 b=S7PGv4OYYjwBxI8cckVnga4Jbs137E/dwcK/4JNQ40lhoxqM26F6S0/osxpAxZJN9N0zHjqVFd53HazwylC8CBu4FsK/3AgvF/NQ7F8pY/z+PP7XyESrXTTqlbN3xq5NUKqa0aTEKYnYyg45yVvK2jTSukMe2GKTi+yZeKkXvJI=
Received: from BY5PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:1e0::24)
 by BLAPR10MB4900.namprd10.prod.outlook.com (2603:10b6:208:30c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:25:10 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::47) by BY5PR03CA0014.outlook.office365.com
 (2603:10b6:a03:1e0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:25:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 16:25:09 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 10:24:43 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 10:24:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 10:24:42 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKGOgHU1443620;
	Fri, 20 Nov 2026 10:24:42 -0600
Date: Fri, 20 Nov 2026 10:24:42 -0600
From: Nishanth Menon <nm@ti.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Zhu Jun <zhujun2@cmss.chinamobile.com>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: keystone: sci-clk: Release nodes while scanning DT
 clocks
Message-ID: <20261120162442.thhohvi7sftcp74i@zebra>
References: <20261112023137.118241-1-zhujun2@cmss.chinamobile.com>
 <sashiko-outbox-210209@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-210209@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|BLAPR10MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d5a02f-be37-40a8-f679-08df4722d89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	uYNuE8qBgvXV91CAIG9EODa6bVTXMQmGjy427+Iq3KyaYegIwWpXtW0zvhL9ax3nEfSJVfBAaEeqOy4R+ml2T1yfGEKgrCWswaiY4FQwwYaOPqi6w8lEE3cFWyizxv/J8k3jJz65EBYJXX9J5siRAxjpVt1zio5z46XKEs1cvyrwweJL5SMDVpBSeElHC5ReoC1RlbQIcJykrKuGdwLE7e1RI/TNYSvruYP4v20A+l2Macd5oO44MA54esKk6g987Wj45P1meG7jirG0NNK7epzDlkaOC41a80DCN7CaYMORcdH/kkc48ubBFQKS59KUFvtkYtbcBh15+dqpLz3kBkrw/GIXpv5Insf6Pq9rt6i8S7IVZV07oR7eU156sYuxGzSbvTMtT03bXFciLoIqLiRiDcElnMuviUCqWgxz4iO7nxHVUZu+Q9X3z9uHh4YSIezekCYOkjRco2BXYbLHRxADu5qCNpzUNOtSpnY7bEPa0+QqmDqt4tN5T5lkSIHDkRntiH9YwA7D3auztQ16OKL2BIrRB9ZL/28Gll0GRH/BKxSECzUVYK4Lcc4B1D6h3SRARbpBn8o+FKgOeMAyz8EV/8RvuqPUOc33OotrkYwDiYh/H3fM1NSv2iFE0TrEj0DUj+wdWSc2G7l9fvEqnPj8G5JiGgMiJ5YEr1ZJkbzQaeX49oucKwQOmg+6UNDZ7E10950RxH4md2eyVdrxYA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KA0mKIb/qaTCwyW7hUefG7ukSgSwGwa98tx9D3inPh6pOWVGNviiHG9s69JeiNzHVFqz34pg5MnhJDYxuWwkOCiIKk896cgCcZjagKWsBSPi1vwVdeSL+mjXeW9+Dn1w+wP8hvc2dIF9+tfLg+i9p1fh2Q0fktAvJr+9I85+Yxy5dhk53Iiubqd/pE3d1+3Di8oTD2T0CsOIfozvYJFCN5Q3ZuZNMEAoZO80UVYaxyIwUQ7TOaGGchVlCmGw1rWQdD/TfeVnRL4IcppaAhQmns+2uOcXl+szUjE7kYD/4urjg0wsAJ3aJfavw2I7dcgB/OzRYn/F8jC2Q4v8StAtSVSN95UDl50PhJbeq2UMwZZo3XM2AR7HV+IfiylSx6yk3ZQXIFwFcxjqETKxlNFcLZngs4rwE6tkmmrbXCBUxmF2+8hoQJLUdtw7G1Uc0PmU
X-Exchange-RoutingPolicyChecked:
	cJeAtVyM1nWg/KeM3tgqQL6Y+nKErWSd34p4NqDYNgHqnnzNMVjaGcp9sgbASfSfM2XS4J6Frn2YKgkcD2iuZr0CpqandqaSEczTxhvNhfPUg1oD+QplbEf7AP1L8DUWc3OhB52AAXAeWWpAWCWL6PNdYBK02RvQf0spLVu9sZm6scITUXVpsdrrb13+MU8+eiMUr7k3a+tfGeBGmpiUydQD4yIrRIQb2Q/eEjkgy2lCPzf/PYDOdxZvEfxao0ruoVrw2ThlrzFdlpzWrTEOJbFLqZqlI7rYEIhxpJJU3gybRozqPqR7StnIXr9Mon0MheLS/04HfA+k4we02lNZ0A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:25:09.7178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d5a02f-be37-40a8-f679-08df4722d89c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4900
X-Proofpoint-GUID: YNKoLYo4yBnfYwEpCepBlkze_dXJchIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NSBTYWx0ZWRfX+NbaJoJ53L8+
 wO/XJAEo2cSiv72/jssLNA4Vgfv4yXD2NVHfMGa5uCnQBOLaAKLrIqSgIJAsVEW8t1krR//AN2a
 dIMpsa5dkQnQKjRSOe5RQfgDP5zzPQljQWxbl7dV7chLhg0pm6Q47a03b9WVarDd7AJ6gDWT298
 7mUjHjXXPYvzHD15sgGeEVBDWQ3HwdAUgwRB2TUJnCQnB4CARuYryQsDMQh/ad6ChlFd9msy+Tl
 dT9lnZT0+XHUfCZCDWXOHppZQFU/tEDB2cJMNFidgt5JYpgeAWj/y8kaq3X7/dnB8VXOOP0+sg6
 siZqaZNICPXhhQLwUSSqy2byR66eHUM8WtRYVL2OkMTDLFRo6PddwEnJJnX96Z9KHvIxj/dFRUc
 C9BtsPtfvOKE5rWhOpe+GLleiqf57jHug8pRU2Zrhlqm796gsqI7mhazlL9ks9fJxmfJLkqKZAy
 6DdocqRe9s9UOQkrQEA==
X-Proofpoint-ORIG-GUID: YNKoLYo4yBnfYwEpCepBlkze_dXJchIg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NSBTYWx0ZWRfX1EKRlgzuwuV8
 VoXr2nlVNj418TqdKwvLcE1ZPHTg/GxNz8dTR7DHXClhVLrJKuckEg4XFmNV0dBAZ4mQtCF/IkU
 w/XHbcmrKGFAneNUY7UCcVJ699kcibc=
X-Authority-Analysis: v=2.4 cv=c6U+0h9l c=1 sm=1 tr=0 ts=6b0074b0 cx=c_pps
 a=Yfwwr8Yczqb7c+94X7Exug==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=R5C9hjxsAAAA:8 a=2FiD0R9IroJh7rdyEpMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200065

On 02:37-20261112, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] clk: keystone: sci-clk: split __free() definition in
>   ti_sci_scan_clocks_from_dt()
> --
> 
> commit f771030e1cdc7fd996c4caa11e1e8cac88d5ff99
> Author: Zhu Jun <zhujun2@cmss.chinamobile.com>
> 
> clk: keystone: sci-clk: Release nodes while scanning DT clocks
> 
> This commit adds __free(device_node) annotations in
> ti_sci_scan_clocks_from_dt() to release device_node references obtained
> while scanning the device tree.
> 
> > diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> > index 967f779003587..433bdca8ac836 100644
> > --- a/drivers/clk/keystone/sci-clk.c
> > +++ b/drivers/clk/keystone/sci-clk.c
> 
> [ ... ]
> 
> > @@ -573,13 +573,16 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
> >  		index = 0;
> >  
> >  		do {
> > +			struct device_node *clk_node __free(device_node) = NULL;
> > +
> >  			ret = of_parse_phandle_with_args(np, *clk_name,
> >  							 "#clock-cells", index,
> >  							 &args);
> >  			if (ret)
> >  				break;
> >  
> > -			if (args.args_count == 2 && args.np == dev->of_node) {
> > +			clk_node = args.np;
> > +			if (args.args_count == 2 && clk_node == dev->of_node) {
> 
> [Severity: Low]
> This isn't a bug, but cleanup.h recommends defining and initializing
> __free() variables in a single statement rather than initializing to NULL
> and assigning later when the scope allows it.  Since the error check on
> ret breaks out of the loop before clk_node is used, clk_node can be
> defined directly at the assignment:
> 
> 	struct device_node *clk_node __free(device_node) = args.np;

Do you see any reason for not doing this?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
