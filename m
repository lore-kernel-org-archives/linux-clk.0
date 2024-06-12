Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177C1FB5
	for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184666; cv=none; b=KR4nq/W6+rg9SrXRfs2q2JHqAnkITfWx+JgrFmbjIvlyN4DgeGb+nUbc9+XZZPrTpjNqOW/8vOSNzWt3ZkKdg3uXY5pjplceMZXRcLDV7n/XDiLN8446u10OlZ3cs6Q8yhp6W5gOWLN7RdeTY/XkuM083VIBd5kBGu59b006Ufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184666; c=relaxed/simple;
	bh=PoPK6+Z1Gri/U1zYPzd1sjOshfAKmlSdqWfY/MIDs60=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SLepm42UQX/OosvNjvoUxEPyr8EVemoGB3mo0aJYvqqh2/kDVomW0jCNrjZwURG98oevTAx+QLYaHKqFcnTXFKj4JVFagQFEwtpo6+5QSgWTRZ38jZKxwiMmdLRmn69W2Tg/CnyZKU8IwJmSl9ivdW/8zR0Nrf+i4bMFNMDeUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=KNfACtrh; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="KNfACtrh"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C2fpWf001670;
	Wed, 12 Jun 2024 05:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=1d0YkMgSmqfYYsdhcRzP314cfTF
	3fl2RYSNhflcpgmI=; b=KNfACtrhyf7XBnbJnhct+aYdADH0LkIwLRUVr30k+RV
	KNMbUk0nSKwDj6FWt01+91nivVW0v7od/nwBQUHspy/b4ls/KezlCy9KKtjOMpl1
	bsLkWZ9mVj9MgY3wn6ozY8+ujpVoMaYLvn9APXPBsRiCAG7b2niQJBkydWFmRRLS
	3FZ38d3BcNFV1nJ8GqybW2LztcHQ+UfklhhwVD1djQa006NRMzJQgDvMvY4NoK5Y
	tNdQ/yxcrCi2LHjqhbuM6+lm/0X9CMm40ZT+xNKqQPbn5fD9GXI6mtQ+1w1rbors
	D7/zoD1yn3vpEe03PmUMT3jRyyxgauVcX/9LhIWPinQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ymh52xxec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 05:30:47 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 45C9UkQt029502
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2024 05:30:46 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 12 Jun
 2024 05:30:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 12 Jun 2024 05:30:45 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 45C9UcNW006288;
	Wed, 12 Jun 2024 05:30:40 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 0/2] clk: fix possible use after free
Date: Wed, 12 Jun 2024 11:34:24 +0200
Message-ID: <20240612-dev-clk-misc-v1-0-7ad8b58f2ea2@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKBraWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0ND3ZTUMt3knGzd3MziZN1Ey1QTA8MkI1MDYyMloJaCotS0zAqwcdG
 xtbUAA7uX9V4AAAA=
To: <linux-clk@vger.kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718184866; l=630;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=PoPK6+Z1Gri/U1zYPzd1sjOshfAKmlSdqWfY/MIDs60=;
 b=rxzlRTKBBsr6VfyagKc6TctGKHqYtIjbQq12hRBgOh8Mc7J0wSH8urp2vY4EFWYKBDkh9YyDL
 fASmQlZ4NwiAYH38dyRqjhYkzilRwXcyYISh6QlRVKg3aYAA7KB+Qy0
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: gTQGkP6SKCSUW3-H4zj4W0q4tRGil9UZ
X-Proofpoint-GUID: gTQGkP6SKCSUW3-H4zj4W0q4tRGil9UZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_05,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=291 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120068

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

