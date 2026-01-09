Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDA33506B;
	Fri,  9 Jan 2026 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966537; cv=none; b=mkrn+7fqo6wE2fr6CNtjaA+/oA8HcINiWUy1eLHTrPc6o+PvVP4r6yZ8q5AfHJm/RpCFRkV+JbXheRdiSzz0cQzrynec7B8551ggO7nLZrqENwdiTcE9sZ5sXL3pFV0UXZ5tu7FUzyIyGv//iG3vPJqCFVFpXoBR9TzHhJ0isjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966537; c=relaxed/simple;
	bh=8vLc6vKQnALInsin48TNFbUpPWBH9K1AIAYCpkTREvA=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=Tjxoy5CbVs46GnaHMOBfKqmvKI2eVE+UzIU2pXMU5lEk2HcW1l9bb8k2dIAsDDW/zRzNU5q1UVH5EAbbAD+4QBIZ4JoIcWU0ZffCgQabnvO6Ej1l5frYRWRHvV+SF/PLhOe3paXiEoWEWmBmg3JRCWun4R2PBktolqgDfMvANUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=mfEIepmt; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="mfEIepmt"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099bSkd1758055;
	Fri, 9 Jan 2026 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=u
	M5w56eU610yq/0Gh6AAdYtU27tzrKHDYhe3iNa34dI=; b=mfEIepmtEmYRukD8A
	+mzx2W0VC/iWu8sG5suKuMZECHd/7/xTcgzs4o8xnr9vr3ezOnc4Gal96noQZN8u
	wy26dbDCEBaLxTl+CafpHHEoWKUpgvYEYOknNn15APm/ek143nA422vXfcyhgiAu
	QxNgoaiRc3/ryQIYUU+ttxRjjNO8+dm66B9cMCdwslT85ijBsZzuqXHEIcIQF+n+
	TnBqPhuv7JVCEEA/sGacRgJ85EuUQTe5e5u1ny1Zsh3AP9VoKVPyKVylbtl56CMf
	NJzbrVLcMwWCzjYRl2vrvXXm3U6v6ZcFNSThlj87kgjf5SfR+u5pvILMNMuEogom
	w4new==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bjnfh0f88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 13:48:33 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.237) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 13:48:32 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Nishanth Menon" <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
	<rs@ti.com>,
        Michael Walle <mwalle@kernel.org>
CC: <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] drm/imagination: add AM62P/AM67A/J722S
 support
Message-ID: <176796651270.31605.2889983349292667077.b4-ty@imgtec.com>
Date: Fri, 9 Jan 2026 13:48:32 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=QJBlhwLL c=1 sm=1 tr=0 ts=69610732 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1vzZ3so_aoUA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=yE9j5YPQHsJ0vJ057DoA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: M5e1-5REeQX0H09cJmFoicxomPB0dDSk
X-Proofpoint-ORIG-GUID: M5e1-5REeQX0H09cJmFoicxomPB0dDSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEwMiBTYWx0ZWRfX0ApUMRgbxWcK
 +18HyTQudS+o8J6X3HxzQeny6Rbol/YhtsQ0rXW5T/Lgo2XVrZO0S2KS+z1NDAOwp0roKSPQ6S8
 0z740f3rokwCEXWC6L7/Ixw6eWLfEM/zJZUOMRDPWbrOavl0wUkESv7lMAY2ipPVVj/pjZGahgS
 WaT7UU1f3O+bZzYqi5s98oUlaTjS8zzupxIOdjzphWUukbD/QFCip7nqoD7vttS3lF8RaT1IKZW
 selLUti/0gUB2HiV/tpDciZtn1qV1qZvjK3Z5nbbLiAKMQ3SsRaEkzVs4piP0VoIflOmw6q1hzk
 CJVGw0uN6W2aBjH2UnjQ3Er0FJ/PCdBKA8tu9A2YrPGuVBiLJCvNyLbpX90GYK8l8WHyC/iklHQ
 tGwHbDuepGpEiymfqaGVLG2FoqsEJ7BZbazv+CfH1ICsapxsCBx9+FZADzaUnStZOIQfrrNyq76
 QMEN7BunOiPwcdZMj1Q==


On Tue, 23 Dec 2025 13:47:12 +0100, Michael Walle wrote:
> The AM62P and AM67A/J722S feature the same BXS-4 GPU as the J721S2.
> In theory, one have to just add the DT node. But it turns out, that
> the clock handling is not working. If I understood Nishan Menon
> correct, it is working on the J721S2 because there, the clock is
> shared, while on the AM62P the GPU has its own PLL.
> In the latter case, the driver will fail with a WARN() because the
> queried clock rate is zero due to a wrong cached value.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: gpu: img: Add AM62P SoC specific compatible
      commit: 5abffd7ff012c1950d52313327fea44eaaefc64a

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

