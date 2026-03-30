Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023130.outbound.protection.outlook.com [52.101.127.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447DB3BFE2D;
	Mon, 30 Mar 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867449; cv=fail; b=uEfS/KPr5PBop4VbRkMFhB3UsHwiD+BnEllLl/ShHWTJYNIYrCB7u9OCorsy1QYadBVz6HWTnMyjm0EHy8bwQY/rkRwtFOmPBtAVkL1rGL/4bKRpGB/okiZUPgEzRFpx0FGSGgge8VT3Ot492yivChICES0bOU+BYwIt0xxCq9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867449; c=relaxed/simple;
	bh=Wyl2TfYR8fsowcfwW40l6jHpBAIuP/8ctbrdbbOCFIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lK0jtiKANb8V5F4bx786V1JVBhMfQNuAJRGEBcssFUgx30XbA+R0AyFIwrKRD/HXBVuVOrj2Y3dp+xxR3klgsa7G75lcbdhHH+MO/zdWguF1J8g81zZsvvl1sk+NwyetHxxBAJWgD7zGyyR+9/xm2klxMud0vfy8wDX/KfQhlZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=IkrU/wtT; arc=fail smtp.client-ip=52.101.127.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="IkrU/wtT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1Z1My6/dGQjdzWh/hquLqdadPfvx95Z3MEOePhWJy8gebtVYcEPm+v3L+W3XLClTkaISFyDkj27ZIcKwJ63PuoDmlX3c/hnDYaAORcisgjFeof1i7fufJaklYWNNZK8QWJzslNRU/3KAiawJpbCahqzbv3EmrOwRTxCtw1L38o/x9l1sMAsNd79xWsY1LPAVChQHGBdNaYIwT6GNDmpUMPW432OcC3LaxtCSwPFh0SRajRhnVEEj1a8xXKjNZnyLgRhmmuZP0+DEx1fdw0/Zz4XGtHSLSuDhM7Q3K4rA6Zuq8kh0w72F5tS0Bb8Phw66AWKtZbld4K8DC0SQPY0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V8HBbG2IACmW7Kt58EwkBMjOE5JvWYRSYV5XrSOZeY=;
 b=wqm8zdFeuSHsw6W54o+d4xuoOsYKib4L30MFtlE3VnzfRfsGd0hN6yCZrURdIZ64WSWwu/RlfTpoA6V21xthN9ZOMdkutIo4n4y41uwCZy5U7vwAuTcttASeInB7Djg3KKzVidNsXJ5qpIkUf2hnsBXPwNl4m0SZGWvs/NH9UW88IkkYd6QRVnWm8CnQm4vkKuNN2NKlMDM3758gJhD/ew4lBjCJW1D6i80bdAe4h5nL1eCtwd+Xx2rVDdVJbsexozWL27+rBJMLY9QKpNxfX2gcAwMWQYm/GDCGNeP5R74UmxUMwyAI6/ncNTiucgaN8DwCy/jvu4AXp46kdJFS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V8HBbG2IACmW7Kt58EwkBMjOE5JvWYRSYV5XrSOZeY=;
 b=IkrU/wtTO4Uh5tYjy5FKsHntTbK3aO4m38Pb4Nm230JhPAg2Th1elpisDYFBItwTeQfuSpD/3FGJTMFzf1JC/GXJSSXs4Y80MadEu/ixGbTTBKx8pIjb73IKWI7agghucYOmnR507Q8VZCB2/v5kMQWq/HC3SSX0OQpfgco1ZTXR708e+pJasMMC+GL80oVXvw2A/Y7PsHKAqCUH88OOg4hnIAf9qU1L7H6pIDz6ksDE/NNMXKiKfA6F7lJecI5NdtQOGfbBDGlAORc+YUAuRwY+mzUhfLx7Fy1u80NmtzFfc8Jid1ASZiLBxnEPsr0W8knVcVCK7Vo9LQA1v5XWuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KUXPR03MB10075.apcprd03.prod.outlook.com (2603:1096:d10:a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Mon, 30 Mar
 2026 10:44:04 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:43:32 +0000
Message-ID: <9830ff89-a145-41d1-98e9-1412f497d3f2@amlogic.com>
Date: Mon, 30 Mar 2026 18:44:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ferass El Hafidi <funderscore@postmarketos.org>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
 <20260326092645.1053261-2-jian.hu@amlogic.com>
 <20260327-rough-spry-hyrax-8236de@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260327-rough-spry-hyrax-8236de@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KUXPR03MB10075:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e650df-391a-4016-ba8f-08de8e492fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C0igonA8m4AiGnvbFaUH/NXffL3SCgERNfiRg8AqY2TC+d+Q1xo41oS0QPStM4JmOCzro1Us98xSvipq0w5C0ZywV8R5cH2qqMid5DNJhQ/0eiqh7mJ38irMKMtGYnKFk6T9sPWGzJHub4p6MnoTwg7VOlLoirneqYUvLEiYyzfJV8aFuMOgybhlWKAz908X8he0Rk4ZZ6LaWuMxGe7Bonl0etG6CR+JWaEadC4WAsrVaBgYJEXMtxk3HAb0L9T27uY7YDi24M1I0L69rB+37d+hEpE0b4wYty8pCZF7JHJ0H7LMF53S4rzL0ZCSrSPlLB/rnQNHnDLmmFt/+B6LLATWjshB4a5bcKomQ3SAIajC1HwWzohwHTRYdmFVI4/l2jE5ylgJeUSFStazpZ5kPPJCitGc26QfOHIg44iFypaVWLARo4TTBO5l+E2KZCz2iD0X+4OZGKlYbHAm0LIOnXefCZP+FXWkC3pFD/8BbKNmzhtUGV+CLlNLpt7zPwUFe3M7mHujeKCScU/AjZe/IxhDn6u8dzMk7GlFifkV2Abd7+20GHPwGmbNQGNVriZqid6JanebIllVj5xHf3kclV9dCZcBq1arD041ANZpT/OaYdBLKlR+eoHc7xE4HVAKrfTRaZFKFzJQ/6e6kmX4gHRe/yRQFuhKMhoL1gn2ntlqbuxPjWLIYD47S8r4nNal4EWYNdbN+bX7bYWaLIqYXenn5TLEgqD4GGoMTWyTeuQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElLUTNPa0F5VnlLKzlUaUtjLzgrTXpNUmxKR2RjeU5GMmh4L2dTMnFHUDlP?=
 =?utf-8?B?N3JYQWxTV3UwNUxEdGFFVW9BL3l5Nkt5WlcxeUw4TWVGaythWERnNjRDanFO?=
 =?utf-8?B?R0k2Y2tzUS9BN0V0S3Z2MldvRGc5MnJoNFg2ZEc5aVQwaE9IVEo4UnB2VDV4?=
 =?utf-8?B?Mks1aVNDcjlyZXNXb1VsS0hJR2E1K0lNd3BCYXNxM1lpdWlhcVIyMVB6eHgr?=
 =?utf-8?B?K3VPcEFTUG9yMGFRSExwd2o4Y0toeWNvNEN4SW9qUVV2VVhNQW1vdndrU2Vo?=
 =?utf-8?B?RGtXVlIwaXZoajk2bC9BbmNrMjlVZ2lPWUZTNkE5MnJ4c29PMXBUU0U1SnhK?=
 =?utf-8?B?cXJtWVkxWll4UVpFMTdETHR1KzlOcmo5b3lmU1kyNnVKS3VLSmtJYlpYMzlz?=
 =?utf-8?B?ZEF4YjR5TE9WQVhSaGVqS1VDNEdPOEdxZm5YK2JZY0F3V1hsMU9aNE1EaU90?=
 =?utf-8?B?bVhlREhRc2JVYmtiVk5yNGM1c3E1R2hTaXFNaWRrdXVqamZlNFI4RGtaS0hV?=
 =?utf-8?B?amxjN3d4UWZwT2dZQmlMZGNvZWpHL2RjSzZIbTRMaHhrTnRyTFA2REx3WHdk?=
 =?utf-8?B?YzVybWhVWlVlS0JLbEdYRUxoV2FxM3dLanA2RWFmT1hTbFZiQkxpTmJOS01T?=
 =?utf-8?B?TC9PaEFRRWdWcUhoa2ZpbGlyeW9vaEJ5a1BjSUI4MGowMmhyMTQ1ZnFOUHVW?=
 =?utf-8?B?T1VwT3BySDVBYkVQR1FncTJ4aGFSZk1jYmhxVXlMQWhTcTZPRVpzY09XSDdF?=
 =?utf-8?B?TFlpQm9MZkNrWVQvbS9Gck54RkdwMDNTTVpTTlVGMHpKL2gvV3MxWjlCZ3g0?=
 =?utf-8?B?T0kvaVpIVGhWbmoxMjZSZ2VEaFRQZFNWdE1UbUloWEhwcXI1Vk53VkMwRDho?=
 =?utf-8?B?MXBZUUFjdFJiZ251SWZHVlhsZEZGaDByNlYydmNqUkdWUFZpQjJwQkxTVzlF?=
 =?utf-8?B?ZUd2SmxYdWp0R3F2VU96Y2RlZEgzUXFGNktIMmsvRnpLZkUvVE9rZWM3aDM5?=
 =?utf-8?B?cTVVUFpxQnZxbzRMQ3QyR3NRY0hKMTM5QmVnbjlCbFZ4SlVkMkcrbklpR1Ft?=
 =?utf-8?B?RVA0Z2NiNXhFc2VxWVRXc2pId2dSdzE3SnBtUFV0SkRHS0cvZERHdG0vM3dp?=
 =?utf-8?B?MnJia010QTRxZzhPcWkvclBzUFdPelAzbG5pNXFBV3ZteXFFZHNxcGhpL1hU?=
 =?utf-8?B?d0dzUktvMW5xbWFkOEY5eGFVK3VEZXp2UkpaUERRbHlTRE1oelRzM2Rlakdr?=
 =?utf-8?B?dm5CaFhucTI2M1hzakFKcEY0UjJIN1V2b1lvbWRRZVYzZ1lPWklGSnMvNkQx?=
 =?utf-8?B?T1cyMjBwZzNXOFkzRUt4T3grUFBjaUpZdkpOMVFlejZqd1NtMlEwc2QzTk1Z?=
 =?utf-8?B?Vnh4MHBJWlJyTU96TGZjZDFKRTNYaGpuZkR0UGRNcE9ZYUh5YzBKTjJyc3Vs?=
 =?utf-8?B?Zmo3WmZ3aG1rM0p6c2dJbklqS3JPdlpVay8xM0FxRldKbVFGeTdYY0dyMXJi?=
 =?utf-8?B?QzRUajBlRmVPdWF3aEsrSW5jazE5dGZjTGFiR1o0NXBkcEJ0MFluZEwyZk85?=
 =?utf-8?B?QWNBSHJFZHdEWTFtWDRCTERjUjlFeVR1eHpENDVHYTE5UVZHb0VkU0o0T3p2?=
 =?utf-8?B?akpDN1ZuZm52azBBMnMvaVZMWXozdFFVQWxyektiVkZZVVJQQWtOcWM5eGVv?=
 =?utf-8?B?YytqTGhHWVZzdVdZL2hYMWQxYWVYN0FwOUtaRzA5YkwrZ0kzVUtndVpYWlJW?=
 =?utf-8?B?TTY4OGZ4cVJnbGZMS1hlY2RROVJpSmNRc2pwMGVQd0RrU0xUR21mR1FCZ3V5?=
 =?utf-8?B?aTdobzg3RThFVjVIQ2xySHZ3RTZWSmp4V0lSZE5pcW13ZzcwaUhhZVczMHR5?=
 =?utf-8?B?Q1VYdlJlSUF0b1hqRnNKclNaby9rcHU2bkFkMXhoemcyeHl4WFJXelhHUTd3?=
 =?utf-8?B?Sm8zQ2tkQ0szZ2hNajJCRmYzVmJKdmp2TVE0bXcrYTVITktobVRoU3dBL2xl?=
 =?utf-8?B?QWo5UDVoS29ZcTdDbDRnR202QjVhaUN2VTlPWFNTa3VMbWhMNUxuN0hiUGdD?=
 =?utf-8?B?cDFzTmRvd0xPeTRDMjJDRHNRZXQxVjEzOWdZNHc3bFdVZW5xUnd2TVh1SDFG?=
 =?utf-8?B?K25TZjQ1bGh3WTR3aHNrRUpkV0Q3Qy9GemNtVS9GY01SeWZMR01yYzFxOXhx?=
 =?utf-8?B?VisrcFd2cjYvZkZTQ2o1RVdJeTRIOXlLWGVXdldPM1dQcWowTVdOMW5ITi9m?=
 =?utf-8?B?QTdpUUlGeEp4emNITWp2bTgyMitjeXVJeTRkZzBLdFVMZkVJN0EzOENuSms5?=
 =?utf-8?B?NDkvMXdNUXdpZlhYQ0lOMjkwRVlyTWJzSUJTV1lTNWhkWXVWZXJKQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e650df-391a-4016-ba8f-08de8e492fdf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:43:32.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ/tRznSkUuc+hX+maiVxXufkipctPH3SQ/LWNjQHWaeGRZ+EYiJinOdkJu/ZKMPaocsr6DeXizYLE6B7muwrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB10075


On 3/27/2026 3:23 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, Mar 26, 2026 at 05:26:43PM +0800, Jian Hu wrote:
>> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
>>
>> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.


Thanks for your review.


This series is based on the clk-next branch (version v7.0-rc1).


Here are the check results without --strict:


$ ./scripts/checkpatch.pl 
0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch
total: 0 errors, 0 warnings, 8 lines checked

0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl 
0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch
total: 0 errors, 0 warnings, 46 lines checked

0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl 
0003-arm64-dts-amlogic-t7-Add-clock-controller-nodes.patch
total: 0 errors, 0 warnings, 149 lines checked


Here are the check results with --strict (I had also checked them with 
this script before submitting these patches):


$ ./scripts/checkpatch.pl --strict 
0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch
total: 0 errors, 0 warnings, 0 checks, 8 lines checked

0001-dt-bindings-clock-amlogic-Fix-redundant-hyphen-in-am.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl --strict 
0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch
total: 0 errors, 0 warnings, 0 checks, 46 lines checked

0002-dt-bindings-clock-amlogic-t7-Add-missing-mpll3-paren.patch has no 
obvious style problems and is ready for submission.

$ ./scripts/checkpatch.pl --strict 
0003-arm64-dts-amlogic-t7-Add-clock-controller-nodes.patch
total: 0 errors, 0 warnings, 0 checks, 149 lines checked

0003-arm64-dts-amlogic-t7-Add-clock-controller-nodes.patch has no 
obvious style problems and is ready for submission.


I have also run the script on the latest v7.0-rc5,  and no warnings are 
reported.


Could you tell me which version of the checkpatch script you are using?

If you are using a locally modified script, kindly let me know which 
warnings I need to fix.

>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Best regards,
> Krzysztof
>
