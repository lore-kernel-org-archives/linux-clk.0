Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60D3C136
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413741; cv=none; b=En41Gr6n4O79Rwd7GUqOv5TYOY9j3TEwvDJhjLIxtZMMFyZaqZkQvOwJTX71Y/atK17RK/KUxsds2IBRYJPJEB+pEFNwjzSqJ4dJU5auvYxV6LfCxBLzHvGkYhTKN0HCcInTVb9Ah9RNDk9M2XuvvBnuRSp66+p7RzYnoh9Fyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413741; c=relaxed/simple;
	bh=YmE/4qGInKDMcs6zPNt84Y1lpKPcj044cK+eW/NohFA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tJhKWr6bgQqAgn8BJgaNy+qzlu9wOKcTz934KZNq4AtGNQCyrZCfoMM90FgTlXfspnTqyS7gIPqR57I1ntSWv5Pao4trE7We/nz57+pSK4foDabLh+syDFG9mLmJWLiZXZ/Z+gjDjsr1uytJJwmhnPJfT+wF2k06Ojm9BARtDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=p42KooGI; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="p42KooGI"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QB22hr030826;
	Wed, 26 Jun 2024 10:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=heXmKtgsIkCDoVkk8+7Tnti/+2J
	S+yDBNhRR/AftqA8=; b=p42KooGI7Xs3HFJ6KRjJbmJvbyv3P8QkA0JZtggr2vE
	sazSYaL509TmjBffC80jtgeueJ6bV1/6GP15PbwItqbBBeE0RPDRQRXgXzuINwMS
	BeFDimZUwOC8F9VPAKuy8tyIosRvuC6GekZOqlzMQuYYK+Due9meKtZYEVHFyL/l
	hDkbtjnrpfmzTLq1uvoRbxGZtuc0mPGVV9iB3awk396noDWLrT+FU15HpfsdW/xk
	8LN2WbygWQqu6Ca79kt/b0R58sWt4mwVLhPNkDEiOSmt++RZSWykZkGjsYlDn6kz
	TmOPgZqVg5MuEuQgI0ENe4OuzWXshp17KfE8eFfT4CQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ywuh2qfb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 10:55:36 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 45QEtYQ3025199
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2024 10:55:34 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 26 Jun
 2024 10:55:33 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 26 Jun 2024 10:55:33 -0400
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 45QEtQfc015943;
	Wed, 26 Jun 2024 10:55:29 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH RESEND 0/2] clk: fix possible use after free
Date: Wed, 26 Jun 2024 16:59:16 +0200
Message-ID: <20240626-dev-clk-misc-v1-0-e2975f2abb76@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719413959; l=662;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=YmE/4qGInKDMcs6zPNt84Y1lpKPcj044cK+eW/NohFA=;
 b=Dbvizv8zOBnlsEh3NG/Bb/o0t8xB4D5pk29JkH1EUxnfy3vtLctYMWy6Phx0ZtR/rbQaaR8or
 zYnfiYx+T+8BgUolKSW/Dew/VgB0aSW4SmSj2IndQ/AwUemViFzeCBU
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: QQ1PtT_0dk3Vfs7kyLUZzOeYWnij0xcq
X-Proofpoint-ORIG-GUID: QQ1PtT_0dk3Vfs7kyLUZzOeYWnij0xcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=369
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260110

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
-- 
Nuno Sa <nuno.sa@analog.com>

