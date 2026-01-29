Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023082.outbound.protection.outlook.com [52.101.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651319ABC6;
	Thu, 29 Jan 2026 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769654190; cv=fail; b=YSSbCVOMrhWqmPYAO3vRc7szUaYLFk4DLMAly0HVLyEJ8YmTqFe6dHifVBUJraNtOv6d7D//QkBEbHWhK5xCYzMwmvWIS5vyFidKLfwGSfusaEImM2pM0wxj4Gpf+zL8PGnQCB+QxTLpdt90hUOq/RWGRMYAecbB2H5445o3jKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769654190; c=relaxed/simple;
	bh=cdOPyv0OMVZs5hobrYxZixGK1gL7zjxqm/Kh8W4BNwk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sNECdKWlZqdD3x1Pe7vL+os9rl0uCYaKPrvNz0n2JQx85rl7QC21u6iiTP7/Nb5RIJq0NkO69dm8WHmjj5mT8o6UnwJIIK8gI5iAIJhsGHtO0qLtYUi1vT35XPnV/m9Oe06I8ig1UgTIGvdqUPoFau1gf/sWLsF7cDto9GSzfUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=jDu5Jz3I; arc=fail smtp.client-ip=52.101.127.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="jDu5Jz3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfePcycqlFEkA8ZXNFA4qUXVvrDO4FcSJjvAPGSwBB9yKXEZ1RDNUnYHqIHST7pOJXl1bjgYoGwR87dlk6uNSqKwuDQPMfJa1odTwgHStQQdqVj5zpKTHcj+VcvEAIZ2hmdXO/Es/wgd6JzwNvZJVQrwmVk7/msLSbgFJ30ugCnhseJh1MqvzgeDoukLiUizAyy+ACYU5J/DeZYVSPrDvyFlfBwUjyGh9/YfmJ2yfZI9dzRzdrE78XTUttxwPduaAyz+cV+8fgXCIjKqvmjQruDDBl9wBIYANluOvUcJYL4QjQ3fLkTik+Z7pt7vca2JMkvwyWPi1JFUh3h4AQ4Ghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBgYxkzUbzo1zUO5M5erB4Qcr7l1HQCBUW9pVxWnsnk=;
 b=BgRW4z070YniJ3s6ZmGvjFGKPtr3a/m0LpANqYkwxwR8U6cESIkhsTJkRMGB+7lEIPPVszEz19kM4vMNWc0vjZwzhZldpfZIz781Gd/oaUNmwx+SKd3/7R4cu15twfUOi1kShXQYSN9L6t9MWbSza0OtlfvmR/OuK5ndnqX6hVWex260Gc6tgw2Zsgp1vNCG49qshuHyFEpbZATvvjK6vGtLZn4ZuBHzK16VW9ah1KsvEzLj6gjdWwXObPjg+Hxqua67hATNB2CfpbMQnfFcQbxxlt12A0EBlKn3y2d4CYbrZhqHmfKKjBcEiSYKPA2etn9NV14E5YoS+KiOc1MFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBgYxkzUbzo1zUO5M5erB4Qcr7l1HQCBUW9pVxWnsnk=;
 b=jDu5Jz3IfpoVc2u2QjEPOdz1iXX00gbgMIp7ajdMGX0Y446I3lzDNwxmhsShWvdc39arRn3ZgiIU+0Sa1fLdz0G2MTKI5V5TQIa2sUZ13tHsVWB5eqAEEKMypW6aW6QU8EJyLGLqBgwiT8TWcVeKip71HYkp64xhhZuFotZSoTihIP9ef3ha3wmYJ5lArhwRJV39BrbgIZfQfdQVh2iqAn/n8kKocpSCmjD38CGTadeVLgI5ZuCGNewBxXvcJXNZGbtQCR7zUV/XfRzyLM/BEdpv3qLr9lywTPcfGntkinySDjAbpLNTbSzO4OKAlOJYsv+vXG7M/P8j0i4glH5lJA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB7171.apcprd06.prod.outlook.com (2603:1096:405:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 02:36:24 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 02:36:24 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Stephen Boyd <sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ASPEED clk updates for v6.20
Thread-Topic: [GIT PULL] ASPEED clk updates for v6.20
Thread-Index: AQHckMdmqYAIy5xp9Uacq7DQdH3nng==
Date: Thu, 29 Jan 2026 02:36:24 +0000
Message-ID:
 <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYZPR06MB7171:EE_
x-ms-office365-filtering-correlation-id: 437b5422-daa9-4087-afff-08de5edf3220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gTOppWXBJSF6ftQGeAw3/gKNQjapw2yqVxmGkqVPKmFecZsWgcBNsSRhBz?=
 =?iso-8859-1?Q?+1PTkhKC6dOcfH/7psbOlKlhTceslXNtqgzWhg8ANX3JPNvqmGwO7HqI/r?=
 =?iso-8859-1?Q?ChGQ+Oc18GvbS7Hr9ObOMKPQpsux5C7DMO+i+ZzEsT2xsPtZMC+nNP+k4G?=
 =?iso-8859-1?Q?LM1SvqoP99UezxF2D+72VOBKtDWqaOeYHpdIIGXl9RbOM0T/6cpXKBJvon?=
 =?iso-8859-1?Q?/6LrBMdX4TVg9nmjRpVOIMdg9kmGxkB8m7IpW20QlROor5vjnbq+Os/PU1?=
 =?iso-8859-1?Q?MNy0srw2bUkMj2obGjXCl0OEVsHmutDZzOHh6O1l/jXXMIXDrdxKA+MagJ?=
 =?iso-8859-1?Q?6W/faNY2p8RUQ8JHPIoLxp4zXbA1iPMHjZisFp8OFrSpEYpifzTmTwC6PM?=
 =?iso-8859-1?Q?9FA2XO3s5qrDL6H6F2TG/zNPo6vb8qigtYUoURzBBp815z4jj/+t3jcYrF?=
 =?iso-8859-1?Q?4yhlmNoisOopNcmGuv9PrHnl2ZDn4vVgy3XI68p3LInF4lW117/YZgah6+?=
 =?iso-8859-1?Q?FTL9mPPFS7j89JZluXn8DCNuC84ImzefNiyc3WlQVqoB/re9kONNjBl4NI?=
 =?iso-8859-1?Q?Ger+whdagUP4tcv+54hBY225YJIbyol7b0WVO7PpN+VMpkvAV/iZbb+ujT?=
 =?iso-8859-1?Q?RX0ius3WKNIvwqSK2lXbqUzGG7aV0zDytcFVyd4S4YvoOjt3nDZdJpebUQ?=
 =?iso-8859-1?Q?JS4H/Wj2rc/yox+jYpMdr4Ia4Omerf1J6efu5ny7uwBiQvz8zIrkPEAX0H?=
 =?iso-8859-1?Q?y35CrpUGmbiQdOWMNy16alucSJa7UFqHyyQK2hpP+5GBomJKbDSRgWOnSP?=
 =?iso-8859-1?Q?z4V2SIJbjOtMlkaa7M4fCsXZEG31ZWZ+kTkIJD3J8+Ymp8O5Z+ZFe3/opa?=
 =?iso-8859-1?Q?/yiaMlN5T0Rjh92kQ9Sd0EZd1Fgxs89DQSD7oBvBWKpzvJhCGZId3bxZqn?=
 =?iso-8859-1?Q?jwnBat5WUocofaia7ImoJ94/kZWwvC1P1N4aDJYnFU6SuEpkhrHzCPfXNR?=
 =?iso-8859-1?Q?y80/CTQ/yf1WGxdWfosBMsclTppkphoq2urEWmdZ6QFhCOL0AbvyZRHxrG?=
 =?iso-8859-1?Q?cOmNT2CuYjfiAhcu0k6JtPAmDAuUDxQaxMIqGgzjeU1C0zZaTj5Bil9h2u?=
 =?iso-8859-1?Q?bwG+xZ5bmwJKKcCuI+n/PZJHOn5Ap1Z2MThfp5jO5mkBePuBlFGzooQVgy?=
 =?iso-8859-1?Q?Zgmw51z73ARvNgEtXeW4PbxjdqiJVIwLtbh78Z42uChkmTbBlB8GNXz2Q0?=
 =?iso-8859-1?Q?4zqLyOPgyES0PuzkWZxkJcWclSfAahfXPvmzUaQLnAwVrsl/PQJadWZkOR?=
 =?iso-8859-1?Q?rIvZWQc4Or6Pe4iwIASVN6qb/7IG6Vb3BwSG8muPbWyuIYRe4ae20Wk2G+?=
 =?iso-8859-1?Q?mjMU3bBByDkNV9vjV7cLbST4zdlZXTwwYFkzClDO5exIJaOBmQhzfM9VUq?=
 =?iso-8859-1?Q?V8PTNFJaKgnx1rT8syfmhfAURpFq5RjbjCHWdVws6CYCvli7GHZA2Xe6P9?=
 =?iso-8859-1?Q?5xMUZpg5HM7gd9FbpcPQGpNRGhnPv6koLdBKfLqniVLUndkmLjpt6az6LH?=
 =?iso-8859-1?Q?fuJ5q585ahgsJF7S1O7CxJvg3vezJGbMQhVWW4LXJPLRwWOAHu/3msFERn?=
 =?iso-8859-1?Q?3xjMlZpvxNPFJ2l/DYyer5pnkV/kDgQ4l0NFeQgVvvxDCeGXZ1s00SgUmA?=
 =?iso-8859-1?Q?wbpAD127sZB0fnos98Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bdrIfeNnC7lW07eqEhBWt8f+7FVxlxzVlGCwBKJeGXF2hels317sWrWnX7?=
 =?iso-8859-1?Q?L7s7ABloQDDGmJ3oSjuTouqrwaQI92Vj19VfYN8fJ24DjC7P70w3vCQG4k?=
 =?iso-8859-1?Q?11gV6yxloUBDUzDYSWjM17vgOqahUQdahe2uRoncjhHLbQegvLDFrc1qYv?=
 =?iso-8859-1?Q?nYCi895MRbBhjhDqaPaWOUTDp1XWlraGx8F7t9qLfX6JYr4l8o9v7Cc8kr?=
 =?iso-8859-1?Q?V8uiyu9Y+jfqdi0OGmKvmXZGfXGcdIXdF+Ijpx3aIP8XK1AEDc6iWhcMCa?=
 =?iso-8859-1?Q?JL9kV2tfOVKmMOiaWfq9a7pOByp5HFW/KfD8aGza1IhOHuMWyW3/zh/2VC?=
 =?iso-8859-1?Q?lAFEvfsK5mLEimSncBmwfnqLJcO0UOSCQpc1fqyd/NixJLhdex+uw2v/hw?=
 =?iso-8859-1?Q?83vaKu5wEJXwvkM/mhKu7fyk4ASfFQTXHzdnvdeDlu7NT4Inbig7Mnto9S?=
 =?iso-8859-1?Q?b4juvUkGMuWsnLnBwECUyqRhx0DAxRp9V9SMOoD2vSRQk9oiqGDTs+71+Z?=
 =?iso-8859-1?Q?AU92tTCUCktIbvNfIU6/R54NTRZjuRCveM3z2Lkai+Vch/3GX1FHOAuEp4?=
 =?iso-8859-1?Q?prYWA2g28VhszjnqBSFY9rrc7ZHaG/Gem3iNiaQFZKOKi0lo8t2M4NH0WV?=
 =?iso-8859-1?Q?XWPmZEQaf0SMAtk+1oYpYLm6tgW3/geZ8gP1ee2eEmuYJeDRAK/YSIGo4g?=
 =?iso-8859-1?Q?nvgNJ1TtybRiaDIHqRNUl0K9Lj80k69cCHNNgJKLgXiQpJ2q8AgWu3Zj0F?=
 =?iso-8859-1?Q?xy/TimWsbxyk7nS2VdAYXpTf7bDTtm7HHk17XhAA32+K+jb9xZpP8WoLEX?=
 =?iso-8859-1?Q?B3vVN76EIR5Kt9/FpBgX9e3289LkmvbfAwqBkk5dwTlOoBRnqhpuOrtLdY?=
 =?iso-8859-1?Q?dblYuazdCoV3JJvcQoILCg3TXr6SmWp6yplcYVRdTMRexYvT4OjY0/3Z6R?=
 =?iso-8859-1?Q?KJqxPqcwldoZ/R+q871S1khBWwE1LJBDGZiouVRiWSTRTzqRQxG0ZkNi+6?=
 =?iso-8859-1?Q?82qn1DL+CPGnzdLHT5shTohlNefSm+YvG7+7kxpL7LwWvIpfqePBM36rMB?=
 =?iso-8859-1?Q?uT+RAcHwbejC+OiIbQ4gpjrGOlMySeXvFKFBSmJ2aJEDcjVMJygf9jyDmn?=
 =?iso-8859-1?Q?tsTPguH4d0s8oZRMdfB8Hc27WT1GVZ82I/0CFs9Tb0Gzl3HYu1XRatvTlE?=
 =?iso-8859-1?Q?qFFIIq4/ZXVWUWCunZ8j2U8jgdMAqD2qYsN/o9U7RK9VYAArkSlfqv2oOR?=
 =?iso-8859-1?Q?wNTXM6Xlb1VNwy73pRwuVGHe5fQj65M0/9tvjnDk2c9+7/PwzKNYusRqGU?=
 =?iso-8859-1?Q?Gy5T0VRZL/jsOjK87XeGqQtfDYHCMLRkX0eTpBJELtJwU1xspSMKezW2xB?=
 =?iso-8859-1?Q?69ISLMPdeS4WIbsgaAyyg8tkcVVzesDPSg1u5NSW5g6ViJ9m1XJWJns/6Y?=
 =?iso-8859-1?Q?ImVz8DNii5or7eLJjhEx4KYqQ/vP3al10b671V9QX6NksSZlWzvliXaYwl?=
 =?iso-8859-1?Q?dbziOx8Yfs0U637rFeM3HTGDkKBiTvgGy57NUHXPCCYl1vX2ooO8P24TGS?=
 =?iso-8859-1?Q?WxA/Xyn/n4MLUaaydoAuevUfH4hklEIXWOIhURlPAX4/XGA9KjfHrw47aB?=
 =?iso-8859-1?Q?SFYvwRzqz0MjnKhwGPsWHZvmrMeznuomaellNVLPZ05ApP7lWQKWu0UAin?=
 =?iso-8859-1?Q?UMijqJJfRMWp3KRUkgOlsP5UqNrDGJt/zazJ/R6H178d2FC/r8NmZZtGco?=
 =?iso-8859-1?Q?RVuHO/R9YeUCZv3aas9zWuzK3Xlu/2iy2L71O3zmnZoIbJOVU1fNy1X4qA?=
 =?iso-8859-1?Q?fHAznsL7Rg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437b5422-daa9-4087-afff-08de5edf3220
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 02:36:24.4497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/7t8Ohxs1wpEHMAcf7AeTo65jTsiQeVar01hUowh1sAlGRNE5SiHVejNdXBEsyoBEoAKaIhM9/7kSe4YNaWk7uf1Nr27mkblGEjp3A+UrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7171

Hi Stephen,=0A=
=0A=
Please pull the following ASPEED clock driver updates for v6.20.=0A=
=0A=
The series includes:=0A=
- Reorganization of ASPEED clock drivers under drivers/clk/aspeed/=0A=
- MAINTAINERS updates for ASPEED clock drivers=0A=
- New ASPEED clock driver support=0A=
=0A=
The branch is based on v6.19-rc1 as requested.=0A=
=0A=
Thanks,=0A=
=0A=
Billy=0A=
=0A=
----------------------------------------------------------------=0A=
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:=0A=
=0A=
  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)=0A=
=0A=
are available in the Git repository at:=0A=
=0A=
  https://github.com/billy-tsai/linux.git tags/aspeed-clk-for-v6.20-rc1=0A=
=0A=
for you to fetch changes up to dc345e213f16d3ae5dce01bb0002e46bc4eaff4c:=0A=
=0A=
  clk: aspeed: add AST2700 clock driver (2026-01-28 14:58:47 +0800)=0A=
=0A=
----------------------------------------------------------------=0A=
ASPEED clk updates=0A=
=0A=
This pull request contains the following changes:=0A=
=0A=
- Reorganize ASPEED clock drivers under drivers/clk/aspeed/ and update=0A=
  the corresponding Makefiles and Kconfig entries.=0A=
=0A=
- Add MAINTAINERS entries for ASPEED clock drivers to reflect current=0A=
  ownership and review responsibilities.=0A=
=0A=
- Add support for the AST2700 clock controller, including initial clock=0A=
  definitions required by the SoC.=0A=
=0A=
Patch series:=0A=
  https://patchwork.ozlabs.org/project/linux-aspeed/cover/20251224-upstream=
_clk-v16-0-8c1318f56c3c@aspeedtech.com/=0A=
=0A=
Reconstruct with:=0A=
  b4 am 20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com=0A=
=0A=
----------------------------------------------------------------=0A=
Ryan Chen (3):=0A=
      clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdire=
ctory.=0A=
      MAINTAINERS: Add entry for ASPEED clock drivers.=0A=
      clk: aspeed: add AST2700 clock driver=0A=
=0A=
 MAINTAINERS                            |    9 +=0A=
 drivers/clk/Kconfig                    |   13 +-=0A=
 drivers/clk/Makefile                   |    3 +-=0A=
 drivers/clk/aspeed/Kconfig             |   21 +=0A=
 drivers/clk/aspeed/Makefile            |    4 +=0A=
 drivers/clk/{ =3D> aspeed}/clk-aspeed.c  |    0=0A=
 drivers/clk/{ =3D> aspeed}/clk-aspeed.h  |    0=0A=
 drivers/clk/{ =3D> aspeed}/clk-ast2600.c |    0=0A=
 drivers/clk/aspeed/clk-ast2700.c       | 1055 ++++++++++++++++++++++++++++=
++++=0A=
 9 files changed, 1091 insertions(+), 14 deletions(-)=0A=
 create mode 100644 drivers/clk/aspeed/Kconfig=0A=
 create mode 100644 drivers/clk/aspeed/Makefile=0A=
 rename drivers/clk/{ =3D> aspeed}/clk-aspeed.c (100%)=0A=
 rename drivers/clk/{ =3D> aspeed}/clk-aspeed.h (100%)=0A=
 rename drivers/clk/{ =3D> aspeed}/clk-ast2600.c (100%)=0A=
 create mode 100644 drivers/clk/aspeed/clk-ast2700.c=0A=
----------------------------------------------------------------=0A=
