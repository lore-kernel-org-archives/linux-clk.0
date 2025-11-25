Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156CF2D8384;
	Tue, 25 Nov 2025 07:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054908; cv=fail; b=QRPV8PyLlMVz7NlYsSUkbegh7y7mkEuCTfs1BAioiX9O2DvFnr5T719Y4BWtq4kIcDCZq6nimx9zeg4Z5SQLwR27KD1EwzUYIe/ez8r4mw4m+gHOmDGIOZFC2+n991UYIf6ozkssi6Xqv4GF2e6BkyEgSxxMUByzXneY866SXQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054908; c=relaxed/simple;
	bh=8LWQNEpwwwi17K3QMUREmUxgdB2hNpBxXYz4WnGSVPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sW1Ex+cQCh62cTlopmajogI5+VNMs0JIPdDDwPOelUd7q1dKTO+va/0VH2cvC9sqbI65X204Eku/g5BTfMCYeF0LKfHWVjGV6iZ83OJAAHZLABPe65XSuSMf90++n7voPJCBCVL3Ab8ZAGYC1TjNsZH4CKV9MEFz0m7peuX3rcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NIr+/HXQ; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NIr+/HXQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9IZ1BO0qtvq/9l0awamNzXRjzvdEeP19eifDjAsFQ7EhZlEt7QGdjW4jfpavjSq2qR8OCKY+OHWJooNxEabkgf6oepH5x98U4MU2HV+vqsJRnLEeiq1wLAhKxdQargs8B/8K5AUNSfbIa8wC8TqeKcVcGsHEEX03OGbv81oLJJ0DhYhZXdsD/h4h27+C1i6mMFnN9kdFPZkBxiWJMNad6hdsuhzRonLMQgQAc0WBC473YqtQEYaHJIrZ+t5DxOtzRquEaDqgHtGcyOgdGRZ4y4AaBxaQ2X93w9DZgqQ7kqtP0msCNIkqAUoh3zi1Zd8IejPS+XiNdSTmj9I/e7byA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uphJgZ7PsOAJXrA/NNcXc5Mv9dyYN02NXHoytbGvzdg=;
 b=qINPt9bgkeXrJ+dMsnlRSQQ8IR5bsxzoBeejWaPjOw5iCdqm0SGHeQEapiHTHMQKs55REZ4lt33vGSRunF2asY53vh34rJtqduQaUvjZmZ2eZdbqYAzXfdkdWYtr9w6c0c9Bsw797Cb8A3XhmdUDfYNRgL5xpsOEnzBX9cDwuZwOrwmBAmXtQlys5cMtV6qIgXePtCLLpbK1EGPVW133MQT78fgs8g5zez/AABmbozSchizSGzcLnMwjWE5L5b01A57F5+1V13FPCVwcGEhQZCF3D98C1DjGjWakJ1sdcKXh0Xk2RoQ3sL/hqb0h3rBJpB1OlmR7R5YNhdPO2NcTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uphJgZ7PsOAJXrA/NNcXc5Mv9dyYN02NXHoytbGvzdg=;
 b=NIr+/HXQUzJoz12iT/mu8/7AQXkSyRmoeZ+h5KUnsOFTDVzewgpR6IEMnjsp3+crkPDt2Weh6+X5tertdOt3NZtlFeAjxwnJGAl0VroPIkdp5e8xExezrsG+3XKfErP0OlgtTviPaaxBt8DmlAKipJ7jbivn5m03oTGRHTo95IXRBtwFo8DjjdPdDm3kTO844ryvuiAJ5DQ+sIawDwaDNEbmUoJ6WVPFSCt4gLwoIjhkDlyGK6d/6LFIJlG8bkmylU1wLKsOJwpM38KXp7nClO0ZLIq3bKnCzjtbcQCQsl2v4SJaDaSETA9taxhpexOzgyjZABcA53AzNxIL6JW1hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 07:15:03 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:15:03 +0000
Date: Tue, 25 Nov 2025 15:08:16 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, Frank.Li@nxp.com, hongxing.zhu@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx95: fix hsio_blk_ctl reg map
Message-ID: <2qfs4qnb2ngwc7cmeegjc3bu3buevg3l74tia24kw2b4mieq4n@pna3ealnibzf>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
 <20251118074055.2523766-4-xu.yang_2@nxp.com>
 <20251119-speedy-delectable-hawk-93fade@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-speedy-delectable-hawk-93fade@kuoka>
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: e04e45a7-703c-4945-1ed7-08de2bf25a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PbVEFVGq3ksGkmXaxXHvkQiHRrj/dBHwONMPm5K7gjzN2SPiVzhZKvzQqScT?=
 =?us-ascii?Q?vBSggF601JfEIDnzUz1Jv5D3GMQ1hCeZh+gpT7vvB/FPfvfaI8FA37S3X/Ha?=
 =?us-ascii?Q?xs47zEgIVIbkFpAvn5nYUl4WXDGdlSscEemdFZzAZWpP52k0Sbqm8HinMA94?=
 =?us-ascii?Q?AmL7XXOrhizhpfi/0wtVMZgRm0GvhApihQpGbd2y7nhwVoB5P0ilVKNSpfaU?=
 =?us-ascii?Q?bSfEIDfk+fUJegTbvSKtpj6EvwRLMYxJMI4S9k/SJs+l6k0srtSshe5ZFFjS?=
 =?us-ascii?Q?3qU4bldQ/+zwlAk+ZqIekUpZKg31oDTW7lTChvOlMm3wYMfgupvDAwidXKrL?=
 =?us-ascii?Q?jthBuWpeQgNqzStj2W4AJpa6gfQ/7PfLESpwaUQ8EC5QNGxqxtTSISt99LQb?=
 =?us-ascii?Q?qnFu+Qi2Top2TBmBZSXD05QWc3qrm13qZ3zxBm8Lv37XTmYZZ9lMOCs8k/5a?=
 =?us-ascii?Q?bC/0cyPn/IPXzZPzEdP8FIErvcdHtbZgh4Kvgqh2CDHg6B3ZxUT3bNNUcOa6?=
 =?us-ascii?Q?kwLLzkwAYLU1AawJ01j5pF8wOfFbx9OgNYGULGSofyog4yhURXfn+6IfosPo?=
 =?us-ascii?Q?CZ53fRuiuTPxLmwv1x8OSxtMaWA0kSmnUkorHh8mI5S01xOGmOzvv0MKg4ui?=
 =?us-ascii?Q?xGm8XlGK30BoiVAmDchJuDY32Xd59igyAZSa5BgLDF4fgIDb8WYVWCkbAMQi?=
 =?us-ascii?Q?9ZGc8Tv0N4wOsXicBHi6uZ/J4L8VxpeUKI5LWd5Rbv2bewDvppZ2TcWU0TXz?=
 =?us-ascii?Q?numuYkvNwrF72HZgoNYOg4yQiV3JkvQj24yzcmlf3nInTs87iae3SvmZiCaD?=
 =?us-ascii?Q?hGyZThfTAKC/y5fpyx7W/+5gt47hvqbKcUYLUO4ftFi7/O7/xTTA8ZMroMEX?=
 =?us-ascii?Q?vN6AnPfI8pAj3QfCbLIMkN2rWNnEgYfVPV7L+quEv9UVctjXwfodpIJrzgUY?=
 =?us-ascii?Q?SsotkZkbDMo+EBA/qG999SkcFxm9/4gGfsi+ekMBrtyEq3Tih976c0xWbKsV?=
 =?us-ascii?Q?p2ZMbb3a65EyNkhitByaj9FxuJqNiqKHl3rStm67nC8rWwQB00l9goQudGYS?=
 =?us-ascii?Q?MFmssodxPUFXVSzk8hVokRSB+yCP0Ka45GEw2S+w9+CY3dzYpC4VoGd09Hfs?=
 =?us-ascii?Q?qLUIi/cWKbor+3ZRc0ip66EASvJu/JN9iYVUBHNxdrdW03MVGGSpMhXZrp2P?=
 =?us-ascii?Q?Iy0wI13sV/TtDxldeZHy3RM3eqXSqEvt8Q7WogaoczGCKPKcbwGkmden3fya?=
 =?us-ascii?Q?/XXviZ+/OtNjIPAxU1l3BLkWgrySPpyMf+NXK9jfhc8/dUiyosXM4H9z0TW1?=
 =?us-ascii?Q?N9IBN4bHeOjn+Zwzv3raz2PthmVsezNBTMGOFR7BGI5pde930zkFuckXm085?=
 =?us-ascii?Q?+CriHOUAhtaFEh8+m+6ZpwYRwQ4hIYzVcIMcJBxddwBQOW01TsRtXtxD6OwV?=
 =?us-ascii?Q?yaaxU8ui2L5zIgXnLVfbl0yP2j85Ps2G9W5id5UuqyHWp6RAq2qEB61W83Su?=
 =?us-ascii?Q?+Y+prZcJCtFcpkAUUXsZxTS0fn4uKXGTm3WH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xLdMn+O28chCrwPHzAQN0citMBtMkbgzBXxDt+zB5EwFNg/CV9HJTA4VttOI?=
 =?us-ascii?Q?VGzMKIvzTT7gThaFPOT6H3w8Rcmwvm+PjOveZXusGhvol8i+Vf6XLF39yuRe?=
 =?us-ascii?Q?Eox0E+DsrAN+CGV1FqN83XidMAYlQkjN0If+Wk7T/z0HokBZZPcxzv98Vkf3?=
 =?us-ascii?Q?yNlTuikd1SP+80dNFrlorAcgDam2FI2JqcZ/1iJdlqR5PaD+vWVOYHA2MS6W?=
 =?us-ascii?Q?oKnQ35W4633XLmtl0AhI8fbi8XYuKiL5tKIPl3jwF7ONccCoU2GnUm56NSpZ?=
 =?us-ascii?Q?x7zxBS+E/PiClSpM2UAszdkKMDU8XiPnLolZ3I8unqiaig7qLXbYXJ7uAeLG?=
 =?us-ascii?Q?2pQYLqBgaeZIrbuQ2SfdYEDMg6q/JXZYzdFexWK5svlBy3IFGvteMqSa4+GN?=
 =?us-ascii?Q?DphqoFTbhUwFRUNfSKjq9YFhYraWF3Y79C05A2X9IPzvuraUeFMk4GXkp9K2?=
 =?us-ascii?Q?EyIuONR0lnZTqvFFRh1C3fRhmoQq70P0jfyga636fbPsIiwp3FEmJFHhqhSX?=
 =?us-ascii?Q?YCJPwZKjBK1Co7dlvzqpZiukxizFAqYA0WFrRyw7KqkX6lm2XONM++MuMRGH?=
 =?us-ascii?Q?beM3KJEb+LNG4a5VtERjoDy+7+YXisn1W2GFYw1aPnlxW0a6eM+h75Bd49vW?=
 =?us-ascii?Q?Sx1jOXJiWHRPFaqV2DC4qMJT9yDFKajvc/QKVWIiFnt+HiI61WRWBRSc3dMS?=
 =?us-ascii?Q?H1L8qHeQ5an6rvKRiS024TKkZl4awH2eDenLX5krLjFHGGT44lv9jcuzW3Gu?=
 =?us-ascii?Q?y+PvbBdzTPiGBuiYd4jNXGFQmSH94yfZEPHUo54Wgkfvi8aFKBht4fHLGxj1?=
 =?us-ascii?Q?6YLyY01Fjsd71sY+742ssLp3M2nGIDDKlaRgQiSywJcWoy6fZwE/EZfc1k/P?=
 =?us-ascii?Q?Pt3YNjx1XUC6PN4qXnj2OTizIUphb5SkYnw27Y/7g0YzTOXOf5bRdeAwZgnU?=
 =?us-ascii?Q?NCgeLbEMI+4o7hdUepln4SLg4FMuB+f59TVD85UzsaoYWfYCEBw3YuHAj1+9?=
 =?us-ascii?Q?qhxp6cGaSIrZ03ve6bl80cn3GuXrkgwc0oZjN5aZrrvgMUdJp4GToKuiqNPx?=
 =?us-ascii?Q?qezJbLZoZyCohJZ5XuYumbGu4SN6x3X3eqfzz+QpxWl7za6xcJisJNO+aMb2?=
 =?us-ascii?Q?oMjEGfUWE4q5QtY/05DqKHjAj9j/NV4kji2e5qDE+d0pPdB/LFJQ9FMCxWhC?=
 =?us-ascii?Q?PAts+Qr5Lap25O9O/2fzz7bRLMG471B1yunTBo2+8IOSlUnRZJp3ghpDqLxf?=
 =?us-ascii?Q?8y5uewjWFg/twgbmckn78FYPPZsjoX5hNgkRaXn9988lYcOtRakeTdIzdl2A?=
 =?us-ascii?Q?pT4aepjh+lMtSJ9CA6jCKuwR54ATMhgxlF1FMH5kRnb0N6ATxSogWJ1on61l?=
 =?us-ascii?Q?T3OxWdP78eGHVZHjPIZtWBBYMH88RGBlgeKEnTNtzBFWw/7WYAI3Gsz+8zcW?=
 =?us-ascii?Q?FWAhdhQo+Vf8C6qnXtgCZawvqyAywmRTxNc1FVgB9PTl1o1nAs+xw7tsPTzV?=
 =?us-ascii?Q?PeLTN/g//z1APCUkkcP2mJX9PfvO4Fu7Xs3IwcEvK2ri9diLV0/vXHusLxgj?=
 =?us-ascii?Q?VrN9a+FSVFRXYQEGIHjwDXUfFDuHv6Rel8CxMHBx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04e45a7-703c-4945-1ed7-08de2bf25a64
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:15:03.3817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8vicfJdN6Xppc7agKAva1sgR10B6O960SlL856N7+9BoJOoXK/lFaeTKbqj9qfbPvKBVW7sx2T4o3RlNbIz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

On Wed, Nov 19, 2025 at 08:44:04AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 18, 2025 at 03:40:55PM +0800, Xu Yang wrote:
> > The HSIO block control register map should be 0x4c010000~0x4c01FFFF.
> > Correct the start address and set length to 0x100 for available
> > registers.
> > 
> > Fixes: 3c8d7b5d2bed ("arm64: dts: imx95: add ref clock for pcie nodes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 1292677cbe4e..21c9df445be0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1774,9 +1774,9 @@ usb3_dwc3: usb@4c100000 {
> >  			};
> >  		};
> >  
> > -		hsio_blk_ctl: syscon@4c0100c0 {
> > +		hsio_blk_ctl: syscon@4c010000 {
> >  			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> > -			reg = <0x0 0x4c0100c0 0x0 0x1>;
> > +			reg = <0x0 0x4c010000 0x0 0x100>;
> >  			#clock-cells = <1>;
> >  			clocks = <&clk_sys100m>;
> >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > @@ -1844,7 +1844,7 @@ pcie0: pcie@4c300000 {
> >  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
> >  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >  				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> > -				 <&hsio_blk_ctl 0>;
> > +				 <&hsio_blk_ctl IMX95_CLK_HSIOMIX_PCIE_CLK_GATE>;
> 
> This is unrelated change, nothing explained in commit msg. Please do not
> combine independent changes into one commit. Non-fixes with
> fixes either

OK. Will add complete description for each changes next time.

Thanks,
Xu Yang
