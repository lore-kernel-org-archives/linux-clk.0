Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96C039CCFC;
	Fri,  7 Aug 2026 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118083; cv=fail; b=RBe/1KG/akyu5msj9qQmaSPxrQzoAftuWyXa6+12TDdclz9CVX+1fKvcbwIfOhcn9TRmczRK2WOy3BcoHUEviuziI/3qQzU456pvIBKq5QPv8QV3XVb14f8SX7wSKdATXUuEDSZ8DnVguyYmEi52XqCZxE1q7A5mTd2iVFjEIJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118083; c=relaxed/simple;
	bh=bvEK/ABbP/JASekIsFcPMwGVg+hCp6aeS+OM+X1PWWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COR1bfv5iFAEjEjJcZw8ZqQo0czcHakrLfWFgWlzcAcisQLERJ46RNtFq/kv7Q01lJ6Cf/o7ih+IiIYydP3RxT573XtAlveK3XaDmG61b5V1NxKwgdODpkAu91oyHCQ9zJo/8ZtZRZ4zpGUBO4Ixgixm/YZWNJOtavRjPPRTrh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=H1tQNco4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ya2uNPpy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="H1tQNco4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ya2uNPpy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FK1Ps780746;
	Fri, 7 Aug 2026 10:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WlL6YQMwrUNZV0FSxbmRqFjNScpd1Jttt2/E1Q4leQs=; b=
	H1tQNco4UEdOUFb1Ljvw6bFv384jUT1wz7NLee9VbfTFpug199ywNNEMsg/Lwkz6
	wMqGfc0JrbK/S9LdYSlm0ia9Mo6qWWIUzbCMKdF7OHGNOpd9AjC97nZB1CyfnaxG
	bYRT+F6gGfHwkBVLWOrFkjq/AG8EXbKe4+EiqbGDcLvDmGsWnHPz3Rd+A36SJhuP
	sJ+WzRPQjXAxMfNw6OWByeoVlzqbzj3nZCf1qtgwWlV9SAcLaq5iweZwqYEcXDr7
	ZQMR/5PvN9R1xqNPhAcoFy75+kB+l87zEhHT+4r9BdVDOaelhOF6QEOAal7Jipwt
	aKYB6vdBHNG2rnYM38x0tg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021076.outbound.protection.outlook.com [52.101.62.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69vcm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 10:54:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEMnM0qz/Hh4DscvC7w2lipEiyUn/3ZsdynJxrC15JmaVnJpxC3ARkM8Y2Jj6JFcDZhxWaaO0Ew1TGdAXIUt/ygFFKuBlgRtewbOP9Phf9FSxrZq3v0sj8ie4YiFbvnKZf0Jkqo6giAJPb01zE40Xw80ab1M9ME6p3oxBA/BIY3T6dRV/IRBZMQPz85EQ4NplH7KrkFWacoB9I5oCz8n7OWlvj8X37A6a/x1z8NMHQUtSjxYzRwYhfK4Qy1g5f+dZGiMMAJasJgnjIFjWeT5mBobUZ8bv3wKlLYIePLYlY0n0KDofXMcFNs44I6z6NnYOVcyo0kRG2CBZIMzsSa1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlL6YQMwrUNZV0FSxbmRqFjNScpd1Jttt2/E1Q4leQs=;
 b=SnLW4igUg44pI7AJCMHoASD8TnRcudsUAaPPXEOiHCj9XoHIvQGAcoAH0i1LGWlcLWa+kKHhZrWhrYmAMejGVBjmGxWqt25gbCZAJqs4P90d4U57KuAKBPaClvbSuAF+nob9J3g2Ym9fpBLRfeOO6OxJTbPxEG36RQNGbHHZurhX31AAsYEaQJTZA0nl7w2jcLuoddRZOBoeVwKZPawgROM3gfR/4cK9cMegIWJ3ZajKnNF8ED1engTe5SA25dZlIxbL3ecmViYhknGeID8EhidASa0s7WMCP/aw6HbaQaRb2H10HGHUmp2xHX+2zl/F3Ga0XL1Wuf/e4x7491Uysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlL6YQMwrUNZV0FSxbmRqFjNScpd1Jttt2/E1Q4leQs=;
 b=ya2uNPpysiPxdrTQ79Zr6GU2z7TSwFYtekVOgtaJ6yCzOKSXqxs8osI3TvGdJVKIWFwytvAQLDQaKD+oF1CVmDn85up31oUCcovbmiaFRpa8Wf/M4f4ESKVQjpR913Ut0c4+s2O9ZDpWye6f2aFwrcS+adwcJe/5OEKSERL/Kyc=
Received: from MN2PR01CA0046.prod.exchangelabs.com (2603:10b6:208:23f::15) by
 LV1PR19MB8870.namprd19.prod.outlook.com (2603:10b6:408:2b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 15:54:08 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::7f) by MN2PR01CA0046.outlook.office365.com
 (2603:10b6:208:23f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 15:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 15:54:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7BB0840654E;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5DEB9822550;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v7 1/3] dt-bindings: clock: cs2600: Add support for the CS2600
Date: Fri,  7 Aug 2026 16:54:04 +0100
Message-ID: <20260807155406.752721-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807155406.752721-1-rf@opensource.cirrus.com>
References: <20260807155406.752721-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|LV1PR19MB8870:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed4fd43c-3b12-4627-2dc0-08def49c1d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|22082099003|16102099003|18002099003|11063799006|5023799004|3023799007|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZhGL9MfhTC18zOFUsnWh/8GuQtp49MhjhG0MeEcitU1IwsM/TGCI2rUtRXN8dFyo0Sp9B0LMQ9QteDBTdnjrmrdZpV6u9fusaylkKva2zgwDxJy4CqswNz1QwhEZZVSyU4qp4dzxsAC97V0fPgT60nHuKQDXLIU2O+//DItjCOdajqfJwTeyuAtu8gBZnNbdyTDBfjioZwxNQmKilHY/iiRZSdC4keSKzdTWznJU4DjSgjrDdtX38QpLPlv0Qb5Ocd4JZhhnM6mCltoL8FVm95cLzcmptS5bIsKTjYnTII2CMdKTnfsJ3NGBnfKI0862XrdFgINJ9QWR0YailzqoapZvUMZSknNPUhH3I12aHFYA077D7ny1sbWReiBLA5pqrRWfPovs1FglsxrKcZt0AdTSqa+waOjIcSFhEYE+miBwvsGgpvGzwFN7hp0BqiF13Ijowqura2UELVOuC14w94SREmBkudLWFYEGxk1l+aQIH0fa4X42EZX4ixOMd9/eO2ggJklYTHyI5hJCRf48PaQQZfxXAKklblFsnR39QdOIQL5cT+2VjRpPPHbiGfc657coQQNZlzHabr+kRqty63gByf1jrpzoKNfKTCWAywkMJ+FOFH/QhyRhAjGm5x9FUwecp7c0ESXYtOiJTOfyJsEWRSJ93w2iniNiq0VKVzg7txgLvapNwPQEvGcmOZaZc8rER8N/kz93fCrnTiWUKQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(22082099003)(16102099003)(18002099003)(11063799006)(5023799004)(3023799007)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JRfPSHFtUmE9TnPngSGdcoTj9HWWnskbemBqBY9sQGAmXsTRKnuNei4b54RcMRPzfhq+tsx70sQtwS0t5qX88e2ZEMucDdQs9KGSlWTpQfiIu8+hLnd3Ta8bYT/Fsb3iuf7I2dfTpn4Wh6m5ctLG+S2KVeYLW91TXSLkbr+ZPl3TIivsG2dUtwv0E8cXZR2orCK9ozxnuk/ulbJa1NROBGXI55asSNpE+nUxQfM8Z+b9LymKlg9yA2e7tg+0kJQPQr5vnUVfPqNtUJ68WMiLYjZSmKIqM8u+UklhkrLpEolciMllHOOoheeGroGSVFaQD25/t4eLz5Z/PdZBUh1jPNTDkqemnI1Z/1KDkRswKkGpr9qKUVxXQxMOtmBNUTMai8J79OYcrLyluJ8CP7V6LzEuswX/aplnPlT7RH1P8xI6KUB24rF1vgXnSOtGKR5m
X-Exchange-RoutingPolicyChecked:
	BoFgHAOnhh1TDU5JWIDE93VhMq9ErcJzT9EWTaOLLHPLJ9BY5v/j5W7MVJaaMBf/zX8gilfTi/u+PltWm5WMVTzW2+uWiwZwhXPr0voJvqYtsdh9z1RiiYQr32xlAqMUduyeOm7X3/EzTCDnha1OLTPvNWz3JB0dWTLZjidzoCrqt5fkStzu9g8ThWM5wos/jiXl442jcJcYRUgRI9mNWY1xWYs+MroPXi8JwjcOn+/+PBiYL+7ER5HBqVZKxf7bPWzrIraqFhp2f2Oz/AgAiN4crwOLxQoG2dENV7IwVxHCfL28TtmjgdAFqEOFR9GgDvoZiGmtD4Fe7g/APZfZkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:54:07.3103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4fd43c-3b12-4627-2dc0-08def49c1d33
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8870
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfX/Ms4dWcOn6km
 0UrZbfVv8SngmM+VP2DqKFFFzv4/GRxhuBtwFY+nWI82n1FLscsU843U7zjmEQuFQ41B+c2EdwJ
 5tdybCBNWhkHshaTpwoYmke03pOGUjU=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a75ffaf cx=c_pps
 a=HbRg4qzSv2wm5CHrpKeBBw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=KKAkSRfTAAAA:8 a=2m1nDjGlFl8AHmT1t8gA:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MLOjP6ZG8NW0eeQvMYs81Xne_K1gOT3s
X-Proofpoint-ORIG-GUID: MLOjP6ZG8NW0eeQvMYs81Xne_K1gOT3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfX88srNSepd5cu
 zIh4M7j91BNGXbjjA/WkFoLPQAUCJ2JLzb2HxRpwFRNxXmcqxh5DC90jFDCIQAhbNAV5Iirzpf9
 c8TT6wJdNw+P2jY1WKhu3uABNV9vPSrFE/68fe1WP2yLk2s1d0LafCHpFoTK2OhnBxYhPpNxeQ+
 i7BO1+9BHtNQyGxwLqgwwsDhfv/zeFk2+C+criYAewxQqnzYb/O/et9FHL+WFHH22KElrkOQZ9L
 /MHKTzkSr1K6lu1t6EFAcrQ9W5+n7OLu7Nu7MxbIuGhirGuiVMB4pEMd1ndh/dkTHFXO6rMG6mQ
 SaHKaUfb7z4jyCYO0btlXxBKWhGHQc1uUNrxbdhOrOur0a2QHlNs69J+E51WJ67KbDjYCPgoT6k
 DkymRNJm/cRGMgPT+BOVaJB5sbe6zBCk6WC3bwOgJsZWc2OiYnhde/6EQxL8fA4x0hdDUx6NiYT
 /b8TOoTPj6Db5nCpLfA==
X-Proofpoint-Spam-Reason: safe

From: Paul Handrigan <paulha@opensource.cirrus.com>

Add device tree schema for the Cirrus Logic CS2600 clock generator.

The majority of the schema is typical clock, power and I2C
properties.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---

Changes in V7:
- Reduced to one example of a typical configuration.

Changes in V6:
- Fixed clock naming in descriptions to match datasheet.
- Fixed clock-names property values to match datasheet names.

- Added cirrus,internal-oscillator boolean to flag that the internal
  oscillator is the clock source. Previously the driver inferred this
  if clock-names did not contain "ref_clk_in", but this made it difficult
  to enforce dts correctness because there was no way to tell whether
  ref_clk_in was intentionally or accidentally missing.

- Changed the cirrus,clock-mode enum property into two booleans, since
  effectively it was two separate features masquerading as an enum:
  - cirrus,smart-mode present to enable smart mode.
  - cirrus,smart-mode-clkin-only to enable a feature where the output will
    be suppressed until both input clocks are present.

- Changes to cirrus,aux-output-source property:
    - Renamed to cirrus,aux1-output-source because it's for the AUX1 pin.
    - Added more options.
    - Renamed the "no_clkin" option to "clkin_missing".
    - Reformatted the description as a list instead of one long sentence.

- Changed clock-names from an enum to an ordered list of const.
  This implicitly ensures ref_clk_in is always required.

- Added properties to invert bclk and fsync outputs.
- Added property cirrus,fsync-duty-cycles.
- Added #clock-cells and vdd-supply to the list of required properies.
- Rewritten description description section.
- Reordered the property list to put common properties before custom
  cirrus properties.
- Added more examples.
- Added header file to define the clock indexes for DT consumers of the
  CS2600 clocks.

 Note:
 V5 was Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 but I haven't carried this forward because the changes in V6 are large.

Changes in V5:
- Change dt-binding to dt-bindings in commit message
- Add minItems to clocks
- Remove unneeded comments for the cirrus,aux-output-source enums

Changes in V4:
- Change DT description to add more detail.
- Move reg property to keep consistant with the required list.
- Add enum to string DT inputs and change the input values to lower case.
- Change unevaluatedProperties to additionalProperties

Changes in V3:
- Changed clock-names in device tree to an enum since the both clocks
  are not always required.
- Changed cirrus,aux-output-source to a string input.
- Added cirrus,clock-mode as a string input.
- Fixed ordering in DT example.
- Removed dt-bindings .h file.

Changes in V2:
- Remove | from after "description" in DT binding.
- Remove description from "clocks" in DT binding.
- Change ref_clk to xti
- Clarify auxiliary clock pin
- Change DT example to not have "reg" for the bus
- Change DT example to change i2c@0 to i2c
- Remove "OUTPUT" from the clock ouputs in the dt binding include file.

 .../bindings/clock/cirrus,cs2600.yaml         | 170 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 .../dt-bindings/clock/cirrus,cs2600-clock.h   |  18 ++
 3 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600-clock.h

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..630be30c160c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description: |
+  The CS2600 is a system-clocking device that enables frequency synthesis
+  and clock generation from a stable timing reference clock. The device can
+  generate low-jitter clocks from a noisy clock reference at frequencies as
+  low as 50 Hz. The CS2600 has two clock inputs: REF_CLK_IN and CLK_IN.
+  REF_CLK_IN can be either a crystal or an external clock source.
+  REF_CLK_IN is always required to clock the PLL. Either REF_CLK_IN or
+  CLK_IN can be used as the reference frequency from which the output
+  frequency is derived.
+
+  The clock tree of the CS2600 is:
+
+                 +------------+
+  REF_CLK_IN ----| Hybrid PLL | PLL_OUT    +--------+
+                 |   + FLL    |-----+------|  GATE  |--------- CLK_OUT
+      CLK_IN ----|            |     |      +--------+
+                 +------------+     |
+                                    |      +---------+
+                                    +------| DIVIDER |-------- BCLK_OUT
+                                    |      +---------+
+                                    |
+                                    |      +---------+
+                                    +------| DIVIDER |-------- FSYNC_OUT
+                                           +---------+
+
+  Clock output names are defined in <dt-bindings/clock/cirrus,cs2600-clock.h>
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs2600
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ref_clk_in
+      - const: clk_in
+
+  vdd-supply:
+    description: Power Supply
+
+  clock-output-names:
+    maxItems: 4
+    description:
+      Names for the output clocks corresponding to PLL_OUT, CLK_OUT,
+      BCLK_OUT and FSYNC_OUT.
+
+  cirrus,aux1-output-source:
+    description: |
+      Selects the signal  routed to the AUX1_OUT pin:
+        - "ref_clk_in"    the clock on REF_CLK_IN
+        - "clk_in"        the clock on CLK_IN
+        - "phase_unlock"  indicate the input and output clocks are not in phase,
+        - "freq_unlock"   indicate the PLL is unlocked,
+        - "clkin_missing" indicate no clock present at clk_in pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - ref_clk_in
+      - clk_in
+      - phase_unlock
+      - freq_unlock
+      - clkin_missing
+    default: ref_clk_in
+
+  cirrus,internal-oscillator:
+    description:
+      Use the internal oscillator as the source of REF_CLK_IN. The clocks
+      and clock-names properties must provide a fixed-rate clock of exactly
+      12000000 Hz as the ref_clk_in clock.
+    type: boolean
+
+  cirrus,smart-mode:
+    description:
+      Use REF_CLK_IN as the frequency reference until CLK_IN is present,
+      with a glitchless switch to CLK_IN as the frequency reference when
+      CLK_IN is present.
+    type: boolean
+
+  cirrus,smart-mode-clkin-only:
+    description:
+      In Smart Mode keep PLL_OUT disabled until there is clock on CLK_IN.
+    type: boolean
+
+  cirrus,bclk-invert:
+    description:
+      Invert the BCLK output.
+    type: boolean
+
+  cirrus,fsync-invert:
+    description:
+      Invert the FSYNC output.
+    type: boolean
+
+  cirrus,fsync-duty-cycles:
+    description:
+      FSYNC output duty. The number of BCLK cycles that FSYNC is asserted.
+      If not present the duty is 50%.
+      This is determined by the type of audio port that is being clocked.
+      For example TDM formats typically define FSYNC is a pulse of 1 BCLK
+      at the start of a frame.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2, 4, 8, 16, 32 ]
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+  - vdd-supply
+
+allOf:
+  - if:
+      required:
+        - cirrus,smart-mode-clkin-only
+    then:
+      required:
+        - cirrus,smart-mode
+
+  # Require clk_in for smart mode
+  - if:
+      required:
+        - cirrus,smart-mode
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&xtl_clk>, <&sync_clock>;
+        clock-names = "ref_clk_in", "clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,smart-mode;
+        cirrus,smart-mode-clkin-only;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce..c2328066fede 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6213,6 +6213,13 @@ F:	sound/hda/codecs/side-codecs/cs*
 F:	sound/hda/codecs/side-codecs/hda_component*
 F:	sound/soc/codecs/cs*
 
+CIRRUS LOGIC CLOCK DRIVERS
+M:	patches@opensource.cirrus.com
+L:	patches@opensource.cirrus.com
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/cirrus,cs2600*
+F:	include/dt-bindings/clock/cirrus,cs2600*
+
 CIRRUS LOGIC HAPTIC DRIVERS
 M:	James Ogletree <jogletre@opensource.cirrus.com>
 M:	Fred Treven <fred.treven@cirrus.com>
diff --git a/include/dt-bindings/clock/cirrus,cs2600-clock.h b/include/dt-bindings/clock/cirrus,cs2600-clock.h
new file mode 100644
index 000000000000..bde505e17813
--- /dev/null
+++ b/include/dt-bindings/clock/cirrus,cs2600-clock.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause*/
+/*
+ * CS2600 clock driver
+ *
+ * Copyright (C) 2023-2025 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_CS2600_H
+#define __DT_BINDINGS_CLOCK_CS2600_H
+
+/* Clock output indexes */
+#define CS2600_PLL_OUT			0
+#define CS2600_CLK_OUT			1
+#define CS2600_BCLK_OUT			2
+#define CS2600_FSYNC_OUT		3
+
+#endif /* __DT_BINDINGS_CLOCK_CS2600_H */
-- 
2.47.3

