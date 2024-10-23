Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4B1C727F;
	Wed, 23 Oct 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695197; cv=none; b=X/U7KrBT27505jw+B1ldU75hrSA7YcIT6e3b78DCHer5ECdgGM47X2jEO/tI0pZ2YPXXlbfymzYClBNPH4r8v3CzIthd63SoOVj8Imc2joOde1aCEV5AaKdO9iw5QkjlbGicZeqORYkW73AF3Bbjv4awO6mMZJ3+nCatFY+yWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695197; c=relaxed/simple;
	bh=8wT9D25QJ1yv6sYGUjWqC5VHGbdqfKlgnLpVnMzRCeA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=A3e2xFFHPbA9m4ZlpRuvtmqHO6WqSchJfDkB2HyotO0xLgDxCFNeUNZIyD/itKV9G+jwvnk3Ptr7kwvCgot/Ox0HEO4DNRi/BMeZsvHIa/Zv5kYS8u77mylTz+7gTeR5L4qSdmdwLCR1X46tkGRqDM0SoNHXtrLqKjEXs6ldHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wyvLctWb; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wyvLctWb"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NDrTjQ015015;
	Wed, 23 Oct 2024 10:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=0nfH7bLly1nDLmzv7jSarI9lMXj
	hfAjcsFjjt5bQMac=; b=wyvLctWb0ZXGgjQpv1yFzqjgmfOwS3hKtPUZl0HnDWh
	bQTopSsUcGx+Owzk4MBu3Pt7g37uQERaX0xzuQEFL405LnUe/IX7b0IL46EWXVpK
	G2Mbscc/C7aRcadTKqWK32vwrrgd+UCM0vVrE8JugbygA1ojjiT3F1DHIEzZEkpJ
	G+qnccOL7THZlDcQNMEnzP0t6xZHt8wcmyKMDbpbsWuY2yjvEp0XMMey/q62TqVk
	1wrl6ulY7WVg8YiMlaaiuamRJ+0EdIkobYIaILs93nmg02V88F36yW1b1WgjLiku
	GE4QU7IUCvhybod4l7QKlnRBfZCQVD9U4E+CAQGzR7A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42em30veap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:52:53 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49NEqqmg034025
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 10:52:52 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 23 Oct
 2024 10:52:52 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 23 Oct 2024 10:52:52 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49NEqewW002884;
	Wed, 23 Oct 2024 10:52:43 -0400
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH 0/2] clk: clk-axi-clkgen: make sure to enable the AXI bus
 clock
Date: Wed, 23 Oct 2024 16:56:53 +0200
Message-ID: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALUOGWcC/x3MQQqAMAxE0atI1gaa4kK9iriobaxBqdKCCOLdj
 S4fn5kbCmfhAn11Q+ZTiuxJQXUFfnEpMkpQgzW2IWMJ3SXotzVywlmujyoMFFoz+aljJtDtkVn
 r/zuMz/MCDObCEGcAAAA=
X-Change-ID: 20241021-axi-clkgen-fix-axiclk-d1d80bcb9ee1
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lars-Peter Clausen
	<lars@metafoo.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729695419; l=800;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=8wT9D25QJ1yv6sYGUjWqC5VHGbdqfKlgnLpVnMzRCeA=;
 b=t2aucuPOkASlB9VMReo4lrVlbIqN2hNpzJmuLFM2DbLLvcl5JudgA1+fQyhCob5t78MIHh5Zn
 uRsCRyZr0YqDhqyRjnO8NHgsA2d2prgqb7WvXJQmGaPtbLN9Cl1z/Gi
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 0tGcTahSFpeW5V7lppmJeGo3umP-lSKM
X-Proofpoint-ORIG-GUID: 0tGcTahSFpeW5V7lppmJeGo3umP-lSKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=789 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230090

In order to access the registers of the HW, we need to make sure that
the AXI bus clock is enabled.

In order to keep backward compatibility, the new axi clock must be the
last phandle in clocks. On top of that, it's not an actual parent of
the axi-clkgen that needs to be set on struct clk_init_data.

---
Nuno Sa (2):
      dt-bindings: clock: axi-clkgen: include AXI clk
      clk: clk-axi-clkgen: make sure to enable the AXI bus clock

 .../devicetree/bindings/clock/adi,axi-clkgen.yaml  | 21 ++++++++++---
 drivers/clk/clk-axi-clkgen.c                       | 35 +++++++++++++++++++++-
 2 files changed, 51 insertions(+), 5 deletions(-)
---
base-commit: 94be1620fb60ea542170779915917443cda9bba7
change-id: 20241021-axi-clkgen-fix-axiclk-d1d80bcb9ee1
--

Thanks!
- Nuno Sá

