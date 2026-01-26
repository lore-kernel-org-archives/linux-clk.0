Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023092.outbound.protection.outlook.com [52.101.127.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388F338902;
	Mon, 26 Jan 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434051; cv=fail; b=GyHew+ijRRMeGY5Bebr1RCyDyC87z+fBi0Khc1A5xVQHZMpc/38F6TBLYN0uQbO1LlqxEyN6aeMuW/nlFEnrJFFZitrsz1JGoFPpEFPZwdiYRk26G5WePomxvP4Wjsv2vWqza40jltXPCyW7wH2uFDytucm/m/9bLyNxgn+PN5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434051; c=relaxed/simple;
	bh=b5/trMfr7tykJJE+2yKGnvAy2e6iXUsFFPpzEv0Dqm8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oRX5qtKGrx5zxMRRdDyoewdJ6pL+sEgWSt8p3u9RoEX243UO04O4PwGlBg0Ga1ES4k58L8+jxdqyHPZKNh9M2FH1VOKjuPyKmPzxbEnxZiaW41lItjLnN8hzdXVOIm7lUx+VyI5QRhhIt8pXdIWssRMKwpaxsA6mG1YmYlQPWNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=zEYkX/zw; arc=fail smtp.client-ip=52.101.127.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="zEYkX/zw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaMNOyjxJNiy7zz6W9uXg6zaEsaDB1zu/GWmYHbZhiFviSJmqyCXFDhhbeGeCLNw5FM8iRM1G0po0tzUKoQ9Vkq5Ei+aB5DgafYtg5TOmfZEYL8fxwtALK3xuDmFSjfberCKq7iQE6LxsBDH7mP8M6Ybenb5Zk5PmyQClztS6WumidktF7TjMjtYI+5uL23FqQJufss7VLPHhF35d7+EwxuKGTS/0Evbw7qdrrZGt9VBoqKRo4SjO6fpd8Rhq5PoouzSe5Qn7/2+FkxgZyARvfGoy6+RxJLKUXMhOz33asm7lv7frJygueHVrHr/A3pPixVa14+rs23EI99ijTGsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WUnwtpk1CHSgkruLofQxZcsYCgHbUxbpvfr3+lctSQ=;
 b=PsEi3PPGPHYY90WbaBny174x4LvS/TKKez6Z3Oefw/mEnVc6Ix1GTk6ItLaDdvwAZGRngJyrLkjFeqXHGWrE2CTt6Z4QhXDH4r+nIoxuurhqcZKhjL3q9Q5CndZ9ovJMLIUBuUt3n8A8odGqHuQgYqE7khkQ54P40bdCxldvEwbirdKZ3Ljx68/rhmFIPrVHVzX/C/H94+KXZ57rr7T6oS6zoQAv5NEibfmUoWF5nLegcKecCd0h3nRE16mGPI7DMWWSy9yB87Q+EcdQi87G5JmOPGsm6o7YUF6zRPmgV2xJW22Fg+fBoqajyK9lkuqUl8C5Qd4lA7ckQKl8rMVZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WUnwtpk1CHSgkruLofQxZcsYCgHbUxbpvfr3+lctSQ=;
 b=zEYkX/zwyLHH9TfG/SC93ItWHvDigloMfCyIoTAFnEYJKXA65x6jXAefsBe4iUzHvgV70sQScqLZmafqk9CPKvUpfoRQZeHJtvvm6Pua9DUfIJ0hBwSKtKQHyW7njaE+ZkgzJOnJ2LVM5iEr98vlBBOYn1PWWAMNZqnj+Yp754LSKOGEYzZsZFOGkaDialKq3+u0lcq9cw7JqqXk4YxbbBx360Q+598rf/CWiXMYIBtjPdqK85O89mLZ1XzTKjFh44AnNHDVs+DIahnKzVg5SgaG4QtyfWIpOy0J+8wLc/X/OIb0R3ln7zdQIXaSdVXbM4kEfGYQwMqMEcva4Auocg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB7316.apcprd03.prod.outlook.com (2603:1096:101:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:27:27 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:27:27 +0000
Message-ID: <6ae1e866-b3ce-4c5d-96f7-3d73b97a1ced@amlogic.com>
Date: Mon, 26 Jan 2026 21:26:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-3-99e350855bc2@amlogic.com>
 <1jikcohbyd.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jikcohbyd.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 75980abf-f55e-4ec1-39f4-08de5cdea5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnlSVXp6bTg1THN0ODhlckIwbFJUKzBRMWpWM3A0ZmdXNEsvcDd5aDFpUFp5?=
 =?utf-8?B?V1dhbGZSSTVoL1lsMkNUc2lqbExuNjBnVGx0Y05WT1VPeDhXSWN4ZmhYbFBq?=
 =?utf-8?B?eU0rYm5TNWl4VlhmUzNJUnlGSVdmck9xVDhQRFZ0Nkw2SHltTTdsTC95a2gy?=
 =?utf-8?B?Mnk5c1hlN3VaOGlSZmRlbm1MQTIyYW1VRHViZHNGLzM5NmJXd3N4TDBSczB2?=
 =?utf-8?B?NUlMSlpwRlU0b2pya0dCaDY5WFZxTDAwVWFraWpJOTNRa3JlTkp1RDhXVTNT?=
 =?utf-8?B?MkIwV3VheGZEcEdGQWZvY2NBUHVoOTJOTVBWTDA5YjcrYllPM0l2LzhpZE9u?=
 =?utf-8?B?MFE4enQyakdOTXorYkd2eEJrTXFtd1NUcVlKMWRUWGxOK0NiRks2cGtnMnl6?=
 =?utf-8?B?NXpZeG5aUmsrMTRvaG1WQnI4aEF3dFArNGgxYnhwSVRCQVJWb21Sekphd1ZJ?=
 =?utf-8?B?eFI1Vnl3YzgyanFjYUxDUTNOamIydzJsN2xtNEREaGE2eDh6RFNKZmRaUG80?=
 =?utf-8?B?bHJZRmNrNFFueVdWalJ6VjExYnY1Z2JHSkRHSmhtL25UTjc2bU1YZWlUTnYz?=
 =?utf-8?B?NEp2blA2TlhZTTRkREM5WFV4bDN0cG5NWEtrVnF5UTNsbjJkdGQvUTE2ZFBn?=
 =?utf-8?B?T0pZaitydlhKUjBKSkZLcFRQOGdrakhwcU1xY0s1RnBUYTljaTBsYnhRaFNU?=
 =?utf-8?B?QVhSWFAxUXlnQXpsUDRqNmdXTVdUbUMweGQ2K2UzZ2xtN0F4YlVuQmZIL3FR?=
 =?utf-8?B?bzVrSHBJM0NDQnRUK1dRUU1ZOXJzcEpQYzRNalgvOFZraGZSd1dNKzk2YVJq?=
 =?utf-8?B?ZEl6bS9BQWJBZDlJKy8xaWVtNkFhdlh5Snp1OXVucDBEVXRCelVhaXdIdm43?=
 =?utf-8?B?ZXRVdVd5NVl1Zm9DckJFa1dPcHFERUVLZ1pvdGRvdEFieExORGdFR0x0eGRq?=
 =?utf-8?B?RERCMW5RTUNONGZvOXFJUWdQRENYcEMxKy9sb2ZlM25qY2hBQjJLdWFRWDZw?=
 =?utf-8?B?MDZBbHplbjI4MUI2eC9ITHNyUWhDdHREbUFqWUlzTk0wdEpHb3YzcktmWDI4?=
 =?utf-8?B?R3kvRHF0RlhLQVFYaW84V0hNaTl0ZUkrNEd6VWlpWmNLaVdjazFNVmNFRWla?=
 =?utf-8?B?alNST1BScTN3Vmk0MDB0d2JuaGk3OXI1V2FLUUcrL1NrOWdTZkc1Q3A0enhk?=
 =?utf-8?B?RlNHSW9yWVVVQWd4NWNjam1laWZsWFVQT0U1TGtrbHozQlE3K2MyNkMyMXRo?=
 =?utf-8?B?anFHWVZHTThaamVGZkxuOHBDWDJuclhBRnFyVnFISzdQV3hDclRFaEk5aTRV?=
 =?utf-8?B?WVZxNzdkREtFaEhDSVRRcFdQRktMZ1MwTlp0L0kvNjQzZDlNOFVOTTNpa2xN?=
 =?utf-8?B?MnpBZ0kwUVVsZDZPd3Q5TG9HS3lad1N4c01EWGwvTDRXaStzVzNOZitvalpq?=
 =?utf-8?B?MjVLbmJnTkl3NnFUWEtPZlRHWVRjM0tES2VtVHBYbHlhV0FOTkQwNEs1d1BT?=
 =?utf-8?B?eWFRZDhvZ1FTTDhBczl2dEc2TmFDZk0vejRHY1lZTDVhNjh3TllXU0ErMmVE?=
 =?utf-8?B?WjN0OVh0cEZuNXM0Wi9FQytzbStyOFl5UEtPVURNTFV3WC9kZGNLUk1OOWFZ?=
 =?utf-8?B?dTZYMG52QkdqUndhWnVjaHVYdnA5d2RlMTdaM0c0M08wTUg5Mk1WTXpvRkhx?=
 =?utf-8?B?b3prMWtXVFVRYVFib3NVTHBiSmlKcHdEQ0cvd3ZETzI2ZWsreERZeSs5RlVC?=
 =?utf-8?B?Z1gvNkh1Vk9hanNlbkkxeDF5bjdpUitFb0xUOGIyZnJrU3V5VG9IQXoyWXph?=
 =?utf-8?B?Sk9VTHI4RlBxY2R0NmljS0hTdk5CNlRjZUF3OXZDazgxWER6WUJncGNqdFhp?=
 =?utf-8?B?STlXSm52WnF5WDM1RUlya2NCb0F0NUcyYXlxTmtCMWxIZEl5WWRDeWdQOGZT?=
 =?utf-8?B?RHY0aC9iV0ZRMjRBZGFjd21PY2dNSG9hKzNHSXZrNzBGQXVhY0RnUGlGR0VT?=
 =?utf-8?B?dWxaS1FybGo5MlE4dTFmT1B6N2dGQncweHlQcHd6aWZCK0d0MXhPT05YZFpp?=
 =?utf-8?B?Z0JDR01MR1psREdaSUhwMEJVTlpnZWxCMy9QZTNpWWlkelg4bkw4Z0VOYnlG?=
 =?utf-8?Q?zsRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJaUE4rODBMUVhJaC9IK1V4Z2ZCSWFyMncyOU1ZVDAxUHZCcVBTSkt2N25C?=
 =?utf-8?B?bEZkNC9XalNrVGRYdWpSeUtMemRFZzlkalVSRjduM3pEcUVNRURSTW9CNFJl?=
 =?utf-8?B?aXZXTVVmOXFrQUN6QzhWT2pjczFlREVLTkhVUUJCTTNoaFJ1dXBuRTAzTjFi?=
 =?utf-8?B?WFR1bEU5Nmd6TW5XejdxdFpDV1BRcDFCN2c0V28zYU94eUYzOCtEVDFkUFRQ?=
 =?utf-8?B?eFVOc1JKeW9PamZZLytDRGwwNGd2RGJLck1lSTJReTI2NjVSMEVwRXBRZGRv?=
 =?utf-8?B?T3E4YTh6ZWVPUlkzUi92c1huNVE4bDh3SnV6YkZ6QzVORFBoVkh2ejNiZGR5?=
 =?utf-8?B?QVVSaDVJWTBjdTFOT1dTMU1KSWhSTFQzaTdNRkRYZWljVHhRUW55eGYzMDFU?=
 =?utf-8?B?N04wdnZNdW83RDFWVEZiSWhuenRNRGZTMnZoSERMYWdueXdUK3kvZ2pXYXk2?=
 =?utf-8?B?MVcxeGs0U1ZISm94cnJoZW55TkhrbXF1OXFydnAvbmJWRi9RbGcvQWh6Nnhs?=
 =?utf-8?B?ZE5icGVIaHpGTlNicS94bko2aUVrSEU4ZzhLMnNXd1lnMmtxdTU3T2dCVUtM?=
 =?utf-8?B?VXRoOUlUNGhkVm81RGlpeVM3WUVGQThMNjhPa0hMMkFNY0UyMnp3TURaSEdn?=
 =?utf-8?B?Zzh5cEcwaWlMUVVzUnJKZWkxdTdTeklHZ3Jjd00vbmhZaHlZci9wTlE2MDZr?=
 =?utf-8?B?Szh6YjNZd29mRkZzMXhrOVFBUENkd1NNZzBySmlzTFlRQ2ErZ2E1a2ZSM1hB?=
 =?utf-8?B?YkRrRXBRU3FCSFE1K0tmYythNFp1M0x0dmVoQncrdFc5MDMxU0IrWkUwczVp?=
 =?utf-8?B?VkVTeTVjRGhwVW9OcGFENEo4VXZWL2h3RjJ4c29PVUlhb1h6djRLb04weUxG?=
 =?utf-8?B?cDNXb1htNEZCZTg5VTdPbU9HcUZGSTk3dWpmbS9jM1VXdnJWdG1rb2ZWN0Nw?=
 =?utf-8?B?VE9UVGdrMWx1SUc0RVMvWGR3WWJNYXhuK3VWekkrWlAxNkJOSkgyZTVXQzFv?=
 =?utf-8?B?RDFUeGJBaEthSWRsNk81bGVRZGl0Sk5FUjFXc1RlNHJXZnlRYmU5dUJvdFJI?=
 =?utf-8?B?OTFEZzhqUlkwWFZFZzJML0hwc0dDZ2JMM0o2dFYzMC9pTWhNVHdpNWxSVzU2?=
 =?utf-8?B?WjFzNVZ6c0V2WmlhQVdPeXRWbW9OSUR0VVZOVVFVWjhnVVN5czY1S2tpYzZx?=
 =?utf-8?B?K3NqTmQwemdZWFRmbEtXVTdrUzdOak1mWVowRGppMjQycmZ1SlFacysrckNz?=
 =?utf-8?B?VnBNYThrbFQ4SGxWeFU2V3JHcWF6ZU1BK0ZJQUg5UXI0SDl1dC9UL3pEajVO?=
 =?utf-8?B?MjVCa2ZaTFllRCs4RUcyRTdqMjF0VTUreXRpbUs0dm1GMmdveXdIcFNtaklO?=
 =?utf-8?B?SDB1SmJ0ZWk4dENWSEhTUzVaQURCbXFQbWYvOUdGZ2M1SVNTUi9WMEl6eVNO?=
 =?utf-8?B?VElWNXNteEladWkxdHVsMjlha2JCVFhWcm1VQWVzSFNFclBZQmtZa0dmU1dI?=
 =?utf-8?B?SElwZDJFVWl4T1NTUjUvN05Pcjh0Qmo0b3hXWkZjaW5uMm45WXNwTllYbHlJ?=
 =?utf-8?B?UjRzdlF5RHZGa1E4NXNUMkxnclJ4dDJBYnc4ZlFsd3ozMXF3UlcwN2tCVVVk?=
 =?utf-8?B?SlZOWW92ZWxjNnNzNXBqelB1cHBIMzZRZkJ2UHFINGRpdjZjSzZGNHpOK3JG?=
 =?utf-8?B?Zi8zaVFlWU9SOVdvQ2pkb2RSQXE1cnAzLzhXcVN5Nk5sTGt4T09QQUZQRkV4?=
 =?utf-8?B?ZFIwTlBJUnBGbHNtOUJQdy91OXVSalhIUW16dkhiNGFvQTBiVE9NRGs0VzJM?=
 =?utf-8?B?TkQzNVk3eVVrMlJwVktKQ3IweFVWcmFyejgxaWxUMUJYQ1hKcXdWRkpLcFNZ?=
 =?utf-8?B?UkdIZ3VNK21iWm16eXFRc3hwcUp3VUtpRGNzcjJkU1RBNDBvQnBUK3RpV0VT?=
 =?utf-8?B?SUJYTmlNTVl4RS90eTVheWx4b0ZIQ0NaZHdiRXI2dXArTGRneExnSFYrcGVl?=
 =?utf-8?B?aWN0cHlPbkRDc2NXY3lQblFwM2JPekZGRlZQcjM3MEYzYis3YVRKMDNJMzNm?=
 =?utf-8?B?S1VlSHA1YkhsWWxvZkhLeS9hcDNFUjJLS1JOMGZKSUlUU3J4OW5hWGcxTEc1?=
 =?utf-8?B?cThWeGpOZDN0QWdSQVFtTnRTbnRsektYYjg2MjcyaXBwZU5aREtjMHVvUkFC?=
 =?utf-8?B?QjEvSWYybUcwZ3YweitWUmFWN3QwWG9HTUw2Z1YxbzVXc2s0cE1qYWx5dzNs?=
 =?utf-8?B?K2hKWnJLc2xNdURUWHdjYVBlTWI0a3NPNjRoTGo2eXpPc0ttOUdQb3M0YU9B?=
 =?utf-8?B?VU1xc0tOV0ZxR1VTeE1ZbVRHL05ZQ1QyTnBsOUlLWlpQZ1BzbndVc0tzc3pj?=
 =?utf-8?Q?/w2Q7Y58uhKZQjEE=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75980abf-f55e-4ec1-39f4-08de5cdea5dd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:27:27.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKLPPaEXbY9rVcDGrzdLuwEgxsvo4DZTkl12w1nvq0T4I+/b+ySOSnAZfZ2lcD5TFHF7g4yTgRo6aZWqcCSY13+vYjwds4YX4uSu5RZrQlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7316


在 2026/1/26 19:04, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On lun. 26 janv. 2026 at 06:01, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>
>> From: Jiebing Chen <jiebing.chen@amlogic.com>
>>
>> The S4 requires additional clock control bits to be turn on while enabled.
>> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
>> Update the widget accordingly.
>>
>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>> ---
>>   sound/soc/meson/g12a-toacodec.c | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
>> index a95375b53f0a..a7f9ac2d08f7 100644
>> --- a/sound/soc/meson/g12a-toacodec.c
>> +++ b/sound/soc/meson/g12a-toacodec.c
>> @@ -41,6 +41,9 @@
>>   #define  CTRL0_BCLK_SEL_LSB          4
>>   #define  CTRL0_MCLK_SEL                      GENMASK(2, 0)
>>
>> +#define CTRL0_BCLK_ENABLE_SHIFT              30
>> +#define CTRL0_MCLK_ENABLE_SHIFT              29
>> +
>>   #define TOACODEC_OUT_CHMAX           2
>>
>>   struct g12a_toacodec {
>> @@ -141,6 +144,13 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>>                            &g12a_toacodec_out_enable),
>>   };
>>
>> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
>> +     SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
>> +                      &sm1_toacodec_mux),
>> +     SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
>> +                         &g12a_toacodec_out_enable),
> I guess that works but it is a bit hackish to hijack the output control
> to enable a something really clock related. A supply widget connect to
> this widget would be more approriate I think

Hi, jerome

Thanks for your suggestion. A supply widget is  appropriate.

I will add the supply widget in next version

>> +};
>> +
>>   static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>>                                         struct snd_pcm_hw_params *params,
>>                                         struct snd_soc_dai *dai)
>> @@ -234,6 +244,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>>        SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>>   };
>>
>> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
>> +     SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
>> +};
>> +
>>   static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>>        .probe                  = g12a_toacodec_component_probe,
>>        .controls               = g12a_toacodec_controls,
>> @@ -256,6 +270,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>>        .endianness             = 1,
>>   };
>>
>> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
>> +     .probe                  = sm1_toacodec_component_probe,
>> +     .controls               = s4_toacodec_controls,
>> +     .num_controls           = ARRAY_SIZE(s4_toacodec_controls),
>> +     .dapm_widgets           = s4_toacodec_widgets,
>> +     .num_dapm_widgets       = ARRAY_SIZE(s4_toacodec_widgets),
>> +     .dapm_routes            = g12a_toacodec_routes,
>> +     .num_dapm_routes        = ARRAY_SIZE(g12a_toacodec_routes),
>> +     .endianness             = 1,
>> +};
>> +
>>   static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>        .reg_bits       = 32,
>>        .val_bits       = 32,
>> @@ -276,6 +301,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>>        .field_bclk_sel = REG_FIELD(TOACODEC_CTRL0, 4, 6),
>>   };
>>
>> +static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
>> +     .component_drv  = &s4_toacodec_component_drv,
>> +     .field_dat_sel  = REG_FIELD(TOACODEC_CTRL0, 19, 20),
>> +     .field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
>> +     .field_bclk_sel = REG_FIELD(TOACODEC_CTRL0, 4, 6),
>> +};
>> +
>>   static const struct of_device_id g12a_toacodec_of_match[] = {
>>        {
>>                .compatible = "amlogic,g12a-toacodec",
>> @@ -285,6 +317,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
>>                .compatible = "amlogic,sm1-toacodec",
>>                .data = &sm1_toacodec_match_data,
>>        },
>> +     {
>> +             .compatible = "amlogic,s4-toacodec",
>> +             .data = &s4_toacodec_match_data,
>> +     },
>>        {}
>>   };
>>   MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
> --
> Jerome
