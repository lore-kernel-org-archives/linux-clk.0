Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58B12DDBF
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600619; cv=none; b=Dm3cR6LrzR5+m2cUOm0qPPBDgqf33mZPPZrLWKvfSiNQOK5D7riq8usae3Nvcs9A3ZBG87w+Mym+BDvpmKqUc2/BXIYNIS59UJT6hcnwQkOQ3FIH9cLUIhrXzTsNTwhgeLlj9+AFwluWYz3CBIEQPan8XYZ8uq1dmD4no3RLm8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600619; c=relaxed/simple;
	bh=PoPK6+Z1Gri/U1zYPzd1sjOshfAKmlSdqWfY/MIDs60=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Y04g0JTOLtTjt1Chp27rd2/ICyz0u1dsYgmcAU7E31gh08q01N5FntWGvEbpkYdNYSplHqJ0GTqaeMxta8RS4rCCCz1e4ft+H01Nyi0dglVXWg0uN6hp0arJiXlbsB7/Z0xIiYEEunu7vO54nS4KFROjp/OUEak/m4WblEIsj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=VxRgd/dt; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="VxRgd/dt"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A3lPjk013279;
	Wed, 10 Jul 2024 04:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=1d0YkMgSmqfYYsdhcRzP314cfTF
	3fl2RYSNhflcpgmI=; b=VxRgd/dtDwI6J0lS+YdOJ62a5Dr6CSSC5mJtncqH3vM
	VFHOy8+MrQ5B7rX2UNWKWUiunbxUeKjquIDf7nT/2euLPH5EzETbJ1tMjFFH08R2
	8oNlJ44+3yfVn3+Tgau9DtuHbmYL3c1TReABCVLRz7bD3XXAo+l6ruLajIl3HDvZ
	KmwWVDYEj4HxyYHCZ+bNQwX+fuJTRnzatVtslv8QkoOYblmOTxCpM6aNF4dewyg7
	NYIlzfsMl/gxOeWf+7NxC05H9LZIJD9JI3F6rs871HcLNHZE6EdkkkIFLDcjzKGN
	cqM7adpAXy4RbuOCMor05d7Y6hcLbPDIN8KGQu8VrhQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 409jq2rsdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 04:36:54 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 46A8aqhq022225
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 04:36:52 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 10 Jul
 2024 04:36:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 10 Jul 2024 04:36:51 -0400
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 46A8agPf014690;
	Wed, 10 Jul 2024 04:36:45 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH RESEND (again) 0/2] clk: fix possible use after free
Date: Wed, 10 Jul 2024 10:40:34 +0200
Message-ID: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAJJjmYC/1WNsQ6CMBRFf4W8SRNr2gqKTg6yOuhoGJ7wgBehN
 a1pNIR/tyEujif33nNH8OSYPBySERwF9mxNBLVKoOrQtCS4jgxa6lRulRI1BVH1DzGwrwTuKZX
 qrjO50RAnT0cNv2fdDS7FtTifkgW2yGYJZcw79i/rPvNbUHPrJ9b/4qCEFDus83uWN5pQH9Fgb
 9t1ZQcop2n6AhEHjs25AAAA
To: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720600837; l=630;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=PoPK6+Z1Gri/U1zYPzd1sjOshfAKmlSdqWfY/MIDs60=;
 b=Daw0jSAmCoalNeuf70vxdEQUmYOcvy+pY0zgyi3V5WGF64ig4jFdG0+T4gXLVTHohMrna56wV
 SHSjyRCzmU1DA5gv0fIWy6rhNQbLl3b7sIulIHZCjCpk6yFpOc011tH
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: iicAVlKaLM6doWmVxTvlVIgR_ST7-blx
X-Proofpoint-GUID: iicAVlKaLM6doWmVxTvlVIgR_ST7-blx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=426
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100057

The first patch is fixing a possible use after free in case a clk
provider is removed before it's consumer (more details on the commit
message.  

The second patch is a straightforward replacement of the open coded 

hlist_del(&clk->clks_node) ->  clk_core_unlink_consumer(clk)

---
Nuno Sá (2):
      clk: fix clk not being unlinked from consumers list
      clk: use clk_core_unlink_consumer() helper

 drivers/clk/clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 5029c56be4bab3bce7db6d9595b0bbd171a5b154
change-id: 20240611-dev-clk-misc-a9e401b25032
--

Thanks!
- Nuno Sá

