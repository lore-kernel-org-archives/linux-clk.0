Received: from mx08-0061a602.pphosted.com (mx08-0061a602.pphosted.com [205.220.185.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B0D13AD03
	for <linux-clk@vger.kernel.org>; Wed,  4 Sep 2024 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.185.213
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432627; cv=fail; b=Yqvzjt6ud+A2veSM4fh5I7lYT5TZnJmfWnzb1fL2XZGjISDhBQptb9JxWQoDrZLiXwPG3sqyk94MUniUPah923U8qUvr2uT83qPd4V42QI/H8QgYJIHm3eiSDN4wxJ//MrKsmh5KMYa09TQnRBE0CmCJh6qS7adg9SmrKgDz9Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432627; c=relaxed/simple;
	bh=6bDv1FnQrEG/4uc3bKM4jbTKFxd1wIzNPw2RnFO8Zfk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NP3SF5xIjY3ZfYvufQUxkSMun2ra7Rn0sj+BAsXIzuaiYvEBpx0Wexqej0jaKRN1Kaev/2cs1F8BNgm2cv4EvG3PMDc6D3YEX6HSd7hwFXlo8nuFfp+gr++PcPaankbtK8sl1F+tPtHadxpvBAmwobQFcG9CR/O+SY6+wgmBdqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com; spf=pass smtp.mailfrom=ttcontrol.com; dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b=r3hM3vDR; arc=fail smtp.client-ip=205.220.185.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b="r3hM3vDR"
Received: from pps.filterd (m0278994.ppops.net [127.0.0.1])
	by mx07-0061a602.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4843F2lm019146;
	Wed, 4 Sep 2024 06:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ttcontrol.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2021; bh=K7X4HSAjjkca4VheVWdxBZ0EZTLZ5+FhgCjZ+kJmqBA=; b=r3hM3v
	DRbLv7JJ2ETl5V4EYy1BnLYN2Moqg4CHwdNGRBNdXz7zPVN/u33JY63NELLuJHfB
	EzlF6eXGRCh7fj4F+jhn0CXv7jVMEgtigN50/qkAW8CArTUAGkqFCw35qoSotGvd
	3MAmcPnFqbJBrfDehHwaV3CSULnjiqKGKQqEO0oZXv2OUISIkSoL41s4xVpnlWvz
	mm/bshpVrxLwB8xLEHPrMaVkf2zllUSBnKkm29Dx1mbFHtMO3FLIAxccEcV6j1+A
	jSW2k+vc8U9ZeahZ+Jk/hiB4iJlYU3DOKWJfey5IEr3UoNQOljfbnCLZ3dze6DhW
	ZrO5vPOHY7OR8y5w==
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
	by mx07-0061a602.pphosted.com (PPS) with ESMTPS id 41edy987dw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:50:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGF63uHu+whzafmfJrOjo0gdZKqzOqmvFw5nnzxmIfOhU1lCZu1L3BAn9V9DwWfRseQOFI/+w0rJisNKQj79s/3FTAknF9L3eMqzuk3PJWQzpWcPM5al70Kl3dv0IlYz33Dh37MJeCBYlqEMWH89YcHDEbSf+khTxV1CAB9BFzb2BFkO8fcfTotDXPqhQkUc4+ZCdRRbxRvpmOOcD77ZhrznR4jUo6iTlwygHoY3H9yJwjE5dfDugZwWUiWgEIVZaQoQF7Y+FTxuo2ZRSgxfqpZO94/vtJHxTnUSKqcQrDvMAIQqZoAHZ6/hDs86pAfFAsMGSimoTgkWjkUtiSMK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7X4HSAjjkca4VheVWdxBZ0EZTLZ5+FhgCjZ+kJmqBA=;
 b=Q0C2cEkb0I1itCjRLKbdaQhClKmRnnbk4seWuVOuxKfg2xpGdrSCtsvFZGX1WaLTkipzpmvQYsSxcBhJ0jQnWQDQ08LDN8HuEHmEjWpMM+Fjwn8D/4ITtPtLBDq0OUpnhnuoLdtwNP7GEoRs0qiyCBhlZ1/CQjBgX2F9tlDLMi60l1esnrGbglXBsnoxHOT79CpCrumBxaY6ELgYogrhuXQUmmjyzei2b8l5ljz/l+Dx64V25jKRIVdk9p6nlEvHEPFRmHemvqAlZDAQgfFD+XORtUNAsEs4/Ip67yUFVb6TzxhxmunZaNhjr2m1Y239FyxOignGQA+6N9Tvy2QGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ttcontrol.com; dmarc=pass action=none
 header.from=ttcontrol.com; dkim=pass header.d=ttcontrol.com; arc=none
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32d::6) by AM0PR01MB6242.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:168::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:50:03 +0000
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1]) by DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:50:03 +0000
From: Diogo Manuel Pais Silva <diogo.pais@ttcontrol.com>
To: Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@linaro.org>
CC: "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "imx@lists.linux.dev"
	<imx@lists.linux.dev>,
        "EMC: linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4] clk: imx8qxp: Defer instead of failing probe
Thread-Topic: [PATCH v4] clk: imx8qxp: Defer instead of failing probe
Thread-Index: AQHa/parsKGDNP+Jxk22GRtAewCBaQ==
Date: Wed, 4 Sep 2024 06:50:02 +0000
Message-ID:
 <DU0PR01MB9382A24116486931F28843BA9D9C2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
References:
 <DU0PR01MB93828B0E6808E33C608BC0E29DD32@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <AM6PR04MB5941651E3920794104B3D24F88D32@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <Zs7gXhohOyQ/abOf@linaro.org>
 <DU0PR01MB9382A2BBCCD8C786121975B89D922@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <PAXPR04MB84591356511162E61E074221889C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB84591356511162E61E074221889C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Enabled=True;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SiteId=5638dc0c-ffa2-418f-8078-70f739ff781f;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SetDate=2024-09-04T06:50:02.569Z;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Name=TTControl
 -
 Public;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_ContentBits=0;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR01MB9382:EE_|AM0PR01MB6242:EE_
x-ms-office365-filtering-correlation-id: 985d410b-e97a-4899-2ffe-08dcccadcd8c
x-ld-processed: 5638dc0c-ffa2-418f-8078-70f739ff781f,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zStkYB08XvkOQS3QfZbsZyxrjizBGTjY4RxijE4g7fF6xp1YkL+b03HLDA?=
 =?iso-8859-1?Q?JpJonS4oubr1MXSi7pGyS/NqYBob6fP4LrRJJUK5hhsbBR1zJplQirOWr4?=
 =?iso-8859-1?Q?8uNY0F7BYJEX6PbaF5AMvdA8lS3fozNRrt/axsb/JLkU1Bj6Get8Yxpnfm?=
 =?iso-8859-1?Q?IuYsCwG7ohfYqyjU01t7mT1RobC21RUDde/ySGu5ljJ2mdA9btDNoTI8iA?=
 =?iso-8859-1?Q?KvuLdmePPhmpVropIMVjzTcFXjEvNlFEaJ3ENkdmBRkYWcGwi9vA/9WIhi?=
 =?iso-8859-1?Q?86/MGRc3eAg+nlHBUM1zRo3vad2Ei55G71dcdVs7UF+kG79tLBiLSID3D+?=
 =?iso-8859-1?Q?7dGbB044HAC0uZqX0SYrLGO6IN/M12CBy6mD9w/PQVQHYmAAqH2A64AeTy?=
 =?iso-8859-1?Q?ww3EiTl9xHxzbjKHkl/YC5AXvNwijMVEzQ8g0RhbKTknXrjaxwuUtoHeaP?=
 =?iso-8859-1?Q?xY2OMP7Atw3ZEjpdeZqEBFCIek9lRXvqh79/nYXX8LPHF8teD6V6fEZb9j?=
 =?iso-8859-1?Q?Be1rrx63lZTOl/rcG64sc7t/vQj/fDVqEZY3gjAjhdSBsCc8hgtYaWOsFQ?=
 =?iso-8859-1?Q?GVeE3A+bH5TWTg80UUEerMXUuyaayyeMALERroopl92Iev5ftYASK/cGYH?=
 =?iso-8859-1?Q?rnFkvT2lJz1Duz0eK1Uu5uEvfJlbEN9gbd+Vq9ysNkqQBLM6QfszZam7lC?=
 =?iso-8859-1?Q?TMYYuaNtWMKhMs/oeDZmmvciuHeFNBbTgLmBbWyJX4sjkP957vJ2Y615Tr?=
 =?iso-8859-1?Q?jT6VI/7oBCaXhG3/epdI2UWebo+G380nMkP5z6hj9ESD6r0mxeysEmzElO?=
 =?iso-8859-1?Q?fQdaV/Hj25U987jJsrTBJm4/edDacZkWPXhBHZV2pVRQDG73Lm+DpMufor?=
 =?iso-8859-1?Q?sFFvsSh2tUe9snf2q1QxS9D2yM4jlyNxrExwq73CFWVGIARyDjOmOBfsl2?=
 =?iso-8859-1?Q?NgY3PshZ2GuLZDvt2UqqFug8yqQvf0htNPZ27B67wQTGGoyblYwQYTzONe?=
 =?iso-8859-1?Q?s/6RAnittqtopuVIpDmtQIfnXoO/P3lAgqhzsybtg4/oYr83sSDe/pOnpm?=
 =?iso-8859-1?Q?mN9n7ZLBOzq+3qYLFcbwOw9FKwS0utIzjvCMSGdb42XNDr/LIy14LSKQTO?=
 =?iso-8859-1?Q?QwYLWLgYELAQnZ58EnrmBHwm6WF5pFzOl3dTS3cAJsNCdb/0RlX7fd9qvs?=
 =?iso-8859-1?Q?OD0TehZjnv3Uveq/LyQg9sC5McxdC+kVq1yrQ36LLETMy/F8Rldp6TOIho?=
 =?iso-8859-1?Q?CmICrIHtJX4KP4cabvJ/j5pQwHnVAdlvqDg7/mAk8qyteRQ2ufnAdo3eBf?=
 =?iso-8859-1?Q?8EyMT4c28wNrmVSjsKoIo5AaCG7WlQ9gO/EZ72+QebG6fbliK+oyY3vyns?=
 =?iso-8859-1?Q?SLcgxYeRPuQxgVUhavAg2EdZbPKvJMeNCVMQpR08qmkSIKXXCqbOSxmHmt?=
 =?iso-8859-1?Q?zf/747QBAoZk1AZXydbH6wPbk4anAgFdgmj9Ew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR01MB9382.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?edffg5lYAsBcRrduhm3VQDmDunNgvVrOribi5VGeaWZgKlE7jsZOH7Hy0B?=
 =?iso-8859-1?Q?HjKmmvG6/PDzgAEvPKU+YOi0Xj/d1iGELTsUOkZ1c/s9x/A00YrySsB9yh?=
 =?iso-8859-1?Q?UU56D6q4k3Fo8hwux1mfZMzQL8jtzRp3T0JEkMXnd7SYbMveq8EA3LfYTk?=
 =?iso-8859-1?Q?Wy0dSAl2LZ66lQ00L1qTEeV+J/ueQVECHbqIk6nftH6W7BYF3BbkHjz9XB?=
 =?iso-8859-1?Q?F66/OgRipxYyvajWfD0Vlwsied4Dpbjx31AWsaK7Q+Z+9qr28nuOHHNslh?=
 =?iso-8859-1?Q?sttMlHpfKvFWcMqcJiorL46kM+qEkEYLM+blLv2PXuvnd7kJO+cYS+gFFm?=
 =?iso-8859-1?Q?EcY+yEeW+wNM1FWGoGFxmB7KwzTX4f2EQ+xqeZi+wKnRqLTgxFTT0WSECW?=
 =?iso-8859-1?Q?2lPt3443fyVHCGOyKG1gHaYGmpuPBOjUQvhKql7tkgBobU6R2kjjARRqyy?=
 =?iso-8859-1?Q?Rgq9O8Lq2lIRc+BA2ocSUvDFOu7MPSwipKvykHdm0qxfZjOe8nY9NDRdgr?=
 =?iso-8859-1?Q?WWZxI39dOrWF5W/3px15unICsQXUfh4FBd9qe7zH33tSz/NgWNWaUilIFB?=
 =?iso-8859-1?Q?UxCPdQyhsIvFe0KRvSac8UgrRwB/3u7sTildx4Ggne6gRdPxX90VQwKODH?=
 =?iso-8859-1?Q?ZH5pU4H1nHotq6u/P0TtqLoH+jPkPSuhrB8GWl3rmYmY2RY6ew2pUidMcs?=
 =?iso-8859-1?Q?SEy0IjennTVwcV5S0GL1bwT1W5Nb7nY1Wvqtod2trE3SAMtq1D3n+GrhK4?=
 =?iso-8859-1?Q?GgHRGXUR9N19hU/p+OkCCQY7IDNXewLN0kepQHcvLu4IyA1cHPzkuQJSXA?=
 =?iso-8859-1?Q?LauECZBhiVopepyQ3FTevxFGDUFugaSP1i79SxXHlqhbQLLcK/CF5pbyBC?=
 =?iso-8859-1?Q?qljK5BXteOxtUo7LnReWAzXhbSvhHpTrHrBCEbIHp+IT4xAFVwT6k6FCv+?=
 =?iso-8859-1?Q?QihKnlpAETCERRcH4uA1jS63AoJFT3GKGY5OaPFUgf/VaSOFH7rQerT/AF?=
 =?iso-8859-1?Q?EYxINaAzx4vb2kD69Wop17MspdlOQE+eNZdaxoj+WFja8lq7ywNJwRbAcM?=
 =?iso-8859-1?Q?/SPWaNS1kFfpzcHX1steL3RsewLOa+T2Roip3topOjDymM4WE9+GppDR/4?=
 =?iso-8859-1?Q?xnAEzG3fVK377I3LxfXNzNYBnllNzLUFiCRp+l6qga7+IGygb8TbZ88Rmm?=
 =?iso-8859-1?Q?XwnZt6A6vWZt7vipB4U4Tis2fBOwed7cvg4PTOKXXRFWLA54NWe+vQYV+y?=
 =?iso-8859-1?Q?8gw22M08tWBOTjWfGplNYGYg/YPXCMeg3UkWVAI7SyJb73lYUph6LT4dGf?=
 =?iso-8859-1?Q?E9wqYMxL5wRnlg/42OprJMhB0uMwOxzjdSqBmxCf/ZhV3CZFdylRxBlxGZ?=
 =?iso-8859-1?Q?QJ7DoZaXCtQtfTfEDxaACD6OUXGENcdSCjEmkcH7YIwhafvUYugEBddWQb?=
 =?iso-8859-1?Q?AIxGFSfG2aRqu84WSREqE2aV56vmeNbgE0xrBxpSIUZiyHh98zGnXE+G30?=
 =?iso-8859-1?Q?JQNpEhL+likQGaHyCd3m1M5JF7eU2Bd1eOIkyl53JKbIypIZtYpunPmcEj?=
 =?iso-8859-1?Q?IQa7ysU4zlm06YWMTDY0IPcin3qPomUmQ0gNiVRqQG33V3S7mDqJ+SEHdN?=
 =?iso-8859-1?Q?yuh+iT6LEabI6ZQ0mnmBFqjHUKg4af00S/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ttcontrol.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR01MB9382.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985d410b-e97a-4899-2ffe-08dcccadcd8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 06:50:02.9168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5638dc0c-ffa2-418f-8078-70f739ff781f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiM3mmU3/l/8p/47SQfK43LEmaBXHLsxd03CFFczQ8Sa8lqyNh9KmJtUx9u3ukWqSXwb/txUGylNat+ea9wM67I1hFmAfLJMOdL6OXHPn90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6242
X-Proofpoint-GUID: F-4PO-tknZl3rILgwZdq7LEDIKJyObVp
X-Authority-Analysis: v=2.4 cv=RpCXLzmK c=1 sm=1 tr=0 ts=66d8031d cx=c_pps a=gP2taHnPVrKuxa3Y2Z85qg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=EaEq8P2WXUwA:10 a=9E89HhfwiosA:10 a=EZQmGfNXMHUA:10 a=nxb4IF0AAAAA:8
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=IpJZQVW2AAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=rsmfmBjOAAAA:8 a=KVT2gqi4WtierUUwmrEA:9 a=wPNLvfGTeEIA:10 a=muotpCzfy8uUhEcWaHt4:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22 a=5SoQ0aNoiOvKt2feW1sf:22
X-Proofpoint-ORIG-GUID: F-4PO-tknZl3rILgwZdq7LEDIKJyObVp

When of_clk_parent_fill is ran without all the parent clocks having been
probed then the probe function will return -EINVAL, making it so that
the probe isn't attempted again. As fw_devlink is on by default this
does not usually happen, but if fw_devlink is disabled then it is very
possible that the parent clock will be probed after the lpcg first
attempt.

Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>
---
  v2: change from dev_warn to dev_err_probe
  v3: refresh patch
  v4: correctly propagate probe defer error
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8q=
xp-lpcg.c
index d0ccaa040225..1c3e1a7df8ca 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_=
device *pdev,

        ret =3D of_clk_parent_fill(np, parent_names, count);
        if (ret !=3D count) {
-               dev_err(&pdev->dev, "failed to get clock parent names\n");
-               return count;
+               return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+                                    "failed to get all clock parent names\=
n");
        }

        ret =3D of_property_read_string_array(np, "clock-output-names",
@@ -301,6 +301,8 @@ static int imx8qxp_lpcg_clk_probe(struct platform_devic=
e *pdev)
        ret =3D imx_lpcg_parse_clks_from_dt(pdev, np);
        if (!ret)
                return 0;
+       if (ret =3D=3D -EPROBE_DEFER)
+               return ret;

        ss_lpcg =3D of_device_get_match_data(dev);
        if (!ss_lpcg)
--
2.34.1

________________________________________
From: Peng Fan <peng.fan@nxp.com>
Sent: Wednesday, September 4, 2024 4:03 AM
To: Diogo Manuel Pais Silva; Abel Vesa
Cc: abelvesa@kernel.org; linux-clk@vger.kernel.org; shawnguo@kernel.org; ke=
rnel@pengutronix.de; s.hauer@pengutronix.de; linux-arm-kernel@lists.infrade=
ad.org; sboyd@kernel.org; mturquette@baylibre.com; festevam@gmail.com; imx@=
lists.linux.dev; EMC: linux-kernel@vger.kernel.org
Subject: RE: [PATCH v3] clk: imx8qxp: Defer instead of failing probe

Hi Diogo,

> Subject: [PATCH v3] clk: imx8qxp: Defer instead of failing probe
>
> When of_clk_parent_fill is ran without all the parent clocks having
> been probed then the probe function will return -EINVAL, making it so
> that the probe isn't attempted again. As fw_devlink is on by default
> this does not usually happen, but if fw_devlink is disabled then it is
> very possible that the parent clock will be probed after the lpcg first
> attempt.

Did you meet issue with fw_devlink disabled?

>
> Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>
> ---
> v2: change from dev_warn to dev_err_probe
> v3: refresh patch
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-
> imx8qxp-lpcg.c
> index d0ccaa040225..cae8f6060fe8 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct
> platform_device *pdev,
>
>         ret =3D of_clk_parent_fill(np, parent_names, count);
>         if (ret !=3D count) {
> -               dev_err(&pdev->dev, "failed to get clock parent names\n")=
;
> -               return count;
> +               return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +                                    "failed to get all clock parent
> + names\n");
>         }

The change is not enough, you also need to handle
        ret =3D imx_lpcg_parse_clks_from_dt(pdev, np);
        if (!ret)
                return 0;
->
        ret =3D imx_lpcg_parse_clks_from_dt(pdev, np);
        if (!ret)
                return 0;
        if (ret =3D=3D -EPROBE_DEFER)
                return ret;

Regards,
Peng.

>
>         ret =3D of_property_read_string_array(np, "clock-output-names",
> --
> 2.34.1
> ________________________________________
> From: Abel Vesa <abel.vesa@linaro.org>
> Sent: Wednesday, August 28, 2024 10:31 AM
> To: Diogo Manuel Pais Silva
> Cc: Peng Fan; abelvesa@kernel.org; linux-clk@vger.kernel.org;
> shawnguo@kernel.org; kernel@pengutronix.de;
> s.hauer@pengutronix.de; linux-arm-kernel@lists.infradead.org;
> sboyd@kernel.org; mturquette@baylibre.com; festevam@gmail.com;
> imx@lists.linux.dev; EMC: linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] clk: imx8qxp: Defer instead of failing probe
>
> On 24-07-02 08:10:44, Diogo Manuel Pais Silva wrote:
> > When of_clk_parent_fill is ran without all the parent clocks having
> been probed then the probe function will return -EINVAL, making it so
> that the probe isn't attempted again. As fw_devlink is on by default
> this does not usually happen, but if fw_devlink is disabled then it is
> very possible that the parent clock will be probed after the lpcg first
> attempt.
> >
> > Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>
>
> This patch doesn't apply cleanly.
>
> Please respin.
>
> Thanks!
>
> > ---
> > v2: change from dev_warn to dev_err_probe
> > ---
> >  drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > index d0ccaa040225..7bd9b745edbe 100644
> > --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > @@ -225,8 +225,8 @@ static int
> imx_lpcg_parse_clks_from_dt(struct
> > platform_device *pdev,
> >
> >       ret =3D of_clk_parent_fill(np, parent_names, count);
> >       if (ret !=3D count) {
> > -             dev_err(&pdev->dev, "failed to get clock parent names\n")=
;
> > -             return count;
> > +             return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> > +                             "failed to get all clock parent
> > + names\n");
> >       }
> >
> >       ret =3D of_property_read_string_array(np, "clock-output-names",
> > --
> > 2.34.1
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.
