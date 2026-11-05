Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868122;
	b=HhVaJ5qRNiAQFXYVs5sWmvw7tan0tXQ9uY8wn+7/p77+MhktMC47WAr2iRv4pwJ631Tf
	 f2sHYMql+yTdHBDxbR1LksBpj4JItgm+aTWNWXeg7gP6ALMygvh/JqZyAdy0sXDsWfK2h
	 cJjLzVLux0JufIJSm1nCTUbWpK8iLRKMPKwudvkWoYsMi8Cl5titUyt1H4k1K72bD1/vU
	 oKlZJVWGZ6FpLTO1DdrHl2eYfM0dyP14En5G2jpi7riB3qoCLmJuJr9Fq68ajjL18O/VL
	 sHbCNHxsT8xe9U64ZlIImv2G2di71bnFacBMm22DTVZC+EMN/bcW7zqnuRrqoZZ4i5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868122;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SebBKmfhtvA4XN5jZ2SI84YRvgNOooZ5HVpz40dOFmU=;
	b=tKwLC5zbKH+hU8TrV+kGVbOOemLsMH0zeM8MzXREFvdaV4bS/GiGyScOzZ5PWo1X5gna
	 RzmrV0G3bxmRH7v+UnXZpHv1Z9nEGqGAlDUyWKM50Qpc9L2j0xjCm2nP4KntNwB+tYUEd
	 ifks5PEF946sHgFfaoHOGa5htW6aGUo/GrQe31JwKrorew7XbEfnCt50BjRQ4FlEeDwnV
	 WMIMLSzEuBUOa8bWV5NFk1yG84UxvSazp9cDB7DxuAb4kh/4Q2I2mU/cqLtrUx+sR3esT
	 GaDhIy3eZP8NkkPWO1Nu5dOpvQ+v2uUnIYAx7L7g1EEzJHxFmRY9cJDTxna1CYhCY1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.103
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022103.outbound.protection.outlook.com [40.107.75.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD4606A31B;
	Thu,  5 Nov 2026 08:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAD4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWHkfqJd8jyKrBGLk/H4UhylVI7J2ncK0YhAbsBKhkWTkCIUtWI/D0mss3E2JdVdX0DfdaUC+XntriqLBvbPrDdXba2kltXOw3QFmSfswDMGpgmAWiSszfi/30qkR3lUzATR3QPu/kZf5X9XR7PVpnYZ7i3KENm0CeX31MU738eDrdx6/vy2R54Bf8EHc3WXyzYFUzSpPhVPn3gNYKNuYtbXBWEkE16MEc59nVTXZvzhb+ZvAe79RFezxR1pDi+4G4Bt5Z8GTxIL27q4XSjDzQXiUn0cbXTfa9ztEA03LzfWkp7wFkhPU4B9qX5ka9Z4ny8LsGb6By6SnRYh2LCG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SebBKmfhtvA4XN5jZ2SI84YRvgNOooZ5HVpz40dOFmU=;
 b=K9HfpRSVgh2PFzRlXURRpMtVtEBBZQxDiteZLtawDX+kmwXcdSZNsXMGao5IjJgBpnuWiEsM9wGG1NLXBmxOAsJmlXot/hY9H9LbqhxKlzsVYU0k6FNdkYvQD9JgG8PQTuL8tsqLl7tGYj9htUaz85WQg0d2nfmtN5cXnVEV5GtRaZgQqgJtgyqHLK2AwFRrpcqcLW+hQg5mY/4Xs//2G/b+GI31rJvgdytjgxPDChwcfI0i6mHeDXq55k/dqEhlz0XB2eV76LLJLUNlRlK3brTgwz9QLKhU7BRfqldwezTRWi4VTamNuvEZYhvVFzogQG0ka/X1+SklKLVpm280SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::9) by
 OSQPR06MB7156.apcprd06.prod.outlook.com (2603:1096:604:293::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 08:41:53 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::44) by PUZP153CA0003.outlook.office365.com
 (2603:1096:301:c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.3 via Frontend Transport; Thu, 5
 Nov 2026 08:41:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 08:41:53 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 05CA64102E60;
	Thu,  5 Nov 2026 16:41:51 +0800 (CST)
Date: Thu, 5 Nov 2026 16:41:50 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v2 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <auxBTkn7Z+Ssr05B@ubuntu>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
 <20261104124437.296753-5-Jelly.Jia@cixtech.com>
 <auuLEgmZFGJ0Ol0g@SMW015318>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuLEgmZFGJ0Ol0g@SMW015318>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|OSQPR06MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: b34a18ad-c616-4d6c-bcee-08df3b18a47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|7416014|376014|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1iKjxzsrYrIKuSnUIykAwftPl9jtumQreYV2dparnsjc4to7o8poQZKyl0CgN1M5juoSVx2AC60IEISmPktQuU318i7K5n1i9lGWqkMletnLZh3I9WfBYLrCSGUu2Wfw/oHBH+R3eH6Ip6aPlh4rlhVCtzSeWSIHgartLdubMuwWtdWm0QJxXFBUia0STVV3fbgvlARGXnxUPXWQf78GuWLYhPWS1qno0E/Ukff4SO7uIh1C/xLrPvnDaaNFIqxDXDHEmN5E8n+L+vwqsvv3Ikr+OtR+kB555dwEt2X3LkTgNiGp7Uq+sQ+1tyGb3+xwU3yq8vUnCuUA1T+YxwYOQ5wnH2fFY4zHQcBDtvPnachfbZjLwFVaDSg7FuCDT/keT24PjHLT4fPE96Bu2rySvLC2Hi+uJ8in/ZvwXTYYwphAti9FyvLmXzC8+XsOXqjN9Hh4wfpZXXkjEnHFbYnvwjmZpdFDVTl3/WDxzwgyScOv2D4/v2UWcxXsygafOCtffivSmtqc/xiZ6cr4LTNJ2jqyVcoE5uNwYNkb/GMTdOIy6PbEXxY/zVNzpoIF4ffn04a/1BJAfhsjUgGidCJfnL5CZR1l1/WvH+atQvc6aKAKp5Pt5rtTqmHR4lTI5UxJnbvBeMsANL17d9Ua+i8tfdyLZmTB2KXSC3KCtBoH6bvpUehV5TRCvUcgpvDLyJOghWz3R++agYiUqENmMlH+ig==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(7416014)(376014)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M2RukX08AyQUcW6PUXy2+1hovag382aKjAfpUCgPaSxdax0TXdw/Cb2uaDjSuyHi6l3KsfU+KHm4aTBbp6DBoSuBCyHiPOeiZoF9FoRf+H//cWrACjl0Zv/LJras9EzmNWCNfv7tXJdaFIvHCwHagkzQnDm95YpRRHxKU2K5WGtLhZbiUBiWxIIwQj5L03cjLVcuj4Fl0cRXFDHchEh0qjh9L6mH2otigxov7dQUAjmZDq6/xFcMI9UuCRT061l5Cb2EG6bsPgOHF22lWSD/N8pn1Hwgg0rDu+Nx4r1Z5Y21nu206fliJCB3szBQ4qKugAxmqaLEBuk5wN7pjIuispoEkCpme11pbCMOJYllSQnlckQaoOUI6fxtaOrDIzF0xMO0wW8IdbAq1AFx3lx0dveuTj0pU5p5G8+8Q2IIo2mgFy8km6DKEeW437GpPj39
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:41:53.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34a18ad-c616-4d6c-bcee-08df3b18a47d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7156

Hi Frank,

> max nchan is 8 (in your cover letter), why need check i >= 8 here?

The i >= 32 check was intended to guard the single-u32 mask and avoid
out-of-range shifts on 32-bit builds. However, DMA-350 supports at most
eight channels, so the check is unnecessary. I've removed it locally
and will include the change in the next revision.

Best regards,
Jelly
