Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6D21D3F5;
	Wed, 26 Aug 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787705135; cv=fail; b=alvW+y3WldXS90hWS6vVrNYiIBLSTnhIWej+l3aWZbzcnriBnLsX2pYPLwJOsif/7xHw4fZhFIRaKV9N5FoHl2d4LrlzHcXDA86PMEXKp1LTHvX/33AVzaZ8oMdDSj/86GZTQEvfAqfg4tSOUSCKTOIqWjUFVkW4YiYU4xfZyoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787705135; c=relaxed/simple;
	bh=7fyMhqCc1JXvLggu+5SAl4h4MQWE+7QlE+uT+yDTIG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oRrbH/plrw9SzNOs2rPa5p0mrrKk5Tlw3RNckmublRzT9KJO0cr24BNmcgAJMJGajuQFluS3nuWCLyDAIUc5WHTsYQTk24Qj53JRuiniBZTdo9pwL9Tem3kN2uiqPsho7reNnwY4JCHr4l1Az7LgvBEw4QKTWm3pKfOj9K/7Dro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GSt5nbUW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AEO5Pzmf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LZ/wfjly reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GSt5nbUW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AEO5Pzmf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LZ/wfjly"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09JBL2241933;
	Tue, 25 Aug 2026 17:45:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=7fyMhqCc1JXvLggu+5SAl4h4MQWE+7QlE+uT+yDTIG0=; b=
	GSt5nbUWcb+2d7hf3+KY/Vrq3Rvz4X2nREdrhN4dQ/wI+HPZTxspDBp0B9FuceJe
	0XKrJL564iYSGu8rxKqvt9nsJl4xh6cS6v9SzSU3zTnG7CFNo1MnaQTa5DdGxHC+
	6mmonOmXFHAPlM2xWfMDTg7u2+PtietWIFtQgyquE+KfvQPLyc2x7Lq2Azxqgg0q
	CP1GxAjDrHBeGrepqk2w6zDkhKiW+PI2ykGDJlKhbvc23YCfiZdUWmbjFtoChd0o
	IIzIyUxFbzjyhCvnqzrqLYf4ehS3M85n+ywTjBCeWHKgRjFcHWa0ochR+tkLFmeG
	VLr9jJxi/y8zb1/55WsHrQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4g9buyxdgs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787705125; bh=7fyMhqCc1JXvLggu+5SAl4h4MQWE+7QlE+uT+yDTIG0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AEO5Pzmf75g7WvpmDE9JZ4N9uE3NCtuOGEBKycO45ki3IBHJnm7DsZg9o+PYetcz/
	 z0W4fnruaPG+uxqspY3dWTAhLuezeyUmdoRgBVUA2lgsYiBSU9a9aEq3k51daHu7bE
	 WvMXVqH4ZDlTTQbyMRyL41aJ2GUKAnVw0OEJH7thyUfhDLmPqNUFC18wA1gDQ8C2BB
	 Tiy3a3xRBatO2Yt0nQ3ndIIAoX0CGSrf2cLDUZ4lfG1Fh4HhtkRMWHWWH8vA6kYtwv
	 vyDLo5qhacyv4h10kttkuvHBUhToHFqSsrOlvwJcNCoC3/dOxago15EFKjJVNCaRFo
	 v/InfFBqJudwg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6D3104014A;
	Wed, 26 Aug 2026 00:45:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F0E04A009A;
	Wed, 26 Aug 2026 00:45:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=LZ/wfjly;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00106.outbound.protection.outlook.com [40.93.6.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 539BD404B0;
	Wed, 26 Aug 2026 00:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpPEKFfHVVtDqTl0QR79r5OAPkUYwpNWKwlyDIdhJ0kcFyXJbXEvzoZ+tnltiXpvJiCEl9SvbzA8jl8yxXX6p+XPcus9Njqi0XSdQcMGF2VmJAKRIciYbwBjqeMQzthRJ1gqRHmN4GQlZBVGbdzn3jGK3PH2B7qIjvQkf4Qc7XhImoVkYRIpjhtNGGLxJHsP2uOOhpaR2kiw0L/7zcizMejdX5JR18JFe6O+3p7LL1/Mntxp3sKz7ymtUW873FmSWU5atSxEcnhSD6qo5jH32+9t321PDI7Yf0Lw9+kDBWHI440Y61e/qSZI9NZdv1swBfbaafZfoWwNg3HEYXoTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fyMhqCc1JXvLggu+5SAl4h4MQWE+7QlE+uT+yDTIG0=;
 b=k7unWHHptr1iBOdJ3fClVLzZ1tFOp0jipU+zAUkdizGVhXONGsjhpTyVWsacWqvVc3ITJqlXXZqqpZnz3SG+c6ZXkwvreDdFKJTLvzRRvEdlHUR+WdJdLHZ2isvvRQKaoKdwXqRIJdmroUOhLoxV46/BS574Up/IZZoG0Z4S1WOPUZCsemEy74QHukzAls2r+xwfBIKFB0FIbQeOErf05tk0ZuFYiV3IBNNMFJL9byOKg9HblJ+fSO80Tw2SPh7hlBTalwZe/VpXAEQXhmcsonJfVMF55cCnEPw+j+r9SlhL3NITk0iY2zYZTfp0Tyb7p0z7cTIYVD1KmEzcKd4h8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fyMhqCc1JXvLggu+5SAl4h4MQWE+7QlE+uT+yDTIG0=;
 b=LZ/wfjlyyrrUP+OExNw8u+Lvr9oeLqvg7ARldXFVKdvp0MmY9xO/1iC5A+dsHhLKmcnWK6xLNuYaSDRBrDjMQLHL8Uzl57rAMMADCy9s7fMaVt6dUDQFvLZDSLZ62MyhdfT+yfqR6KNK7Jx2XUJqpWKfvFw661HC0OtcFbsTWyo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 00:45:19 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:45:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] usb: dwc3: add Altera Agilex5 support to generic
 platform driver
Thread-Topic: [PATCH v3 6/6] usb: dwc3: add Altera Agilex5 support to generic
 platform driver
Thread-Index: AQHdKi3Tm0JdRnlYVUGybOM6Xu1uhravk/kA
Date: Wed, 26 Aug 2026 00:45:18 +0000
Message-ID: <ao43E4MPo8kMI8lV@vbox>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <b1a0734a2e074e2ffbaa4099695406e54206a725.1786518803.git.adrian.ho.yin.ng@altera.com>
In-Reply-To:
 <b1a0734a2e074e2ffbaa4099695406e54206a725.1786518803.git.adrian.ho.yin.ng@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB6655:EE_
x-ms-office365-filtering-correlation-id: 40537e98-11d5-4939-ef58-08df030b4d8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|18002099003|22082099003|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 JRSYUXkVxbCX1dvKdQ4neNDxbzYPip5rfs4ldt/KvznDPu9+8BlD6rp9GQQbL5GqNIoQWkTfgYOjC1pu/3/zXQo4/7QDtHz90oTyHypkYU3rvzz2SFax5o/thidEXQXBvdoj6BuChoTo5LSRQirayFH5xeyV4lTKaWzh3TT/HVhiUOT5S8wr5gHbKkCAI5KRxU43qJRnqbm84qF/5M89AKL0DOyV9rOEcvp1IbVYNrHWaAHe+WmYbSl7Aq7Z2q1TRFamFzoWXG5vTg9Lli2YQwgBpRp31SpHOffjU+nfreqiykMNF5VH3DCOWR3p3xtYEZPcxQMEiOJHLIu52G2ss1neGv8s/Lhvrkk6FMizycWm9py3bB2v9RSBE2Llh2E7wfmcIl01leqZ3qkyMKe981cEQdymqDfU4Fo7fAn8WPR3OJ8N7HGsMDBxS2uqGLxxTTv1Ds+KB1VtixuUcjEjtrHiEoPQcEnltzKE6ymBc8j4nB6BwBHpsHJglffef3cPYcdwZOwv94jyCaArxBT+7nIDlknND97Er3OaJLSPE/UEQ4/BxbPADTLor91unrAdGxz6llKSWoCUMPZWX5hJLy3AypuE+7nd/to1cJat4fHA0W59hXNK39RfkQw6SXW9Spz4iMNXyjsPCM08mX3F00OlKkdgjHRBalSLYUBU3+2ppe3OsqlrNK2sbk2Uw0SL7dW0llt81IQVpDAe9Cgz1fE7ihot5aLlWek4LgoO6Ok=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUR1b09Od3Q4cHQvYTE4UUtKRHh6bC9ZWXJUVHRFeThHWlBUMUNvL1Z6L1ZF?=
 =?utf-8?B?eW40VENwd2hEaDg1VWd5b1R3b3hoTXRSN0Z2V3ZLQzREeFpTVkY5Sld0OTQx?=
 =?utf-8?B?eW92NDdDa2RlOHFYeG94TTZmK1ROcm5DWHVOUDlkSGhiRTJKUTl0N2hPeGdW?=
 =?utf-8?B?cDdYRE8vZ3pxek9Qc0MyRjZJaE1yVmdNelR4ZXZJaTIvaTBLM0p6VzhteUJm?=
 =?utf-8?B?RTdzNVRuYmdvc3dGaWdlVGhsS01najgxUTU3dWN2NzFkRUdWd092M25Sd2Jr?=
 =?utf-8?B?Y3o0M0NXOC92NVZNemMrelFoTGRrUjN4amRnZGxPYWNLMFVodHlTZlpUek5S?=
 =?utf-8?B?QXBnMXg4TDVaT2t6aDVWSllzaENjdXZobFNqQmhXL0IrRmVBTVdvT2NUT2lp?=
 =?utf-8?B?QVlqa3c1ZkF6Y0wyMmpBVU9VWTd5b1JuWjlsVTFoeWsyMnVTRk9HY1Yzd1Y5?=
 =?utf-8?B?Rmt4YmVUVWkzRm8vbmpSRWNuSmxtV1EyQzZkSXEyOUpBMVlFQTBHOTI2M084?=
 =?utf-8?B?TTFPOVhGbkNKRlcvQksxQ2Zxd1U0L256MjYwZG5GQThMdTdTYkQrRVljK0J1?=
 =?utf-8?B?RGZadnhzZ2dzZjZsWWN0TG9aSXlPSWJlYzkrNEd2cUhiaTZIU0pVKzBaenlS?=
 =?utf-8?B?ZDFVZnZ6eHZoOUVON00xald5WlRjYnFpaWlDZitjK1ZXemtpNlZxZ3hrb1lU?=
 =?utf-8?B?azd1RzV3K3BlbDdHY0R1b1RwZUxIb2ZKV0EyU1d5TjBCZ3RRT283eWt6TUt0?=
 =?utf-8?B?VTNPT1Q0NmFVaEh5bUVVY1dMazcvczNZY0R2Z3B0aCt1WTJmbWRmTHIzUnVj?=
 =?utf-8?B?MlVETWJnVytjalQ1ZkJOTjg2U0x4VTB0cUp6WGRaa1ExUWJkck5LaHdyNWo2?=
 =?utf-8?B?MXhDQ2lHdjBVeUYrZkxvRmRFV2Y0azBzem9yV1lmZGg0Nyt6OEhiazBhQXRN?=
 =?utf-8?B?ZzhOV2pmVktMVDlrRCs3VytuN0Vlc2w5alVXMExZM1BqQjIwOFEraHZSU0tC?=
 =?utf-8?B?NTYwUmFrbjZ0ZWRwcEFCVWluZVQ5VzNZcUhIU2xSZTlwMXp0WWFkaks3b3J1?=
 =?utf-8?B?T1U2K3MvUDhXWGV5UndKZ3FIdUZoSDBnanZjcG1oeVdNcitTL1VRaEJwUWJC?=
 =?utf-8?B?cTV3ZjhBcHM5eEExdFZ0Y1hJZXZiVXVJb0RRaWJhVUdSOE10RFZSSjF0UnRj?=
 =?utf-8?B?ZU5aZFczL1pxdlZBOHdFT01qYmN4N3JLL25RZkV2RS95V3pzS0pzQXdZWmN5?=
 =?utf-8?B?Q0RmN213OGh3dENSbnF4SEpJb0prRlhFSUNtbFpPeS9FYWczVno5dkNPVjJ2?=
 =?utf-8?B?THc5MUpMTjh4dkkwUUJnblBiUzRNQ2tPY3p2R3BuWkI1U2FLa1d3dXlCWVFI?=
 =?utf-8?B?Y21wbkVLMWxhSlBaeWx3RHU5UWU3WjlUSlZibjFTWlJVTEZRT2U4a0didnhV?=
 =?utf-8?B?TWIwQjNpZ1AvZXFVT016dlFYS1lQSy9IZDRVRklmdVVSZk1BYVpBK1NvQjNZ?=
 =?utf-8?B?QkZtV0h6NStIK2c3djE1VVlSMGtOSDYzVHJRQjFuK1l3NjY0M0NFNmNMRWhS?=
 =?utf-8?B?Mm1Xb1NBSHVnMjQzM0tNNnUyUCtUQ1QzZ0t3d1EwS2xTclBkWkwzTHVFQXgv?=
 =?utf-8?B?NnRrZHBWWkVRUStyY09pVFU1WGt0RmFuU3AxMk91S3ljV2tpZVVGUzdWVWhO?=
 =?utf-8?B?ZmNCK24rdi9wK20vNzNOdEg0UU9SVnpMOFVaSHJoSERtR1lwL0NRaDU3cm5s?=
 =?utf-8?B?blV6VjlOUEdzcXVGTXhubUJ1emJ6bXh1WDd4dzVUWkhCdGxkTHZtN3VUcGNQ?=
 =?utf-8?B?MFBrOFU3dHVra1oxTlJ3MXVTUXFLcjZvTXd6SG1XekhKeVR3UGg1ajdvam45?=
 =?utf-8?B?VUg5TnNWY2JxMzgzZ2xxd1dNT0syTU1XMWppamQ2MWFjNmZDaUxsZlRsd1pa?=
 =?utf-8?B?WUEyVjZMT3crcHp1Zm9MSmp4SXArVzhWbm5yc0pqYkcxdlZhM04vdC93V0E2?=
 =?utf-8?B?NENyUVZVMEpjMXhhUmd4VnUxWUpkZlBLVnJ1QU9qbUQ4bTZLUEF3bEFvL202?=
 =?utf-8?B?NzlRRTBabGdxWG96cEJPQnc2THA1N3JMSnRwTG4rZ241TEpyb1BWbzVTSGYx?=
 =?utf-8?B?VVVEWmdsTDNXeHNGV2dUK2tnTGZ4RThrRER2T0FIOVFJZEc0T0xiOWJ5S3hv?=
 =?utf-8?B?NlR1QW9lVVN4Y2l3Nmw3bGFRTm5pMk5rSVRadEh0VWx6QUpFc0R3WjF6NGZW?=
 =?utf-8?B?K3V6cThDSGVkNHo3UmdIWmdoQW9OWnVGTHY0TUc3eGxvSmowSVZDNFNtZXNO?=
 =?utf-8?B?enRPSVcvdHpxMXpTMEt5R2ZwK3plLzlWMHV4eDZ3Y2w5OXRzeUtJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B3865020AFD704F895D8D92B7A7447A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	D5SctjebeWDOJAe2GADCkwC8IzI2Rc1Hq3KCWzSjV+Pca00RfhihAxQe47aZvznO4aXG+HQH1vsFQji/zB+S7e3MjMlRZYAWkl2bxLPLpTNIrHVXvn6ye7gYhylzfPMMH66PoOJ2n2FuvNWqaPKKTEOjxhrKj3K3rFUcwoilRND1TPoEc1F6Qwv04KPPH0fF49z5KDBDjT49LIy6XiqcBxtyQXcqG0nIiE9UJ1le35InhYH8vgGUrVI44oRUQVvCTjgYUE2Q81wviqrakqDJsfwmPr8QT5w2w0rZ2F0DzXu9EWKC+LHqaU5nsrPibgJaq1Qxm1bc7wd6RGwedtt/Eg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pzO24RHomWLuZFE9PAXUHt0Sc1l7XbD1NqrjHYiLzyEBhtt5n+gdCyKve/Hc4pL4Jbh/EBH1YN2ZoZVkbHtzSdjlisQ1/85R2Y5XFOIxxmmkj4kmEUE5r4QMB8xCkix1G+737rhWI+psN/wdTwH+9NjcDHPX6JewtRyOQl8fiNEEtd7YN679APQDSmO6QFYJqrCIpb/cUpda46C2JrF02CDTTM9m6mgvwh69sxOsaBAEmjt84PiQ5Bu0bS/7KOjNC7xOse/oKeC0ZUuS9ms3b2K8Md+s7lIuCnF7N2HS3yU3ZMHmuBNV5U5ihlEzhSLkWMVyy+HuPdHEfqqQbdXrE184QwgpSWuqw+PrHlUH1P/9JaTTKsx8sqxvXoyd1wcKO05fhj04Nuh7CNHEVoJUSPqlYaPMgmv9F9F2IcDc34hBObIiXocQuw17EXlXt2JUOpvtH8h/jQqwUvZaDoZBihMewlCI9vQaEUHXBxipntefNjvQ277WXjJPTsrHbjLt7rWjZ0DMdkzz7RR1uk1U62rezUlEr8Glru1Gw4Fr4J+0LkCqQjkC2VlfRCgt5uc9ja1Z7/xA4pCw87yoofzFjYNve89SxmYXTebA9NlyJyIsil99v7Wxgd9mZHLb79IIlVK/uHWHdh8IWNO1alrh8w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40537e98-11d5-4939-ef58-08df030b4d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:45:19.0191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhD5h8bOaa/OhLYHy9XY+P5H+EG6AVpEQyKIpZElIYZv7uF9a36ws2PK8x4sIxnCg5tarEOWBWQilB/OQmfMfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
X-Proofpoint-GUID: NNeQXsCRpNwwwnREFuheKmGmjIePWWks
X-Authority-Analysis: v=2.4 cv=euvvCIpX c=1 sm=1 tr=0 ts=6a8e3726 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=yBYpec10AAAA:8 a=jIQo8A4GAAAA:8 a=d-6TQz4Qv73At9lZlOMA:9 a=QEXdDO2ut3YA:10
 a=zbxmTX4fiVD2UiCe4Dha:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAwNCBTYWx0ZWRfXwc3wKNIDsyd9
 2kr9K0+Qlrb9T2lsjRH9WRKTvny87QBVMKQ121NFsjDZSI+XFcrkPNV7bQgTQIGx6cstl5BbPkB
 o/kdMxxPPhWEpCKdNU+h2HTqGL8nXqWtI7mKGT/xqSfNGcBs5k32i0RQkDxPll28ioDPc6S8/Tt
 388uTivyZnXV9o+sIWo5UdEVSCUlHB/uo7A8al75dQzUG+F9+Xmcqbq4wnHOubGBRlBpDWyqgMS
 s5vOjZYhTOd1KnptZm8xlmQxGVttE/OCGqiykb0AmL16OFLBAuq6DqH0BhtUT1r8GuzcRuSyDcj
 zF9p41wHuJGv6V3yDGE4ICWl8JzH0EjO7HMeA4ii6audYUmac7EiPAMxljEavC7kv7hde+yXz2z
 ff9dQ9bpbxLmTGKg6GlzuX32xA8BFBFnqTgSYgUIvrxH/NYMuDvdykylONdo9i7KoTO64OJrb+A
 wG+kXnb5zt+H1JNnozw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAwNCBTYWx0ZWRfXz7pEHXhks12T
 dWAX+xEu/ljHfuSWEdBFmca+kdvP9okJUtD933CoitC8wBCxjtvokpUdKse9BJL1BGCbDQl4jje
 Dd8E75CnDJ5R/p913hznHCtkmMOjbSQ=
X-Proofpoint-ORIG-GUID: NNeQXsCRpNwwwnREFuheKmGmjIePWWks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608260004

T24gV2VkLCBBdWcgMTIsIDIwMjYsIEFkcmlhbiBOZyBIbyBZaW4gd3JvdGU6DQo+IEFkZCB0aGUg
ImFsdHIsYWdpbGV4NS1kd2MzIiBjb21wYXRpYmxlIHN0cmluZyB0byBkd2MzLWdlbmVyaWMtcGxh
dCBzbyB0aGUNCj4gQWdpbGV4NSBVU0IzLjEgRFdDMyBjb250cm9sbGVyIGNhbiBwcm9iZSB0aHJv
dWdoIHRoZSBnZW5lcmljIERXQzMgcGxhdGZvcm0NCj4gZ2x1ZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgfCAxICsNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmlj
LXBsYXQuYw0KPiBpbmRleCBjYTY5YWMwZWIwN2MuLjg3ODFkN2VjNmI5ZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiBAQCAtMjMyLDYgKzIzMiw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZpZyBlaWM3NzAwX2R3YzMgPSAgew0KPiAg
fTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19nZW5lcmlj
X29mX21hdGNoW10gPSB7DQo+ICsJeyAuY29tcGF0aWJsZSA9ICJhbHRyLGFnaWxleDUtZHdjMyIs
IH0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1kd2MzIiwgJnNwYWNlbWl0X2sx
X2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtZHdjMyIsIH0sDQo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kd2MzIiwgJmZzbF9sczEwMjhfZHdjM30sDQo+
IC0tIA0KPiAyLjQ5LkdJVA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1
eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==
