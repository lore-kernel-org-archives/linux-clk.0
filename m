Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F46125D0
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170495; cv=none; b=gikohHIj0rTxxhBU2mdeeKIAt5a+WouulsOm0iAQi+OYob8FFxDC5aDkPjmOzII6RGUEewwx9/2UMWQg2AhBq+l3xst/olLeKAsJPE+DnenMLllK4KULnubG8A9NNHIGj0r8CSIu0JGFYiBD2xmZjSX6YUP5Hiwa9YJ+QWhAE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170495; c=relaxed/simple;
	bh=1VBKv2d4Kw/BVieQnuOG1OXfQo9tqr/j1oaUqqUaIi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUkiI1rggRn4g2W1Emlow9fA4rUpXs7hs6TmGPYIC6AZ4QgvtOtKRUqIh6dLLkpv2KTHqf1LM/X6L+vsPqSE3IVE0eotpwCiJnKWMS7f7wYXyhts+YvZKQQj0V45i/ZDXH6VApMgHi7SmjFq9ZsDwmcqs5DDRVZWyaFFwxcNhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=docilZlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDoiNAW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="docilZlj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDoiNAW+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N9p7OZ722631
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 12:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BBFlJ/LfGtg3hOzrf7Xo/5L9Tz24VTUma/0
	bRXqr9Gc=; b=docilZljk0zKm9bbHQN2nMhLSGiBiD+rt/DlMAov5D1AVQGqNXe
	TaQTUihgGA/roCInhNvD5kTHECH0ktl0mrS6djO5xcmk8UlCdjxkWfavOMQ46OmL
	NOpYolyD0yFDcZ9VO2Ye49djIz+Y1nBSg3YIAdhf7T2+haQnm2zEHTHS9c7MG4AT
	MvLMXO1lj61ajEyxCe0dOADPRKSweMwQn8Rhd/uoOMfUB2zqcmXk6BXCjUP9pOGI
	aVW7TJ+0XwgLpNRlZitSiHdZFkDngprX4dx4FSafjjH95L4eGiGlMREbAxsRmPBc
	IchHDAuYbQpzLiS/oswzyzNoO15HKeLx/sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069j1ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 12:14:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so581107185a.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 04:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769170492; x=1769775292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBFlJ/LfGtg3hOzrf7Xo/5L9Tz24VTUma/0bRXqr9Gc=;
        b=LDoiNAW+21ciSsgRgfGCfOtldYPjKNGHh1EW7ptf9Z0+NDV20FqBpl3YXu4FSVTuz0
         fE457UJxRzZbH0GnquHAYt8S+uP1Ppp1L5h7aKspsJyvfqU1ThlUXRfUDGCIwXLz7FUe
         O97te1HaelFdtV/s9OGa4/LBmaZYwDacceJ6szm7ixYdp8sKgFVBKEUhXFP4qwFVlUm+
         6ogiJ92EPyAY1b7/2PDxAvJLZNAiE79FlBQyvlYCO9l/HjGgdO0UWqn13+ks0wyVMBKg
         dtgi1GFSFGYuZhEuIJsnyeZE+V2shMyVEQoUNOTg6FHgbQs3uXbv1LSk31fdiK1hhv3g
         IDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170492; x=1769775292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBFlJ/LfGtg3hOzrf7Xo/5L9Tz24VTUma/0bRXqr9Gc=;
        b=shW0v3EaA9W4o7SXzcGlx51imaxY4zR3qxRQ9Tq9OmtJRRlVrpviS4sP96EJhlhplR
         Se1Iwnp7zdzU4vzPrXMpauw3NuCuBEuhmHv0FaUilpzrEbwYR5nySUnLt+r8UjFpyF6K
         6ZhCy/vqFLYB9RiGfKF4DNTTBcTcnYBLO84UGAU84Ulo6zzZY/tiBnA4ZUDmSlx1CMly
         31s7IQQHs2MZ4JpnUwHEe8XaNwozbDto4kejPDboyWws1Ffmw7UA8aZTl2A2MmGujASw
         JTIADiMkSKNp8M5zYBUDdKGqCSHRGkknTyCuoaoJzYGrwm2/oOMnTyI7xHs/5KeoEWwB
         cdzg==
X-Forwarded-Encrypted: i=1; AJvYcCVqjO3NnVJNwvFBvbIcXVregzoWfajIyXLu6x/hzyb1GA2gDZEV7NdRgYBlPl1Cw8vgw4AulubOY8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YysPc8zDqkV3bqXUhuBtKEaeCf5OnoozwLKEm35VBPO7StdMSJE
	E6DjT5Kw07CKwyRM2SpNnGnhoeOu+yUyNGRNnSx4GGZ74fA6MlE98LnznCG0CXt/VtgichhiCi+
	g0raXv1XDx8pRxHiEj2Wfg+GBy1v3Ypzs2zxCNQa27GD6VmBIBQXxsi7bbr2lVGk=
X-Gm-Gg: AZuq6aIZiy+UfwYLzphbhOxvsDl8mNg2pj0egDjvY18XvoZS4l4OzMErIdxNLg9B6SU
	Jk5NDPBkvPpeIKTd9+SsFYCD91eYHrtH4wK3STNZmeQ2JNMHXH1ObXD9SbBZjCfDFu1osXdySIu
	UyOau6JIOYmcjjV6k34PePHQtPwNboAbid91nQaC6fnpVC0vazrkvMxhcly1wRlWeMIPLqD479A
	1u1fr8RN85/X4ND2vV5CH0MD1OdrvSavCerRznUd+1jlNVH+SDf55/Rp1WhsbkJd909QkhKbPQi
	ZLgLRx1C5U3EcnomDFsPuwIkZ046r2T9itMcWwpiIkH+aKvGlBtA+N3o3Mr3kofyhDfYicmOFQM
	BnGj5lGVz+XofYI9oyA==
X-Received: by 2002:a05:620a:4009:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8c6e910a882mr103125785a.12.1769170492271;
        Fri, 23 Jan 2026 04:14:52 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8c6e910a882mr103121985a.12.1769170491724;
        Fri, 23 Jan 2026 04:14:51 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470c1dc6sm126122285e9.10.2026.01.23.04.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:14:51 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.20
Date: Fri, 23 Jan 2026 14:14:43 +0200
Message-ID: <20260123121443.4011649-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=6973663d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=TobBm0t3FEPbU2nNDSsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yqtFGn_DLFmXCL-4hTJC2EWhcWWQqs1f
X-Proofpoint-ORIG-GUID: yqtFGn_DLFmXCL-4hTJC2EWhcWWQqs1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwMCBTYWx0ZWRfXwdBfhEpUvGjL
 5nXVpG+FaxpTborSeqnAk3YAoNzUiNyaML8r3xK54TBMs25RA7ol85LNLgPFb2hkupVeDojNK8l
 L9tFpegEYAdXScFyBWs7JHb3Pxv4Zc5jKg/rr475/aFxGo3KVBAYk5bH19ngo+ECo4HoC4JBEGT
 X/S45UOEgPpsFAUAAg4ZtbUGIVLZJFGCUv0m+QfQf6fP7Wyn2+vzl/haTD2W9VVq3lcrt2e5MaL
 uNtSIDiuR0ix1865RuEYcLBya1BfPJBGDrpDKnRqfb6iwIlt5Q6haKiAdd8ZZwCoB/RjRMh6BJr
 UYsUGt7HU9/GyJ3qB8CMkAUuOWPFeAB6ChCBnr8Pqa6t8DuRQPOJqQhF/2mAA7f9oTGCtpAi6E1
 4r+tdOy+do0rB4+Q9Ywo84P6NwcnIycy6LlW/M7QgsKvz9abZ/tj2UqcEkPBX5F+VlGjYqpU8dj
 GI+xTP815WkeNEHFd4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230100

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.20

for you to fetch changes up to 3e6b0227b93c708e93e33f6c3485bad077650766:

  clk: imx: fracn-gppll: Add 241.90 MHz Support (2026-01-17 22:17:10 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.20

- Add support for 241.90 MHz and 332.60 MHz to the fractional-N
  General-Purpose PLL (GPPLL).

----------------------------------------------------------------
Marco Felsch (2):
      clk: imx: fracn-gppll: Add 332.60 MHz Support
      clk: imx: fracn-gppll: Add 241.90 MHz Support

 drivers/clk/imx/clk-fracn-gppll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
