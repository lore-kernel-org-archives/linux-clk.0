Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FEC385D6D;
	Tue, 12 May 2026 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606173; cv=fail; b=E/N1Tyw2gVMtTJa0Jx0wjrCo7vtnt4n9q/mYwFgvRx++KasXnKZmrypmqDW4uH1RwkxMOwmlVsc7bdrSvV1VPfwLGY1OFWxJMewnQ+D5biiojwpBU7kECrhp2eXEGPbZa/oAYK5tzd6yKxF1cSgDT3vK+8UNZJrDhu4KuZiQcG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606173; c=relaxed/simple;
	bh=9CVtf7PAs6cstjnwTNYcERAF7SEpiUTyb0+BmjbNwYQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtGxoSSN/R/O7dut3MOclYjFzc7xIC1I/WtKx419uYiD49dqwt2RGB2WYu8WiXPgN1Yc0TZotW/JcFVm/LAb5PbxTeendYqmN/xWfaOKsdPWXI+BANdLhwXbqCkHvjJ7oEvjorKS9OG2FWR0jPZ5awPy/cD0FC94Lq5Fg6NPU3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wwKoZZwM; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wwKoZZwM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K01ybbfeZWADEPsUMlmA3JpdKVu7lioU9rGfXy5JF4k/gSEmoKk0DxE0vJp6RhoDN2ydu6b3l9Hev1IQVxYkZQEJ6f5tV9dnrh0nBesu7WcPfGtfUm4RJxFhTDSdnNF3Mh0Bveq/CeHsi2UjOVTnWWSf3NTdHUQ7ARG9pQ3/snUOxtsocInqnVh0MPgeTKvf0mYU3LVrMuvwnjV6c8+Ir+Iu2In3J6LntN3J603vyYYJ0eXR3mUjpOZa0ZGZRTSwqYgRQ8MXxYDnvSOVxd7vVVyHAdk677+asfpoNcTyvRwG7HhgNKTrG8YeE25w2eBLHEYkd+ufFBSa5sZnPYuOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye2EuyLWcnvncBYxQalplepFyMeY7Tpbew69nVoIh0w=;
 b=UswwpEN1FLz+UQ0h3SLvelJ+jTbcQ69XK757wilcDg7X3VCAMWnW/vD6VeOoOdHt5aKMxe2tusFuu1U3H9m0gY0yr8mjNnzY1wwcIPWRizofycdzrGFKNwtWl60xCpxpXUwmEBe8Wi5XKLHWcQon5ji/aE3ZAfHXMejGruxYlGk7njsoTi8GJVN7nC5QWsLci43AZfKEcYE4V2iP/QQTB2qVw2XKIMNpRQVn/ZZGi7l9wmxU3B5TaKJUShkk7ju4oTuMRX6VS43AAks6M8i0IizbkrhZzSIGtoCqg9advIqbLeQSWiEAVlJWcCBIA7CDth9OBh4TwKPQDOIqMRSLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye2EuyLWcnvncBYxQalplepFyMeY7Tpbew69nVoIh0w=;
 b=wwKoZZwMOQtFcjYEudYhG2XgFwsA8DYt0LkqmtNcNx5wSreV4WXuNdykNaVXovv0ANs+XrcpGcnsruwNEqEdpSwGIOgHmnzJEWi7hyBRCrsWT25nDBxknnnscy+tRYlbg9m6DsMt1L6nO0PRqPWMxLYU72tuyXV2Ng738TLv0ag=
Received: from CH0PR03CA0400.namprd03.prod.outlook.com (2603:10b6:610:11b::20)
 by MN0PR10MB5983.namprd10.prod.outlook.com (2603:10b6:208:3c9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:16:09 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::d4) by CH0PR03CA0400.outlook.office365.com
 (2603:10b6:610:11b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 17:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:16:08 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:16:04 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:16:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:16:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CHG4WT2248995;
	Tue, 12 May 2026 12:16:04 -0500
Date: Tue, 12 May 2026 12:16:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Brian Masney <bmasney@redhat.com>
CC: <a-christidis@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael Walle
	<mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
	<rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <20260512171604.5ntgq65bmedb7jpc@stinger>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
 <20260512104848.4axgjeto6i7ejvli@retorted>
 <agM-VB-ToGFNphfu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <agM-VB-ToGFNphfu@redhat.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|MN0PR10MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a651c7-fe65-4416-411a-08deb04a2852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wPDphZCERGn2UoRjIrtQFCXgmIL00bLV0O9Vl9fpvuUQUGLIzXvSuxdH+3xwCIU6XaCAqkL/iRcNbUvteg1jKxpeC6uqRAmBGrz5bOkFt0yryGGNjDmKkdwRtj1jmw9eRzk1oogII83vdlipOYeBQ3MV1bW7WtWbszYV9vvGacR6duRJTqk0ncX46XHOgNTgq442If3ybjb9EegHdAO00Y4Re0FtW7Yq9V0iDwWcj3xwpwCOktVTqgBfbl/2SO/CWHdNlUuFe484MbXwqd2QKzn/6T29hGXINDXpijbTj8fi3+ir73Kcsrr88OXfJ0FN4EWCNEF2IuWOwQG+XfLkhrjQTwi6UhvvBnowlK+HR7/F9xLt4VuAmuEVObOJ5jfIfDZzjdc+O12jCC4bBvrc9rMz8YRXGoNJZ5IqAUeKWGV0FugUzShfG5gcsgWQOhzBIaNhTya5AplAER1kBwFngdvtz6UQxcERNR2pPY+gk2NaWl9VRT1ampaVDFXJL6R0nsWoffzI/JORGaNtvTzCZJZJ/7/N/JhZFXeoRrXIIfxtNxVdHd2k/ZOmotOrIHd8RYHHkyPFfR8zqWUfHVbsLPSz3ipoCreeqyNJEZccazfCYWyqWR3JIGr+joFLEaScXGk4rzxT7+AlSLf5lP14ecUs3cufPWHESfeKu0xJJLVBJXrf1OZ4dWsMU1RzH123+BS1bb5rGDiHmGT5FWpgvvvJQDOiEOqsISFnT/h7vtU=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VsqkLi/9n5cO9l6NDyZTKVlzzQm4UCSgB0fc7OhrwdlPgk6ddEpiKH1/VCtEMnqd2n4IuQkp3TaiTuky8ce6NbYUMyGT75zCkaa84ROvBchgcVAjmPIqJGRx5gMpFrAJbXn2+O/nsHmVGzYcIvrdVci41d1Z0H6ti9S4SurOYpwt+JtTVIryOTUw+9Fgu3Ug4tCyCYNZ1ZULmxnoCRh5uF82LmSh89fNO8O8BMvCnqzK8JJBeyTPdb8iHzjWnCZf40JmBQiwoGwDLfB3cw3B1iL8DN4D2vOJXrLiaVYIRFVd23EnDvDA1ChwBiVWw+W5MZVY/MKATKICHgSSBPkm0ewEMy4slXeT1prj6FqaXiIf0bitU/JdL5hmTG0eL9yEjAA0cy7zPpwyZRNi/QmIqSuqvruosHIOdraE7QXPWdOJTUrvvnUKdQgz4eFkUuCP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:16:08.2567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a651c7-fe65-4416-411a-08deb04a2852
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5983

On 10:51-20260512, Brian Masney wrote:
> Hi Nishanth,
> > Could you clarify if I need to take it via my tree to arnd or if this
> > patch will go via the clk tree?
> 
> Sorry, I'm not sure what Stephen prefers here. An argument could be made
> for either approach. I would just go with whatever you have done in the
> past.

Thanks Brian for the review.

This usually will go via Stephen. Will wait, just trying to make sure
there is no change in expectations (given this patch missed a window).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
