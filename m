Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAD206051;
	Tue, 29 Oct 2024 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210153; cv=none; b=UGt/ta+3nd42kClPJSvVcklq8YLiOYfdJpxDo33rYP5qT1yUiPRRkUtHSCZXbrcHMta3UVJvYsqaD9vI/4he5uNwT09AAY4uYL4rMBPovFZHMc9TS1Jajx55U/CVMMWq49at/X3S8swuYppC3MIT+Qg2lUe+XnbrPkP1ULVEuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210153; c=relaxed/simple;
	bh=WWGKcQlEKlB3mLe7xMyRPUx6cijy/4QMsSjKf4DvAyg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qvJnLTVn1Io58N7CWTtJskFfHpyZwmLGeQ29LwQSSy1LV29042OgbHwE3SfPZ4AHp9ibVu+BaNWh6YBrs6E8RdNDY6KR7SJ+tDUEtUP8+HM0uZfCQI+jmNP0pKuU9+VI1do6019tZUMpdoR0cLrVSQDpjEJssaY1f/WVc6aKFOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=uiERj//w; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="uiERj//w"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCfZVE007171;
	Tue, 29 Oct 2024 09:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=yE4CupEowLtP6izoasbECl7opcz
	2ALXuT/n+/Ternq0=; b=uiERj//wrxph8+k5PR6AhKbEA7KddM6+UZjPfApQVat
	0Z+X9dTTcMFwoma8Wd1fBz/l2CZzbUhNIP/1GvMpZADt6qPoS9d4pgN+JKrhs6Oq
	4/U1QTs0HRm6TzPEmHu6Ess62Ij3hINj86RY2DUyo4PwkVbziEsEjUY9qtEKt7PV
	Htjjm3tiUqkEq5ayUHvnR0C7+k+K+krO6k84GaoGS1iboeJ6kkTQ0SOoi1Xxck/R
	SBcMvRkMtmJMJtDQDJC5iEGInwCMs/twNf1ljvGUlLM7ziaa7A0D960YdEB0eZjb
	CzlDxV3YT/IxUtjHvX2SHguLp6WGKYvYwc4bEPuLj+g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gwb2p420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:55:35 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49TDtXHH022162
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 09:55:33 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 29 Oct 2024 09:55:33 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 29 Oct 2024 09:55:33 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 29 Oct 2024 09:55:33 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49TDtMVn021546;
	Tue, 29 Oct 2024 09:55:24 -0400
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH v2 0/2] clk: clk-axi-clkgen: make sure to enable the AXI
 bus clock
Date: Tue, 29 Oct 2024 14:59:40 +0100
Message-ID: <20241029-axi-clkgen-fix-axiclk-v2-0-bc5e0733ad76@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEzqIGcC/3XNwQ6CMAyA4VchPVuzDkzAk+9hOIxRoRE3shmCI
 Xt3B4lHj1+b/t0gchCOcC02CLxIFO8y9KkAOxo3MEqfDVrpipQmNKugnZ4DO3zIujMLe+pr1dm
 uYSbIt3PgvD269zZ7lPj24XO8WWif/orln+JCqLCplal0Zy5ky5txZvLD2foXtCmlL2geZ8O7A
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730210382; l=991;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=WWGKcQlEKlB3mLe7xMyRPUx6cijy/4QMsSjKf4DvAyg=;
 b=bPV4gKnBiME+vrxMzfWtw+V0TPw6PQN5dYBFKrnpQ0IYvkMSi7u7Cs+vs/1FC9tz1VfQO3ONH
 0Y+PzNseI6uAOCJ86DCNjLthGKlSHAAiS7h2HesOfxi8BSirfirVP6Q
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: O6aVAYtHOHpdh-P-CYGU7WH_pXXts7zE
X-Proofpoint-GUID: O6aVAYtHOHpdh-P-CYGU7WH_pXXts7zE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=741 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290106

Hi,

Here it goes v2. Main difference comes from my discussion with Conor. We
now keep the same old behavior if clock-names is not given and only
enabled the bus clock if provided via clock-names. The goal is to make
sure that old DTs still work.

---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com
- Patch 1
  * Make clock-names required.
- Patch 2
  * Only enable the axi clock if clock-names is provided.

---
Nuno Sa (2):
      dt-bindings: clock: axi-clkgen: include AXI clk
      clk: clk-axi-clkgen: make sure to enable the AXI bus clock

 .../devicetree/bindings/clock/adi,axi-clkgen.yaml  | 22 ++++++++++++++++++----
 drivers/clk/clk-axi-clkgen.c                       | 22 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 6 deletions(-)
---
base-commit: 94be1620fb60ea542170779915917443cda9bba7
change-id: 20241021-axi-clkgen-fix-axiclk-d1d80bcb9ee1
--

Thanks!
- Nuno Sá

