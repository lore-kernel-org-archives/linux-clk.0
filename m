Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021128.outbound.protection.outlook.com [40.107.130.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB663E8C6A;
	Fri, 26 Jun 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468851; cv=fail; b=kMAnZ/LtpSNLTmNYYjDpdAdTce4S+6SBSCv4MzAU1z3PQZLfR6gHL0W5xsI7kqvgKnsQMKlF29cSf5TA/3tjzfWqtouhCefDFzCxmnMW0wLuhd2tBH8Bwf9VbwdhLKz607j46+Ycu8gGN3rRAy3ZyilQVk7wGp5tcWIX7o/vDjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468851; c=relaxed/simple;
	bh=5vaq0wY2wRQIf+jH6Ly7oISNmCTip3L7k8DHOzD3Qco=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o7SJ+wFAxEDLGNH5B1PLgqo8abmElH3nnH7Pnqaz4zWJ/B7uQTMsv3Hzbi7M1xlRVgGKGNNHMR/XbuOaqeRoE8kkVkzBOq/6Ld65bm4XgvEp8DO+3nQBRfNqfR7QY1fYNVZ/ifxGrW3S0TS3JQ367Q9lOMw/kWL9Md3Bff2q7xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=fgfivQyN; arc=fail smtp.client-ip=40.107.130.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="fgfivQyN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpyAfc8KUQXbXcbi2osJn8cpHD8xTVNyRjlcHVpRuSXT93VeEAsJ5UQtTV+YoSbtx5+rvqilW/VTmrinxU2b65BtAb/+aMBZ9R1UGVoo2qpcC/2857VryuXNwoa41PNC7j18RvH0jzH7Pubg+Np/Zup/aV3RtZZx5n1rmXLx5Yan5foXW/Pf4n2knPI7cEdsqhSvOBG3ORYcXTlnwKAitV8Gkwhv/qqzZC1/PxUPaVMMOipcjHeIUWzIR+7j2UOctYVD7nNJ1U6zMicJ1xA55ELwC6/awPddiZ1I9fj4cgJeYvSW3iM4U6GA1EE9VIZZJSvR8ZPD/C0NWAS8iBIvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3DOW9oBWN29pehvSJ9L5h7lHtRWSPZxJo0v3WBFkWc=;
 b=sf0qqU+y2UFgXY+FALZGa7qVrWE7hwXg2HJosOfuhGM668Wjhv2bBqnmABeOtJpZx2r5UwyhdCF01OYgvy+/qDrcu+0cFZrA++cCnyEvLPgHjSubOsSM3NsysHPku2tIp00Kxr9djYTio5fbmLON5a2sNuLB3nDQ5OSpoi9Brq7CQ7aiby6F9X3o4sckKGtN2UWGb9t8Y4cHSVLktfPnO8NCR+NK3US05YJxFGeevRMPHyhE3Z5mAlkvQaJ1eFP9qlIOYVnIysqdJLU7I5lsWMb2Asp67xHYTlsLjylHVsvQIt5QAuI22+zWCDduKuhZpsQtX62o1aQ1OUbPNS1Xuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3DOW9oBWN29pehvSJ9L5h7lHtRWSPZxJo0v3WBFkWc=;
 b=fgfivQyNYRVdVOpR13jmwe7yYSbbgYd62o3s9Rqu6tauUgbgLTG5qtautbSk0+mrlJ8YPH2lV+gcNxqmd9fgvLJB6N0tarKUgLMzxD/FYtak2igcBA/6XQYZ8o3SquuDF0nvU5p4+YRIi6LuMKCusF+V3XR8MugVHyvVnPVpKJlcnC/M7uJ4+Fjw7vmfHLE98KhA8FQajXIWX+uhp4ahv/i9c7IHuIQ/rx6qZiOuVwaxR5SZcYMaKbphmHsXKgqwy/k4hYW5v0cNMHck3hqDPzwgvaXf6j0ULAcmzpzYHWG+ZWQuPCYCADmmFqHkTF35YuK9PnHhAQmzMMFe3xYqwA==
Received: from AM9P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::22)
 by GVXPR04MB10706.eurprd04.prod.outlook.com (2603:10a6:150:219::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 10:14:01 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::3d) by AM9P195CA0017.outlook.office365.com
 (2603:10a6:20b:21f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 10:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 10:14:01 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.51) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 26 Jun 2026 10:14:00 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by PA1PR04MB10556.eurprd04.prod.outlook.com
 (2603:10a6:102:48e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 10:13:58 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%5]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 10:13:58 +0000
Message-ID: <e47de1fa-7952-4deb-9a9b-d22d50d3474d@topic.nl>
Date: Fri, 26 Jun 2026 12:13:57 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] clk: si5341: disable input clock on probe failure and
 remove
To: Myeonghun Pak <mhun512@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20260626093410.67573-1-mhun512@gmail.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <20260626093410.67573-1-mhun512@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0545.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::15) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR04MB12030:EE_|PA1PR04MB10556:EE_|AM3PEPF0000A793:EE_|GVXPR04MB10706:EE_
X-MS-Office365-Filtering-Correlation-Id: a06a77d9-4dc9-4cd9-a4fc-08ded36ba4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 54T4SYGs431DGyOJjnlTZUReTLQQBeUd5YhL3vjNj2dZWC9EBXHJG2jBNAmoxg2kD8KT8JqZ82blD7Idw2WcUCrd9nxD7wU2O73JqeYu2A38TJlW8zAM4JJ2LJn3F7T+sHLH/F/Ve8qcEA3/V/To6sz6/XKVQGzvSzXTolofOlatmm46bk+pLDhRDNaN91ctU5mTX954jLA8uUhaM7PrdmkeTVa2UZ7mCMcLljXAzqBHZPO0WsWOwR6uJHXC4x0jQaOg2WvSQ+Nku8MadAZjbcA0XRjLoxhb8u8soAQvZZ50JWaaaQ5ilh1wHai65lNmh+aOaAwWmSRQvFPaO4nI6lgiMmYxG3YTL8sQiIn7edpmAl4n5/DPwED0K+gl235J9aDCGvPANXBdMVePKJmnq9dae4tGZxFIynomT7hjim/sRxNvJ15itwjOe+FCNiUQ8OU3odHCyIO+3Q+1roI630Wvgk0S0mnpFy1jyqLdgG5gedHVuXLwydd9wuMJ0gDKl9ziFS5T5sU0dLeLbdNqhc+5pS9e0BHMKSB1L6ELTZmitygIZ2Gp8GRr4ZMv5BZGSucUGPpW76UOg+B3AaeoSVGBygmzLQhqzqEfYrBTxwAOVGE/Bu7kLBXbW9eNk3HBxWsaShR/1+wpPByu6jRybPBljjGG6r9o+bjmEPJf40w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(5023799004)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: K9FGzhfyqpqSDJQLXxP9kYrMqO9PRxPpItml7zhYHm+HT7r9V5eX1xyevThB/gdi5rKDiA52Ox47gNIytK7J52L52vsf6bqFmOTThrbJEVROyaGm/oiURO872XgZpG5evCaTEBZMq0kJktgDNTdhh2IXX66yJZ+Gyz60tRIV5p/0NrbMV188EneNmNa0mv2mrv/zHC1BxqMfVIGuOiIUCM978iWXE42wbor5oq6nb/yLYjrov86tMuoeFL3Kh8W4K/32Cia480YyGqX12DVNdVLOSEq9kPrpi3dlSHxGmzj8PamkS3LFvbEVWuf9uN+B2mS2xtTCxP40pKjR6qtlAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556
X-CodeTwo-MessageID: 306f325c-8ae1-40bd-8eca-657c85165a28.20260626101400@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	964a60ed-0f8d-4889-aa13-08ded36ba2b9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|14060799003|82310400026|376014|36860700016|35042699022|3023799007|22082099003|18002099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	HKrJAcwZc34AUjOqxnp1qDiPSDBZnK3ODdeSA23aiLUI+6W+LLXugH4xJPokDjnEz5Orps0aGoEtWEa0mSUJ11uU8HMSiLZ5NU1r/fnRLVA6ER9bYl2Qa6wz5tdgwH2/ft3kwaVr+BquYXd11JryBtgLhhu6EquhgFxWVzv1R0m2/Gn6jZUKuX9tvopVjUlXO4zcElEfvZVlfuAjiBmtG30igAswrHqree4q7CuH9OtlOUhIdgTCJS+4cDBTeJUBb0XjyAkwRAkxdc9SBI44ugNIzuV81Sfxq+ScIj/MNhQPf4RvPpQJndFTBKe4K8Um7j1E5j3wkcGP8g/XVXPoUl7FhCurq/y2urOs7P7/AyX89hfyq3yJyzf5HeO2t2y0oM0haEVhygGNxXI0p6NIfjkwmguJmPRqNv5ai/xCQxpPR5/8Cy67BIfV24PRKp+hZQXxXqdu+wdivB5RWTBQn/13N5/WLXxAu5Dvr1gp7qc/gDZmZI+HtC9N5XiEVShxHd9kbd4i9ML6FtqBASr5GlzZuL4rPcZSFK7gHeWSNWOBCa8r34X/IbGzvYT54W1s/WCZENJsPA1/zCtwyXGPO9X/v/hGerndb+GIC/zTmH+PlWAuIYnyT1OToE6ZDEUdbUFhZM+PJB1IJ/ZaLPATXoUIk+7XW94P4GxZyCv9MS0Qa6Uj30IwFbtYXjOQ1C3Y9MAJnGPsa9AnINUUhO87ZA==
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(14060799003)(82310400026)(376014)(36860700016)(35042699022)(3023799007)(22082099003)(18002099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7sfeEbxI2YG9mxJfo3NHlNkOINpi6GTyXTg77cPILXnYrW8MUA1iEWci86WrgPryODkVwZfASPq1kDqGnFDn6Gy8Wp99FBvS7M2VF604BTWvOanEHALGXlcNQEv5ecoOcPjaloBssUtqVn0Sk0V83Tt601NlK2X4XIkbxLwXG32O/mmbR1GM+tg++YP70Jc+E9OZI3jBTHB3bUIGAN/K8s3IpBeYd4tKTsJ/f75nMUf6euKOYGAMmUe+EMqUiWeibt5DZFMP8F05w+asllvruCESQUNHaHbt90jsFWMALKWJ9agywYp7KVsnSwiifi3L1sSr1H5weUZOXBaD/UigEquf0KlRzT3stb9cpEF7KRv4p1Yrcv3Wq6fA6GuH/oiFWEFkoE+fvbSrfjUBvTItrott3krsS8of0+6Uq3kEPpG7OodaH98qXmIcicEDFe5A
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 10:14:01.0490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a06a77d9-4dc9-4cd9-a4fc-08ded36ba4a8
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10706

On 6/26/26 11:33, Myeonghun Pak wrote:
> si5341_clk_select_active_input() prepares and enables the selected
> input clock, but the driver never disables it. The devm-managed clock
> lookup only releases the clock handle; it does not unwind the
> prepare/enable count.
>
> Track the input clock that was successfully prepared and disable it
> from both the post-selection probe error path and the remove path.
>
> Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>   drivers/clk/clk-si5341.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 2499b77..14f80a5 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -74,6 +74,7 @@ struct clk_si5341 {
>   	struct clk_si5341_output clk[SI5341_MAX_NUM_OUTPUTS];
>   	struct clk *input_clk[SI5341_NUM_INPUTS];
>   	const char *input_clk_name[SI5341_NUM_INPUTS];
> +	int prepared_input;

I don't think you need this here. At the points where you want to disable t=
he=20
clock, you already know that the clock has been enabled. For example, you=20
cannot reach the "remove" function without having it enabled. So in remove,=
=20
just disable the input clock unconditionally.


>   	const u16 *reg_output_offset;
>   	const u16 *reg_rdiv_offset;
>   	u64 freq_vco; /* 13500=E2=80=9314256 MHz */
> @@ -1463,9 +1464,20 @@ static int si5341_clk_select_active_input(struct c=
lk_si5341 *data)
>   	if (err < 0)
>   		return err;
>  =20
> +	data->prepared_input =3D res;
> +
>   	return res;
>   }
>  =20
> +static void si5341_clk_disable_active_input(struct clk_si5341 *data)
> +{
> +	if (data->prepared_input < 0)
> +		return;
> +
> +	clk_disable_unprepare(data->input_clk[data->prepared_input]);
> +	data->prepared_input =3D -1;
> +}
> +
>   static ssize_t input_present_show(struct device *dev,
>   				  struct device_attribute *attr,
>   				  char *buf)
> @@ -1571,6 +1583,7 @@ static int si5341_probe(struct i2c_client *client)
>   	if (!data)
>   		return -ENOMEM;
>  =20
> +	data->prepared_input =3D -1;
>   	data->i2c_client =3D client;
>  =20
>   	/* Must be done before otherwise touching hardware */
> @@ -1803,6 +1816,7 @@ static int si5341_probe(struct i2c_client *client)
>  =20
>   cleanup:
>   	if (err) {
> +		si5341_clk_disable_active_input(data);
>   		for (i =3D 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
>   			if (data->clk[i].vddo_reg)
>   				regulator_disable(data->clk[i].vddo_reg);
> @@ -1818,6 +1832,8 @@ static void si5341_remove(struct i2c_client *client=
)
>  =20
>   	sysfs_remove_files(&client->dev.kobj, si5341_attributes);
>  =20
> +	si5341_clk_disable_active_input(data);
> +
>   	for (i =3D 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
>   		if (data->clk[i].vddo_reg)
>   			regulator_disable(data->clk[i].vddo_reg);

--

Mike.




