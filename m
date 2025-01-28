Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C067187332;
	Tue, 28 Jan 2025 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058072; cv=fail; b=jOaXahAJH0/iPI1/p1i8TWR2KN4ZJ7QJ9eX0JkFvdm2lIgoHDUSOQetYlCfk0eFP38qkC4i+VQJ4Scj1hzvJJyDlUD7VH9tkq99HCwd+zI9fzcJFXwlp14ckUxC3s3/2dKcYO01Q9sp2KfeS0TejtVeUIau9KC0uE+hhJTxYYVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058072; c=relaxed/simple;
	bh=7rMbaOkaO6yIvKYs4MirBwM5kDo9FFvlw0lcF2hYu9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K2EyILJikqbujD5YXWO7K2MHSMmBr29bzLGTGTGEXNmpZCbylJeVnDtzjyy1t/tFJBkrsDiuiuQtCtdUVUcVNeS+a4kD9OqTCKKzfSNfrZkGFLoFguRL6Rh08qXbdiHUaJm2FyQr1FIxFmbR4WckJnMoYSNHkVv1hCXZpDqOfVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Gg7dstD; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5Gg7dstD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4gwCXBBjDzC7mqX5jMnfccjZ+k9412Ei4uYnCxidQt1QHZlJOcPPc/gF3tSJcJnwuykbGiaFaQRcbq5aiV8kco6n6+hTr/aePjATg1GyC6AWOVbUW+PmPLTW4B0UdKM1Wqj2QeZ5FyY8Qj5WoJl+8KGHp453edgi7fN7PsSJ7njEbetmrb2Rhm8eu2IOs95p9NqKs5dv10kNc6LYeL1O9ivtC03wW9BZBZJwjshcSsVNF12mEOb3B5rLUGXjWwWT2W/15RxllVyF52ZqLW1yq9+DOgRwQX7WfJwW5/9hfaclitKSOOJgPnwk4dXipKu2fUUUghgUyh685HyNQfbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rMbaOkaO6yIvKYs4MirBwM5kDo9FFvlw0lcF2hYu9k=;
 b=YUJe11AkfTrUAqoLTPRxCFhBpf6mfxrQtausnJ9PYhubFPGLmPB3gAawKKGAcr+PzIoG3pdzdjKXhbLC8nPv4qpOqAe2KXRm4MM8dDnLtrMO2cKiA3hDV/y0BxIKvH0QdCYjqLlRC2QVn1781zUnTHbSEsOsds5UluPUjIRzfApgrzBjPKvbH15XnUoJDDi80Bwq7rBRHYfOBlnnMva75P43nNIFUdTWBImQ+2wUnbCUDigj6UVKEbia2mYKK0BtIWBaAGX8cwSwiKXqXoyISV+8zmYSLA/rQVLOM8H6FWA6TpxnUdfZx6xtogK1zSS3YttOqUq8k331oUY3ChGMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rMbaOkaO6yIvKYs4MirBwM5kDo9FFvlw0lcF2hYu9k=;
 b=5Gg7dstD4r6LqktLaQRzl5Eo++db5akA/60jUSiVa8OX1BJ5piiuPlSPU7V7iDYVHm4nHBXbUlc2tTabaIn9cAJPxcI3fIkfsZkHT+TeZ3sXUen7qf46fSxOqYmce2YKnEnuSdcMRGmKezyk9mm6sqTjCyHkuSX+kZ5kA1LMeT8=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 09:54:26 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 09:54:25 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "Simek, Michal"
	<michal.simek@amd.com>, "Sagar, Vishal" <vishal.sagar@amd.com>,
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
Thread-Topic: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
Thread-Index: AQHbXThfxENiXuuPAkGTQeKoLPlpprMD3niAgAWomUCAISif8A==
Date: Tue, 28 Jan 2025 09:54:25 +0000
Message-ID:
 <CH2PR12MB48756130C65F6D23FD885A66E5EF2@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20250102170359.761670-1-rohit.visavalia@amd.com>
 <20250102170359.761670-3-rohit.visavalia@amd.com>
 <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
 <CH2PR12MB4875D93D5F91CEF9A99E4A45E5102@CH2PR12MB4875.namprd12.prod.outlook.com>
In-Reply-To:
 <CH2PR12MB4875D93D5F91CEF9A99E4A45E5102@CH2PR12MB4875.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: geert@linux-m68k.org,sboyd@kernel.org
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|MN2PR12MB4357:EE_
x-ms-office365-filtering-correlation-id: 0c0ca723-f5c9-4955-859f-08dd3f81bfb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzBLekxXNHBidlc4aWNramw0WWNLWWNpVldBL2sxS1dROEZlaG1JL2piRGhi?=
 =?utf-8?B?bDhJdlBzdUxiTTArd08xYTloOU9YbHhxNDZGZEJOUTdxRlpGbUo3K3hxSklt?=
 =?utf-8?B?VDlENThmVGM3NzN3aEFBNzQ0bndDd1Y0bDlweENHZ21wVUZ1Wm15eU1sQzZI?=
 =?utf-8?B?K2pxK0JmOVJoNjl4UExDUmV4MlVmdXlXNUV6dFJ6R01vczcwMlZnTHBsNEpo?=
 =?utf-8?B?cnZjUzVKd0N1dkd3bGRjWlpKOTVFSGdoRStIaU1qMm0xS2xkTUhxKytDYjU3?=
 =?utf-8?B?UjVMOXZ4dUVhUWFWUkJmR3hWSXBSdHpFalRMUHd0M25Eckt1QWFyVTVwTVd2?=
 =?utf-8?B?QWVwYXIyblBZQmkrNzJhWFVSVnZEWVozTlM0WDlaSmlORm0wZERUK3hzUGZG?=
 =?utf-8?B?Z0Z2eUdGZ2IwdjhIV0Fzb3B2bXFjeTgyd09qRERNb1psODJjOWZhU2NndmN6?=
 =?utf-8?B?bmlFbTJWYmpqZktXWG1zNHdxWUxoVnlVU3h5eTh2VE9TZnhCS0hUKzJXQmRW?=
 =?utf-8?B?L3F3ZWNZZlpLOGdzQXlNYVhFNStTOUt2MWNVY291Y1JxSWFMYkZ6UVdKdS9E?=
 =?utf-8?B?M3BKRzJ1NFlnQmJrQ2Z0OGdIMVVZbG96QWVoVHVhS3ZXWVMwcGtESmNTaWhh?=
 =?utf-8?B?UUVodVRNUHUxdEdiOUZkRXlTNE1nRjFVMlZ2RmNjanU4cWQvTjlUWW9xZmNw?=
 =?utf-8?B?M05KbTlISWVJL0F2bXF3d2dUckdRaXBpNllRM2NXTGp4ZmR1TnFUZGNyN05Q?=
 =?utf-8?B?Vll3WnVyQWJBalIrb0JZdmRhZUxCTWhTUHp6ZzZqaHNYbStuaktwZG1qalJi?=
 =?utf-8?B?WW8vbDhQSDBGdG80ZVlmVU1VR0RYTlhqdVF2dFUvSWNWc0JVU25SaGxCc0ls?=
 =?utf-8?B?U3JSakxMczE0d0ZyTXI1N2hmRW5VTjF1SUN1dXdyUHdUUm8yVXA5RU5DRVcr?=
 =?utf-8?B?QUFMMHM3VTF4M0xLeDA1ZHRXSDdkSzB0b3VSY0R0enJJRDhibklCM3RMeHVp?=
 =?utf-8?B?YXlDSThBek5mVkZMa3BFRWE3b0Vhd1JlcFlPZFpNVWt2cjZHcWlzNkZEd1Vy?=
 =?utf-8?B?MlB5TkltbXlMa1lmRVBFVEZyU010d0xnNitWVEFra0s4U25NdWZobXJCb25X?=
 =?utf-8?B?UzNLWUluVDR1R1lNSmZ4blR2TjhWYUdDajBuRzZNR3RuQmV6MXJYZ1VxVmJZ?=
 =?utf-8?B?R1ppTnhpLzg3UW9XdmZNazJMZFExUXBlN0VaTFFJZkhwNk1BL0o3enNxY0lw?=
 =?utf-8?B?djFVTUovUDI4Y3RRaWFvYzVDYVFJWUxGKzlMdWl0QmlNMDZiZU9tYVFlYmNv?=
 =?utf-8?B?aURVRng0MFdVQXlEbjZ3MFZwUkp3djgzSVJnMzRna1EyeUdkYzlkTmJCY1ky?=
 =?utf-8?B?SlhnNDc1Y3N4cGJKUEpyUEJtalNnZlF6eklKQ2xRMCt1TnZOWnhEQXJYbkMy?=
 =?utf-8?B?dURQcTlUTzJ4cGpqNjIwajJEalNhN2dPVjJTajFLYXZkV256SUxwZ3R0cTFw?=
 =?utf-8?B?MWwra3pyaGh0TUs1TjVhc1VuV2RHUU9qa0o3M3RWS1NkUko1SWhib2JSNFNp?=
 =?utf-8?B?Tm9FRkxDYzJPQUhHSDV5aDZjU2NUYVpENStzYnVUUTF0Q2hkcG5DbUI5K3o4?=
 =?utf-8?B?UklJVVhKMHVZMmRNKzV5UkhHeTNKK0Z1eU5jWU5UeHVpOHBudERUbnZuTFBF?=
 =?utf-8?B?YmN5eXoyc0pGUk80TXhpUzI2MGwwNGh6RUVlRjBTZWRsUC9TNmdnUVU2U0Z4?=
 =?utf-8?B?VTJzdTNBUnFER2FUdVhhdm9vRCtQbHE4bUxNL1lYWk8vSFdEQ3BQRkxzZTdp?=
 =?utf-8?B?RGcycnQ0Sk4rbXd4emVmanQ5UEZ2ZU92VzFlZC9nSVd1WGs5ZWF4aVV5NWdV?=
 =?utf-8?B?RmMzT1R5dEM5blN4T1ZidGRNc292eXFPTURjbmZFVkQ4blBsOHFMcmd0Sk12?=
 =?utf-8?B?c1dUSDBweUNEQmsrOHlWMDZpVkszS1NlelkyVm5EWUY2TERUZFB5ZUovYXk1?=
 =?utf-8?B?Sk16MjRBeWlRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzM3Z1lycTlVUzRCRWdMSmNpVnlMZWo2UEZnRTZvOEFsdE9yWHVRN3QzRHc1?=
 =?utf-8?B?TzFzQjhqaHZ0K0srUzUwTVhPZ3FTNjhCOHJtczBGSDBNeDlseitWL05TMDV3?=
 =?utf-8?B?YVJjbWNLMWl3UkdjRzNCS3FaWUQvbWMreFppTHYwMEtnNTd0RnZ1UllZMmls?=
 =?utf-8?B?Z3h2bkNDY3U1VVBJdzBWQ25jVkNEZlRZNmxYeU1xeTlRMloxTWtoTjV3VFZu?=
 =?utf-8?B?bC9OeXplTEdHOUZzeUs3UjUwbmx1ai9zUDlKQW1PWEhob0daNjFVbHJiSTJC?=
 =?utf-8?B?cFV4c3Q5RDBVSkJXR28xallxTlMrK1JETWtpYjNKdDhBcDYvTjlEbnVKZng0?=
 =?utf-8?B?Smp6ZmxrYzltaWJTaUdibWZscFluYyt4dERUNFNOMWEzZkREN3BsVGFkUzVs?=
 =?utf-8?B?MElpdVlOVHJubGVzWXpaOUZhV1hhenR3MTBGcEpSeThXRlRMS0RkWTkyZE4w?=
 =?utf-8?B?SVo0enVSbktIRHZLR3lFUlZuTnM2TkRXY1R5MVRCYXhrb2loeVhHY0s3V1RQ?=
 =?utf-8?B?Q25hOHBKSDIzQmJ5K1VFL0pNdkxSL0JCQllMUGFCMmV1VFloZDVUQXJuM2Qw?=
 =?utf-8?B?U2I2cXV2TGFjL2xQNUg5cS85WGdGU0xUTWpvcjMyYjRVdDZ1Q2lkcXovbUwx?=
 =?utf-8?B?UGt3TUtWZ0RXanBjRTBORitMUDZPV0pIR0NuUUtsSENQQWhYYUYrU1VFLzBl?=
 =?utf-8?B?WTdxaG9ndnhrV3VGUFA4R2JTVlZsK0lNM2R4QVVkTEdLYnZsZGk0NXorRkxP?=
 =?utf-8?B?RGRvVUlBQUdhdTZoZzFJS0ZaNVpiemE3Sks2R1FSdkNKL2t3VnlwU0xZL0dE?=
 =?utf-8?B?N01tSklpc0VtOHBnUTdtQjdLR1gwRDJNZmJmSkZjaU5yWitEaEZsWUNWMm9E?=
 =?utf-8?B?MFhRaW5nbzFiSmpTaVFVRlV0ZWhXSFRJaUt3NXlnampqT3dxSUREbFNoNzZi?=
 =?utf-8?B?d3RLZXc5SFlqdlM5NUJyK1RtanhaclFUTUVmazNhWW91azJTQnRaTEFGZU9V?=
 =?utf-8?B?dzZWbHF4SVNobXJjWnluYkFHdlR5WkR4OUlHTml5a1hob3lDUDAxZWZKMWs5?=
 =?utf-8?B?V1hTQ1FXR3ZIWTVycitPVVA2cVE1RDZjZUxJNDZoaGhtQWwvTXBNRmhxS1J5?=
 =?utf-8?B?REh5aGZRODF2b3FYNXo4eFRZQlMvd3ZlUTdDdTVpOHY4WG1NaDJKR0dObkli?=
 =?utf-8?B?UU92UHlyWk5yb2plamZJQk9odEdxMTNlKzZadXE1WkxpWEpHMUJ3VTdTcm45?=
 =?utf-8?B?R1JlZ3dJdURvdnBlOHluWWVMUGxwMmVNeSsxUWt6YmYyL1ZUWkI2NkNlTVNt?=
 =?utf-8?B?M1U2NG8xUHhOaEM1WDBsY0tlU2gxK3RLZTNoNW5uTmN2TVRuRzVXV3NBZFpG?=
 =?utf-8?B?L05TY0RKVDk0ZDh5Y0JFOFZnTGUvY3g0ZXljbHBKSXJ5Zm9YTU1zaGFhc3RN?=
 =?utf-8?B?NU4wb24rQmFadnU4NkNSc1Z1b2NHV1cyMjhKVUFLZk5TeExSOWN2UjBPZCta?=
 =?utf-8?B?aHVqL2ZFYklXTkJtTnBZZ21ZdUFtT0RGUDYxVmVidjR5OTVpN3ZJZUxDVE5X?=
 =?utf-8?B?SzBmODlaYm9KNHVSKzM3ak1aNEVrZkJVbTBsWXRhWllRUWxGdUIvMWZvVDln?=
 =?utf-8?B?dW1EakhjeEt3UTkvQ3FpbCtBdEFzQ21HbnBmSjd1NDZzYVBLWTFJN25TWmdW?=
 =?utf-8?B?TGJjRTBnQVZHbDZBRWxDVG04eFdoQWhlQXRpV2hpdFp3SUZ1OWhCZ0FFMlJ6?=
 =?utf-8?B?L0htRFM5Qi9zc3hKSHZmMDdRSVV0MmxjZkdhL0tLdzRvN3lHaGNMcENwNXFP?=
 =?utf-8?B?T2Z5dEdGTDhQV1dxcVk5WXVmek9jS2hCSVd1NWZqeDg5MXBzTG1EbVhwMzZH?=
 =?utf-8?B?bE54T1RYakRnWWx0UkFFUGhDWmpLMzZOYmlVUUh1eVJLRUw3Y2pLR2oyelhR?=
 =?utf-8?B?Z3M1ZVVQZC9xd0dhL2RJQkpkZWx1RUE3cmhTR0ZROGpjMkdHUFJIRVlkdDI5?=
 =?utf-8?B?RW93bDU1eU83QVB1eXhqalF5aTlEbnJWejUvRmpBMFozVWxWc3ZWbHRsRW9Q?=
 =?utf-8?B?cTU4anFyb3I4WU5DOFhEeHVNUTJySGJXMDFIK0VMUmtKSlp1aXB3L0ZNeTNN?=
 =?utf-8?Q?bBSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0ca723-f5c9-4955-859f-08dd3f81bfb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 09:54:25.6234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awZuhuhNTxYvaElbDEvbq2hPst2LcW+O6Lv3jN9u6kKbIumE2WEby6C1BAXqweKW+B3GkHwYVd6eXElE74CGIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357

SGkgQEdlZXJ0IFV5dHRlcmhvZXZlbiwgQFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4g
DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFZpc2F2YWxpYSwgUm9oaXQN
Cj5TZW50OiBNb25kYXksIEphbnVhcnkgNiwgMjAyNSAzOjM0IFBNDQo+VG86IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+Q2M6IG10dXJxdWV0dGVAYmF5bGlicmUu
Y29tOyBzYm95ZEBrZXJuZWwub3JnOyBTaW1laywgTWljaGFsDQo+PG1pY2hhbC5zaW1la0BhbWQu
Y29tPjsgU2FnYXIsIFZpc2hhbCA8dmlzaGFsLnNhZ2FyQGFtZC5jb20+Ow0KPmphdmllci5jYXJy
YXNjby5jcnV6QGdtYWlsLmNvbTsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7IHUua2xlaW5lLQ0K
PmtvZW5pZ0BiYXlsaWJyZS5jb207IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS0NCj5rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPlN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMi8zXSBjbGs6IHhpbGlueDogdmN1OiBkb24n
dCBzZXQgcGxsX3JlZiBhcyBwYXJlbnQgb2YNCj5WQ1UoZW5jL2RlYykgY2xvY2tzDQo+DQo+SGkg
R2VlcnQsDQo+DQo+VGhhbmsgZm9yIHRoZSByZXZpZXcuDQo+DQo+Pi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+PkZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+DQo+PlNlbnQ6IEZyaWRheSwgSmFudWFyeSAzLCAyMDI1IDEyOjU4IEFNDQo+PlRvOiBWaXNh
dmFsaWEsIFJvaGl0IDxyb2hpdC52aXNhdmFsaWFAYW1kLmNvbT4NCj4+Q2M6IG10dXJxdWV0dGVA
YmF5bGlicmUuY29tOyBzYm95ZEBrZXJuZWwub3JnOyBTaW1laywgTWljaGFsDQo+PjxtaWNoYWwu
c2ltZWtAYW1kLmNvbT47IFNhZ2FyLCBWaXNoYWwgPHZpc2hhbC5zYWdhckBhbWQuY29tPjsNCj4+
amF2aWVyLmNhcnJhc2NvLmNydXpAZ21haWwuY29tOyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsg
dS5rbGVpbmUtDQo+PmtvZW5pZ0BiYXlsaWJyZS5jb207IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS0NCj4+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4+U3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIGNsazogeGls
aW54OiB2Y3U6IGRvbid0IHNldCBwbGxfcmVmIGFzDQo+PnBhcmVudCBvZg0KPj5WQ1UoZW5jL2Rl
YykgY2xvY2tzDQo+Pg0KPj5IaSBSb2hpdCwNCj4+DQo+Pk9uIFRodSwgSmFuIDIsIDIwMjUgYXQg
NjowNOKAr1BNIFJvaGl0IFZpc2F2YWxpYSA8cm9oaXQudmlzYXZhbGlhQGFtZC5jb20+IHdyb3Rl
Og0KPj4+IENDRiB3aWxsIHRyeSB0byBhZGp1c3QgcGFyZW50IGNsb2NrIHRvIHNldCBkZXNpcmUg
Y2xvY2sgZnJlcXVlbmN5IG9mDQo+Pj4gY2hpbGQgY2xvY2suIFNvIGlmIHBsbF9yZWYgaXMgbm90
IGEgZml4ZWQtY2xvY2sgdGhlbiB3aGlsZSBzZXR0aW5nDQo+Pj4gcmF0ZSBvZiBlbmMvZGVjIGNs
b2NrcyBwbGxfcmVmIG1heSBnZXQgY2hhbmdlLCB3aGljaCBtYXkgbWFrZSBWQ1UNCj4+bWFsZnVu
Y3Rpb24uDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2hpdCBWaXNhdmFsaWEgPHJvaGl0LnZp
c2F2YWxpYUBhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4gICAtIG5v
bmUNCj4+PiAgIC0gTGluayB0byB2MToNCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1jbGsvMjAyNDEyMjYxMjIwMjMuMzQzOTU1OS0zLXJvaGl0LnZpc2ENCj4+PiB2DQo+Pj4gYWxp
YUBhbWQuY29tDQo+Pj4gLS0tDQo+Pj4gIGRyaXZlcnMvY2xrL3hpbGlueC94bG54X3ZjdS5jIHwg
MiArLQ0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYw0KPj4+
IGIvZHJpdmVycy9jbGsveGlsaW54L3hsbnhfdmN1LmMgaW5kZXggODhiM2ZkODI1MGMyLi5jNTIw
YWUxYmE2NWUNCj4+PiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2Nsay94aWxpbngveGxueF92
Y3UuYw0KPj4+ICsrKyBiL2RyaXZlcnMvY2xrL3hpbGlueC94bG54X3ZjdS5jDQo+Pj4gQEAgLTU0
Nyw3ICs1NDcsNyBAQCBzdGF0aWMgaW50IHh2Y3VfcmVnaXN0ZXJfY2xvY2tfcHJvdmlkZXIoc3Ry
dWN0DQo+Pnh2Y3VfZGV2aWNlICp4dmN1KQ0KPj4+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRS
X0VSUihodyk7DQo+Pj4gICAgICAgICB4dmN1LT5wbGxfcG9zdCA9IGh3Ow0KPj4+DQo+Pj4gLSAg
ICAgICBwYXJlbnRfZGF0YVswXS5md19uYW1lID0gInBsbF9yZWYiOw0KPj4+ICsgICAgICAgcGFy
ZW50X2RhdGFbMF0uZndfbmFtZSA9ICJkdW1teV9uYW1lIjsNCj4+PiAgICAgICAgIHBhcmVudF9k
YXRhWzFdLmh3ID0geHZjdS0+cGxsX3Bvc3Q7DQo+Pj4NCj4+PiAgICAgICAgIGh3c1tDTEtfWFZD
VV9FTkNfQ09SRV0gPQ0KPj4NCj4+WW91IGNvbXBsZXRlbHkgaWdub3JlZCBTdGVwaGVuJ3MgY29t
bWVudCwgd2hpY2ggc3VnZ2VzdHMgdG8gbm90IHBhcw0KPj5DTEtfU0VUX1JBVEVfUEFSRU5UIGlu
c3RlYWQgKHNlZSB4dmN1X2Nsa19od19yZWdpc3Rlcl9sZWFmKCkpLg0KPg0KPlRoYW5rcyBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuIExldCBtZSB0YWtlIGNhcmUgdGhpcyBpbiB2MyBwYXRjaCBzZXJp
ZXMuDQoNCldlIGNhbiBkcm9wIHRoaXMgcGF0Y2hbUEFUQ0ggdjIgMi8zXSwgYXMgb3JpZ2luYWwg
aXNzdWUgd2FzIG9jY3VycmluZyB3aGVuICJwbGxfcmVmIiBjbG9jayBpcyBiZWluZyBjaGFuZ2Vk
IHRvIGdldCB0aGUgYmVzdCBkZXNpcmUgY2xvY2sgcmF0ZSBmb3IgZW5jb2RlciBhbmQgZGVjb2Rl
ci4gQW5kIG5vdyB3aXRoIHJlY2VudCBjaGFuZ2VzIGluIFhpbGlueCBjbG9jayBkcml2ZXIoaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9iNzgyOTIxZGRkN2Y4NGY1MjQ3
MjMwOTAzNzc5MDNmMzk5ZmRiYmNiICYgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4
L2NvbW1pdC8xZmUxNWJlMWZiNjEzNTM0ZWNiYWM1ZjhjM2Y4NzQ0Zjc1N2QyMzdkKSBlbmNvZGVy
IGFuZCBkZWNvZGVyIGFyZSBnZXR0aW5nIHBhcmVudCBhcyAicGxsX3Bvc3QiIHRvIGdldCBiZXN0
IGRlc2lyZSBjbG9jayByYXRlIGFuZCBub3QgY2hhbmdpbmcgcmF0ZSBvZiAicGxsX3JlZiIuDQoN
ClRoYW5rcw0KUm9oaXQNCj4NCj4+DQo+Pkdye29ldGplLGVldGluZ31zLA0KPj4NCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4+DQo+Pi0tDQo+PkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0NCj4+Z2VlcnRAbGludXgtbTY4
ay5vcmcNCj4+DQo+PkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGENCj4+aGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj5saWtlIHRo
YXQuDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMN
Cj4NCj5UaGFua3MNCj5Sb2hpdA0K
