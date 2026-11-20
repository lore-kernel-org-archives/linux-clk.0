Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152939;
	b=JAoMEYtsPuyoWFvQtVAQqcPghF1NXX1AU+aqB4Wgu9UHG+vzYYUqZl1fYXxodWInpS5D
	 5CNoYFdCcwk85fc2v7Txw4s+3ADmosAm96bY1dTUhlCSqV6ZNZ8FLghR1LH4DFH5oYE3D
	 T5QrmXwLU+QqutzmKKNhjqa5TwhDH6lmn6LLXcRCARXJzMxHNRXNbP2Rv5l/xF9Nq5GMc
	 NMp4iw8blDxtqrgJQfrZMRA+pE+F1ZzyJUJlgj5cw9FBQMXIoOz+dNnrQHHynjtRRP7ea
	 gMgvydYqCRKm7EnaWQWTNsumh8/qTd7x8I2pbLBj2k5ow9mejziyTvwnqK6FfcmaMFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152939;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DEnywqUXzOJNef5LgzsE7pOnvRhFruVjLnOhXx4NlJc=;
	b=v817rueSCV8Z5Ot8m+VXB42eKO6smD3uGmTv9qfpMoj43HRMTb0rND952bC72S+XJhpf
	 S+osbU+ssRmHENp3fPrzLEOea2iIwficP9PsHWVv3Emr0Tw+EShV5BDYcuhkcU1QTtdam
	 hSbmfuKcwWUnXhg230FCk3xBWWxZTpT9mbXiNQrkAyfAvm5vDCrkf68OzGvPeiDmdQMyI
	 2roZecTrPK/pCwR4HdnqB0NACgkqgr7r3kOZkeZgIJ7wXUgIOXGyVMQ5N0oTd7jbAx+pa
	 FAlV8jKyEsVtbc5TFwtcwiLuvSXXuSL0HR0p0jUmiWiRbuotbrlOerEjTAIH5nXCNPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.87
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023087.outbound.protection.outlook.com [40.107.44.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5260A2616;
	Fri, 20 Nov 2026 05:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA5260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nessYTsf17us6ISOcQDMrCjTMSfFqUI7tyqIu0BhFiPVH4RCM79L3LYeJW2LS6s86L2kSriN626Vkc/FLEhAp6fkEw4E8F+6h1wdRF4DHG4whrz6k3eD58q0c+YfbBaUUySQ91Ms69ajiL78SVoju18yfuH26coYp2Ip200Ozyw8W/WofCfmLy+s0urXKx0TLnNM0onAD243LhCdmc+uO1UEGU9fZi1DE+pIANOdV/Gp9GyaPM8cMjO+X7rQHtmNOmUMOdzf8O+xfT4bFYkL8SHPEROh9nHz3ZwjO4uvnxaxCBjzciKkv8mi20XtKl1YJFxjnTEoIn+BoH+w9UVW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEnywqUXzOJNef5LgzsE7pOnvRhFruVjLnOhXx4NlJc=;
 b=YhmH18sMxssrByDtknn0Bobr60qFvzTNQXoMs8amY7xizqXrg7tgoSFgW4wdQIDX4XqHyOPOtpd1XyuhTbNtAK0CvqyTCpJhzoOatenKKkocbzWnZWesSl1FJtNSuCLPBmhUjmSWk2SHR55AlUggQgYmOcOGzjfPoVu2liFZfTEI3B5Wf9YiYiF/bS3KRedPKrYvewvwcyXvsNjqCTkdoJeo+cfVHJIImOcX6MAkh4smQL+Qje3MySHPogo7Es9BYCo0YzW5jjBqwAcmQ2APiS07JJNMF055graH15wEb3xFEWCw77wXcwzC9v46RjATrlb7G5TF7dk0zH+/F3sXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0079.apcprd01.prod.exchangelabs.com
 (2603:1096:990:55::14) by TYZPR06MB5976.apcprd06.prod.outlook.com
 (2603:1096:400:33b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:35:33 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:990:55:cafe::38) by JH0PR01CA0079.outlook.office365.com
 (2603:1096:990:55::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:32 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0042E40920E5;
	Fri, 20 Nov 2026 13:35:30 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v5 3/6] clk: cix: Preserve Sky1 AUDSS interrupt and reset context
Date: Fri, 20 Nov 2026 13:35:26 +0800
Message-ID: <20261120053529.371923-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|TYZPR06MB5976:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d3c45fe-9361-47de-09a2-08df46c81874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|7416014|376014|261102123227099003|261021121427099003|261026121527099003|261022075727099003|921020|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	e+3L+nqvn3AY/fHoFCC62HUYElA/hyGKr23KZOXfYBNWDIM03mhJi8r41S+pmMV6SKq3DOEXlJt2aBTcca+5kR6xvi5IHApBYzYNdc73RkzTGGkHI1V0DotR+yHWpo7On3m2s3j4J9WfWFHNp+uf8SPIyqXo6zltoGwOLwU6IxmVTZVh+oDS9dfXSPTAyOeNBjb7At9yEFbUgQuHatCeNJMyLfCZzaY0U2N646qSxuUnYKJEpfu1MyQpv5URmw0RjatW8Cv2w3QI502X6fgO1cDe/zfDbi9ebBYbG+g1flumOQ2bQp4dSKyIQR86qngDiwJlHHmzaTPF6K3FgyCI6MMuyBOF4H/T5e9STRWI6BJzOALkWld+ahyfNbU7gXcSLqVEjyaEwiMdLuFYHpZ6xRxoyJQzcJPTWjBzfcnsLIem6cM/MC0PQZ/jH7SAs9aQFssEfabKDTVYT6xKyFpAO4g4SvyUfQJNVnci7sXr8sEx/8J5eQjzZ+YUZXbe5qxAW85+TSAgTUt7gQ5nwW9a0neV29tJY2sZMxbCxwioEoZTblJSbuQUCufWF4YMqblzRS8PHbqj1NrwBwU3O/23NMfHQLIs4rkoXk9JR7OvterEfyqnpwXE20JkXOtFGGpAnyP9iAnkR8acroIXgI8wOjbH3fmVSjElqSTJwYrI1q9Ur0zqTpxtfY5pq+rHE26jLU/y9TOpNunHp9T5q5TdWc9h+L5/JUFqlpo4wHEYZ5XimYhBB4ivmAGoExVcIqRz
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(7416014)(376014)(261102123227099003)(261021121427099003)(261026121527099003)(261022075727099003)(921020)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	32huZVK7FfiC8mBlGX1KEuPfsadVScRG2xEp+n0qkOs7JZshzaI62kmXj37TqGVP9tufcHfyL3kvAqmRbZwdFZyQ186XBaEWHSqNNajgo66zeUty3Z3TaX9kJN2VH9okHfr6+52lBO3aRztXTv9IzwPu/cQuyx4nBLhfgeqIloD+/Y3refCNqE7VumLE5U2AXw2dsCn44+mKUHTfuojmqKo+7SRyI+xv1A5Yf/fjekyGjRzHNAAuQGcYv7xHdr8X8aCPZR4jnF+1IRAgqX7tvsuyMpOZmHnbVAncE5poFVfe/35O8VXyFHgtpEyUPOxi7rIQM456BmRLbm0PUAe8UisNePRCTpGyLtFIvbf8mwc6nJVt6JydscDvKjyo4xuEOA5htyuKA3Cr3tlC+BT20sc2+2Y6RjXsHn9BqcYzKZeN0EhbZaNTXKoZxg8eYx80
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:32.3724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3c45fe-9361-47de-09a2-08df46c81874
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5976

The AUDSS CRU saves its clock configuration before runtime suspend, but
the save list does not include the AP interrupt gates or software reset
state. If that state is lost across a CRU power transition, restoring
the clocks alone does not restore the configuration of its consumers.

Add INFO_AP_IRQC and INFO_SW_RESETN to the existing save and restore
list so the interrupt gate and reset configuration is preserved with
the rest of the CRU context.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/clk-sky1-audss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index e096b8121df3..1da86f6def4f 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -18,7 +18,9 @@
 #define INFO_CLK_GATE				0x10
 #define INFO_CLK_DIV				0x14
 #define INFO_CLK_MUX				0x18
+#define INFO_AP_IRQC				0x54
 #define INFO_MCLK				0x70
+#define INFO_SW_RESETN				0x78
 
 #define SKY1_AUDSS_CLK_PARENTS_CNT		4
 #define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
@@ -28,7 +30,9 @@ static u32 sky1_reg_save[][2] = {
 	{ INFO_CLK_GATE,  0 },
 	{ INFO_CLK_DIV, 0 },
 	{ INFO_CLK_MUX, 0 },
+	{ INFO_AP_IRQC, 0 },
 	{ INFO_MCLK, 0 },
+	{ INFO_SW_RESETN, 0 },
 };
 
 static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
-- 
2.54.0

