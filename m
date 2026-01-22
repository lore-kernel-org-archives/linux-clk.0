Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4793AE6FF;
	Thu, 22 Jan 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083315; cv=fail; b=QyteVBTnImPfjAQxxWfJKvcXHMswNwLjS+bVai+owelLPC0qD6GH1ag+m4kBeopE6o+ZWn+YRx4rbHjmZUYcIimj37QxAF55pRulA1sPhVZoAa3OYK/CeTo6P+kyXm+YHSy41heYQ5G5jtZR7Xlqo7YN9bircS89ykru2paC99c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083315; c=relaxed/simple;
	bh=RKXUakg2ibfQbASl8pypGXJK0VMYDo5MDN0hMLcvM/Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V1zloxR5Q74lA1CXmcw0Bhx6emozlrIbYoNvOmCV4wSqYHI1T0pQslZTXbkUThfpN3VBzM44OvkKpOavk4By6eBAWCtTngqcOKLc1Zx4RofZTKfrIpithQi4EcJH+tyVM0BXM4gsxFnAXeSrc1IJbcwaE6kxTOfMX6pniiZi2Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kJtnkEvE; arc=fail smtp.client-ip=40.107.159.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kJtnkEvE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igkAyPsbdwQ4Ic/LHozttjmlMMtBhEk3d72jL5qLyeFHbkxTP7acggPl8GHx5qQz8/mU26z3PTNvv4tExGapsrOHcO5Hw9etW6MmgJ4+T+yXxT4o30JKBXQVgklyrUNrNgqmPwkj7bDwhMDZzSZzKsx+CH8StB779xytqHyY37cuHEtuVECBk/L0FsVBq2/QVzfQrqA3km5Ar3Fw8+HNee7F6CrC8pc55Agdd7Tx7ph3rwsNdzEoEI1ZoJp/gkaxQiicciIg7upq+9HazFs7EjDhtxeQArmB9MGErAfVsCq+ZN6Rdy1fJDvXlxwMgKt6Ci/5YdRkb5qmHIf57yFn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzdK5xMV9VP1Zh5BObpei/DRwKu1ShIAqwCm+T6JwRU=;
 b=KZQ8FZ5mhoHknt72mwUmpyVkjmTOZ0o3NTo9Vg/LS1gSyrgAdViLrjInc5Ei9qyyw3IXEnekrsD22gJc5VUXB2r4941kKdZtx36z85+4YXcMf5BQ6EfptIKRUkGOqQ+610ay9fCT1xbIZ+LODE4kq7ZW1zE9CmHc9r0o0whX7KHzGFOvSMqFcdu9rU6Z62kALnNvFc/CE7Sq4D1XwL/9rcQrKzFMfsPLHl9UnXb8rc5SvpkIuVrykOZeXGKWVJ+jSZTVHGKltInGid4ZoXG7ELfALkQH6zLhVi3+6pNoJJUsWgLnFfqw0HqmU6ykCw5lYbun6yARKb6Yjm8eyxWiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzdK5xMV9VP1Zh5BObpei/DRwKu1ShIAqwCm+T6JwRU=;
 b=kJtnkEvEBSpLWATiSBrmeZGKs57R2owh3GEomHdnmbjwAA75u5/OQmASL/FrdyzpBdBsdO7/VEJO9IUOJoidnZ544OTIrvEbABem/WacBnklkDoy4RbIBj7WLh43JJDwVeqHmZqLvQus9QmIELr/ns/jdlqV7vlEfG0cMgIftXMeWAmbqOHOMU1lPA73XQurLQ+9vL7f3qNZsvyFNQx67Ah2US2zBuBkz+2F/87Ci9WOrgvOkSqsqfzZcLwhCp5BJM3KeQ4+uESxhVuKIvOz4VptjvR30q1wfpFrX3Mxr06myCPnuyOmnQK9pfece5mwmLV0chQtoTCtYQYOuBb8dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Thu, 22 Jan
 2026 12:01:49 +0000
Received: from DB9PR04MB8250.eurprd04.prod.outlook.com
 ([fe80::30da:db99:155a:92a5]) by DB9PR04MB8250.eurprd04.prod.outlook.com
 ([fe80::30da:db99:155a:92a5%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:01:45 +0000
Message-ID: <031fee8b-8d58-46d8-97a0-ecbe8fec6a00@nxp.com>
Date: Thu, 22 Jan 2026 14:04:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: imx6qdl: add label for system clocks
To: Frank Li <Frank.Li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
 <20260121-ccm_dts-v3-2-820ce9b5fa38@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-2-820ce9b5fa38@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::20) To DB9PR04MB8250.eurprd04.prod.outlook.com
 (2603:10a6:10:245::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8250:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4485ec-5a60-42c7-7e89-08de59ae0354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnM1aHRkeVFsVFF4VkxJY1FzYThLTHZBakVqNTY3VU51R2NwZVNYYXE3cG0x?=
 =?utf-8?B?MW9HQzJ4d082U3VpS25POXRRUlA0dm95Wmd4NW9MNm5ZZG0xTWM2QVp4RWgv?=
 =?utf-8?B?SVJwTkdpZzRRSFVXandtbUc2MVR2SVJ5eXJvSGZmOWIyaEZFNFJCL0ZGM1A3?=
 =?utf-8?B?Z25kZiswZ054TzVBdmtKNEJhcmFRMHNIY3R5MWhwMjJKVCtQcUFFZ3hKUVkv?=
 =?utf-8?B?Q2IyeXE1aDFGRGZtcnJzMEZxc3UzallkR3BsVnArS0lTcXR3ZThST21yZmhI?=
 =?utf-8?B?anZTOFc3Mzc4dVdRamlIQXBTbjMyZDlrM05nRnFXZTlGOTA0bnBHWXJGd2NK?=
 =?utf-8?B?aThQdFdnQk9idG52bGlPc2FkaHZRM0Nrc1MwOXdwaWlKMFBGN1Rka1U3aWNz?=
 =?utf-8?B?ZTJUUDhRR2tLYzlrQlZqVEJrU1NBWFRzMU8weEpZTFBnR3VScmJqNEFtY2Ey?=
 =?utf-8?B?a3QrdzV5OExKSXRLWDdlZ1FJbVIzaWU4elpDcGxHTzJreW83WFJ3cEpOVHJJ?=
 =?utf-8?B?TzlWYWl5a0xFTW1uMW5rU3JxZEFsRnRBREMyYTFRRzFYQS9EN0xCZ3RCQ2px?=
 =?utf-8?B?VCs3Q3VCUlA0bWNmdXphTWsxYVZCWmZQRW5NbCtjU0c1QWJyVkk5aDhIazRP?=
 =?utf-8?B?eVRleW9SMXBvYi95NSs1U1dGcVBKZWVSbnhaZTkyVE0xWlVubUhtcjJRejJM?=
 =?utf-8?B?RWo4YUdjcEFsaFRGTUF2K2UvWjRTV0ZaSm1pMGNtMkV1ZnVraUN0eGozNjZM?=
 =?utf-8?B?YmpMRmJiSS92Si9Sdy9jL3BNamF3VnhXb0xGamxlNU1sQ3ZOMWFuaXdpUWdI?=
 =?utf-8?B?YUNjd3dnVFNWRVo1TTl4UjRuZ1IxTy9TbVovOTB3RWhsSmZiUjBKOHpjeG92?=
 =?utf-8?B?UndjaGFJRzY0Z0JQcXh1OFFiNXkvT0xXMTBUVGRpS0hLM3U2OXZsd0FjcmF3?=
 =?utf-8?B?VktUQXJlTmJmTmZrbmY4L1M2czd4aWNScHREMVBqVWV1Qlh6cDlINENUMU9q?=
 =?utf-8?B?NFF2MENsRERQNFhRc3ZqWmVObDgxUUVTTkdkN1I1Y3dKSWNhVTZLV2lWbUlQ?=
 =?utf-8?B?RHRpaCtWU1IzbTVJUFprYWVJNUcxL2JLVjRCRFllR0hwdVJiYlYwTUVGeDY5?=
 =?utf-8?B?ZjVKZUlWbUhXazJlbGN4RUZpZVByeitGTUpLSjJINGMzc1Z4N01RaisyQXc1?=
 =?utf-8?B?NURMelFIRjhFbVc0Tmtnb3hIUTNuWW9iZ0RkOUZabGtWVGdBNStPa0djbzZz?=
 =?utf-8?B?V0JDU1duTGxvREJqMng1bXRsWmxqL1lRZ3diWUdPVXBCTGNaVVJLeG9wS3lK?=
 =?utf-8?B?cDZjMVFObFh1UnBKYTVGK21QYXpzNTErN1hUZGlXQTZjM0lzUXFOUEQxaThk?=
 =?utf-8?B?RzhFK29JSVdzWVRRdXZsNlA5MDRsMWFZUkQvWWErd2lMSXh3VTNZcDdJV2li?=
 =?utf-8?B?NWxLU3I0UnZ0bStOMW8xZXByRTJxMW9OQUZCN0xXZndJbjF4YWdpREtiakdy?=
 =?utf-8?B?VlpxdHVYd0l0MnQ1Ui9tNGUyZ2pSVjdnVE0rUWNsZ0hpM2ZTRmtHNEs4dXUw?=
 =?utf-8?B?bllXM09XY29DakttN1FlMXdWZHVqdERINjBQNm5pUmltSGE2eUJmaytubzlL?=
 =?utf-8?B?VnVaRTFwc0VYTjNSTERBdi93R095OU1wOTVjdGhlL25qMW1lb29IK21KY3Fq?=
 =?utf-8?B?NVVhc2ttQVdGbGt3dnRwaGE2aTJSSUJ1WTg5V2pQdW5uUVVXaW9LY1hWT3Jl?=
 =?utf-8?B?NVQ3UEV3VVpXUFBvZ21wOThUZHY5UE1JVTlmZ2wveWVHWFAvNjRxWWtWUHRR?=
 =?utf-8?B?K2Y3M2ErWnNtcmVxRGFYQTRvV3M3SDFVam5nUFo0L0FsdnE4aks5VjlFTVlp?=
 =?utf-8?B?b3ZleCtiK2F4blhyelk4cjV4ZWxHcUR2UTQveFRpbzhIb0dZMDNuTlpGc1Ro?=
 =?utf-8?B?YStrblZSRzhRM1BlZzBKNmo0TlIreFN1cTNiVTZFbEZGQTJ2ODdJS20wZ0cx?=
 =?utf-8?B?REVvSTlSUmNHdzlaMW9EUTkzMVVpa0JSMHNSL29qcGR0RHMwSG12VWVTRUtY?=
 =?utf-8?B?Vzdhd2pHenAydkNPalFRZWNMTjZaNnd0K1VsQUxNcXlnZXlmR0krOFJDb21m?=
 =?utf-8?B?WFlrUGdWdTA1b3RMSFlmK3Vqc1I5a29IYUNwS0Nxcm5yQnRTRVRTZHBoT1NY?=
 =?utf-8?B?cHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8250.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WERFT29XMmRGN1ZYVzZoVTZrUCt2cDc5eGJrTXgrTEprc3NTdU5ENTFieEpT?=
 =?utf-8?B?MFQvc2ZxSCt4MVp4UjhYVStzUEoyOVpCTzM2UldQYVhOclRjZW9VV1Ayaksz?=
 =?utf-8?B?bENOd1FhdVo2K3JlOGd6NW5oME1ERmFBWHpnMUxLckZ5YXBvWWJrcVVZK2Q1?=
 =?utf-8?B?VHVXbEl2TzYwSFdKU3V0TG90TWRWL1p2QURaNXc5T3lDd2V0Y1p1WmVpSm5s?=
 =?utf-8?B?THlvMDBCUDdHUXJoa2piaTc3NmF2aHdJcGhOWVhMZks5aU1qN0w2VnlkenhK?=
 =?utf-8?B?WmxSUDh3VlVWbS9KaFJmdWk1Qk13RnoyOFFMZnhNejRNOENwWXpOeUlSVjlU?=
 =?utf-8?B?dzNJNitaTklDUlJLMnRmeFhncDdxV3piVE11YXI3eHVWOW94R2RkN0xvVElj?=
 =?utf-8?B?NEl3MXdFSWZFZXZuTHNzdEhibFhrTHQyL0Z0dmdSM1dIRHhYWHQwWE1tM2d5?=
 =?utf-8?B?K29GdUtmRzk5b29hL2V5U293K1ZzbUo1S0Y4Z255UFlQUWVaOTRWTTdhWUx6?=
 =?utf-8?B?VUZHY0FoYUk1OFFnTTlKVUx5RXkrUHFYNDl6cUhhRm4rY1JQNnFPVDdXMmNi?=
 =?utf-8?B?Z2JKSGhZS1VpNlg5QmFFckN6dFRkQVZvcTkxUkRWd1Mzb0FHeENtcEVkZXZr?=
 =?utf-8?B?QlVWbkdySXBTWGJsV1RJNVRoR1E1THJDVWhwZFJoNzg1NWdxRTFIYWdOWEdQ?=
 =?utf-8?B?eVM2MVI0Y3dWeWN1YWRiT2FUZU9TcmsveElyNkJ2THZpZnhDQmVMdW1JK0V5?=
 =?utf-8?B?Vjh6MUxSRmp0UnQySUExTEtLZU1LaStnOEZMdktyVmJzMXZiV1dqdXI5OE11?=
 =?utf-8?B?N0k3a3IyYkJna2pvR3lObjRVZmlXOVVwU242S2hMRnh0eTVCUmZJNVZaUi8y?=
 =?utf-8?B?K3g0b1ZIbDFLK0hCZWVWNEx4ZmdsQy9oN0FGYXl1cWJuTERyUExiYld2NENV?=
 =?utf-8?B?S09MMytlTGJzemNMYnhyQjZZZDhvWDlIOXR6aDluMjQ1NHhjdlhLbE9sZ25P?=
 =?utf-8?B?ZTZWSVRwNmZIZUs4WCtKWkphUHg3RGxvZVhhOTNSUE9tYS9GMjY2NmpmbW9s?=
 =?utf-8?B?d2lnbDgvSmovdkNVcWNEMTNkQWg3N1k5WDFwR0lzWUhpWWJ6ZkgxMER4ZkVv?=
 =?utf-8?B?WjUrRmEzT3Z6NU12anZCSXkzQmhwemJ1eHdLM1FNUXpldVFUUVRVLzhVektX?=
 =?utf-8?B?QktCSGRKOXo5UmVaR2JFSVFkU1ZJTFl2WUR1UFlCRU4zdlo1d0swS3V5YXZa?=
 =?utf-8?B?dmZCaCtKVmZUbEtveHN4Z1dkWG9NNjB2cnJCc055TG9OZ0M4dFY1NWlncE5O?=
 =?utf-8?B?UGNkMnBmUmhUTUR5RkVDZXVTZGNFbUFSejdUbGl2WTR3SUxJRmNBdnFIcmtX?=
 =?utf-8?B?L3dXUFlmTnhFejgzbU5uQkliQm1ud1hpbmZIdnBQcThONlJVR01pVXVoRnZx?=
 =?utf-8?B?clUvSC8zM3E1VE5BOE9iOFR4T3k4UnVXRk1ETnM1bW5QOWpUSGVaakUxaURz?=
 =?utf-8?B?dnptdUlKS29qNWVFdkh0YjBpL0htZUM1Z3B3MDJ1MXY1VE5iR1pOR1QvRmw0?=
 =?utf-8?B?UnB3MzZIUm95TUlFbm1hRVZHQUFMeS82TDVjMEZvekRHbTR6a2dRYzVrczB3?=
 =?utf-8?B?WUE2amx4eFpoeUx4UG5VaDVlVTJzZkZ1TWVyVUxqM2tzbmhMNytmSTlucEpo?=
 =?utf-8?B?TnFFbkwvKzZuM2tXSlFFNkhwL1FDZ0JUbGJRNDAwK2dmZjFOMTNJLzh1MFpP?=
 =?utf-8?B?SVRQNlVTeXNwMXdSMml4SWh0YWdUaDZDRWhzLzNVb1VjVEIvcHdsTFBDUXpJ?=
 =?utf-8?B?L25NUWlGK053b2NrZUZ0eGVOMVdVSFVoWktUNmxrcUZHZ3lnWnpQYmtqY0Q0?=
 =?utf-8?B?ajgzWHFPQ1B1ZmJuTWJma0tyaTNGWksrMzQxT1lZL3J4cEhzNy93WkJLYUlQ?=
 =?utf-8?B?dUxJOUhIV3AvZ05lVDY5QWRVSlBBamhTM2I5RE8wQWJKV1NvUU44V0N3WkND?=
 =?utf-8?B?Y3daZC9peml5c3dsWWhqRzFQOXdGMDdWT3ExMlNQSUZHOTZjTmlrQWt5MmNS?=
 =?utf-8?B?MjhDTFdHajNEY1FudmgvZExkdjlFUnBCZGhrc3ByRzkvZzRKeHNJOW9ub0lP?=
 =?utf-8?B?RXFSdVN0R2JhL0IwN0dRN0x0RzdaNDBhclEzUThqWCtERHdpUGEvN1VBdTNR?=
 =?utf-8?B?Sk1YWWhlQXg5ZkJ5a20zQ2NKbUZ6c0xXYklpRklFcWVDcEhaMGZ0MGI1WExJ?=
 =?utf-8?B?TS9CYXlyc2J6OW1FMzZHY1BxK1ZsQXdWSGtsdTZZYnQySDJzRVlMdzNZclRC?=
 =?utf-8?B?OEpNMkVzV3lkM3JQWmt4b080SmRwaFNqTEhDYjhWSmFFSWlJL2liZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4485ec-5a60-42c7-7e89-08de59ae0354
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8250.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:01:45.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1BNu1bLHS2rS7xgpAOm+qAuTIWpvmL+am8waZqg1jMqr03bvlmsFkmJCUg5oVgNkDHBoumyljmGVsaT6b2Luw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

On 1/21/26 20:04, Frank Li wrote:
> Add label for system clocks and add two missing clocks anaclk[1,2]. Prepare
> for fixing ccm related CHECK_DTB warnings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

