Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DBA38DC50;
	Wed, 12 Aug 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520407; cv=fail; b=psTy/4D2f8Zp3MHK+HbapSjckoP0Hzggz1minlw9h4kmOP6N0/q6ra4xLz5ax/j/APVp9jqTVab7hnmHQk/r9WamvOx2VJHs6KY+yx506pJnyDxz+LDrAN4RDdUs3xEpm7iZRSnmyDj7xBgrMnL18RCrZU/leLsR4AtGBXwaiJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520407; c=relaxed/simple;
	bh=pHoa0NP+m9rTkIi9JRwqo6lz3LDc1kHfk9aOFFeCv6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dy58N+3o2Kl6VvP84ZE3nTshjE2ogklaBp+C34Blrd7r4UIxvfRx0UYxswfjLdL9W6ZxZGHSdpn+wD3XkjWUS9L9Wh5MClHAF9afhbVhPEjiDuuElWh6P5WU/WUGCO+2OUTv0/JfEVTcfmvDlxN+oCUjXlxvHek8BSEOOEqCtNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=bMhqtXt+; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="bMhqtXt+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiGei/qe02bhnqzgazh3SPu7YtgMnGjXjkh871IiVuwGguEKGwTptTdNqaxdKzh0oPES57KmoQZRGqziFFri6LqdiEuqV1bw/yqOREIZpqzFVTZbDNzLtpOQCrY2hbRXKvCrD9TaZJZ8abtXjkpeGHw+PBXD824M0DGDsOkUIPIv2eI8aotYCRQrLNxYhx6Ib8Oh1eNnTAWzdi9uSEOnccSzeDjt20izJtYbHMCbj8IRhQE9eeqOo7938cNARJrg6LZyIetvBbVhFZcxUj8+ox5g0vWbE9l9cOsdvJoJ7XgIk/YQJ43eK7m2wLkA9AZUk3UlmdeI21GEg1oUAk5kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta3TF8kTjMd/uXiyjCU04PJK1W3bwIFrG8d2npgMiW4=;
 b=pfphH81blTQIybKbxK65GNpLO6CHD1swtOI/4eV3lmvhjHd/g6I4hb3SZ8Z5DbTYVZ8RjZySvotjmg+/xUiW1OWLQa8UxGg2OPm78zyAULZBs8yYHgqjN6rnlltGLQYSwov7ORHhEjlIR5VzQgDCUngN31oscFk5lfyiiKnm8YYtbp2yoddukmFAJCQK4L6LWVcryxdL8D5iitlYKLmic8b/h/3flwG8o0ocsuF836jQsgsKsyjNTVtEdaZKeSVYYwGoEn+Pq7z9a0bybvzhs50gRe6B9t71L5ooN1HgAMBl/NpjmtLVQg0oOXITlpL5ltwKhfDybG+53wPP+9QjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta3TF8kTjMd/uXiyjCU04PJK1W3bwIFrG8d2npgMiW4=;
 b=bMhqtXt++RV4XdKjSAsFc3kdRLSEu4J0AYvnl/0q68DTvvKaIN8G6Sftph4NtpFNVgsGXvyd0IkgLsfVcVIUiKt19ncFQ8f2EI5nX/gl/QPJCL5G1n3Q8+220D6fMbx9A/tCx4Lh6UMHJ/QTgKngetw/TB6/q4230QpgPmxwA3PX5aLjW36HRg156WDUnG0GkzWtjU7XQpSofZPxtepz6TJrGlmpEI+KR3VUZQgTQEdwXxAH1fcrIxP2SzVw1Ztsbu5QrNUVtd5P/nyHfO5j0/lJcwJU5CKDGP9xgJuYKPGBrHTgk65W38a6grPBPHIe49UhZWBMY79dSFYjKY8HIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:39:52 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:39:52 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 2/6] clk: socfpga: agilex5: add usb3.1 reference clock
Date: Wed, 12 Aug 2026 15:32:55 +0800
Message-ID: <fd7dfb0bfc9fdd0cc68385960d98ae24b2137416.1786518803.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e05fea5-bf04-46b9-b4ee-08def844e54f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|55112099003|11063799006|6133799003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	mF1iPpFqLO8g8Fe091MS2DhyiiXZAaNjAS/z28D7wA5qwnTM8SNgoRWWGbKNB6ogHIGQRwpIahAVx3dG8DRsH+Qb613ckXq6c0MKMshca24zwTLLh8RiEyijlYlWZIG5lNUKfedwlxP30N2BXKqIOAEg6yoPZwL2EPkuGn4i6XJiSshb36p9WmJFuFN79j1AserRAoe3iWQpd7xyEYhtdQk2zzghRLW4jxpUjippdJGQWix5zEhXD3OAAR2UA+fIbDyAIJJxAXzPk+y/V/hj48J9E78RbY0IGj6F0TiJnaSRiEuCQXk0Jjm0alf4u9fR3rBn3kCn8TTi6Vb91XsrQc3cexqVOD3J7ir91LO+pYNdBsUoyfOKzzVotd1HpKnrn2zm/UufGi6He+eOy8WWoYaDHLW97sSstnlKKIW3Hzi5PcsFGSmYro4XmOIUifVFD2pBw8I1TMSF2L1XAfTHEhvLbA567KqoK3BWdC8ND9mWagLnRQ8uXw9y0y5WArF6g3Yg6CApnby9kCZ3Bwr7UZ2ZbaRA71ZVsYoZq1gcb/DyCWlsipyKIZrpmPxawawumP6WZhBpSAc31RpbT3AcNmpXsFdV8b1QKEn9k/v3PQmFrIYaFlkgL7Pd/VIYlfa82wSW6ghsqJBBKKcPIVCOq6ZiTcH7NQQomq+sTf28bL62XoDL9BsYBt6hTKWXyckyv5lsmUN7P2NdukEJVk/qCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(55112099003)(11063799006)(6133799003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iYo8/kjIxG+n+UUSQws5CdcDV8M9ZwofKGkcXgeMBU9hWpJZOlejR0CObT7w?=
 =?us-ascii?Q?N44SXs3Nxegm1vedUFkFOD/IZn9Nqzyz7hCf1PUKl8dFSmd4bU+6CYDsCzRj?=
 =?us-ascii?Q?Tyfn/Mhuej5TY0M4w0pg67FTFHVBgEv2QHbSCBMBXfoIPsH4wMiUYOyke63K?=
 =?us-ascii?Q?zT/n7wdlQG8Ok6QvGPawzK+6pj0tN0YyBmuJEJof3fuRxOWUQrbqNKTJW3gx?=
 =?us-ascii?Q?3764wYGpXitXZbmU3AkePuQIGap8z62vX6qJ7qwqj53EGvhbl5VLaUUgKcbi?=
 =?us-ascii?Q?TWoei8oxjeX8XIfkWoIGO1TG3ja3bhbvpBCC4u8esYb9f7CILV+eQm4ni2CW?=
 =?us-ascii?Q?5NWBN2oLZa9EpAzGMlB+ZFlawCH3Q0u5D1LnCoZhYEdzC5S0zAzYvQlLPDi8?=
 =?us-ascii?Q?9c3GOrddEmCKu+pyvtSASbMVumxnN/HgKjLzHZoHVC2vnrRvVH+hbm59/fzS?=
 =?us-ascii?Q?Ka3QI0N4iptIDcc7UD+IZQhVi5MVO+8wyX+t5drwrXNq+AOZuER0M31R1jNe?=
 =?us-ascii?Q?l3mbcFK1ZaWR9UT3hoFZlqy8fDk5N7nAxXuRkfxSCL8JCxsqK2nGC6sHQXxA?=
 =?us-ascii?Q?GW3jBXxoApxbLFJffpSMYOVdKQigPXkdRrAoTZFETr8pgntUp6Ndvja3giTd?=
 =?us-ascii?Q?xlwfepnZpZIu16mqoclDy5v6xgn8z7LcFYkmCib3/7d1mKHwskQLCb8wjBxX?=
 =?us-ascii?Q?iVcfHOsBkWBQCQLNMoODNacZO7hD8Z4P12AbSAdlToU/xX8nbRmzr+X4UaZX?=
 =?us-ascii?Q?hA/t/LvvqLp+jiy9rHIQGtW2Zm0ESPw0LbNbKruoHfWuVPDtjq0yLyodP3tZ?=
 =?us-ascii?Q?tsft4CmwWIfUPabvf99jtgZlooTzV10vATzzin2Nb3BswDwRDXNnCw/DlP9U?=
 =?us-ascii?Q?PpcyAUwELDT5TwZ9OlURCfb4UC+c2QEFp5Catt72me+qd8m6uBVmFK6rsB0L?=
 =?us-ascii?Q?xVzzJw57nNEAFtpZdgrkSN05AM9yoVSvlvAwzcnY7CEHxojvrRfhXTBNub84?=
 =?us-ascii?Q?ZAGPU3fcKtf+Lpfw5XIN9c+vdzXIqaAkk1sSl+yLEGpbWX6YfnH2JaXWOnv6?=
 =?us-ascii?Q?baW/zswL8mKYrIQ/+Nl3x0lSY3BsHYVyK0BUAQWHUkjiE8A4sek13R391sNC?=
 =?us-ascii?Q?glf7p97da0CCruQSTz2xQ27eVdoj+tb4aIrJV+0fRR2dfAhC09aWaAPHpDKl?=
 =?us-ascii?Q?TXWYmqGPeUuf8lN9Iw2KuZaFpQ2Z1ayBOlp7oZ0RWReS1ot8sJTKEHmIPFrz?=
 =?us-ascii?Q?j5WhQ5qHUUQ7uVd/Wx0ApKEIHrbLtwee9Pl+yv3e51WYOa9HRvfHUFhx7jAd?=
 =?us-ascii?Q?g0jK5dACNZL1P3dLieWJAe7r5mzQtUKpFoKd+FEBtAYJyazk022c17nxxcgb?=
 =?us-ascii?Q?QnE/I64/lxy0PVQbID6chzOm2wMo05SDZ/+LC64JqZmYau9KT9D1ReC3WwN+?=
 =?us-ascii?Q?PtRmNC4PA0Iqyn6eOhxxvRH97K+C8nsOtxU1sNudaca4ydDhpAorEUjlkHnX?=
 =?us-ascii?Q?GmhHM3G2r+0ZspNoLl9Z0jx0zK6v23J8uKsNKJcB8mS6BK7Et2x2LN1PnjVS?=
 =?us-ascii?Q?csSrbuhWYq/e+Pvc3QA9Ov7frxFicMyZgbOFefDCPcI9STP3kGLyv6eH1uDW?=
 =?us-ascii?Q?ZVqg/WDMneuMxUxs5yhPvwFZGS0rmaoYdfLQfis5+kQYuEC8SpEtnJV3W5td?=
 =?us-ascii?Q?cna12KuqKBBoEXecuWA4tRov/CiP8TJa8M5NctMPaDiYemPcJyPkXxUkLZR1?=
 =?us-ascii?Q?FyAnAtGxvBGrTQLlXxWfKMLRMuNKI+c=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e05fea5-bf04-46b9-b4ee-08def844e54f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:39:52.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uHqquFz//AEAHffP7OodnW5tO3brHET/iLrVxxqm0AROf8BVY1BE350VeKVvTtdeuYA0MSOaIeAUAoL0hldyIVphwrLLljxJ4G6NZkHX6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

The Agilex5 DWC3 controller exposes separate ref and suspend clock
inputs. On this SoC both inputs are driven by the same hardware source,
usb31_suspend_clk.

Register usb31_ref_clk as a fixed-factor 1:1 child of usb31_suspend_clk
so the DWC3 driver can request each input by name. A fixed-factor clock
is used instead of a gate entry because agilex5_register_gate() assigns
the gate register unconditionally; a zero gate_reg maps to the clock
manager base address, which would corrupt the boot PLL register on
clk_enable().

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex5.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-agilex5.c
index f7f0ad884f64..af3009ddc6ab 100644
--- a/drivers/clk/socfpga/clk-agilex5.c
+++ b/drivers/clk/socfpga/clk-agilex5.c
@@ -526,6 +526,21 @@ static int agilex5_clkmgr_init(struct platform_device *pdev)
 	agilex5_clk_register_gate(agilex5_gate_clks,
 				  ARRAY_SIZE(agilex5_gate_clks), clk_data);
 
+	/*
+	 * usb31_ref_clk is a 1:1 alias of usb31_suspend_clk. The DWC3
+	 * controller uses the same source for both its suspend and reference
+	 * clock inputs on this SoC. Register it as a fixed-factor (passthrough)
+	 * clock so that enabling it propagates to the parent gate without
+	 * touching any gate register of its own.
+	 */
+	clk_data->clk_data.hws[AGILEX5_USB31_REF_CLK] =
+		devm_clk_hw_register_fixed_factor(dev, "usb31_ref_clk",
+						  "usb31_suspend_clk", 0, 1, 1);
+	if (IS_ERR(clk_data->clk_data.hws[AGILEX5_USB31_REF_CLK]))
+		return dev_err_probe(dev,
+			PTR_ERR(clk_data->clk_data.hws[AGILEX5_USB31_REF_CLK]),
+			"failed to register clock usb31_ref_clk\n");
+
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
 	return 0;
 }
-- 
2.49.GIT

