Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FFF41A571
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040522; cv=none; b=HIOcFB0kaQ6OMP9NATH+3fOcTMDrCtesl7jFS6D2jYibbP8JaOY/ek/4l+mA5/gm6VgqJSMKT5ENnr7apS1ZA5V03o0XjxDrtIDUGtcdE22r/KaRwHa3cyZHOZmcB8av6A57SX8ijX4hM3iBy4zMcndDpav6GIyyoBPcyC/VYbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040522; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpgRmafGmhSgGic3YnHVcCpVDkiQZTdFc9ZnUAiYU+I7rOmHlV9DJ6KytRkYEdBHKkpEkkId1XpPIm5qFK+9ipqE/bUbRUNFZCauGsXGWMFDiPJuJ2HXsD2SPoEZvl7e53BdyTrEZV18q27iy7qT8IbpPK9OxvlXZlNPn/oEaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI6XYGs/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI6XYGs/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccf2360620so42100575ad.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040520; x=1787645320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=bI6XYGs/BsTbQPfQw1cFnhLWv7COTDPyZ5g/Pw68p6BAToDUUV/gE6z3R2zuIkwSmX
         PzhEaxzm1omhRunR2Z4KS8nwLmlkqMXOmq5EjAVUeqGRlwSqvLuLsBy8igmNnHLPrAK6
         CqIeJj3iB7/427Z+viTXFzDUlFRGNI2Y0eKbpOrNcxx5OK3f1X3ZKhermACkBXkunqs8
         W2Ecnr1u4L1BBOb8VSLHZRQ6y2Hfe5uMrrhwCr0uzPFYX6+Tz0XfhgYskuD/rp/IPZXk
         TRf5Re2k0RsSxaFZhDp55aWvQVDEw1ndq1zVEgaYxGuIEuL2GsVxyylnCKTDdhie6IjN
         sANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040520; x=1787645320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=CYkL8LoEPfSBO+eLt0WjXGX8elJNk/+UYYDXP+H+OSZMUAzGj2nHs/3lvDe3dXs05H
         ZvC4wPtZgV0wNJ3a8UazmNA6dn5B2dhxSetlYnZFzq5jFukLFEiMP1dGQwYszdb3Ghgx
         ntAhIlg/rvdBLSA1OdetEqX60WgBI9aiF42iKfN8qcpQDHE0BGbCcYtxXFIzZZTnHb1G
         VYCL3cDUEjCnNtS2VrN+TKROx6d/DbBUQRBtGxLD9Q89ebc8X4j9LpUz2yQqexRTtJ5l
         ag3LNVTZo4+YQGy2+BaXaYNOOFrG58IpwIZfb8z6ctIaK9k4cKin1n3vID92rdeGcEBU
         LFMg==
X-Forwarded-Encrypted: i=1; AHgh+RpkezfF1qVAU4G/LBhA1z+J9Bv+5BpraCNzNhW981r+CXDR2eQqXzhMtsxoDUInaIJBnMjOL1GQ83o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwcyZJ37lCV7xLVq++ITV/u+MfbYV87I0q2r350TFfI7gotIhL
	DIA/U1BFjE80b6UQ0sw8fievF8k68mW8KAwKfyUHVUP5x5Ym45mxdOAL
X-Gm-Gg: AR+sD110oiRzY1Tvl93/hyUUA5TRTa/cna52VqDiRdpa2lIuQfEOAc8hgnTP4VFe6De
	LWtTIJUHhy6sF2y374aYrTr++Y2wsIgSE0kdw6aSgdiwKgwk6ZKN3UqlOQrpzrcd8Twp9BvfkQV
	dU5c2+I1D+sQH9jv3X+PO73BxFyHVSBgsE+MCBdcRCDGSqXE+YR1c6YSB0FEoUV2eQoBdF+TSrT
	lFFwqwbmwtjWAsJhxaZ6nsgLO4bO78z4bnoeQFbuWSXmezY1Y2W6NiugMN0AkzunF8za2su41WR
	B2obyyivESYX1QEqS/JSEzHl8jK2sqMoMBDdjx63PcCi41JPvHncdsB70CXreSknIrd9EQ5jAUW
	IWSXm1tRpIraBycjYGb7wzyRD8JVR/PALwqN5INUrc34XzAyNJgjqDawPzYEk2XH/EiZUUvcnPx
	WQJWtd71HZX5MqJtzzRsforiDy6Lr3K2KQfLl3zxDAEUdKJ4JzoVI+fVB0G1S8BNDDKD17vFNkH
	07JlR91ltc=
X-Received: by 2002:a17:902:d592:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d3b0d5cec9mr386376235ad.14.1787040520521;
        Tue, 18 Aug 2026 01:08:40 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:39 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue, 18 Aug 2026 08:07:44 +0000
Message-ID: <20260818080754.4362-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

