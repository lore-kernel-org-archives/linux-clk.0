Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3CB3A6B66;
	Fri, 22 May 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440848; cv=fail; b=MINUknLDz1IMHEeAapnJ9MLsmor56c8ndji20SfqTuXFvdmLVRNyKBDMhdriBqUEW4oY0nILv+1HXGFI+n2sI4mbANOj3cSDXNEgh/EPAwrxn5W+v9bBJvpVv6Fn17uZmhqGcAf8a+KO0EbR9fhlOrWHTbzByyZFjvUKpFlnmcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440848; c=relaxed/simple;
	bh=D8V8MYZK6pHlrNjmGKyrE5Hywl074VQxEvREANIonwo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=knnLatOINViplyl2r6TrWcttkxvH5WV33ohgS2nmyDcatflEUs3KV6TNwDhqjBxUW9O2qPqyHqMLg8mCt/uyro3W2RfR1J9WqXdsVxTaBora/uUa6DH1+KIJHi4W4Jq0X/pOrAGB70lChfGSmQwdoe8EEq/tu9nEOix2MQs95QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=swWG8VQH; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="swWG8VQH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzbNIOFsDzm3cKj8EOnqM/KZJl+rvPxqK/b+rU7cefrHiALrduPSD8xRdgwg7UOKeJj1N8uMqK2FgQoyRF348aGBi81ejY0epLI+17VRorY7IICkienCxa60TXwBipD0iNKzF7xcDib9m6wnbmPsVI8QFmQmbSpLYt2Az+5tM3AvNLX89U6g2KntQKI8dskui2QlkcUsywKGojYvav5eh248nSlRpMoV90JT3MllmrtzLFUu4TuS/RXewUVLPRz4mM2B6n2Z0QYwKhHEpqUe2BZBHdMqZx46g9I1MtPlSRnWPIa1PL5vR96wc0a9j+aauAKhX2i+1cwLfWHfoGF2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XxNsz2iXuU7tsNf5PrIb9rCd3gQXNN0K8O+BFYOczE=;
 b=i5MJj3J4Fa0PbdmhboFfcCBDZCgtoUjwJR4FSAOvwigsObS4ZY0AJw0D0ZX4iBypy3hrUGv26OoyOIhB/fSs4OFTwvTbUcEDdLtBJibXaUygGWo5BkowRY1nc4uWIHIZYSNdapkP4qeglYxaUNgknT1F0GYOF+FxW0hApotnL7Anvv39ddiNERdkWoUd4ib/HZ1+8/4vDEfN4ubYYZImhAizd11bG786irRq8f27/dGBVoYuMmPAgjew8rSWJvFqFd0948ZIssbggHoHh5konsnRG6P5Z5ieblBCnP4uHoH1ZeWkPmtgcNCuCL++bKms/69JS+ZYOjSuik/vrEyv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XxNsz2iXuU7tsNf5PrIb9rCd3gQXNN0K8O+BFYOczE=;
 b=swWG8VQHljSIX8PfjYLgRRB5wqcdfMEyFk+pv+mkYm8V/m7mqRomhSph0aSJgOxJ/WgeUAWIHjdZgiUJ4DQBD0slrR3gOUj7JsqADI4POGnTQOMXkef9sUD4aFUwZXdzOD52rzkzrV2YuNoOfwk76QTBXIpjPPFvlDgGq2YPdGZcr05VXdJNQ9RsRls1JWMQIk+HamS+JFzplhjL//KFKalvwd7ugyOY2dL98XnvktHTbtuNaG3fwMFDlckLlf7LLrmbs9etwCfbOasUcjZImMppKfpE2AxgsYl7DlrMhjVt+SSe4GsDst5mIFBsq8OnLgh8awLFfhuFF9rUmmGdyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA5PR03MB8451.namprd03.prod.outlook.com (2603:10b6:806:476::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 09:07:24 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 09:07:24 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] clk: socfpga: agilex: implement l3_main_free_clk
Date: Fri, 22 May 2026 17:02:54 +0800
Message-ID: <9f35b944a8bfc79ff17e645d2d3662824e57cffa.1779439821.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA5PR03MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 876c336e-d73b-4ac9-d873-08deb7e18989
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XgGNozdM+/3lwcu9Dln/c3AYd+y+ic9IqaJJeJeBIesQr6lB35WD4pjn5vyORM5RJDiDFA4CK4jqibYLnEUyRvFtZM06Kg9W+5zypzRHfUjGNmUAMtDnsmqxyztgjgmUBxx+ywDzpr0FkFPyub1kS7q690eHUu96BEU0MGKc4QT5UwQ6MRtn9mtUsKbivTe5X5j2vo5jzXZvvPEKWnbse8DDTxD+dZMxOEORG6R9cG98WfIsdBFV6XQcBUS3e37vNbeYZZKdIaryP/4LI0U0NaGbc5ZpPoyBXNmKE/nM2g3dns+qWr5hMg0Om5QjhPAYV0spjvDndEPgnVS41kZvQmQSR8SXJT73tbQtmpR9adHzpEfYzXH3M6fAdttKv+N0pRliRK3ufSsMr2USHT9ctQ7fAoUfQCT2YLBHD1L0KND2ZmUOz1HMWsCYqxogOIyO+CbCP6aW/d0KwrpyzyWBVzrlBNYR79gES4w9RKpW3J54aCwGTcDXJ557NIxJUdRf3T4LZmBjdERb5Vi4imKE1sbrR2Rj+2Fs+fCQ8PVe+FG5Pu0ufxHlDMkf0cj8kM49VkfjgE+9Y5eIpfn+QiYeCqPd/DGgXkCHMhhAQx7OawS4EYrr8v8rS1y21/2SfMFWsoyiUYBVfTA6bQfcuRACr/1LAIPfalcU62LsNwj6FBIJLNEs8a4+BXrZ3iRKlOvn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jz1+2OUIzI2149JKrE4VHLdQl3ZG/p0XoY4sylJXDPAg0kcUuZrc6ffjMKJb?=
 =?us-ascii?Q?dBVzj15aiuuRdRahMOFMRmd22X5GBsIGM4/ssiuumTX1TJaW3vFf+Eznu8wl?=
 =?us-ascii?Q?oPqnS3eohmNj5DugdHZJ7XVKatrIB3i3lGQdTIyVPgaEKQbqqKE1SxaD5DUa?=
 =?us-ascii?Q?7pqwyh+hOrS3YEgHhBL1l5cyLKCBZQkSf0Id7lqq0kAoHi5iYm0RkZnO9qr/?=
 =?us-ascii?Q?AkLnsEPK/8p0y8XO7pwkSKbhqoX2zylrAkomV/mpYBKNs7QWGT3FakI8hHI+?=
 =?us-ascii?Q?7OTLEv5zJu8LwlANDY5UQ1B2NB2DZQnAve5n6ODnp9CpozULtm38k6Qq8e/U?=
 =?us-ascii?Q?+rINYxFXfh0e9mauOI+uDTOqzKldgBakaWrR4weQ7KTR9Ef1rDcia9JzkWBB?=
 =?us-ascii?Q?8gVmSazwEoGvCv6/DSJahlBNpe8Jg3sQgUjTeuhG0KVCcbp/KvTxukqBChLD?=
 =?us-ascii?Q?Ad31XpH06Bs90VcLOSVi7qgd526ayj0CXOIb05Hv0pfXQLSEiRKOOaejPkt2?=
 =?us-ascii?Q?5asc2nQJ44fIg2f/CTLUZVnBqaYUy1jy1YQYaI/sA255iwL6xdTX2QM0pxj7?=
 =?us-ascii?Q?zmEsj4jgHj1EqSjxlyz+zxk3y7faBq0cDD3iX9EATnbrcngMnXfkIh2lIK/2?=
 =?us-ascii?Q?DwoeHuhoT2wvt+s5OUgaZcIQXclUwhMeqwDDQWddsz0xuCBMAlwV7Dn45hhy?=
 =?us-ascii?Q?1lvQqCKaRtQ/ummAGzOfbsWRqLJWSvlAqnQJLBSyvMzlv/p8fhkIflydK2EE?=
 =?us-ascii?Q?KYHD+e9vNOV2JPKKqRQzbZWIsxCxCLERF3OL7unRWBYiIvFa4/22xrhebyER?=
 =?us-ascii?Q?BQj5+Z7GOBzijEkELRrM6QY4SlWSpFh8HM13qpMWYq2JMkMbznwlPDZ5OZNm?=
 =?us-ascii?Q?QSh6z4SYvgS12Mk06LnDkx+niVDwT29F4WzPWknqgDJMH1TkUpzI7sDFfeI4?=
 =?us-ascii?Q?lvTOJvYE1sLiBLYuK0ervl+2elOswaB1AILBJkaI7rAfdhdgz691qISIfgZf?=
 =?us-ascii?Q?u8Cpy0MGSX272zON6cWIng3hckO79JVHhNl2j3neO5lXvVh+xqhqykVB91BU?=
 =?us-ascii?Q?xUD9AcTLpPgpoOSCKlrWTEgYyjHv4o/8gjebCA+x+hYS+IhoJhvwD3i2UsCd?=
 =?us-ascii?Q?VcIKQi+gWTXZuu7MhbJZhf1YRI9soAPXihs8nlS1V+p1q61dtlV4/K89XFfL?=
 =?us-ascii?Q?5e0WvwuA51tEDFFmc1vJWIOUxu2jhTyoXDOm6ErUJBPIGMRjt91s25Ic3arI?=
 =?us-ascii?Q?DnfORQmS3yBXHB3Lykxhh7u6fQRAxYFN8ahEZeeAU+zuUlTi1BSyIWVw1YdJ?=
 =?us-ascii?Q?+oGXu2RZOFQTRmz9zLBIoWYZ81HOitRGfEqhmHMi2Jj/MwXoJCFxGSE5xXy8?=
 =?us-ascii?Q?w9+F5j+ZWcAn0VVCEAvk+Nt/mbjom6NdDR6BAAj0mZ1roj75Kp0OAl0BV4io?=
 =?us-ascii?Q?yeRyI9nfGkhWIiM8jp3i8D2MzBfEIWh/+2gc4DouFgtGRCR4qQooWWOqoNyD?=
 =?us-ascii?Q?obHH3T99NkVS/cRwZfuWAl6k/f12y87+I+2sB60JTPcVl5Ez4Dk2yxtFwG4i?=
 =?us-ascii?Q?AOPP2/Se+OpN/youVtrLLaBm24T53i84p7UpVTGi5kpi7k7b3KRpkKpKyNM/?=
 =?us-ascii?Q?vSkp3rMfRnG4FaXOujMXycfuzJ37SOiSZViRPv1YxHJnavBT+7jSgxo+jtVk?=
 =?us-ascii?Q?7S4UhHb+Vorq1yCRVXzeYHvN1UvOXHkjG4+atY1EI+GTZAeUAivvsswWeRZ5?=
 =?us-ascii?Q?UxGYVh1EywL293Xv0SxRjMRkT5vZxOI=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876c336e-d73b-4ac9-d873-08deb7e18989
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 09:07:24.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mgq60GjJhl/taQAm6n/D6w+CY/opBBmvyg4K9hygumOKlnjUdzzueMWLaaO4lxSrT4OC7BFuC20I02lMGW+wlPRuz/A5ngz/9bx7QtT6asU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8451

The AGILEX_L3_MAIN_FREE_CLK is defined in the dt-bindings header but
was never implemented in the clock driver. Per the Agilex TRM,
l3_main_free_clk has no divider or mux and is a fixed 1:1 derivative
of noc_free_clk that clocks most of the interconnect datapath.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 8dd94f64756b..2bdea1997b5e 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -259,6 +259,8 @@ static const struct stratix10_perip_cnt_clock agilex_main_perip_cnt_clks[] = {
 	   0, 0x3C, 0, 0, 0},
 	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
 	  0, 0x40, 0, 0, 0},
+	{ AGILEX_L3_MAIN_FREE_CLK, "l3_main_free_clk", "noc_free_clk", NULL,
+	  1, 0, 0, 1, 0, 0},
 	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0,
 	  0, 4, 0x30, 1},
 	{ AGILEX_EMAC_A_FREE_CLK, "emaca_free_clk", NULL, emaca_free_mux, ARRAY_SIZE(emaca_free_mux),
-- 
2.49.GIT

