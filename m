Received: from mx08-0061a602.pphosted.com (mx08-0061a602.pphosted.com [205.220.185.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42185145A16
	for <linux-clk@vger.kernel.org>; Wed,  4 Sep 2024 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.185.213
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432506; cv=fail; b=LZ/IcJAmsuBmYwdhVC9QXXv7JK4rWNhbqCqlUApzR/HUbOQI7sEwJxRt/2ljcqkZ/NlDGuy2dOkdvOg035TdMi8uqFeMJlo05BuPItMHkZ7e8H3NXLnmszH69zQSWJUCpv/l3M9lk6q6oaf47Cr7LB2xg2ToAHX6NPT8UYlJTOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432506; c=relaxed/simple;
	bh=E93KMypq8ed0vMFmUCsODmSsBx14LRljsapv4OXhiRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gq5AI5LSpD2JTVC+cUTSGfnsRh7FDBasNu/q8F2fgocmRDje2Awm41X95DDcCgsdqUKK9fLJxau8V/0VLmQufGcCVHtCU+BzA3ZEE7EeYyfWfSphXSHUtSKief+5gFN2mvt0F+ny4ObtFo7w3WXy9/Fg8Ex697SzpvmSnq9WfYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com; spf=pass smtp.mailfrom=ttcontrol.com; dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b=Z0Yu1bsb; arc=fail smtp.client-ip=205.220.185.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b="Z0Yu1bsb"
Received: from pps.filterd (m0278994.ppops.net [127.0.0.1])
	by mx07-0061a602.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4842IhJP006497;
	Wed, 4 Sep 2024 06:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ttcontrol.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2021; bh=BrQh/wxM3N2qGkLPLwB3Zy65YLaUZ3fMv8dLp9rB2hY=; b=Z0Yu1b
	sbwiijD9wjiy8fPVA8thbgtiUjywow9tvf3lUQq+4Wakalt0qE7F8GtVs8cN41ez
	1HlFrOf017YnjeqLKW4t99PF6fs8TlhZlZgcIImncs3iwwrlrJfqrQNHufvMTRt9
	9nx76wV88IEuxz/jvFsDCV7Nm2N0EYSXQ5iPoFNB1lKXN42qztGnz9kpwuv7zgDT
	pZb4CCphD3sm7ZVWcx2pg2oDcI+vGyXezDM9fBNSH5dEemU57B4sgP+VoC+39/ea
	8NV/vPn7jW+XovK0QLMT8GYsoCoqIYCPOUNvZOCImxp6MeU/nodpLY3x8VmZgK5B
	oXstU9OhJT/0nDbw==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazlp17013014.outbound.protection.outlook.com [40.93.64.14])
	by mx07-0061a602.pphosted.com (PPS) with ESMTPS id 41edy987as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:47:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XE1i8h/nsGNKYe49bMJJoFVY5JhNNgsQMg8QM0mS49mG+c6BD+CTv9V4yYQenWa0h1TeoBO42YOCMegfks9Sit9F8BSWtziWJAiKcLGcRxqMY/OpLFh4LZa40Yl9nTldwurwvw2pBp0JD5tS25hRBJgYtyTGcaNOlcQh/t2OpdeQb6PSqEsdqtZNnLXavG8t2uRNwz5/FuH6Z/QgDcteO0+dI8w/4JWa/9Kge/JF5HEUDKJ7QrD+omOtbPLMGK44b02+IERwnVAWBetytD5Y+LX0PY07A0VWi1v3GMrLAIs6kzv+cihyRcFJiBsKjYh+2Cuagxtq4xWgVOVzhHwzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrQh/wxM3N2qGkLPLwB3Zy65YLaUZ3fMv8dLp9rB2hY=;
 b=B++POGYDYMO+KwgVUuZgQR1hsl01kI91IfcHq/FXRzkDlKASV60KmppP71Et7Gz7ajqyVgVInPuh/GMis9iYNmYOK2WxyLZyXjmmRd37cZ7211h7hPon3/8DKhFLjtdtXU4lo+ieuD3EVAf8yJXYdNkHjQ7Z3gm8ymB/FZfpyt079mdvi23qh7wPVDsei42RDvG77w7TJLqflSUmc1p67+opt44Nigm4FC4IeiExuz/hivPMi7EswzQX3xCTT1E2Jxi8j8zptX3Wb3UG5VoJv4SW/bPK3lQS621W5ajomwxzgLsllA9Vr+T83omkWWhTKUrQdnz79foKQ09BLI/fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ttcontrol.com; dmarc=pass action=none
 header.from=ttcontrol.com; dkim=pass header.d=ttcontrol.com; arc=none
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32d::6) by GVXPR01MB10965.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:21c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:47:45 +0000
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1]) by DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:47:45 +0000
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
Subject: Re: [PATCH v3] clk: imx8qxp: Defer instead of failing probe
Thread-Topic: [PATCH v3] clk: imx8qxp: Defer instead of failing probe
Thread-Index: AQHa/ULwBX4QDqA/8Ua7zDhzNMik3rJG4uOAgABNqdk=
Date: Wed, 4 Sep 2024 06:47:45 +0000
Message-ID:
 <DU0PR01MB93828BA400376EB1D6EEBDA19D9C2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
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
 MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Enabled=True;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SiteId=5638dc0c-ffa2-418f-8078-70f739ff781f;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SetDate=2024-09-04T06:47:44.671Z;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Name=TTControl
 -
 Public;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_ContentBits=0;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR01MB9382:EE_|GVXPR01MB10965:EE_
x-ms-office365-filtering-correlation-id: 300170a7-97c2-447f-d5c1-08dcccad7b62
x-ld-processed: 5638dc0c-ffa2-418f-8078-70f739ff781f,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LgkqyBGi/aPUuE2K94TrPBB4djAGerVPo6JB5dTA0F2zuVCnLWOtCUKtdz?=
 =?iso-8859-1?Q?v9teE37Hc6756SH+55MwcJe2+C3KyjbzXfnrAlCuF58blEnNHRAop10wcR?=
 =?iso-8859-1?Q?aZIhErWb8dkLY4M3t6+GVNAkbAzy2SZkyTaA/jDoWUJbXy65EI0ktRYayV?=
 =?iso-8859-1?Q?IbO/J+jv8G69wQoVcK/X2LZgV9jLHhTlnzwsz6A2Avo2YNfbVzhgJyKBiY?=
 =?iso-8859-1?Q?qWzfi3uC33uKTN4ZcJ1JaWwTXSupuYnB3q0PB47c2+FC+TuR+9fqILNpge?=
 =?iso-8859-1?Q?dw94gz4t1EihGTeIN9Y11Th6CEK9V7QJ2A+s//qzSgxFttfWL4uH4D/iEw?=
 =?iso-8859-1?Q?jbxUR45Qy5jGEbVtubvOATJYeLM7gjla4HYqxa3fd8+mwhD7KT7H5fG5WU?=
 =?iso-8859-1?Q?fZXHK4bTcAjQU4AyBKfSzjIj2OotBEuoFCdkFPZ4thChLzwfx9x4hHGBbv?=
 =?iso-8859-1?Q?dKAvLtKbrS/XwQKF6APeMb8/GPOpWH0MwOA0UJ07NNca4o2qWXy1Fd35G+?=
 =?iso-8859-1?Q?UwL41QXU39Qke1gXUFw1H/49OXfUC1viVSPLj092npJQHPaqKSRZGxl9MV?=
 =?iso-8859-1?Q?D+8TwEC8SOmooQKmpSPw2D/P57avX10Advm/rxCLD5Hgal9h0Xs6DNytWk?=
 =?iso-8859-1?Q?U9WEtmrKV79ZPNCpAJEz3z8ROGqEVULG3LqRssLQPn3/poVeRt8B792oxj?=
 =?iso-8859-1?Q?V7I5KRhNl1VUFtZ4+uvgsbN6kMdXeYrHrHHe2Qd9Vi95nDlIFSJvr/G7QR?=
 =?iso-8859-1?Q?DkJglGv92sWcnrB5EiXcB4Oc01/2rywcvA5gFhx1vFd2d2JgkeRm9uG4Yk?=
 =?iso-8859-1?Q?/d1x4qPbZft24vMP1cOM85s6gHmKaxfcFY5k9M47GG3TJgOMqcQqeYJQMm?=
 =?iso-8859-1?Q?kFxKPvUJkuH6bNf1JP7HEIRw9BAZiZ7k/azvrsdBIKoppEM03WHnBcdWii?=
 =?iso-8859-1?Q?E+6iLuvcGm5B8Jlzmezgexdi5s/crcy5hwwKQjG7uRhlAXy+i0UyUnvzBB?=
 =?iso-8859-1?Q?iBmFfCQdjblfn4jWYUz0MwBw6ywI4Sxa5vOJdmr2yLo0i2mdWh8Ufm3mSX?=
 =?iso-8859-1?Q?PfhlnpSfvkfd/wh+W06Z5aM7iWr05cMEdvz20EZD7744BFhzh5j+X0Mlkb?=
 =?iso-8859-1?Q?n2Gsqcm7BdY4cKDr1Jdpdmvu0yvIdy1BS+ygBLFbX+ZpsR960ZQHzN1y3O?=
 =?iso-8859-1?Q?uKOcEu6ELeF1ce/EDecXPdH9rxmRB0rYjJn62UwR9kQEuG/3NViD2bRjWV?=
 =?iso-8859-1?Q?n/nHqefdnaWqltrBGKpaBkQrygz9Pgrudg6QoX+yLKqL/72bdJXayVZDE+?=
 =?iso-8859-1?Q?o2Jtuj8gmUpyhHKKjMD9F72eIT/9B9L5A6pkqacN0/dItkALqRK8WBCM9a?=
 =?iso-8859-1?Q?uc074Ew1qI4O6HxkSJhFFaqpTS3bp1djZ4Fy55B9KfVjcCxrgKHWfeP8zr?=
 =?iso-8859-1?Q?6laotLt1WZDfIwZvvM9C2pvARjhSEscd1D/wgA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR01MB9382.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KLPqHFdVEpz/0gYu9DWRh6lEedfVfP38dIohwtEh3VRlSGiSgwbpN9o9pO?=
 =?iso-8859-1?Q?JyQvyg9AH0di6b3Hg1cUChbDeGHGNxEqg9rQjXQlRtZzqCgpqWimlDVLOV?=
 =?iso-8859-1?Q?QiTTpiTPsQ202tWyCqCIQXx8uiKuEM9j8LCdgUNKYsI5bUfI6tGTefmSkG?=
 =?iso-8859-1?Q?YO+Ie8IN/3ZmHPhDSqvQX/egE1IkfvGiE3lm+MfTU9kYeqesNo0magRjRM?=
 =?iso-8859-1?Q?G1qk8l+Ycgwk1YVI47jQXqNzBO1U+AkJSOi2eXZtZSN3rbt6rc3XCuwn9F?=
 =?iso-8859-1?Q?0wGuLkvKPivyBDJ1hmYyNfP8fovSD14swYKNOvCfPZEZZfqDPbmjdhyYNY?=
 =?iso-8859-1?Q?Ikk5WHN8cWYT34743gRTntn++FxzwrC/nBsIJgr93HFoSl+1MBV4k6iJhd?=
 =?iso-8859-1?Q?U1u9Od5bbiihRLMbRU0fbbCY9DIdzKQTRGlzhngW8wZWd0IZIAEl+HaqOC?=
 =?iso-8859-1?Q?7F/Pg6I53ew2FJeyGhIvIxinGrHfEh8RLDQ+MZluKYHpwzB0n+aQT2D5+2?=
 =?iso-8859-1?Q?znFYNrvZg24XLF20xmgQEblRym6sH3/aNHNx8S0HsRZY4AY85u1i3z9sr8?=
 =?iso-8859-1?Q?PIvgHLqbXqtCGW8B/6NSP3hTlMSMp0D9n0I3cigRikJ/6qAzc/Ay0kOuKG?=
 =?iso-8859-1?Q?83aI6HAIkqwFmdzQr3eowMkao0Mwo94+vaiAEn7/soGHFs9kOAgvJkQl9w?=
 =?iso-8859-1?Q?bbQ9nMqaiV/RHeeuQAKBcSbSMNKIETslZJO/t4eSVM19+a+QDyYWkkRXE+?=
 =?iso-8859-1?Q?HleBGPUkvIPVrWgKKjh6J4hQpPqxCttyK+DbXzPZf727UOqhZjGQG13FQ5?=
 =?iso-8859-1?Q?xQzZnh2qvYgdGAN7pBlp597GqREozPrq3k7I24nQvWox/xQl49od5+fyyT?=
 =?iso-8859-1?Q?rt43tcLlM2EzRNb8IUI6XS6borFQpp7AtZVbMivyPe6bnFP6LQLoZyBI+M?=
 =?iso-8859-1?Q?d8b+oyYMRw+cOrPBshYEQo3scaG1UlfvIKMv1tbJM+AZyvJJ3OWH9WJFfN?=
 =?iso-8859-1?Q?lS3L351CQLE0AwV0jNM9eJuIMsvtguOysl3pVm7SerJDWaZsjD668xgNU2?=
 =?iso-8859-1?Q?59KXdBARrP8/gLkiJMAjFCrkQAJgQqLFr6WoJ+uLErcWd88dWqnxeL8n/I?=
 =?iso-8859-1?Q?t3JYhamvPHccxNN2ok0wOIFYZroWAICIj36FsLn7uUmYriJlosdpyUgrQM?=
 =?iso-8859-1?Q?wwSvPx5yPUF6D+2s/6rc0ErfaMaEJh1YeorTHpwbWJN1dS/DpOwpAQpwL4?=
 =?iso-8859-1?Q?m37AIO/W6HsYLHXq/7sBDWw+pV8YctGQfTlbOAz42Qwv89+0fbKKCDcTA4?=
 =?iso-8859-1?Q?7HPeAd6ZZ0ofAOGVZVFhWI7kbIoox/ynzLro6SwAq67znWcHZ9Pv9GT4yL?=
 =?iso-8859-1?Q?M4VghtFEs/ro7Mil80mHRcBzYWHyY/IxhqWiGjwBqc2sQXIDnZ1v5qIt59?=
 =?iso-8859-1?Q?Huc1pFaDV16BchWW6/LnIWwUYfmBgLs0CHNQYvqDcgPHJlXDEY0XvapP3I?=
 =?iso-8859-1?Q?iVyTpx6esxsSofDUMbo7QraMAZW9DyEkuk8WtpsuDzvSN88b+eL4+fhtbz?=
 =?iso-8859-1?Q?PilBGnZrK2zZg1KZHjxU3K/uqiUrmsbryvbubPe4yX1puL7DPrKB60zYUO?=
 =?iso-8859-1?Q?L+VT1vuQeO3TUwRaNB/UQ77lbsD9YedT7M?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 300170a7-97c2-447f-d5c1-08dcccad7b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 06:47:45.1157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5638dc0c-ffa2-418f-8078-70f739ff781f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlKKpmwNxrUI9QBOPwxO7SnZojCrV1+HQiSrjNI86MYjZ32yMLl7Kgoh/aLp03Pl6W3eRPime0LcY+32MSKf6ZUS4zShk2RHsEE0UrMq0K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10965
X-Proofpoint-GUID: ODAGvNlkk31VqaJOlgJK3yeea9F47Dan
X-Authority-Analysis: v=2.4 cv=RpCXLzmK c=1 sm=1 tr=0 ts=66d80296 cx=c_pps a=sxbXCBvE7ebpWdnPLwrrUQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=EaEq8P2WXUwA:10 a=9E89HhfwiosA:10 a=EZQmGfNXMHUA:10 a=8AirrxEcAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=IpJZQVW2AAAA:8 a=pGLkceISAAAA:8 a=nxb4IF0AAAAA:8 a=KKAkSRfTAAAA:8 a=rsmfmBjOAAAA:8 a=Qr78a3XGCp7qmsgNzh4A:9 a=wPNLvfGTeEIA:10 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=muotpCzfy8uUhEcWaHt4:22 a=cvBusfyB2V15izCimMoJ:22 a=5SoQ0aNoiOvKt2feW1sf:22
X-Proofpoint-ORIG-GUID: ODAGvNlkk31VqaJOlgJK3yeea9F47Dan

Hi Peng,

Thanks for pointing that out, I missed it. I will submit a v4.
Yes, the issue only happens when fw_devlink is disabled. I believe this is =
because devlink generates the device dependency graphs and only probes this=
 device when all the dependencies are met. When the devlink is disabled thi=
s dependency is not respect as far as probing order goes, so it can happen =
that the device is probed when the clock parent is yet to be probed.

Best regards,
Diogo Silva
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
> CONFIDENTIALITY: The contents of this e-mail are confidential and
> intended only for the above addressee(s). If you are not the intended
> recipient, or the person responsible for delivering it to the intended
> recipient, copying or delivering it to anyone else or using it in any
> unauthorized manner is prohibited and may be unlawful. If you receive
> this e-mail by mistake, please notify the sender and the systems
> administrator at straymail@tttech.com immediately.
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.
