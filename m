Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021105.outbound.protection.outlook.com [52.101.57.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AF33A005;
	Wed,  6 May 2026 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097963; cv=fail; b=ET2wQkBsD8kq0F/rM85LIlUlmEFbQ97TRHH1z4mTl2sIrSQGIe/6NqAbNQvuv2r/IHjS+5gNDkmGGCetg38G2/CbkTtxpmuVxsWzAMX6VNZbrhUUTjPPJffTwOelWWwsCPTtNM56Y3bBQmxGQEkmRuFsNOmWH6MavvestsrDiFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097963; c=relaxed/simple;
	bh=OlsfvomhkCYKuZUMIuDxSWbeVyTCMBqvJR85cmJlBgU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rEzCgGnq9BX9hoEevO7k9DkqZQpOt60/fcljgSSF4fd2VXUpaR+G3y4phqQvHqqvNzI/SSXWOrzgh9xZpscmi4OvJATPHKzgns/vg3OJO3aCQAEyOck5R5BOINPkj6KBydaSX7CRPGUh1kCZ5yYjhZRadGTnOHiOZaa3zdww4dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=ScRjOHn3; arc=fail smtp.client-ip=52.101.57.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="ScRjOHn3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhPd9zr7bdbZ9srihwd0KWfbsNhseoYqw1FWSfv58r50Y7zR0CA2+UEEMsGIqC3lGK8WGpee/fmVpXmw+4IYipb/GDBy1rUqV8uHpPImlkajbUp5EmTHH9RMT1l6JIUV26icNuyWDzCRSCJdFbnWuqG9sdFFnTcDFvuJLScQbDsKQiHEohi6V+mOn/Hfxz3cDZjgYRm5jjS4aI4YK5Ye+2+Z7spEng4ar0HPYpRHG0iYKfHlLXts+6jKL9ohsEG6XRY9woZQ1eaqNbuvL8bd3A3QDxan+NQva3eONvbGONdupXQDI+qLT1QZIUtvnNsSubQrdPs784i6XbhLguIkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+9b5zzrb/0B1k0xtNQ/ysdxsC4W03HpPIPeiSvLbhA=;
 b=EbRlyv6f90seAX355BNW4UrxcTpDLuuc2Dm1J2qB8Hoy+i+D5zmklx7p1B2zdpneCsWI7iqfzdZUjgzTRo14ftBD0R0dtHzfa421IohpiJf3P1e6QZ49KwIgfI0GlmcH9rfWAns4tRBJouMOETRct4/QNXBKwKrPFcYp78EI61R7/gJluNJCCnYfxyXlYZcr2s32ekpP8XFGLXmeDScuRzf/wLQSKFCSwB/wbuo1T3Fy21rmDb5p0dd96OU+LUl3qPa689XB6pqzSyQobte76qDBDOs384cUw2Jgw2wjKn7nmn+xkP9GnAzS+Ojo102h3ASOjbrM1osbEUSO4YIu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+9b5zzrb/0B1k0xtNQ/ysdxsC4W03HpPIPeiSvLbhA=;
 b=ScRjOHn3PqU317ebccUUhdAOSyyJn/r+rqJjfw7swYIEljCa9n4piEzwSH3+3C9mZfqQ2B8WpHYncw6QTCJ1AZOIBy2dBwI+eGUAvvi8H/piy/qT8nFVh4zn7uUfOIFoOU6r9vPh43igNarpTlcTWt9OBK1wOAsUuyZQU/px/uw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796) by DM4PR10MB6278.namprd10.prod.outlook.com
 (2603:10b6:8:b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 20:05:57 +0000
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b]) by SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 20:05:57 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 0/3] clock-wizard fixups
Date: Wed,  6 May 2026 15:05:52 -0500
Message-ID: <20260506200555.2558434-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::34) To SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF2BB505D96:EE_|DM4PR10MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bb53e0-609e-4a69-4cec-08deabaae2e8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	zVW616/y6RGtS4mTPcqHHSRayhjHrQLnODqanBGYgVbXxegnmWj4PBa0kxAkuv1pbh1oLuUbXuIcOeCNkaZaNiBbW0a+XQqequY/+jQKYQz7pxoT25Kr1/wVyuRMhsVwV33XPAfxs1Vt+biEc9MbH9md3VazRYrnHvEwN4cJF+30RCyVmvY3IidAHhHNjN0qDaX19INDldNtYaeLUfmSWtNPnFPAeTrirzD7M5XPg5He4bq/U7r4dw0h5FwN9d80sOb/NrPkM75ftj5LVlgfK91FOL3ue3f1jukkT2yk5Mlm8xFCb6AVdJCR4trNQ5d1qxugFPsFzhys4qwFxj0W7+lpT75yw5ro441DrOunWFABPBBMJEjylAmhoceEhNxWJNmCJMVq75/PNL9+Kd5PfQhmfeGMCB1bO/bcTDkdwVUd3cqbT7EEZEnIzNDvBm1E1SyryMY0bUDxtMhoNwzsqkmYKSUF5sAGPKxK3kGhe8nOQVqHZsrwzkqRlzI+ij/lEJTdSUsXSz6qao6OySLp7VRGzlp+RB8aIKpH94Ylv2qG0dGGw4uZbxvSi0mkYOp7OOcpA+PFYxTcHmfRJB9HhmFh5eP/c4jNIC5OA3T4QuzDvGTnEuotVe20uYCb0HO9JofySUwGM6DeLqNJJaUDaesYswLO/9mSUVEgCC6oBNKEDDyvrX18OZpWiKBYxIF3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF2BB505D96.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oktvF003QibFldx9PbOBhtI2SvEpNTWm2OLh0fCF8xeJG4nFSsdM9JSlsc0K?=
 =?us-ascii?Q?CH1jLmcAq02cNT6lqYVB4acqsoovNYTnpOGIeiq0MVuRlf6Lr50hAcbBXZRg?=
 =?us-ascii?Q?wr7rv2+q6k+0CfB/JJwmOnDUfPeZF/9jE39JjixLboBVVvz4L7+jwqHlWQb+?=
 =?us-ascii?Q?8g6uoxHJJWEGciGhcyANmsStP1BmnfBbkdcWw/5AN4hBofjuLiHuWDLfMtTX?=
 =?us-ascii?Q?DWZQBh7BVy2Lv4/VuUtK3six2YQg4mRI78zSNS7yTHuzkNR3a1mDU1Sue4Yp?=
 =?us-ascii?Q?8FPwntkPMNuOrSEZWkt53VTh9P/ZHkBQh/Qj7/ul3b3iNFNhWElmFBX1+C09?=
 =?us-ascii?Q?nCVufemmvxykDEMufgqWsw4D2yEtHrT616qSFt48saUAoS2N6DrXy7eSg5sU?=
 =?us-ascii?Q?63os3hVmv3I6gWdEQtVECM2dHUbQ3r1BpJU085TEVAs3T40HrnHTsLZFa+R/?=
 =?us-ascii?Q?9vkrbtE7kAjC6uzMbc+YhDItTW9bUmXvN//hUXmidZZnGNB5KNmWjfV0EIAB?=
 =?us-ascii?Q?0FYNRN9e6M6fQnr6O2L5mUCrDAZh4PjwEa8DJ/0QVo+M8yYMUH+ONJxa6ANK?=
 =?us-ascii?Q?TAq+KIQ6rA/gqsji2zje50ENKL9GiugVUwrhgLzIVbr60FYc3J0ZqPbld/S4?=
 =?us-ascii?Q?seTV9rpiqw0sPRUq3pabRYFbUkfIF2E47i24wxan/8wmRNl49iD6StfoASBo?=
 =?us-ascii?Q?PY2qI5HYW/mp7WhtVU93NWjTjijzaQRfDTu8n/j1yB6UoT7dOTU8+VXEhs6B?=
 =?us-ascii?Q?6TQblxYYtayT1wGt0iUc7eQSVAW0KBZtPLNAfRqskFoA6vaVv/NRwTacT9ky?=
 =?us-ascii?Q?LV/N/6zUyTPFpiGLswLZTeqV9DQm5zBYqrQv7IR1+InLO8CwZI7/4aIHci60?=
 =?us-ascii?Q?FUIp+bzBi63EwzYY855zGu40hGAijGt18+NXw+SEXFqB67wb32OvEZEvLoLv?=
 =?us-ascii?Q?3Pd6pde/HchwYxEsiBYoiyyk63/tIYDvLb3pjqqlSkmWvuidb7nrgQ1MqZF7?=
 =?us-ascii?Q?Kf+qMCYrLNfVFxA5ZRjLjlFt/BN7s161NInB7zoFtFa5Lv/SJCJrc0YxwMjo?=
 =?us-ascii?Q?b4KTyNIPbWtOEe10rRAJpRi/XNvX4bLR839NzX1kkvdxmhnW1xjM47OI6d07?=
 =?us-ascii?Q?C/1+aqVrqjDVjhOgjHQTNbFbB3Rd+Q9FZZdN/GDboSnc0+XbjW6bpz6mTo8Q?=
 =?us-ascii?Q?OVw+bZDIulnDyJuepwPuLHlDmjuHdS4EXnOGYimcnDlhqT1KLcT4Bny+ijAy?=
 =?us-ascii?Q?m8XtjRr6ftKDtvvP5gGFDW4sGmzZ0dnkchNWctFKAS4epsuDIft/DQkFidTQ?=
 =?us-ascii?Q?YiGWspxGtMyGXEkkqHkaeb+Bn67gcCABRHseisJKiWcNb41ZHBw2fK/I2j7L?=
 =?us-ascii?Q?OVO7Gk5v7F32v42ZwjIHDrgoI/oRQ+4ssYmhTL3rb5gGrHcNt+FdeOIsJ1es?=
 =?us-ascii?Q?nNM61cOTi6QHEqDLSwbn1lceYUFpGY7Peki+ZwXeZZE6jDxHS3qYVaq7MJo7?=
 =?us-ascii?Q?3HqvRtfT+DV6E6sXSKwyTco/090nTOlS97cCWJJs+2diKC6cuD7V3wJF1Owg?=
 =?us-ascii?Q?jXTGj4tquKxFdmlxJhnYp3hRQ6wJEu6+3PUeTEB28LiGesEwnuFdvBK68jAp?=
 =?us-ascii?Q?da6fJCebbSIt+aO94OymA5eIgT9Nt8EMjIucf0C4IELH48ZNwntXHJMuymSq?=
 =?us-ascii?Q?IRBLoinVk2Km14V6bdP1QcVKOXn0Nzc0RL5CzpeeCop9+FQj3D6LwzRKR083?=
 =?us-ascii?Q?E1aMfATFRbGcB1RnSobRf67+KvdwM/w=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb53e0-609e-4a69-4cec-08deabaae2e8
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF2BB505D96.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:05:57.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQbiwhKlKqjJaXqjEcD9wx2I4+byUXyYrEBJpjIbPjFZKFm7EDWFBrLV+dinynydQ1HXpWc+9VXRLfZ3DbJdNvzkwbCxgg6f8QgQU/GMFHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6278

The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
led to out-of-tree drivers silently failing to set clock rates instead
of dealing with the best-effort.

Remove this 20KHz restriction to match the Versal clock wizard driver.
There also was a bug in the difference calculation that is addressed in
the first patch.

The second patch optimizes the search if an exact match is found.

The third removes the restriction.

Colin Foster (3):
  clk: clocking-wizard: fix clock difference detection
  clk: clocking-wizard: optimize clock search
  clk: clocking-wizard: remove 20kHz restriction

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.43.0

