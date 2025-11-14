Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023087.outbound.protection.outlook.com [40.107.162.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A5303CA3;
	Fri, 14 Nov 2025 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763163609; cv=fail; b=TPK/gx2Eodf/MWasoisDRaiu7JpzJ/BuXgNBgbdeK3gfOzr5wR71udff+uVQWSdXLZ9n7VLfFinzUFp+6W/LdUHiRWWEnb1VS9xQHszat79VtoYxWeRzeGzeVWWdYARHtN/t/mwftpwKd9JlP6+LlqS4lSGpTAGkUBz+TguJg2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763163609; c=relaxed/simple;
	bh=tAjMzBlSRikyK3K4CyDHY52v6peFAMh/eU+voRxTOKo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rpAXjsGrnsRNiUuRYPuP+kjOzplXK6T8EU0oX9BhOMu7/JiEey8SgCuaqBnVypxYzC9GTMOVqQia0zb54togN+vWwZ7hVmSpMsbXqjAJLJ14ulEutk0UjVbERXV3gojfKprYA0hz7mGNnEUneKHrZOnPp2XjrW3q6n8DvKlHtf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=VfAdmbq6; arc=fail smtp.client-ip=40.107.162.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="VfAdmbq6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS7uJzL7uobUzdZ+8qr3dgI2OFawrFRiQTZuJqkUzsgNr2PqCBps+47A4Ltnh3qWmSg5KNLTTr37UyhC6MBXAF6JJOpQVPDQdXVkfmquUvq5grQ1oUHfHhS+usmCvSQbSroTo2cthNpXxsDWVtnvTjvfrnDiNQqqqkLXklOtlpgaR6Bmj3Ca+RdSZYeaj78xJY/rTapxMWXtd9fHUufvqLSsPsbwXvXu1G14SeIoNr9hXavkpIb/qmH9vEnJG/2IwnSreV7JmUSMvGL39LmY2E7/Yz5s95yBp843eIU0p5eM0lVRrmXUpxFTluUAYVbkItb4zuRibdtxQnfgUuj+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAjMzBlSRikyK3K4CyDHY52v6peFAMh/eU+voRxTOKo=;
 b=BsA902Gxl+EK09E1/GvdzTq6jlKNyRgD7tphc6Rl3+WfnUrKlr8l6gCX3Fbgb/aUGVN7tZOgqNrCgptGUbPpv1t3s/xfZX2g7HTUU7bAzIzt48gG2YaufUkl7tdIunCkSohdUOok2wTMu7QqmPtof1XtEN906CwTipmewin1BWzxu09lL3TSs6GGNF9F0eGe6LZ0ApJKWqxTGYTrq5JUgiUJ1i7H4SOCEhm6NelG9wsX/TW0Nl8fY3YfUhL+QSI6JG9AkcZvEe/T6w+kh06cLUAh0K1yplPwEyfUNIDsooE3/uH+SyEheSGr0P/DltKCCBpTD62vjM8FXwqJs7CZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAjMzBlSRikyK3K4CyDHY52v6peFAMh/eU+voRxTOKo=;
 b=VfAdmbq6hqXmkXdzNRcD5ZRb2gE6uQtltwmkrHRfiQM/ESm+ukx9N86fWqmQPtfOgpb7eGM4tPPnG9c/IRnGPhRnTweONYOwVajGwHDoGTOiiUjf9nBrrqYMVWQKUreskEZp2aUJMgwHPOd9aveyrLmJcXF6Cp8OEkFNfN2iZfqv8BgJNWMv7JD4Uts2AJIe6HDPGqBFK4KAEiQL0Q2xj3ga0KfqEnGjaSO83IcKE4/7/ItrXf6uMeeIxSOXiNQK67r7tXbpiOGZCWulddNnbtEiBU1BJlK2/HmUkwb7r4gXiUMBztoTiaVdu4wt9CVYxmStILDc3LvojPiUq4Dalg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AS4PR08MB7854.eurprd08.prod.outlook.com (2603:10a6:20b:51d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:40:04 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 23:40:04 +0000
Message-ID: <05e79250-dcae-48cc-a3ef-d56031bfa10d@iopsys.eu>
Date: Sat, 15 Nov 2025 02:40:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] clk: en7523: Add reset-controller support
 for EN7523 SoC
To: Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu>
 <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
 <176309336273.11952.13793350271645615953@lazor>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <176309336273.11952.13793350271645615953@lazor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:7:28::36) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AS4PR08MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db8de2c-6c53-4f3f-723c-08de23d722f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dSt0Q05KTTFXYllnbWQ2TGpVSy83VEUxZzg3U1dQalpzYTdVOC9SdmQ4a1pI?=
 =?utf-8?B?U0NCdjVaZ3RDL1Y0QWxoSVQzT1FXWEJHczhSMmVhaldkSStJZFVOTlpZSzJ3?=
 =?utf-8?B?NnViMXE1WHZnYWF4ZityK0dodU9POElNRkFVVGx1RGRvZElydzBqMWdHMHY1?=
 =?utf-8?B?VDdNd1BXQUZVdWVrOUN5QUM1NS81c3B5RXh1enRMWEU0UC9SaktvazdOWmRX?=
 =?utf-8?B?U1M5a2hkblRtVjZzZ3NYYjB6cVlJR012M3V4UDc3SFpTZ0lKNlpaYXR0THRG?=
 =?utf-8?B?bFBpVk9VSk8rS0lDQnM4amhCZXh1L0x0Z01CTW1TU3BBbFFBVWw3NHlqWTRR?=
 =?utf-8?B?T1pzVVFFbUU3TzNaT3AzQUU1ZnpDSGh4cVhPYlZHVUJHelc4QUMwVWE3bFJ1?=
 =?utf-8?B?S2RwWGRRWjRtOHdoTGgrK3pwM1ZPYXdoeVVIaFp3blNqdmJLYUNIU2JJMG9m?=
 =?utf-8?B?WWdUS1dNVzI4UWxQWHRPcTlNT241bFA5dU5ObmlWLy9zTGpwZ1pGMW02VTR4?=
 =?utf-8?B?Tnp0aHJObWFyZEVSZnJGSVVWVm1uY25KSjJtbW9JZDB1cjQ3UDNXU2VPZjFi?=
 =?utf-8?B?WFA0VkEvWklOMmpLb3R5NVRtNG54VmtmUjJ5QTA1dmdyb3NxL1p5NFplQURY?=
 =?utf-8?B?NzBub1JCOVlaL3dzWlJ2Mjh6NDd5eTdiT0twNVhINXpzbWpHNy9BMjROdnY1?=
 =?utf-8?B?UFFLZ043d3lENHhyakVMMUZxcWxtbXVLRXJYL1p1ZHZoOFlZZFZGcVdHOFRs?=
 =?utf-8?B?bUhkOHJ6clNsdWtXcnp2UkFOdlZmRGJnUEpyTFBuZVprY1dxZDg4NmdydFd6?=
 =?utf-8?B?RzVNd0R4NzlQYnRRY0JHbUVJc1AwOW1RVmFMU29sMHVoWWpaK2lJaTFsamxF?=
 =?utf-8?B?QnNCSm94SVg4d2o4N3gvc1FTS0NDTzUvSGFQWXlnZGJQLzlqVmZ1S3lKL0cz?=
 =?utf-8?B?VS9pOHh4WEYvbHlKdW5DcVRFZVgzYlJZVnFqcERzTlVHL1NmeXZBSVVubmwz?=
 =?utf-8?B?Wm1MM0N5Y1hBTTNYa1kwMjgyZWhBYjI1cksxbHo2c3JqUjFlMjVJSzk3UHlC?=
 =?utf-8?B?d1FQTWYxM2ZtbEpRbS8yT0swQWhPWE5tWE1rZHZIOG9JNGlDcmpQWmFiclBz?=
 =?utf-8?B?UUlXbUFYTzdFWmNzK3NVT0ZrWlh1ZEw2c0x6cGxYeEdZZDB6RnhVSy9HbzFQ?=
 =?utf-8?B?YnR5dGFHdTlTZjN5NndDb2JMVGJCQVhJVEtTVEtqaEIwZzQ2b0x3Y2RiVE82?=
 =?utf-8?B?NlVtU1FndEttNnZFNE43Ull5cTBXRy8yQkJuWHVzdzlJV0luUUlUTUFQeGIr?=
 =?utf-8?B?bEluNW9JRFRXWGt1TEM2OE1sNkV0bU9xNEt3QW82UkhEYVJSdEhpQVlORjFz?=
 =?utf-8?B?Ynd5TXhscWVENFZaS2xTdW5OK0xhZ3VSVm4xM21UVTV0MUNTMkRrNXY2Ullx?=
 =?utf-8?B?OHFQOVZzUk1KRjJqMzJyWlF0d1RiL1VCVWZsQVJRTnNNbmQ2d0VXSUQvazIv?=
 =?utf-8?B?NHRBQld3L1hBcVM2aG5RMzJ1MnU4dlRkY2FiOUhZSG0rREZPODAybk9aT1hT?=
 =?utf-8?B?M2ZzTkFvZ0syOGFvREJkZU5pT0owS0R3WnRQUXhzVnhVZXdZVVpRUmQ3d1Z0?=
 =?utf-8?B?YWVyMllDcVpyajF2UFBJbzhyRnB4NE0xN1NndlJ2SGdrb21yUkVZTlJ1NUFL?=
 =?utf-8?B?ZnF2bVZOa3d2VkRma3RvaVJjQ1NDZENFalFIbERSV0hTVUxPcjU2c0w1dmJL?=
 =?utf-8?B?Mk5DaitTdXB3azA2elZpR1ozWFMxL01ZNUhCRGdGd3lUN3pDTm5qOW42SWtr?=
 =?utf-8?B?OEJhZ1I1MkRLTklNVlUvQzA4RlQ4Umo0bnZZQXJKNnM0eWhacHhwQjdBVW1S?=
 =?utf-8?B?bTV1Ym1ab0FjYlo2cEJXSFNvUlA0MGtuOFNPNy9QdlZRRlU3WjNBT2l6RFhL?=
 =?utf-8?B?UmdDM1JqQm50eDFFT0s3Ynh6RkFLS2E4M1ZSSjNqbm5EaVlMRG5ZUVBWUjNY?=
 =?utf-8?Q?kVFxlJ/6m16FClLLfVW2B9zlh1sdjI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVlkMW82NXlPVTE1dUNXL0s5b3pnRnZFNTJHUTZPOTJrMnU5ZGc4WHhXMElk?=
 =?utf-8?B?TXN2cVZscFpycjFCZk5nZGhwbURQYTBlemhCQTB0VHBjb25GZzU4V25zeGxE?=
 =?utf-8?B?b3JOTk13MVM4SGEvN1JGRkRRNzMxRDdMeEhlVVRvcllBRUNvMHZBWSswY2V4?=
 =?utf-8?B?RVliRitqSmduTnhYRWgzenBWUjg3MHFxblNtaklBMG4xMGN1dTlpejRieTF3?=
 =?utf-8?B?dlVGbGlrOFltODhKSk9uYzFqaGtXdmsxbk90a1FQaEdVOEc4c1h2NGxxc3FU?=
 =?utf-8?B?OEIrOTZtMkQ5Q0lvd3V4WVNEbjdiUEFjbUpOYVQ1ZFR1SkRkU2hHa3pKYVM1?=
 =?utf-8?B?NGtDOGUvWC9DMld3MTg4aGFqNW9MVEN3cEJ2blkxamZXcmFXNHhOYkFId25w?=
 =?utf-8?B?VThSNmtjNFVpZ1ZadWVXZmVXcHhmQW56NEovQ3ZFMnMrbjdrZHFMU3Q0Ky9F?=
 =?utf-8?B?KzFTZ2w0aTZLRkFRMDJhVzlyd1FxVlBERm4wc3hOdnB6eHRxS0N2RzNkaytV?=
 =?utf-8?B?RzlPT3o0MFRwc3NacGp1cjYxMEppWnVNU0JzTGY2cDVETTUxWm5oeXdCVEpL?=
 =?utf-8?B?VVRBTVpFRWZlMW1YVllNNGg1OE9GSzVmbGVGN0oyNjNjL0dLNlhka2VwWkNl?=
 =?utf-8?B?b1JCVjY5QVg0cEpLdTM0YlBxeXQ2UlJkeEpjYzhFUDNjUUpmYllQNFgyQ09O?=
 =?utf-8?B?YVMyWDRuUGxUbUhoMEpUbkNEdW1ocHlqVE1jcUc4aFFqaW9LUktMbkdUY3Zr?=
 =?utf-8?B?L3ZVWHRhelJndEY3QVZPdWxsSjdsekE0c1RsUkoxTVc5a0NGM0Rldm5hRW0x?=
 =?utf-8?B?Skl2dmtiVjFaamloYmhFSitmMWxhQ2JFa0ZoazVCMTJyZ0N5YUVNeWhzalFU?=
 =?utf-8?B?MHRlb1REMmc2T0hMcTNQT0xSclpBQlBwekpIT3RCN1F2ekcvYWFGaGlTRnhw?=
 =?utf-8?B?NGV0RHFhSGp0RzJDeTFBQmlvajJ2UVBJYVNzaGpMYlZwY045cXBYVStlbjI1?=
 =?utf-8?B?VWE4MzZkWFhjYmNlWGRIL0VrWnlqVzF3MnRIMUJxOTJJSEF3YWlYTXZadmJp?=
 =?utf-8?B?WTZWRHJiRThqRUs1NnQyRkE0blpOVHZRZTArTDZubmlMWDF1TEdrUXl0eUxD?=
 =?utf-8?B?UkpIeTZhQWxYbERrRlV0SjlwWEt0N3I2R3RlcUlkd1NoKzlSZmwrTzVha1Jv?=
 =?utf-8?B?WEZ4SThOcHdicE5iZ0NONEU0NldFWVVnUUhzbHRTbnFWZ0ZiZlNrSllmZ3JB?=
 =?utf-8?B?Rm1DYUxYWm40M3BoN1diY29sTFF4ZDUzZFFRT0xhUk1TZk4zQ3UxYXF0TFNs?=
 =?utf-8?B?SDFhVHF4ZVJxMFFYQ3MwdytXM1RDRkhJOGYxYzlOS2t4enJKSFkxQ01VME5t?=
 =?utf-8?B?S09LV0xIMng0NFgxR1ViWXFUL1lkYWw0WS9WQmVMUzYvckZ3NGg0UjNyK1Nn?=
 =?utf-8?B?TnBITlA4Q0YvSVdFdkZlVjBtL3d6MmNTS3IwQVNBcTBSOHJxb2FhcGRkUXNy?=
 =?utf-8?B?V3BrOTFlR09QM0NneDlGSFJQV2dGS1B0WlYyL0JRZElpNzBWamNHQTdTdVdY?=
 =?utf-8?B?UnByMC9GODNLVG5Ic3NVWUhJQ29CMUc0Y2krRmZlOG16azdRZ3VVWmZmWEVW?=
 =?utf-8?B?ZkNWa1NXbHFKbHNFS25hTGZ4M3gyR1J6QTFseEVYVEJKb0Z5bkpoUk5kWGJP?=
 =?utf-8?B?VFRUbER4bit2ZFZXenByalpXQ0IyVURZTzk2VzIwaVBXNGhPcjdQdkVYUms2?=
 =?utf-8?B?clI0MHpGQTIxbkpGNjFGSFc5NnBxdjN6WFFSWlFFQkNPR3M3eFRtWEF0QzV1?=
 =?utf-8?B?WFQ0US9OQ1J6cGtyU3BGZTRIK0tVTzJhRWM0NXdORTFyNkVQVkd1SzhONXho?=
 =?utf-8?B?dCt2eU5tWUFDZmU1dEFacStVS0NwUlFETWNKVHBDQWs4MDBud3ZWMTFwRGF4?=
 =?utf-8?B?Tk94R1k2RDlQbjNtakxHUHJhMzJBSDlOa01XTTFjYWdnRUlOWFBsNlZ1WHlt?=
 =?utf-8?B?amVrRi8zQ3FjN3VxK081K21VUElDQlpPWUYvRTd2VDY2d2pWTzl6elZEazcz?=
 =?utf-8?B?b0RxV1preE93YUVMQktkMUtYTUl2L2ZPZmRVNzdTVWVxTGI3dWx2eEdaNVlp?=
 =?utf-8?B?b3VUczNwVDk3TnR6L1pOS082NHljdDUvOTZOVXNYN1B4dlkvUWNhaEpwUUFi?=
 =?utf-8?Q?FHSwUYFtOooPU3o4sUFvfU4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db8de2c-6c53-4f3f-723c-08de23d722f5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:40:04.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcncrK9rIi5IHt9TEKJxbkWOMDwtJ+oRzsoKG8LbR14AsMCIgGkyY0rNRfp2PuH+rCeOiGR3cY302drFhdeyPFqluBuDdv7MkQ00Gv4SxlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7854

Hello Stephen,

I can't find this and other my commit in the clk-next. Are changes was
dropped?
If it was dropped, could you tell me a reason?

Regards,
Mikhail Kshevetskiy

On 11/14/25 07:09, Stephen Boyd wrote:
> Quoting Mikhail Kshevetskiy (2025-11-09 19:56:44)
>> Introduce reset API support to EN7523 clock driver. EN7523 uses the
>> same reset logic as EN7581, so just reuse existing code.
>>
>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> Applied to clk-next
