Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61293C43610
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 07:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F2CC21780
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 07:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="uifMQXkv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2CC21780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730764AbeKNRtb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 12:49:31 -0500
Received: from mail-eopbgr680042.outbound.protection.outlook.com ([40.107.68.42]:46880
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728406AbeKNRtV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 12:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbOXjsaKlZQB8HbQ7aQEZbS3DcYQ9Fs/SAfITmUba6w=;
 b=uifMQXkvMg57itvR6GlBTq3frU/QW1sTdbl5R4GfCEtyr2E31xJbpjPusPwv0VZYmWfRn8/PQfTnVvyinINUIQ2A1NMW09q+HwPdhxnskK4bn+hngfXf3GZ8kGcFnPvVj2QT+8j/kZlI0XMAae6jM7Gnl6G7HPA1p7MP9okGCiY=
Received: from BN7PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:20::30)
 by SN4PR0201MB3519.namprd02.prod.outlook.com (2603:10b6:803:44::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.30; Wed, 14 Nov
 2018 07:47:13 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by BN7PR02CA0017.outlook.office365.com
 (2603:10b6:408:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.25 via Frontend
 Transport; Wed, 14 Nov 2018 07:47:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
 via Frontend Transport; Wed, 14 Nov 2018 07:47:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1gMptH-0000Jk-Rv; Tue, 13 Nov 2018 23:47:11 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1gMptC-0003uq-Oq; Tue, 13 Nov 2018 23:47:06 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id wAE7kvDU024772;
        Tue, 13 Nov 2018 23:46:57 -0800
Received: from [172.19.2.152] (helo=xsjsatishna40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1gMpt3-0003sd-E2; Tue, 13 Nov 2018 23:46:57 -0800
From:   Rajan Vaja <rajan.vaja@xilinx.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <michals@xilinx.com>, <olof@lixom.net>, <shubhraj@xilinx.com>
CC:     <JOLLYS@xilinx.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: [PATCH v2] clk: zynqmp: handle fixed factor param query error
Date:   Tue, 13 Nov 2018 23:46:49 -0800
Message-ID: <1542181609-12189-1-git-send-email-rajan.vaja@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
References: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(2980300002)(438002)(199004)(189003)(6636002)(8936002)(106002)(14444005)(44832011)(77096007)(26005)(2906002)(186003)(8676002)(16586007)(476003)(575784001)(81166006)(50466002)(63266004)(81156014)(478600001)(446003)(486006)(5660300001)(336012)(54906003)(76176011)(316002)(2616005)(126002)(11346002)(426003)(110136005)(9786002)(72206003)(50226002)(7696005)(51416003)(305945005)(47776003)(2201001)(106466001)(36386004)(36756003)(356004)(6666004)(48376002)(4326008)(107886003)(107986001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN4PR0201MB3519;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-Microsoft-Exchange-Diagnostics: 1;SN1NAM02FT019;1:ihmNlgphRYodUYHnWyzMIQ8OJZW9k8ZXwojscry1rinhekOxHPfziST1WgDd9rOyjSepBP1VBAtL5bYEpkxqw1GZYKTHZv3ptmT9mqZ18hgvrNlFD7dMcxC6WHNOFldv
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4e5f960-39ae-418e-7839-08d64a056387
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);SRVR:SN4PR0201MB3519;
X-Microsoft-Exchange-Diagnostics: 1;SN4PR0201MB3519;3:f7vteZQqkvd2TPHjPmzbYw55dusj/vQPNtk5vEqrYPPTF6FQKWisRkoAnFe4QUrNoAuArojGmh295MQo8n0cYvvzhdgKVsnLgGNllC70M+mdF8eVyv/oOm7nlPBceP29pTP46f6v8KVKoiLBBC7NrIGyKBnKf8/BQtCae95cuIhG2Z5xrDnrF5V++ORyoq/bcsM1A1IuvyTlUkYsz5xwFUgJ2RTut5y4yZnM2exN3X/EdiCxBiM95SetbOU1P7cLdZMzWKrVzUk1VGns6pFN7awSJqhpm6fLEMthGMWy9DE+1L30hPMGpFnc2Ld46/tBC0ZzL/PkcKFErz8qRJrGTRoJ1bpVXOmk3ln2Yf+9rTw=;25:J5fIeR96s3ShTWHsfpatWAGRfkAJIqk6q4gv0SiwZMPyIfk9sbl7LkRdvPIR3MbuwTQNBPjRygYmhGv74R2X7Ngi3vEzaOkerSByDVMR3L9kEF4oEgqw+t7lUBWFgLVrr01JDjuR0Nsac5FECCD0D1IN8xeQ8iDyfFycQ+fbC1tZuP6J8jgwSammL+3pdh0e9BHFs/6PLYDGvNVZ1v8BDCP6e8D+jmvga++y6tY4s1ERHbKrDfinjNm6In71mw4CPeCQ67nwNnoYW0IsGhqPuFz0by+MEvknhgSlRv7xpdNpvtAp2SMZXk3M+Sa7umJ5V81x8ufHbQ/PSS9sQHPm2A==
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3519:
X-Microsoft-Exchange-Diagnostics: 1;SN4PR0201MB3519;31:jrHR/alr3RyawlB3wuM46iZ3xxH/FF+mrvFRcwZrNALe11sLnqMYVQ34zBHsF4jxcSl09axEVWKGS6rbhKOH7D/uTdF0Bno3vsHe/yQBrsAKzNgbK4f/d6K2lyvuZDxOvQecv5upCVlgaJJvHV/SuYVQoU9jxb68e3ITQfPEvCOFMUre+i3yAxYZ5RDzMtew9ngPMHp0jvl6v/jkvNWSTPNXy+SXVFdUKIaVA5N5x9I=;20:Y4FlnP/3nsjOKBGfuJVu9izVIt0Rp0PD5yug/jzFBWDyE9H1oelajCnL6dWZVS3dS9SCZM8vQOG3vCqzESuAySQ6tjeLWHPAFEJWtWJYc/+NEoYzidKzIqrJvE+wUSiWYhFgZh98dls/IE+vLXnMZCqdo+BciE9AlJYwn8QWIsqazkbYNdiCxu+LHsfyRu5ngDf8icNUWVdynhFlsgkmSRFx8RgOixqFKWY0rabdahkZT4HQlQ0BhN9Wemg02egIVR/WALOSV9p6GRsrYVVbIZIWjo7jN4lePBj7HRRT0mJ7djh3C05byvla03WRpKt/AFXqaZ2bw2ne/ATfPj+vN8uOdp8E+acF0z/zgZzNCsXkwbdTVzaxZYzSYW8qr5hgmRfCtsejVQ8t4S99F/0kC/mihiA3VzQoY+d5gXz68wbADVAJe1NmQBUz18K9P3D++hcuXZmBioP2+sBoJ1VItvvvjw4g/qrMa/S+s7g9m5GalG4Q3SB3p+HeobW7B8sU
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN4PR0201MB35190CBDB3F1027D83494174B7C30@SN4PR0201MB3519.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231410)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:SN4PR0201MB3519;BCL:0;PCL:0;RULEID:;SRVR:SN4PR0201MB3519;
X-Microsoft-Exchange-Diagnostics: 1;SN4PR0201MB3519;4:NH/CuYR94ZWTPRm9mbsKIamjlONnevpmZOZMglPT8XkLGKBAPl8pNbhcEf+SJCKxrz9xx9BJ4LQX6NjkBCxVeErq+WzLgCBLjfjXa/jesqBd2cDcLgHeAbvf51Wt+LgHLeZYvMCmozeZUm9HTjmDg6V3q4nGYCu00K2D+otRpzuWJyE73dVu4n/CbYRPs5CR8o5li0IQxRtxnIko5Wat7/hOtfPcFVWb894+W2JPqob0QEUAfg61/Pl6NE0u+SZ8O8lU8D9nEQXDQ5gmx+wcWXB8Q0pGoVR18vtySJl2Cr512gmF83xrAgMar1hdjAhd
X-Forefront-PRVS: 085634EFF4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;SN4PR0201MB3519;23:QzA2hdnW/WT3IPOb9hBVv5uzydgZ4X8V83T/JIN?=
 =?us-ascii?Q?3Qq5I46B9Vn1lE/RAC2isMRArlfpDw+CZWQXzyHvYsiQ1qYPDNnRLleLa7YC?=
 =?us-ascii?Q?N8kO4WeKUqGb2u7euB/Eg5LZVx2Hzu55GF9MzuFlV1CnowvmqLBaM1calq/3?=
 =?us-ascii?Q?rKMIVO4L0qbsWRCuWmxAUgYJtP6IOgRp/In3+wQ2mpaMQWrgC5/9JAnZhLXk?=
 =?us-ascii?Q?GxaJwPohXhVWJ9PVCwiqLfnTKox6E2Jvy9yI8J2s4tcCOVGP3BmjhjxrSTSf?=
 =?us-ascii?Q?nUwik7Tok24QO+0I7zxkHU/zfjui1VciaL68Rc7iP+rnN1qJhVbEFhy+fD7V?=
 =?us-ascii?Q?f44U46Wn7j78LaSFN2f07apYoivYZAnHUozGKm1+78kMVsK85FBiCd7uCrbX?=
 =?us-ascii?Q?D5oBcyFiscEVRemGmnnvCvtkiC53o+ihOt98iXsUR1TSlGreAKlCSZmUzUXs?=
 =?us-ascii?Q?tdIjOAwskdve8FaAmScLvfQa23KwcmAQmEnHyYuEnwAvo3C3qGgdhb2+/DOe?=
 =?us-ascii?Q?fVgLWO4TNa607ig8bDNrmCnp9JhpRJS7de9E0GTC6mTKCvTbwX/L4xk91iqS?=
 =?us-ascii?Q?24jtYmKNN3gQGK1vBfu/LMpoEUa1Ig6xC68xaM11czzdwaYj73HQ5LbTmkzs?=
 =?us-ascii?Q?OTobwC/6ZcmXqr+XOwZapL8VwBdS8TAjZb2cPvwyF0BpW38gvBTeRiI9T2gq?=
 =?us-ascii?Q?ErMKGprmnZhenM1bmAo2nVW4B9plW0tM5UsWZfksdbSxVsflem4g/cKs7tBC?=
 =?us-ascii?Q?ZQuMspyY2KrrFwiLEkTNlFFhEFC1IUjFSK6UFfCivKdKWPwrQknWomUO5hcQ?=
 =?us-ascii?Q?6uMt0YKlilipGlsz2WbLrylOt9R+7kGRSj57iFt7bayO1m4dpUPM0JINhShc?=
 =?us-ascii?Q?oU6Hp6RfAZpugi/4xLBwDqrpRlfN6Dn3PRRfIQNOThQhXJSQe+s2VSLsUsFf?=
 =?us-ascii?Q?qCfIFpLr6vrbCKWCxOUym/EZHstxOVY0ajF5eUtxalY2wC8Dp6V6kLCik7az?=
 =?us-ascii?Q?SdfP6iYd/C4y24kuxPBK/DpI/x/BqyuMVbo9kf21Zqthn4zr0EJkZ7WBaomW?=
 =?us-ascii?Q?1ME/0RnD9kpPCh+biGonNKizor2FdH6YngYbmspmMphXShPYv1EoiI6L4Hn9?=
 =?us-ascii?Q?FSyGmSmGRp0NLraJHR9rNFjXqRhyVmoexuQyPAw6XgiKqo99Rwwkk+iegPeI?=
 =?us-ascii?Q?Q+d2xmjHhszAxzB0BdC5VaHFCW1zxB8Soc8fJWCMGzXl9kWSIH3+CWT3keg?=
 =?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: yEYtqYS4mtVKZo3qCWEHxad/LH/1cTf1EKcKmnhUs0roqVuq9XtvBEbilZnu9XxkwmQf6a+pSEUp8Qruq6ia4wlM/zM9Yc+I3v5glcVppvMoWABF5mhS+sRGt7SSLgN4OZJn6QgqdaTibEmcP1glIcQ3S7XW5hFkewJpKSNOGUdn/SxvGO8VIzpqxOhB+kvgm+sXZRdYIYSjY0qOdLex0OHm13MGeCfnY20vSX+GFn8+/jq7ym6CzJ0kpAbwXZ0h/oSrOWlT38w3zhEwmZO74PxBDp8B88hWkLc/TFNsA+9NabaQoJqq298+JQixPzozCO4/oWsI41EESfV541qpFqKLkDieRYAR3W3Xq1KetjU=
X-Microsoft-Exchange-Diagnostics: 1;SN4PR0201MB3519;6:hcsEkvxtmjKkrRV5atos53bJZBQLfsOx4DQYlJgv2yj8LZ91eMVL+2P3hxxwKI1EwG/5i3ZRzMgmahtv+NSHn0msOACNdF+y1vjZO0MKDm/5vAYFhlrCeGxTn5ZRooudr638T2bIua9OKuuMvqqoBdfD/J2PcWubYHGohtWKFmo92ZUzlQxd3rh0RttzLK+3UfIzclY4P4evVVJ6dY2iw7w/bG3WtGYKh++BOtQ8mBw+OgXgGWRQZDLKRkscwlvcRSklfH7KnGuy8AUHL/1Q+xq9WpK2d4CNRAF/Tlzkc0RLUnuTvj3Z28QFUzYniWZ2uWFAEkHRorKw72yJ3OTFkT3M5XgEhoLNUBZVVlAg7ade8LQGQT8lXJgovwcOXMQVltM+7+8LfbmzTMIfkxvR6RlDgMRW+y4B+l8d95Tk4DjphNgM7sErvsHD29Gjdbgsxl7uhAChSb0jx8fYOQtdbw==;5:ngKHlw2nnbLbEIBAkWcf2vJv+EkO9O50nWkRPN5ypv/SERqVXORlsoJCl2rng/39/040gQgf1y77gM8qBrB4UD985lFDNJYbWDgfLCRtP2eOI7ATVZC6g+Br0F6AcVl0bMVlbYRDxnZq67tbwnO9JuKxRVnFG8USJL26oz8HzrQ=;7:JGWiy5e/0SGEF/Kf2uBc4t7i3Xx8ZaSf/rPmlAqPFnlUHL8poStj+1cTDyMfB4NkWQjIks8rQ9ZDOgMm1Ms/YTrd9D3i7lzV8SY8wqUVUIR2iVNxk5sLobagwJc+wtkbNGYHXUPPLFvw7cjJx1Dg+Q==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2018 07:47:12.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e5f960-39ae-418e-7839-08d64a056387
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3519
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Return proper error code in case query for fixed factor
parameter fails. This also fixes build warning for set
but not used variable 'ret'.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
Changes in v2:
  * Add Fixes tag
---
 drivers/clk/zynqmp/clkc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 9d7d297..297f16a 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -279,6 +279,9 @@ struct clk_hw *zynqmp_clk_register_fixed_factor(const char *name, u32 clk_id,
 	qdata.arg1 = clk_id;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
+	if (ret)
+		return ERR_PTR(ret);
+
 	mult = ret_payload[1];
 	div = ret_payload[2];
 
-- 
2.7.4

