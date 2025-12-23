Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023139.outbound.protection.outlook.com [40.107.44.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4141324B23;
	Tue, 23 Dec 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491007; cv=fail; b=Zc4jgSLbeqvYPi8jCoUvvVVcPS8+h24C/q6gkKE/hiewfmXuRDiDlXN8Ch8ilbxG992YjBudkDh0DfoIa18n65fpK0I/dBHx0+WXQzpEnxVESaVWCS0bCVCe3MXRmfjejA2LsggM8uqzlBiGl5j6LNUcEBKCSpSsh2SLf1eMxGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491007; c=relaxed/simple;
	bh=dDX0W0rYWnkwS8c7vMVOrkQh0KOCXpuWxYBXmkLmT2o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L8qhnFMayB1ONW4gdwB0JVfiqL22jzH2T+Yba5PyVE/vSuoEk18muHRPtPSd3w9DtF2uYiqSP4d1XOq5fn0jOkDprYvZ8UB2viximBuRcv9T0hlE0l9XcUi/2CQvULlB1+k7U9/qQsSH7fVP1l0kJHXhxsVHRXRs4XagW4ExEzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=xCiOf782; arc=fail smtp.client-ip=40.107.44.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="xCiOf782"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMIxKDyyfoZhlBheP6fcwC3S8fOrKlX13CtLDbfhOxnpUUvQ2ST9cET8L0WAy59yNOEmwgE0youvsJXsSLGqnA/GYYJYZIBb5bMdQSuLbQFJYwiLbpcBdPAf/teJ5EZDJasSmMfvVEPk8avBOslN0etChpkOvzfUvsag+zh+N9tZemHHzugRfg5bO4Q6iC15aD5Ahik88CdhdiRiDlyv+yMs0YlMowyGYwwdjbldNFYtf8swNqcU8lr70SN6DBSaf8uLijsEWrSHwjs/1hYl7FgYXgLKX1dZow4qVBUzu8FzRJHdLkdzMk5ZWGhzU2tRw2UGT+Q5QzrfswuzXW3bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrlR52f9wzQ2TdQ4di34jPiEgkzvKIgERvPntVwob34=;
 b=ulC7jvqOvw/0c7srxIWnZUOO0757CfEJfvgmD4QrD1/o2E8TfXos2vnl63alRv0Pa5ER1yEn0nF4qbZcqhJe4F5hxg5JIFwYL8hoXnIwRNhrx7L4BZRVAMIOXNUlWQ5qOLofPTGAEgt5GKsNScidoHZb/dlgeqrfJ+5sY9QHpsCsecO6tDgqsTL4O4y5K8SjJfL501od9Pr8AVne9JVwAvE54DzSQgaqQY1XuVHp6x8PC27hmjoDkr9mfuLYme5BIlHVLLNbEaXmefMXX7PQ8VZZNjxVjwZYYlO40LRiTS2Yj435pOduyHLQSuPh/pj/oamzuv2pyRi7gr+C0WmpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrlR52f9wzQ2TdQ4di34jPiEgkzvKIgERvPntVwob34=;
 b=xCiOf782S5BCKz0zQW28DY883JqVy4bhXCSPABy4jGxTdrixiokIwsiCkKK+g/bkO1iVUR1WRaqd5H5WlKq/9NTktAcIL7LxhQHKiUbtnVpwyw/UjDpLUcXZXaUxCNx/iS+B9NohGJs8kbS7nRBL3m+3FZFUk95qXFXbLMXi1fNlC17FoPLAF/1wS4jWN79vGnKaAEBhcZ6M5eN9LhJ6eUBcFGJgb+yg8UgBeADEEmAfSFNIcv41RMZbqAN5VCwmPJxYqP++nkTeHLYu2z2g6KSl2JbABCA1XqL7jEkV1mEtr/7OpBl0mw8EQI2AppUs1veEUhkglqfBbJ2Q9m02Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KL1PR03MB8144.apcprd03.prod.outlook.com (2603:1096:820:101::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 11:56:41 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 11:56:41 +0000
Message-ID: <a4d1c7a1-f7b5-4717-b356-0562efdb9815@amlogic.com>
Date: Tue, 23 Dec 2025 19:56:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: Add Amlogic A5 SCMI clock
 controller support
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
 <20251028-a5-clk-v4-1-e62ca0aae243@amlogic.com>
 <1jv7hx7ew6.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jv7hx7ew6.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KL1PR03MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e59619-483b-45b1-48a8-08de421a55dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z216aFVzV2hlYkVCTFczVTEybktreTNyL2RzODl5WWdFLzJWN1VwemkwNkdE?=
 =?utf-8?B?MUVoaytRSDI0ZFQvL3Uza2NiOW02em5IT2o3NUdjbCtCT0lVMXBLSFNtSlM1?=
 =?utf-8?B?ZDl0ZFMrZ2xVWTluQndWQWd4cCtWem1qZVNrazJSRnAyNWZQRGpIMGcxYXo1?=
 =?utf-8?B?eSt1WjI3MWQvK2NDOXBZT3hBRWNBY0FiRVhhMDNnMGJybmVuM0pmeEVHb2U4?=
 =?utf-8?B?dlVuWnNmZkxvZEU0ckxhSURQRkhXa2VkTjROenR2aTBFMlFwWVQyYlhQWXlG?=
 =?utf-8?B?d2FuZ2d4bStrK1NvQUpldm90SjFaaFViMmJQZE5pYmNEQ1EyWTdXTXJObFNZ?=
 =?utf-8?B?Q1c1VzAvQnNtSlY4RkhORCtSdC9jQU1TcE1WaWMxZ2IrWUoxR1haSis2VWxs?=
 =?utf-8?B?dVRnY1lpRkYzN2ZZc0JiWFhhWHRhazFUMXQ0UlpEVVA4OERTK1ZHOWZKRFNy?=
 =?utf-8?B?RExWZjRwemV3ZVhZVjJYeWdaQ3BaUEhoUlhPRU14WjRKaEVhT3lZd1hSbDVz?=
 =?utf-8?B?dkU4Q2k1STlFUDAvSGtwM3U2TXI5T2ZrMEpHMFNGLysvd1QzUDFtbnVGK01p?=
 =?utf-8?B?c3hnZ2VSMHB6bVZzVXdtSzRSY0VYUDgrTlZpcWZnV0tMVnAyWmNDMzBnd1Nv?=
 =?utf-8?B?RWZCNkt3UDE2MUJ1OEgxcVdFRDBmOGh3a2h2WW5wYXQzTFYxampBTDEyMVR3?=
 =?utf-8?B?YTl3WDdBa29RN3BQVEFDOFdWYjJmTEtNMzlYZkExNFFXTUtmRStLTFUyczQw?=
 =?utf-8?B?MmdQYnNsdnJpUVhzVG5Cd2IvWkNrOUVIdlN2c2ZWb2tmWnhDZE13SWR4YXAv?=
 =?utf-8?B?eFNoL2dIcnNxcWhWRXFpNWkwNStMM1RLeS9wS05uQ3llLzg0L3ZtKzArR1Bx?=
 =?utf-8?B?K0xNOGpNQ21lYjJpUVpuRnE5aVBNVzdISzRmS2UxRVVSZXViUUsydi9CK3Zm?=
 =?utf-8?B?SHFOMDBqUGdmRkVRQ1NhL3NIdXhIY2NIZTF4NWhNb1Y0QWtac1lFbFRvejBJ?=
 =?utf-8?B?bi9kL1JrRGdtaUhhaityendKcGFQcUsya2Nqb28zVy9tYVk4SGp2WWJGTGNL?=
 =?utf-8?B?TVRmaGpJZFpWK2F5TXFRMkhncTJ1b2NBcWt1UzJjblUxT1hCRWtiUFJ3QUx0?=
 =?utf-8?B?MStRdUxuUC9IRVhJSUx1US94M2xqMUUyZCtxZWNKZ2JnWVUzZWRrSGtxT0U5?=
 =?utf-8?B?eGZkeUhrYWQvQURiVkVrNVNQTlhrTkpkRlFCM2x4UklZcHJqN3hYSVhtTm1E?=
 =?utf-8?B?aGFqQU1NUk1nTCtTeWUrRjF6Z2hoMkdPY2ozL2s0WktrcVpSQnczaThUM3pC?=
 =?utf-8?B?eVNkNTB6V0FvdXY5SWtucFF2blZVKzJTOVRSM2FOMzVML1JzZ2VkRjF0TFpJ?=
 =?utf-8?B?UlBXZURxM1c3Zkt6RlQwbTNmV0JPMisxdFZhT2xoWVZJS1dDMkc5ekhocGNq?=
 =?utf-8?B?NzVuZ2VETDYxUUlGZ0RVMElDdGttaC9LeDJ3bWRZN2szUnNrZ3Q3Qnh0VUJQ?=
 =?utf-8?B?NGFYcGdMODNyOWVRTmdheGRRVE5Obkl5SEZ0UkV1cC9mZVVRQkR6UmI0Q3lP?=
 =?utf-8?B?VUM1WmRYUlZMTHRQTDVzQ2ttL0JHRkc3ZFZrRG5wLzNGSUJpT2Erd3d3Z0tC?=
 =?utf-8?B?REZWcEltc1VzbERhOFdTMndHQ0JDcTVzQlJwakxpWXJ1QzZsZ1Z1eVBtTU5L?=
 =?utf-8?B?S2pTS1M5c05NQ3oxNTNYRkV1bC95Mm9iL2dOekVTQndHYW1aZkZXaDd3TVRP?=
 =?utf-8?B?R0oxTDFoU0x4K3JiaVlDUHM0RFk1MFhtdXl6OEJOaVlzdjF6UDM0YmVlUVp2?=
 =?utf-8?B?cVRDSUt0MDV2dTVLL1ZxVW5BNHQ5T0dWZk1DdHZ2ZmxkN0F1cCtZekdrbHRP?=
 =?utf-8?B?TVFrNmlZZU4xdTRlR1ZSWXVrL1pPR1VhQmlabEhaOUxVMkNPbDJ3MDlkR2Jq?=
 =?utf-8?B?c2ZOeUVCVlBXWjMvUEVCZ0tieWNjVHRGdjRWL2gyMXFLaXRCa05OcVhRSWor?=
 =?utf-8?B?NXhkNWh3TkV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1JTVERtdmhTMzFEczI4SmthV2RCaUhUY2l4NVZRZEt1N1cvb0tPU0ppRU9D?=
 =?utf-8?B?TkNKdjNWYUEwTXpwZnpkelJGaXVMK0Vud0RwWGNrOWVaZU1hTktqVmFCY0ZS?=
 =?utf-8?B?elRXTy9DNkgxQkp1cVFLcWY5OEFzc1VvREtTekdKWFloQXZHS3RKSm1LUkZk?=
 =?utf-8?B?L0FnbE9TR2gxbTYycGc1b3pDTnlVUCtBVXo4U0hJTGVYdFZUL29JNVdKeTJ4?=
 =?utf-8?B?dlV2a0NFZEFJTTAvS2RydG5uVXhMN3hxckhZaTR2NXNiMGJxRk1sZUdrbENH?=
 =?utf-8?B?dFNTUGdJU2dNTTBtdTFXN1hFRFdQOXdWOXBEeU16OWRPQmdwWk1WZ0EyTHdM?=
 =?utf-8?B?RFZDdGJzU0xTcGNVV3U3TU4zQVNCcHIzcnArc3ZXSTJ3SFJhejkzN0J4ZUVU?=
 =?utf-8?B?S2luZnh0OVZuOUdaY2E3eXB6RTc1TU1UMXVUT3JFUUlSY0tVaTZUQ3pWUkEx?=
 =?utf-8?B?TzFYTDYwL3UrdllSakNGNkRrRUp3SHErTld4VkxLTUhBdUtSZlBuKzlmSXJv?=
 =?utf-8?B?QkxuT3NMR2I1Rk5QWEtkbEk1b1E0NmxrM3NWY3hqYkJPTzVpYjNHZ2RmdkJ4?=
 =?utf-8?B?dVAybUs2a2IyOU9TZHRCNDNueFV0ZDVYQW9mK1JRK0g1cHN5YmRpTjdKNVo4?=
 =?utf-8?B?dG9tQUQxRXZhSUNXdWJsR1ZaZ3F5NnBhMlQ3TXZheGVHZkJuYms0SUMyWDlR?=
 =?utf-8?B?a2tubzJMaThsRWpVdWQraTQvMmZZRVdTdVRVRWcvbXpXSHJVQjRzZEY0Skov?=
 =?utf-8?B?dVZKRGErV1FCNnVmb3hKRDg4MS8zSm4xYm1XMUZnc1ROMUZ1dUJUQ0RaZXV4?=
 =?utf-8?B?VEJEMEtUd0J5T3F3ZnpSbCtkN1c3R1BOY0JuUmZEN3FVdVo0MGJEQktxV2N5?=
 =?utf-8?B?NHExQ0J5TUxoMm53VlNqUHRIMWR5M0t2OE5wb2hTY1BwL3o4dzhuVFJLWTQ0?=
 =?utf-8?B?NE1LMGpaYnp1bHQ4N3pUNllxNFcyVHkvQVp0cnBaK2dWVllRcGE0Wm9aaDBZ?=
 =?utf-8?B?VjIyNEU0RTFCUFFDaXdoSmxxNXFMVzQ1ZWN1WEZ5QnFyT1pLcnhKVlB4RDVp?=
 =?utf-8?B?L2tLMXlheEIrRk5aVFVMbnZpMWFHMnAvRm1sc3p2SEpNT1J0WFYvRkhZeGw5?=
 =?utf-8?B?bGFFQjJJbEhHbldKdW0zeDc0T0xHc2Rzb2hnN1VrcUFtRjgzcTA0eUtXRG9D?=
 =?utf-8?B?S1BzUTBkd2VCbHdOUGpFbTlWQWhMcVBvRXFWOEtFK1gxb0RreFluMm4wbXUz?=
 =?utf-8?B?ejhBY1ZlREJubndiZGprRGpxWEhzbitjVEFySVFibjhMTUgxTTU3SGFWTENh?=
 =?utf-8?B?WE5ZcForNm5BVVp2T2J2cy9wWDRRMWdSanVYQlB4MXBVc2tmeVFrajhBbm1R?=
 =?utf-8?B?OEFkNkw3bnFFVnN3VWx6a1JmSE40N3d6NlRnWDZyQ25MdG8vbEYzV1BRUkd1?=
 =?utf-8?B?RWJuM3A3Z3l5N3pldUVIRllUYTBHcG5CTjRDcXdlbzZLK3p4UmQyOW80ZWNw?=
 =?utf-8?B?bmN4a1hYdEhrVXRJRjk4b0tXWkZsQTJWRi9GWjRabGpCK2ZSbVlpUC9Ray8w?=
 =?utf-8?B?QUxEUFl4d1Y4dWRud0VyY2JXWmQ2eFNqM2lVcWkvWTA4VmlzRGJNRENNMmlv?=
 =?utf-8?B?MkJER1U4MGdOQmlhTHNieGVKUGVLZVJqZzJyS1J1NU8wZHdZTVdpaG9zbmpx?=
 =?utf-8?B?NXpPVjkvd1BHczdQTVRxTi9NbXdpajNCREU2TjdDaktabTRtVUhZL2VlTlpW?=
 =?utf-8?B?QlIyUk9oKzlJU3M3U1JiODU3MFhWTFJzVHV5dVNDa0FVM0lySFJCWHcwdXJF?=
 =?utf-8?B?M1dUN2Nwb3FqdkM5bm5UUEFLcHJIbVozN1VoWTVRc212ODNTa2pJWnl0aktD?=
 =?utf-8?B?bXhiUzBUby9BV3BKUHQ1RThRNWRLUWxqaGVxZnFRMW1kZ1hiRVowcG0rZTNw?=
 =?utf-8?B?ekdMbWttbGc5R0plS0szbVEwN1hTdURtWG9GZElDbVhXYk5EbWRGREttTHdm?=
 =?utf-8?B?Y09uYVhlNWhXRDY4WTFxT3lESjU3dVBITXdobVFRNTQ1RFROalRsQkI1WEJs?=
 =?utf-8?B?ZG02OHFWbUhucmlhelpwY3cxZk1ETHlyVjNoQnA4V0FFQUZVNldVQk1ndVZQ?=
 =?utf-8?B?VkpLdUZiWlh2azhJYVRmNjViV2JqalczL0tEcXUyS2pIRU9BWkJwclp0Tllo?=
 =?utf-8?B?NmhFN24zeVVJbzBXQWliSjFmNXYxeC9LTm1KMCt3dVExeHV1TEJpanpRcWpo?=
 =?utf-8?B?bUFMVkgxWThWamJISlZ5Y0xldytDMXVDY3pmRjUyQ1p6QWpVbnFOdTJhYUxJ?=
 =?utf-8?B?MWlXZS9SQVAwSndCYkl4eXYyQXUrSjRQZkxNcnlhazdkbUI1MU1tZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e59619-483b-45b1-48a8-08de421a55dc
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 11:56:41.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfrYSvRoN1KYfJkVAyrEcRDCginIMyp4UHp0ZW8t/FoReRaD+mLPwM7kPdlD0KfSbGWXRpZzKwZVqvtR1GxOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8144

Hi Jerome,
Thanks for coming back to review. Y

On 12/23/2025 4:59 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue 28 Oct 2025 at 17:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> 
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Add the SCMI clock controller dt-bindings for the Amlogic A5 SoC
>> family.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Please read:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc1#n503
> 
> and adjust your patches accordingly
> 

Thanks for pointing that out. I'll address it.

>> ---
>>   include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 44 ++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
>> new file mode 100644
>> index 000000000000..1bf027d0110a
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Chuan Liu <chuan.liu@amlogic.com>
>> + */
>> +
>> +#ifndef __AMLOGIC_A5_SCMI_CLKC_H
>> +#define __AMLOGIC_A5_SCMI_CLKC_H
>> +
>> +#define CLKID_OSC                            0
>> +#define CLKID_SYS_CLK                                1
>> +#define CLKID_AXI_CLK                                2
>> +#define CLKID_CPU_CLK                                3
>> +#define CLKID_DSU_CLK                                4
>> +#define CLKID_GP1_PLL                                5
>> +#define CLKID_FIXED_PLL_DCO                  6
>> +#define CLKID_FIXED_PLL                              7
>> +#define CLKID_ACLKM                          8
>> +#define CLKID_SYS_PLL_DIV16                  9
>> +#define CLKID_CPU_CLK_DIV16                  10
>> +#define CLKID_FCLK_50M_PREDIV                        11
>> +#define CLKID_FCLK_50M_DIV                   12
>> +#define CLKID_FCLK_50M                               13
>> +#define CLKID_FCLK_DIV2_DIV                  14
>> +#define CLKID_FCLK_DIV2                              15
>> +#define CLKID_FCLK_DIV2P5_DIV                        16
>> +#define CLKID_FCLK_DIV2P5                    17
>> +#define CLKID_FCLK_DIV3_DIV                  18
>> +#define CLKID_FCLK_DIV3                              19
>> +#define CLKID_FCLK_DIV4_DIV                  20
>> +#define CLKID_FCLK_DIV4                              21
>> +#define CLKID_FCLK_DIV5_DIV                  22
>> +#define CLKID_FCLK_DIV5                              23
>> +#define CLKID_FCLK_DIV7_DIV                  24
>> +#define CLKID_FCLK_DIV7                              25
>> +#define CLKID_SYS_MMC_PCLK                   26
>> +#define CLKID_SYS_CPU_CTRL                   27
>> +#define CLKID_SYS_IRQ_CTRL                   28
>> +#define CLKID_SYS_GIC                                29
>> +#define CLKID_SYS_BIG_NIC                    30
>> +#define CLKID_AXI_SYS_NIC                    31
>> +#define CLKID_AXI_CPU_DMC                    32
>> +
>> +#endif /* __AMLOGIC_A5_SCMI_CLKC_H */
> 
> --
> Jerome

