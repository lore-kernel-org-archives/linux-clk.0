Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022124.outbound.protection.outlook.com [40.107.75.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D253328255;
	Tue, 23 Dec 2025 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492907; cv=fail; b=PFoSDQlbwH8nhUrFHsqsYlDd+e6LIi8/BB8e1BfhHhGHMp23s3YSIgUJ69D7+CqGXybbVCs0aJ0piFpgn1vx9MUMjEQ/S50tcbiwpcPGlaKA9cGLfYt5oPxfeAgs6HbP6paSsFbOIB72BHhq6HrwWyVeGtV/moFarJrsjpSkd+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492907; c=relaxed/simple;
	bh=jkCkdefVqLB+WpSAAOMxwgpZ1Fpsbh/faFiJNAgsIS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gBjIrXlkEmi8Cn75fGvXS0VbtA7LFHH2nopXgLq2336x3+kuvkusTTxZnu7GC/nUc1lcOnBHErPVRVkLIjviJz8K4az3sPex509SY8g9vbnL1c4W2pF2JWCPTTiIfbI4lE1Rz6LsuueLxj1gZUf9y4LjvoxshLRajvk4zgd2Vo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=UjzO8iQy; arc=fail smtp.client-ip=40.107.75.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="UjzO8iQy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjXTuYJKvKwo5iNNJvoPPPsvFNMZHfUoAT2EqXM7EccA0Ev0Lq9g6eGuKCeGdHgSwBDgnuxDExuzNHh2JGvevPOHIckwUK07Tsa4bxzK/6CwWhACN8A53IzelHHmKsr1a8wLKOOhh+k5hozWJRrEbroS2Ldx5/BCD1Vj1cqHKrAiVuMWvQ5gDgaDABhctycLMJDOvOdCylBhcavWVyfgTYqye6HPu+2KkR/fVSQTCKw1UctTMyILD8NDeKbE6HsoN0F7AkErNYOhgEhYFmowub3zVLm22Y5qsTkQCaRMv61XDme8Kfn18EMScyP56BcE9T922H07MYa9FVZLb63ukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E8HiZpOHaUnw5nfitXBP9TycN+xtH346HUV/beE1Ew=;
 b=TmZEq2zzfuzAeCV/kHMRNytYZFiIRRBoN4v5A0mENp60Jep6gTl9d1ReirgUCom6roV0X8PGVFrEl2RAy75gDfJDZ01mOEMCuXaKgOEpyCGBFkXLSS2O3tXcUZ3uS5oeTxilbos4vjVrRke5HV0oMn9kfL2QUQBGeS7xYHzJJTdmi0kbvZJXoPAA9czggTunpZchnI0veRbdhRsOmZZCl3Pt68PNOO3CVeiTd1Ty1AGbE4nrAdVA1+wqS/1WuaVuNicKwyQrfn5n9ff/ZFaV/XrRr4LZ8hXpwR5MBdA6gfrSCjtQEFqVvPsk6hEIF0HYaF56jkUY8ONdAHp+0T3ITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E8HiZpOHaUnw5nfitXBP9TycN+xtH346HUV/beE1Ew=;
 b=UjzO8iQyAhwxf7knbHkoUTJna1aaSbN7Eag3OOv1EeNbqJVI6hdsGurMsbIHlzrRsioRbqbIXRqU1vicxiNbp/YTR8gmxsD/0XFmzPIrwmQirhE6Uxd0gyi0LWtm918pG0xkNBQfoXIudelSPOmLGGHfNmyfK1Asi8unjyVSaDVLF7jqz7JQhyTLSVU+pEu6/GxB348gYy6VEkoGeRCDGtmxaznt2Jm9y/fQIAThG37gYuQGaRBwSQcapAzNRNcpETM2vKlIVGVFgztlfhMZxh2x7fJLKV61NB4Q6yrxNzmoww04asPmBrxTlhlZeSTboPIYh7nV0ttkOuYizxcrCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8006.apcprd03.prod.outlook.com (2603:1096:101:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 12:28:19 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 12:28:18 +0000
Message-ID: <425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com>
Date: Tue, 23 Dec 2025 20:27:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] clk: amlogic: Add A5 clock peripherals controller
 driver
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
 <20251028-a5-clk-v4-5-e62ca0aae243@amlogic.com>
 <1jpl857e2w.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jpl857e2w.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 17985528-d1d2-439f-fb16-08de421ec0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3pYU25VOVJKTHczS0xsK2pLNGxvSzF5OXZ0dnZlZ1VrUDVaUzVxSHc2bXdN?=
 =?utf-8?B?YU9CMm9WYVIrcTZnYkl1bkE5ajN1MldTRnptcm5lT01YOGV3dDhsNkh6aW5s?=
 =?utf-8?B?czJEQkhUUXZ4ZW4vU2tmT2hsTTUxSzNhT1gxR294aGs3VHJzU2dYMDBya2tT?=
 =?utf-8?B?OXpITGhHNkdFY3NDV0VHUnROZExaT0hLNTA1emZDb2JFVTEzUjFNdXhpaks2?=
 =?utf-8?B?M0s0NkNnTHl3ZlIzM0NaYTV5Rkl5aXAwQ2pZMDQ0WHdVZGdEZUQxOFVEZVRw?=
 =?utf-8?B?OXhNZG9Ud2NYcWZPYllXc3dsNkh0MzBCTDRRcVRpc0tvNDJxQ0FPNTFQWkEr?=
 =?utf-8?B?T1pDSllQQVF4ODZRZXk2WWk5ODVoVjhUR0RhendXbkpNNGF2bGM1eXpacUlQ?=
 =?utf-8?B?YmlBa2ErSmNXVmxMOCtpV1l4R3JlQzZHRUIzQzVvNVBBb1VReDEvN2JCajRT?=
 =?utf-8?B?K1A5RzVxSmNFYkhlZ3VaTmNySzAvT1ZuN2xKWGUxL1IwTkkyKzhwMFNtcUJC?=
 =?utf-8?B?SWVyc1kvZnhwbVBMQy9vTnFJSkRMd2JmSktLYXJtSEV3V2lqN0pENG5pRTdH?=
 =?utf-8?B?dXkwMVkzL3N3Z0Yzd2ZqOGdyUlpyYU02MXl4bHJZNmhsbmE3NS9GbXFucVJX?=
 =?utf-8?B?RUJhZHN5elJUd1lBUFVjV1Z2ajRiamdFcWVEMjMyV1RhRWhJcUp4akx4ZHZC?=
 =?utf-8?B?MDJwcjlWRkhqL2FFbEJWbTJtSHFQRm5XUXU5MUREazhyWThpN2lhdDZVSWdY?=
 =?utf-8?B?dzhBN1VyeTNpMEI2cGtKTnRSWWoyRUNTaG0rZmJXdloyMWRjOW1WVnZZRE9M?=
 =?utf-8?B?TFJubVVSbFNLMUplS2JmVWxqeXp0aHVJclBzSDIwUFdUT3VRS0pWQnhkWlpL?=
 =?utf-8?B?Lzd3RWFKRnFqc1Q2QjVoSDFEeS9pb2FXejVQaVYvdXNEYkNWblQ1UnhOdFNV?=
 =?utf-8?B?SGVnMzl1RktZMzZBVWlBd2hBUEVHaGtzd3JMbWNTS0x4dWZ3dTllTlVMRWJk?=
 =?utf-8?B?TDcwTDd4WlZsSDJnUitubzFCaVJwNlpWR0FtMGZhVlJLWnJoWWVkOFZQeVhu?=
 =?utf-8?B?VzlQRkRYUXg5QXJyVGg1a1cvUnVFZHlLcnpZRFVwaG9jVlRsS3ExZ0pLYkx4?=
 =?utf-8?B?cUtTL0NkRnc2YWVnZzJNL0l2aFR1YkxEK2pzQkxwaTRodVY2cS9OdVVxOVBS?=
 =?utf-8?B?eXlsTFRlSUppNkxoaHNCZGdOc3Z0YXpJVG1BVERobWNBYmlJMHJkeFJSeDZk?=
 =?utf-8?B?U3YzcUR6dXdabkpYRG53RXNOTWs1QXNZdDdmMUpLRU9FZ1V6SmpYZmR0L0VF?=
 =?utf-8?B?RU12Z2Z5OEx2KzMzK2NYV3JMYlB3TndlL3BTczVKM2dYWXkyL0ZOcEh4a1ZM?=
 =?utf-8?B?Y25GREh3b1ppWTZjOWpUejlsUUpjdWN1M0J4NWhaRVdzYjdQdklCMjVpdGlH?=
 =?utf-8?B?cmUwUGxsQ1BYakUxRkpOSXBhVklSVDJaWTNKNDEwTW9vcjkvS01FTUJ3K0JX?=
 =?utf-8?B?b1JvSXVVM2ppUmgyODN5WnliVXNWTzVFZVdqOHExNlJLMzN3UXdMYStsa0xC?=
 =?utf-8?B?bnFPRWFaOUxZbUg1VmdzUUR2VFRtY1JWZm13N1RJWGxUak5uL09GV1pNeVhS?=
 =?utf-8?B?Q3FERytEZEpWSjI3WW1ycmFTZ2U3WHRqeVZWNndSeVZ3VmUxdGladDhaL0Jj?=
 =?utf-8?B?Um1BblJscHF1UkFDSmpGNFFlYTlIWm1taE1IQi94dUZhSVRiV0d2TmJwM1ZM?=
 =?utf-8?B?WloxSGdTV0pQbEV3WEJPcVpvR2V3d05WSGpkaVFRemxuRUdBZStDSkxaYnJX?=
 =?utf-8?B?NGFPRWJ4UTJrcFR4b25IZGVBaFpPRnJWSDYxVEdSdjRqUGgzWThKemZrZGhT?=
 =?utf-8?B?amtoMGJUMGFnNkp0NnFQTUZjZTU5N0JoYXBJNzJRUmtzd1JJRkY4ZEZIUVMy?=
 =?utf-8?Q?2zlW823VGfia4TCBa6AN+MGukHLrEk1x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WklhVmhiL1hoMjkybExYL3hyWVZ2U0xlcGUybWhQU1N4K0pnV0xCbm5zOVc3?=
 =?utf-8?B?cit5WDFEejZqZXpoTUNVVGMyRXNwcWxZbHlFU1lva3NnNXMvMSs5TVVQbUJX?=
 =?utf-8?B?bjExZUVrQnVCK0tTQXdScTUzZ0F4c05sU0RKSHRaL2JGWWtLcXViVi90RGR1?=
 =?utf-8?B?SUlFcHB2b090UjFmY2JZZWhoUENGU3ZyMDBqYlJGOU9zMkN6cm1ZUitPOEZP?=
 =?utf-8?B?ZlluWkRLMDY0M0lkSGNFUWE5WDNVZkRTUTZGSDNmUVRpdGs5YmtncnZETWpG?=
 =?utf-8?B?U2RrL1lVZW02Q3YwWktqT2NKbHIrbDBZQ0lBdEJoY0Rsa2NXQ1REOFBuRWd1?=
 =?utf-8?B?Y0Z2aXZBS1FlRTFaTXh4Y2xOL29YaWlwa3IxejdSa2hEWUpFQzNsTXBOeFN1?=
 =?utf-8?B?d0xTTGxGTFBobEp2aytEaDFrbTY0Q3dsa29FSFowQzFNVE85T2Jxa2pENHJx?=
 =?utf-8?B?REc0S0xJNXVObEpOUngzSmw3MGVsNDBDOHJETDhscEdFL0ZqenRJSnptUlhO?=
 =?utf-8?B?Yk03cWlXUzA1S1VNa1pDdjlpTHIyOU9zTkpDc0lKOVVNUDRtRm1UWmJaSS8z?=
 =?utf-8?B?Tnl6ZlQwTU4zTmlMNW1TSXpjLzRtZTY1U09DbzVMakdXTm05ZWFaWmVVcWR6?=
 =?utf-8?B?RHpmdTRjWEMzMmgyNnk0eFhRbURPY3FLaGcvNjBqYlk0WUJDeS9TVi9xclhQ?=
 =?utf-8?B?eU82enFxeUdIVis1c1gxRXFUaTJ2Vlg1LzBNTTU5VzJBbTNXWTRJTFBRV1FZ?=
 =?utf-8?B?TlRsVTZ0ZzdJeXVUcUIyTTRkaFVxNlFpQndiYlp4OW5Dcmd5MVB1NlE2WnYy?=
 =?utf-8?B?OWVpQ2JSSUtCUTZKcjFudDlaMTlSaUEzR042aTlUQkxkNGZpRVZwbGlhcHhO?=
 =?utf-8?B?anVvMFBXRnA2QWdFYWg0UnB2UlA0Nk82bDVwZGMrU1J5QUc4TmFCMFFXZDVG?=
 =?utf-8?B?TGVHV0FMRjFsNitUcTNjUFgrR3Y5SXo1bDBVcU1YbUliRW15V1A0YjBqMGdO?=
 =?utf-8?B?QWZyUm5OaEZ3NXNmTXd2UWs4b04za09tRUw4YlZ6VDJ2cktVbkNlU0JmUXNH?=
 =?utf-8?B?VmJmUlJEWHhIbkxXeHExdUNzN3dVKzlIT3NieFE0UjVQRy9ZZjdsVzJIZGpX?=
 =?utf-8?B?TDlRYnFYMldEZHhpZHI4YXlzdjkzUDBjNmYzazljVnZWemFuWWZhTGMyK2E0?=
 =?utf-8?B?dnNYZkxweGxpWUZTNjExTUduTGFXYmFseEMyc0F4LzAwUkZqWVZjQ3B1K0h1?=
 =?utf-8?B?dVlhRFgxQmU0bTRUcU9hU0NCRGFuK1VUK1RJOHM1U3MrUHIyaXNYYjRXMmVy?=
 =?utf-8?B?R2ErajFiMVAreW5CWElsTnkyQ1UzQ2k3ck82bUhOZHBxMCtRb2ZuKzRIcDNq?=
 =?utf-8?B?cjZYTEw5bWRQVmlqOHVuaEJoWlQyRHZncWtPNDdvUS9nWS95WHFNNUFmdXov?=
 =?utf-8?B?RytWNVU5dHl5RWwxR1JVNjV0N3BOL2ZoRE1ISElnVURDOHZoTUkxa2JSeXM2?=
 =?utf-8?B?WHU1RDRFdnNNcUIzZWJ2dDRvdGpkNC9aZ3V1a25pclo2d1NEdW1oeGxPVzk2?=
 =?utf-8?B?ckdmVEtGWitRMHB6RkdPaTFqTjk5bk16TGFINkJ5ektlckl1WWdyd0ladXRR?=
 =?utf-8?B?d0NyMU95OEw1ZFdkdmsvOE52dFpBVCtaZG0zcWlzelRwdUtPZ2tYVkt2YmNM?=
 =?utf-8?B?MlJvbFlETnNEVkVrcnV2RHlJa0RFYmJ5cmNpUmpUajlpVVZOdjJSTUdFb0Ni?=
 =?utf-8?B?ZjRjNm1SLzVIOXVSa1dOVmJHQnlvL0ZpMzVaT0h1UVhDTW1HMjNQTkZmVGMr?=
 =?utf-8?B?NHExUVh4QUl4VE9KWUFYd0REa0VWTFJLZ0ZrL0loNnhxSzdHa3habzU3OEZ5?=
 =?utf-8?B?OGJ6S0E4Z2plQjB2NEdkKzJwZFJDMHJDQkdWU1RqM1ZCYzRVVExYcERhNjBM?=
 =?utf-8?B?cVk3RXJCUnhJcnVHdEtJc0JIcUhVZjJFeHpkTitsWVBkcnQ5RWpoYjFTdzls?=
 =?utf-8?B?Qll1Ujc1VTBySnRjVE1XOE9adERRWWFWeDIrclY4WHUyMUt6UVMxRm5IZFdi?=
 =?utf-8?B?ZXN5c1dHOGkvUVNITHJXM25BV25KOFBEdFg2NVpJVUxuclRyZTkra3d6enRM?=
 =?utf-8?B?a2lxSDRXV3U3UC80WXpxZEJzS3V3Nk5RVWQya0tuM2JFZ1lkSWV6b05FaS9i?=
 =?utf-8?B?QnBWMkRLMzJJajFTUXZkME11UkhNbzVrMldGR3lCU1pwWU9XRk1qcGFuNmdl?=
 =?utf-8?B?cGN4Yyt2TnVEZjI1cjhYQ0dONExzMmxhb21zRGJSb2U0ZWxlaVFQVkNUWFJn?=
 =?utf-8?B?U0hDcDRITFhOelE2aUx4UG9teTEyUXR2SUxTdml2TG9NRHJLbzRtZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17985528-d1d2-439f-fb16-08de421ec0ec
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:28:18.8249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMT1N88+E8cBSKPzRzCwLUFyapvjXqz89U39V+FA9Oj1HsfOY+iHwtJK2R8nEulcZLKw++uqWtvHDRohoUNbzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8006

Hi Jerome,

On 12/23/2025 5:16 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue 28 Oct 2025 at 17:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> 
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Add the peripherals clock controller driver for the Amlogic A5 SoC
>> family.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |  13 +
>>   drivers/clk/meson/Makefile         |   1 +
>>   drivers/clk/meson/a5-peripherals.c | 883 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 897 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index b627821da081..5576f351ef8c 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -146,6 +146,19 @@ config COMMON_CLK_A5_PLL
>>          Say Y if you want the board to work, because PLLs are the parent
>>          of most peripherals.
>>
>> +config COMMON_CLK_A5_PERIPHERALS
>> +     tristate "Amlogic A5 peripherals clock controller"
>> +     depends on ARM64
>> +     default ARCH_MESON
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_DUALDIV
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     imply COMMON_CLK_SCMI
>> +     imply COMMON_CLK_A5_PLL
>> +     help
>> +       Support for the Peripherals clock controller on Amlogic A113X2 device,
>> +       AKA A5. Say Y if you want the peripherals clock to work.
>> +
>>   config COMMON_CLK_C3_PLL
>>        tristate "Amlogic C3 PLL clock controller"
>>        depends on ARM64
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index a074aa7e187f..0432027d7e2e 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_A5_PLL) += a5-pll.o
>> +obj-$(CONFIG_COMMON_CLK_A5_PERIPHERALS) += a5-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>> diff --git a/drivers/clk/meson/a5-peripherals.c b/drivers/clk/meson/a5-peripherals.c
>> new file mode 100644
>> index 000000000000..eca9f3dcc256
>> --- /dev/null
>> +++ b/drivers/clk/meson/a5-peripherals.c
>> @@ -0,0 +1,883 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Amlogic A5 Peripherals Clock Controller Driver
>> + *
>> + * Copyright (c) 2024-2025 Amlogic, inc.
>> + * Author: Chuan Liu <chuan.liu@amlogic.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-regmap.h"
>> +#include "clk-dualdiv.h"
>> +#include "meson-clkc-utils.h"
>> +#include <dt-bindings/clock/amlogic,a5-peripherals-clkc.h>
>> +
>> +#define RTC_BY_OSCIN_CTRL0           0x8
>> +#define RTC_BY_OSCIN_CTRL1           0xc
>> +#define RTC_CTRL                     0x10
>> +#define SYS_CLK_EN0_REG0             0x44
>> +#define SYS_CLK_EN0_REG1             0x48
>> +#define DSPA_CLK_CTRL0                       0x9c
>> +#define CLK12_24_CTRL                        0xa8
>> +#define AXI_CLK_EN0                  0xac
>> +#define TS_CLK_CTRL                  0x158
>> +#define ETH_CLK_CTRL                 0x164
>> +#define NAND_CLK_CTRL                        0x168
>> +#define SD_EMMC_CLK_CTRL             0x16c
>> +#define SPICC_CLK_CTRL                       0x174
>> +#define GEN_CLK_CTRL                 0x178
>> +#define SAR_CLK_CTRL0                        0x17c
>> +#define PWM_CLK_AB_CTRL                      0x180
>> +#define PWM_CLK_CD_CTRL                      0x184
>> +#define PWM_CLK_EF_CTRL                      0x188
>> +#define PWM_CLK_GH_CTRL                      0x18c
>> +#define NNA_CLK_CNTL                 0x220
>> +
>> +static struct clk_regmap a5_rtc_dualdiv_clkin = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = RTC_BY_OSCIN_CTRL0,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_dualdiv_clkin",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "oscin",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static const struct meson_clk_dualdiv_param a5_rtc_dualdiv_table[] = {
>> +     { 733, 732, 8, 11, 1 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap a5_rtc_dualdiv = {
>> +     .data = &(struct meson_clk_dualdiv_data) {
>> +             .n1 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 12,
>> +             },
>> +             .n2 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL0,
>> +                     .shift   = 12,
>> +                     .width   = 12,
>> +             },
>> +             .m1 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL1,
>> +                     .shift   = 0,
>> +                     .width   = 12,
>> +             },
>> +             .m2 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL1,
>> +                     .shift   = 12,
>> +                     .width   = 12,
>> +             },
>> +             .dual = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .table = a5_rtc_dualdiv_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_dualdiv",
>> +             .ops = &meson_clk_dualdiv_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_rtc_dualdiv_clkin.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static const struct clk_parent_data a5_rtc_dualdiv_parent_data[] = {
>> +     { .hw = &a5_rtc_dualdiv.hw },
>> +     { .hw = &a5_rtc_dualdiv_clkin.hw }
>> +};
>> +
>> +static struct clk_regmap a5_rtc_dualdiv_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = RTC_BY_OSCIN_CTRL1,
>> +             .mask = 0x1,
>> +             .shift = 24,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_dualdiv_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = a5_rtc_dualdiv_parent_data,
>> +             .num_parents = ARRAY_SIZE(a5_rtc_dualdiv_parent_data),
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_rtc_dualdiv_clkout = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = RTC_BY_OSCIN_CTRL0,
>> +             .bit_idx = 30,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_dualdiv_clkout",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_rtc_dualdiv_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static const struct clk_parent_data a5_rtc_clk_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .hw = &a5_rtc_dualdiv_clkout.hw },
>> +     { .fw_name = "pad_osc" }
>> +};
>> +
>> +static struct clk_regmap a5_rtc_clk = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = RTC_CTRL,
>> +             .mask = 0x3,
>> +             .shift = 0,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_clk",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = a5_rtc_clk_parent_data,
>> +             .num_parents = ARRAY_SIZE(a5_rtc_clk_parent_data),
>> +             .flags = CLK_SET_RATE_PARENT,
> 
> NO_REPARENT maybe ?
> 

OK, I noticed your comment on T7, and it is reasonable. I will add it.

>> +     },
>> +};
>> +
>> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)                   \
>> +struct clk_regmap a5_##_name = {                                     \
>> +     .data = &(struct clk_regmap_gate_data) {                        \
>> +             .offset = (_reg),                                       \
>> +             .bit_idx = (_bit),                                      \
>> +     },                                                              \
>> +     .hw.init = &(struct clk_init_data) {                            \
>> +             .name = #_name,                                         \
>> +             .ops = &clk_regmap_gate_ops,                            \
>> +             .parent_data = (_pdata),                                \
>> +             .num_parents = 1,                                       \
>> +             .flags = (_flags),                                      \
>> +     },                                                              \
>> +}
> 
> You've complained about the time it took to do the clean-up of amlogic
> clocks, and yet, look what we have here ...
> 

Yes, the previous clean-up was meaningful, as it helped simplify a large 
amount of duplicated code.

Here, I redefined a macro to avoid adding a SoC prefix to the "clock 
name", which does not seem necessary.

>> +
>> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
>> +
>> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
>> +     A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
>> +
>> +static A5_SYS_PCLK(sys_reset_ctrl,   SYS_CLK_EN0_REG0, 1, 0);
>> +static A5_SYS_PCLK(sys_pwr_ctrl,     SYS_CLK_EN0_REG0, 3, 0);
>> +static A5_SYS_PCLK(sys_pad_ctrl,     SYS_CLK_EN0_REG0, 4, 0);
>> +static A5_SYS_PCLK(sys_ctrl,         SYS_CLK_EN0_REG0, 5, 0);
>> +static A5_SYS_PCLK(sys_ts_pll,               SYS_CLK_EN0_REG0, 6, 0);
>> +
>> +/*
>> + * NOTE: sys_dev_arb provides the clock to the ETH and SPICC arbiters that
>> + * access the AXI bus.
>> + */
>> +static A5_SYS_PCLK(sys_dev_arb,              SYS_CLK_EN0_REG0, 7, 0);
>> +static A5_SYS_PCLK(sys_mailbox,              SYS_CLK_EN0_REG0, 10, 0);
>> +static A5_SYS_PCLK(sys_jtag_ctrl,    SYS_CLK_EN0_REG0, 12, 0);
>> +static A5_SYS_PCLK(sys_ir_ctrl,              SYS_CLK_EN0_REG0, 13, 0);
>> +static A5_SYS_PCLK(sys_msr_clk,              SYS_CLK_EN0_REG0, 15, 0);
>> +static A5_SYS_PCLK(sys_rom,          SYS_CLK_EN0_REG0, 16, 0);
>> +static A5_SYS_PCLK(sys_cpu_apb,              SYS_CLK_EN0_REG0, 18, 0);
>> +static A5_SYS_PCLK(sys_rsa,          SYS_CLK_EN0_REG0, 19, 0);
>> +static A5_SYS_PCLK(sys_saradc,               SYS_CLK_EN0_REG0, 20, 0);
>> +static A5_SYS_PCLK(sys_startup,              SYS_CLK_EN0_REG0, 21, 0);
>> +static A5_SYS_PCLK(sys_secure,               SYS_CLK_EN0_REG0, 22, 0);
>> +static A5_SYS_PCLK(sys_spifc,                SYS_CLK_EN0_REG0, 23, 0);
>> +static A5_SYS_PCLK(sys_dspa,         SYS_CLK_EN0_REG0, 24, 0);
>> +static A5_SYS_PCLK(sys_nna,          SYS_CLK_EN0_REG0, 25, 0);
>> +static A5_SYS_PCLK(sys_eth_mac,              SYS_CLK_EN0_REG0, 26, 0);
>> +static A5_SYS_PCLK(sys_rama,         SYS_CLK_EN0_REG0, 28, 0);
>> +static A5_SYS_PCLK(sys_ramb,         SYS_CLK_EN0_REG0, 30, 0);
>> +static A5_SYS_PCLK(sys_audio_top,    SYS_CLK_EN0_REG1, 0, 0);
>> +static A5_SYS_PCLK(sys_audio_vad,    SYS_CLK_EN0_REG1, 1, 0);
>> +static A5_SYS_PCLK(sys_usb,          SYS_CLK_EN0_REG1, 2, 0);
>> +static A5_SYS_PCLK(sys_sd_emmc_a,    SYS_CLK_EN0_REG1, 3, 0);
>> +static A5_SYS_PCLK(sys_sd_emmc_c,    SYS_CLK_EN0_REG1, 4, 0);
>> +static A5_SYS_PCLK(sys_pwm_ab,               SYS_CLK_EN0_REG1, 5, 0);
>> +static A5_SYS_PCLK(sys_pwm_cd,               SYS_CLK_EN0_REG1, 6, 0);
>> +static A5_SYS_PCLK(sys_pwm_ef,               SYS_CLK_EN0_REG1, 7, 0);
>> +static A5_SYS_PCLK(sys_pwm_gh,               SYS_CLK_EN0_REG1, 8, 0);
>> +static A5_SYS_PCLK(sys_spicc_1,              SYS_CLK_EN0_REG1, 9, 0);
>> +static A5_SYS_PCLK(sys_spicc_0,              SYS_CLK_EN0_REG1, 10, 0);
>> +static A5_SYS_PCLK(sys_uart_a,               SYS_CLK_EN0_REG1, 11, 0);
>> +static A5_SYS_PCLK(sys_uart_b,               SYS_CLK_EN0_REG1, 12, 0);
>> +static A5_SYS_PCLK(sys_uart_c,               SYS_CLK_EN0_REG1, 13, 0);
>> +static A5_SYS_PCLK(sys_uart_d,               SYS_CLK_EN0_REG1, 14, 0);
>> +static A5_SYS_PCLK(sys_uart_e,               SYS_CLK_EN0_REG1, 15, 0);
>> +static A5_SYS_PCLK(sys_i2c_m_a,              SYS_CLK_EN0_REG1, 16, 0);
>> +static A5_SYS_PCLK(sys_i2c_m_b,              SYS_CLK_EN0_REG1, 17, 0);
>> +static A5_SYS_PCLK(sys_i2c_m_c,              SYS_CLK_EN0_REG1, 18, 0);
>> +static A5_SYS_PCLK(sys_i2c_m_d,              SYS_CLK_EN0_REG1, 19, 0);
>> +static A5_SYS_PCLK(sys_rtc,          SYS_CLK_EN0_REG1, 21, 0);
>> +
>> +static const struct clk_parent_data a5_axi_clk_parents = { .fw_name = "axiclk" };
>> +
>> +#define A5_AXI_CLK(_name, _reg, _bit, _flags) \
>> +     A5_PCLK(_name, _reg, _bit, &a5_axi_clk_parents, _flags)
>> +
>> +static A5_AXI_CLK(axi_audio_vad,     AXI_CLK_EN0, 0, 0);
>> +static A5_AXI_CLK(axi_audio_top,     AXI_CLK_EN0, 1, 0);
>> +static A5_AXI_CLK(axi_ramb,          AXI_CLK_EN0, 5, 0);
>> +static A5_AXI_CLK(axi_rama,          AXI_CLK_EN0, 6, 0);
>> +static A5_AXI_CLK(axi_nna,           AXI_CLK_EN0, 12, 0);
>> +
>> +/*
>> + * NOTE: axi_dev1_dmc provides the clock for the peripherals(EMMC, SDIO,
>> + * sec_top, USB, Audio) to access the AXI bus of the DDR.
>> + */
>> +static A5_AXI_CLK(axi_dev1_dmc,      AXI_CLK_EN0, 13, 0);
>> +
>> +/*
>> + * NOTE: axi_dev0_dmc provides the clock for the peripherals(ETH and SPICC)
>> + * to access the AXI bus of the DDR.
>> + */
>> +static A5_AXI_CLK(axi_dev0_dmc,      AXI_CLK_EN0, 14, 0);
>> +static A5_AXI_CLK(axi_dsp_dmc,               AXI_CLK_EN0, 15, 0);
>> +
>> +static struct clk_regmap a5_clk_12_24m_in = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = CLK12_24_CTRL,
>> +             .bit_idx = 11,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "clk_12_24m_in",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_clk_12_24m = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = CLK12_24_CTRL,
>> +             .shift = 10,
>> +             .width = 1,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "clk_12_24m",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_clk_12_24m_in.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_fclk_25m_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = CLK12_24_CTRL,
>> +             .shift = 0,
>> +             .width = 8,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "fclk_25m_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "fix",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_fclk_25m = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = CLK12_24_CTRL,
>> +             .bit_idx = 12,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "fclk_25m",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_fclk_25m_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +/*
>> + * Channel 4 5 8 9 10 11 13 14 15 16 18 are not connected.
>> + *
>> + * gp1 is designed for DSU (DynamIQ Shared Unit) alone. It cannot be changed
>> + * arbitrarily. gp1 is read-only in the kernel and is only open for debug
>> + * purposes.
>> + */
>> +static u32 a5_gen_parent_table[] = { 0, 1, 2, 3, 6, 7, 12, 17, 19, 20, 21, 22,
>> +                                 23, 24, 25, 26, 27, 28};
>> +
>> +static const struct clk_parent_data a5_gen_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .hw = &a5_rtc_clk.hw },
>> +     { .fw_name = "sysplldiv16" },
>> +     { .fw_name = "ddr" },
>> +     { .fw_name = "gp1" },
>> +     { .fw_name = "hifi" },
>> +     { .fw_name = "clkmsr" },
>> +     { .fw_name = "cpudiv16" },
>> +     { .fw_name = "fdiv2" },
>> +     { .fw_name = "fdiv2p5" },
>> +     { .fw_name = "fdiv3" },
>> +     { .fw_name = "fdiv4" },
>> +     { .fw_name = "fdiv5" },
>> +     { .fw_name = "fdiv7" },
>> +     { .fw_name = "mpll0" },
>> +     { .fw_name = "mpll1" },
>> +     { .fw_name = "mpll2" },
>> +     { .fw_name = "mpll3" }
>> +};
>> +
>> +static struct clk_regmap a5_gen_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = GEN_CLK_CTRL,
>> +             .mask = 0x1f,
>> +             .shift = 12,
>> +             .table = a5_gen_parent_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gen_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = a5_gen_parent_data,
>> +             .num_parents = ARRAY_SIZE(a5_gen_parent_data),
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_gen_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = GEN_CLK_CTRL,
>> +             .shift = 0,
>> +             .width = 11,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gen_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_gen_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_gen = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = GEN_CLK_CTRL,
>> +             .bit_idx = 11,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gen",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_gen_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>> +
>> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
>> +     MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>> +
>> +#define A5_COMP_GATE(_name, _reg, _bit) \
>> +     MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
>> +
>> +static const struct clk_parent_data a5_saradc_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .fw_name = "sysclk" }
>> +};
>> +
>> +static A5_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x3, a5_saradc_parent_data);
>> +static A5_COMP_DIV(saradc, SAR_CLK_CTRL0, 0, 8);
>> +static A5_COMP_GATE(saradc, SAR_CLK_CTRL0, 8);
>> +
>> +static const struct clk_parent_data a5_pwm_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .hw = &a5_rtc_clk.hw },
>> +     { .fw_name = "fdiv4" },
>> +     { .fw_name = "fdiv3" }
>> +};
>> +
>> +static A5_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
>> +static A5_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
>> +
>> +static A5_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
>> +static A5_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
>> +
>> +static A5_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
>> +static A5_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
>> +
>> +static A5_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
>> +static A5_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
>> +
>> +static A5_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
>> +static A5_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
>> +
>> +static A5_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
>> +static A5_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
>> +
>> +static A5_COMP_SEL(pwm_g, PWM_CLK_GH_CTRL, 9, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_g, PWM_CLK_GH_CTRL, 0, 8);
>> +static A5_COMP_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
>> +
>> +static A5_COMP_SEL(pwm_h, PWM_CLK_GH_CTRL, 25, 0x3, a5_pwm_parent_data);
>> +static A5_COMP_DIV(pwm_h, PWM_CLK_GH_CTRL, 16, 8);
>> +static A5_COMP_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
>> +
>> +/*
>> + * NOTE: Channel 7 is gp1, because gp1 is designed for DSU, so spicc does not
>> + * support this source in the driver.
>> + */
>> +static const struct clk_parent_data a5_spicc_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .fw_name = "sysclk" },
>> +     { .fw_name = "fdiv4" },
>> +     { .fw_name = "fdiv3" },
>> +     { .fw_name = "fdiv2" },
>> +     { .fw_name = "fdiv5" },
>> +     { .fw_name = "fdiv7" }
>> +};
>> +
>> +static A5_COMP_SEL(spicc_0, SPICC_CLK_CTRL, 7, 0x7, a5_spicc_parent_data);
>> +static A5_COMP_DIV(spicc_0, SPICC_CLK_CTRL, 0, 6);
>> +static A5_COMP_GATE(spicc_0, SPICC_CLK_CTRL, 6);
>> +
>> +static A5_COMP_SEL(spicc_1, SPICC_CLK_CTRL, 23, 0x7, a5_spicc_parent_data);
>> +static A5_COMP_DIV(spicc_1, SPICC_CLK_CTRL, 16, 6);
>> +static A5_COMP_GATE(spicc_1, SPICC_CLK_CTRL, 22);
>> +
>> +static const struct clk_parent_data a5_sd_emmc_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .fw_name = "fdiv2" },
>> +     { .fw_name = "fdiv3" },
>> +     { .fw_name = "hifi" },
>> +     { .fw_name = "fdiv2p5" },
>> +     { .fw_name = "mpll2" },
>> +     { .fw_name = "mpll3" },
>> +     { .fw_name = "gp0" }
>> +};
>> +
>> +static A5_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, a5_sd_emmc_parent_data);
>> +static A5_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
>> +static A5_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL, 7);
>> +
>> +static A5_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, a5_sd_emmc_parent_data);
>> +static A5_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
>> +static A5_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7);
>> +
>> +static struct clk_regmap a5_ts_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = TS_CLK_CTRL,
>> +             .shift = 0,
>> +             .width = 8,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "ts_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "oscin",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_ts = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = TS_CLK_CTRL,
>> +             .bit_idx = 8,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "ts",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_ts_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_fixed_factor a5_eth_125m_div = {
>> +     .mult = 1,
>> +     .div = 8,
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "eth_125m_div",
>> +             .ops = &clk_fixed_factor_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "fdiv2",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_eth_125m = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = ETH_CLK_CTRL,
>> +             .bit_idx = 7,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "eth_125m",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_eth_125m_div.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_eth_rmii_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = ETH_CLK_CTRL,
>> +             .shift = 0,
>> +             .width = 7,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "eth_rmii_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "fdiv2",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_eth_rmii = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = ETH_CLK_CTRL,
>> +             .bit_idx = 8,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "eth_rmii",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_eth_rmii_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +/* Channel 6 is gp1. */
>> +static u32 a5_dspa_parent_table[] = { 0, 1, 2, 3, 4, 5, 7};
> 
> Considering there is no rate propagation from mux below, is it really a
> problem to have gp1 in here ?
> 

gp1 is used to provide the clock for the DSU, and the dsu_clk changes 
dynamically along with cpu_clk (cpufreq support is required). Although 
we do not have good cpufreq support upstream at the moment, it is very 
likely (and almost inevitable) that it will be supported in the future.

If the clocks of other modules are switched to gp1, and cpufreq later 
adjusts the gp1 frequency again, those modules that depend on gp1 may 
behave abnormally. Therefore, gp1 may not be suitable to be exposed to 
the clock tree for general peripherals.

>> +
>> +static const struct clk_parent_data a5_dspa_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .fw_name = "fdiv2p5" },
>> +     { .fw_name = "fdiv3" },
>> +     { .fw_name = "rtc" },  /* rtc_pll */
>> +     { .fw_name = "hifi" },
>> +     { .fw_name = "fdiv4" },
>> +     { .hw = &a5_rtc_clk.hw }
>> +};
>> +
>> +static struct clk_regmap a5_dspa_0_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .mask = 0x7,
>> +             .shift = 10,
>> +             .table = a5_dspa_parent_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa_0_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = a5_dspa_parent_data,
>> +             .num_parents = ARRAY_SIZE(a5_dspa_parent_data),
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_dspa_0_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .shift = 0,
>> +             .width = 10,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa_0_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_dspa_0_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
> 
> Same comment as the t7 regarding naming and macro usage for the glitch
> free composite clocks. Please adjust accordingly.
> 

Ok, got it.

>> +
>> +static struct clk_regmap a5_dspa_0 = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .bit_idx = 13,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa_0",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_dspa_0_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_dspa_1_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .mask = 0x7,
>> +             .shift = 26,
>> +             .table = a5_dspa_parent_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa_1_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = a5_dspa_parent_data,
>> +             .num_parents = ARRAY_SIZE(a5_dspa_parent_data),
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_dspa_1_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .shift = 16,
>> +             .width = 10,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa_1_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_dspa_1_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_dspa_1 = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .bit_idx = 29,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa_1",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_dspa_1_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap a5_dspa = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = DSPA_CLK_CTRL0,
>> +             .mask = 0x1,
>> +             .shift = 15,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "dspa",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_dspa_0.hw,
>> +                     &a5_dspa_1.hw
>> +             },
>> +             .num_parents = 2,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +#define A5_COMP_SEL_WITH_TAB(_name, _reg, _shift, _mask, _pdata, _table) \
> 
> No, adjust your main macro.
> 

Do you mean to unify this into a single macro here? Like this:

#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
    MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)

>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>> +
>> +/* Channel 6 is gp1. */
>> +static u32 a5_nna_parent_table[] = { 0, 1, 2, 3, 4, 5, 7};
>> +
>> +static const struct clk_parent_data a5_nna_parent_data[] = {
>> +     { .fw_name = "oscin" },
>> +     { .fw_name = "fdiv2p5" },
>> +     { .fw_name = "fdiv4" },
>> +     { .fw_name = "fdiv3" },
>> +     { .fw_name = "fdiv5" },
>> +     { .fw_name = "fdiv2" },
>> +     { .fw_name = "hifi" }
>> +};
>> +
>> +static A5_COMP_SEL_WITH_TAB(nna_core, NNA_CLK_CNTL, 9, 0x7,
>> +                         a5_nna_parent_data, a5_nna_parent_table);
>> +static A5_COMP_DIV(nna_core, NNA_CLK_CNTL, 0, 7);
>> +static A5_COMP_GATE(nna_core, NNA_CLK_CNTL, 8);
>> +
>> +static A5_COMP_SEL_WITH_TAB(nna_axi, NNA_CLK_CNTL, 25, 0x7,
>> +                         a5_nna_parent_data, a5_nna_parent_table);
>> +static A5_COMP_DIV(nna_axi, NNA_CLK_CNTL, 16, 7);
>> +static A5_COMP_GATE(nna_axi, NNA_CLK_CNTL, 24);
>> +
>> +static struct clk_hw *a5_peripherals_hw_clks[] = {
>> +     [CLKID_RTC_DUALDIV_CLKIN]       = &a5_rtc_dualdiv_clkin.hw,
>> +     [CLKID_RTC_DUALDIV]             = &a5_rtc_dualdiv.hw,
>> +     [CLKID_RTC_DUALDIV_SEL]         = &a5_rtc_dualdiv_sel.hw,
>> +     [CLKID_RTC_DUALDIV_CLKOUT]      = &a5_rtc_dualdiv_clkout.hw,
>> +     [CLKID_RTC_CLK]                 = &a5_rtc_clk.hw,
>> +     [CLKID_SYS_RESET_CTRL]          = &a5_sys_reset_ctrl.hw,
>> +     [CLKID_SYS_PWR_CTRL]            = &a5_sys_pwr_ctrl.hw,
>> +     [CLKID_SYS_PAD_CTRL]            = &a5_sys_pad_ctrl.hw,
>> +     [CLKID_SYS_CTRL]                = &a5_sys_ctrl.hw,
>> +     [CLKID_SYS_TS_PLL]              = &a5_sys_ts_pll.hw,
>> +     [CLKID_SYS_DEV_ARB]             = &a5_sys_dev_arb.hw,
>> +     [CLKID_SYS_MAILBOX]             = &a5_sys_mailbox.hw,
>> +     [CLKID_SYS_JTAG_CTRL]           = &a5_sys_jtag_ctrl.hw,
>> +     [CLKID_SYS_IR_CTRL]             = &a5_sys_ir_ctrl.hw,
>> +     [CLKID_SYS_MSR_CLK]             = &a5_sys_msr_clk.hw,
>> +     [CLKID_SYS_ROM]                 = &a5_sys_rom.hw,
>> +     [CLKID_SYS_CPU_ARB]             = &a5_sys_cpu_apb.hw,
>> +     [CLKID_SYS_RSA]                 = &a5_sys_rsa.hw,
>> +     [CLKID_SYS_SARADC]              = &a5_sys_saradc.hw,
>> +     [CLKID_SYS_STARTUP]             = &a5_sys_startup.hw,
>> +     [CLKID_SYS_SECURE]              = &a5_sys_secure.hw,
>> +     [CLKID_SYS_SPIFC]               = &a5_sys_spifc.hw,
>> +     [CLKID_SYS_DSPA]                = &a5_sys_dspa.hw,
>> +     [CLKID_SYS_NNA]                 = &a5_sys_nna.hw,
>> +     [CLKID_SYS_ETH_MAC]             = &a5_sys_eth_mac.hw,
>> +     [CLKID_SYS_RAMA]                = &a5_sys_rama.hw,
>> +     [CLKID_SYS_RAMB]                = &a5_sys_ramb.hw,
>> +     [CLKID_SYS_AUDIO_TOP]           = &a5_sys_audio_top.hw,
>> +     [CLKID_SYS_AUDIO_VAD]           = &a5_sys_audio_vad.hw,
>> +     [CLKID_SYS_USB]                 = &a5_sys_usb.hw,
>> +     [CLKID_SYS_SD_EMMC_A]           = &a5_sys_sd_emmc_a.hw,
>> +     [CLKID_SYS_SD_EMMC_C]           = &a5_sys_sd_emmc_c.hw,
>> +     [CLKID_SYS_PWM_AB]              = &a5_sys_pwm_ab.hw,
>> +     [CLKID_SYS_PWM_CD]              = &a5_sys_pwm_cd.hw,
>> +     [CLKID_SYS_PWM_EF]              = &a5_sys_pwm_ef.hw,
>> +     [CLKID_SYS_PWM_GH]              = &a5_sys_pwm_gh.hw,
>> +     [CLKID_SYS_SPICC_1]             = &a5_sys_spicc_1.hw,
>> +     [CLKID_SYS_SPICC_0]             = &a5_sys_spicc_0.hw,
>> +     [CLKID_SYS_UART_A]              = &a5_sys_uart_a.hw,
>> +     [CLKID_SYS_UART_B]              = &a5_sys_uart_b.hw,
>> +     [CLKID_SYS_UART_C]              = &a5_sys_uart_c.hw,
>> +     [CLKID_SYS_UART_D]              = &a5_sys_uart_d.hw,
>> +     [CLKID_SYS_UART_E]              = &a5_sys_uart_e.hw,
>> +     [CLKID_SYS_I2C_M_A]             = &a5_sys_i2c_m_a.hw,
>> +     [CLKID_SYS_I2C_M_B]             = &a5_sys_i2c_m_b.hw,
>> +     [CLKID_SYS_I2C_M_C]             = &a5_sys_i2c_m_c.hw,
>> +     [CLKID_SYS_I2C_M_D]             = &a5_sys_i2c_m_d.hw,
>> +     [CLKID_SYS_RTC]                 = &a5_sys_rtc.hw,
>> +     [CLKID_AXI_AUDIO_VAD]           = &a5_axi_audio_vad.hw,
>> +     [CLKID_AXI_AUDIO_TOP]           = &a5_axi_audio_top.hw,
>> +     [CLKID_AXI_RAMB]                = &a5_axi_ramb.hw,
>> +     [CLKID_AXI_RAMA]                = &a5_axi_rama.hw,
>> +     [CLKID_AXI_NNA]                 = &a5_axi_nna.hw,
>> +     [CLKID_AXI_DEV1_DMC]            = &a5_axi_dev1_dmc.hw,
>> +     [CLKID_AXI_DEV0_DMC]            = &a5_axi_dev0_dmc.hw,
>> +     [CLKID_AXI_DSP_DMC]             = &a5_axi_dsp_dmc.hw,
>> +     [CLKID_12_24M_IN]               = &a5_clk_12_24m_in.hw,
>> +     [CLKID_12M_24M]                 = &a5_clk_12_24m.hw,
>> +     [CLKID_FCLK_25M_DIV]            = &a5_fclk_25m_div.hw,
>> +     [CLKID_FCLK_25M]                = &a5_fclk_25m.hw,
>> +     [CLKID_GEN_SEL]                 = &a5_gen_sel.hw,
>> +     [CLKID_GEN_DIV]                 = &a5_gen_div.hw,
>> +     [CLKID_GEN]                     = &a5_gen.hw,
>> +     [CLKID_SARADC_SEL]              = &a5_saradc_sel.hw,
>> +     [CLKID_SARADC_DIV]              = &a5_saradc_div.hw,
>> +     [CLKID_SARADC]                  = &a5_saradc.hw,
>> +     [CLKID_PWM_A_SEL]               = &a5_pwm_a_sel.hw,
>> +     [CLKID_PWM_A_DIV]               = &a5_pwm_a_div.hw,
>> +     [CLKID_PWM_A]                   = &a5_pwm_a.hw,
>> +     [CLKID_PWM_B_SEL]               = &a5_pwm_b_sel.hw,
>> +     [CLKID_PWM_B_DIV]               = &a5_pwm_b_div.hw,
>> +     [CLKID_PWM_B]                   = &a5_pwm_b.hw,
>> +     [CLKID_PWM_C_SEL]               = &a5_pwm_c_sel.hw,
>> +     [CLKID_PWM_C_DIV]               = &a5_pwm_c_div.hw,
>> +     [CLKID_PWM_C]                   = &a5_pwm_c.hw,
>> +     [CLKID_PWM_D_SEL]               = &a5_pwm_d_sel.hw,
>> +     [CLKID_PWM_D_DIV]               = &a5_pwm_d_div.hw,
>> +     [CLKID_PWM_D]                   = &a5_pwm_d.hw,
>> +     [CLKID_PWM_E_SEL]               = &a5_pwm_e_sel.hw,
>> +     [CLKID_PWM_E_DIV]               = &a5_pwm_e_div.hw,
>> +     [CLKID_PWM_E]                   = &a5_pwm_e.hw,
>> +     [CLKID_PWM_F_SEL]               = &a5_pwm_f_sel.hw,
>> +     [CLKID_PWM_F_DIV]               = &a5_pwm_f_div.hw,
>> +     [CLKID_PWM_F]                   = &a5_pwm_f.hw,
>> +     [CLKID_PWM_G_SEL]               = &a5_pwm_g_sel.hw,
>> +     [CLKID_PWM_G_DIV]               = &a5_pwm_g_div.hw,
>> +     [CLKID_PWM_G]                   = &a5_pwm_g.hw,
>> +     [CLKID_PWM_H_SEL]               = &a5_pwm_h_sel.hw,
>> +     [CLKID_PWM_H_DIV]               = &a5_pwm_h_div.hw,
>> +     [CLKID_PWM_H]                   = &a5_pwm_h.hw,
>> +     [CLKID_SPICC_0_SEL]             = &a5_spicc_0_sel.hw,
>> +     [CLKID_SPICC_0_DIV]             = &a5_spicc_0_div.hw,
>> +     [CLKID_SPICC_0]                 = &a5_spicc_0.hw,
>> +     [CLKID_SPICC_1_SEL]             = &a5_spicc_1_sel.hw,
>> +     [CLKID_SPICC_1_DIV]             = &a5_spicc_1_div.hw,
>> +     [CLKID_SPICC_1]                 = &a5_spicc_1.hw,
>> +     [CLKID_SD_EMMC_A_SEL]           = &a5_sd_emmc_a_sel.hw,
>> +     [CLKID_SD_EMMC_A_DIV]           = &a5_sd_emmc_a_div.hw,
>> +     [CLKID_SD_EMMC_A]               = &a5_sd_emmc_a.hw,
>> +     [CLKID_SD_EMMC_C_SEL]           = &a5_sd_emmc_c_sel.hw,
>> +     [CLKID_SD_EMMC_C_DIV]           = &a5_sd_emmc_c_div.hw,
>> +     [CLKID_SD_EMMC_C]               = &a5_sd_emmc_c.hw,
>> +     [CLKID_TS_DIV]                  = &a5_ts_div.hw,
>> +     [CLKID_TS]                      = &a5_ts.hw,
>> +     [CLKID_ETH_125M_DIV]            = &a5_eth_125m_div.hw,
>> +     [CLKID_ETH_125M]                = &a5_eth_125m.hw,
>> +     [CLKID_ETH_RMII_DIV]            = &a5_eth_rmii_div.hw,
>> +     [CLKID_ETH_RMII]                = &a5_eth_rmii.hw,
>> +     [CLKID_DSPA_0_SEL]              = &a5_dspa_0_sel.hw,
>> +     [CLKID_DSPA_0_DIV]              = &a5_dspa_0_div.hw,
>> +     [CLKID_DSPA_0]                  = &a5_dspa_0.hw,
>> +     [CLKID_DSPA_1_SEL]              = &a5_dspa_1_sel.hw,
>> +     [CLKID_DSPA_1_DIV]              = &a5_dspa_1_div.hw,
>> +     [CLKID_DSPA_1]                  = &a5_dspa_1.hw,
>> +     [CLKID_DSPA]                    = &a5_dspa.hw,
>> +     [CLKID_NNA_CORE_SEL]            = &a5_nna_core_sel.hw,
>> +     [CLKID_NNA_CORE_DIV]            = &a5_nna_core_div.hw,
>> +     [CLKID_NNA_CORE]                = &a5_nna_core.hw,
>> +     [CLKID_NNA_AXI_SEL]             = &a5_nna_axi_sel.hw,
>> +     [CLKID_NNA_AXI_DIV]             = &a5_nna_axi_div.hw,
>> +     [CLKID_NNA_AXI]                 = &a5_nna_axi.hw,
>> +};
>> +
>> +static const struct meson_clkc_data a5_peripherals_clkc_data = {
>> +     .hw_clks = {
>> +             .hws = a5_peripherals_hw_clks,
>> +             .num = ARRAY_SIZE(a5_peripherals_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct of_device_id a5_peripherals_clkc_match_table[] = {
>> +     {
>> +             .compatible = "amlogic,a5-peripherals-clkc",
>> +             .data = &a5_peripherals_clkc_data,
>> +     },
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, a5_peripherals_clkc_match_table);
>> +
>> +static struct platform_driver a5_peripherals_clkc_driver = {
>> +     .probe = meson_clkc_mmio_probe,
>> +     .driver = {
>> +             .name = "a5-peripherals-clkc",
>> +             .of_match_table = a5_peripherals_clkc_match_table,
>> +     },
>> +};
>> +module_platform_driver(a5_peripherals_clkc_driver);
>> +
>> +MODULE_DESCRIPTION("Amlogic A5 Peripherals Clock Controller driver");
>> +MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("CLK_MESON");
> 
> --
> Jerome

