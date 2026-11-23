Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437369;
	b=MtOW2KSk1CPB/57lGOs/6GilGh9SVZsFDdMEM7Lc/j1PUtkBmZ7JU9a/+XCripPBxNUb
	 DJmLEZb0D1Kk+l+CFg5TfgWL+g05R2JcGhbYgE7lpEvvhDQD0oOkkop3j/MitaNQrC3Sv
	 Of2ysdUZjC9cYJgzh/gdNXP7hHz8Dfjut6fsxzK6GgGhyWRws5e5k31LKgMBLTzftISc3
	 oGaubnoeh12ylb7ubq4YGi7lufAWcKFuuk+pMu26BaMwhiSXlRsxrbHnyNm0RCn2Xl74o
	 t+0jZkLzpa5aRuB9RtivuvztJKvDZCWnhCT450ipPvcblwohjkJECcVxTJUkpyRYL+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
	b=rPdNyz7NoHX/OeflBK97HBzNeqZlUHeTSHCHBgBhpvGKLTWGQjMAzs4sGaaHVOD8vZ1J
	 HYyFipZi7PptJhkIkN1rQ1tKKVvjzHob5CildaYjaNOmwnCq6uJ23NHEeMisJc9+ZNArv
	 AZd5b2stfWhlQOBfsTDqFEHE6rU145aBn/X4znVYTUaFXINiP35YtibovWQS4chw/K6FT
	 qfnoMraFMCk0UgmUNSZH42qolGAxY1RjQFWq83A8WkgaUCBwMRmcdhyNAihUb+pkxy8gQ
	 ABaha8Iv5Q/qigWt//U1nKPAR0Gr765E8eOLGp9Q11/crNm8B7qlTMJMvYxQwI0ztGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB9606A334
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DDB9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so5494952eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437368; x=1796042168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=alq+xpW8lvIvn7LcJwzSvomTxbVuQXitCohB6cKUBQAR6jW9xKij72us30SL05FkMa
         H3Poy1cOtIZ4Sy0okJijmUSOBntFNr6/Oxa43vJbYWKncSm6Do4G1wHQS2tDipyPE/lJ
         fwQh+u8cNBxIiNdUK+P/pbNoutc9ywa4rJr/Geb/7NAHIHIGl+GlkvwtU8NaxtVNcE6x
         3vMPNKRFxg87rC0bZNZfq9UgV+4zlMY6+Jh9w7xb/LhDIVRk8EgnbFP9ID41wPMuZYrX
         e7Cx2HK0oF7JaWx+jgqk+gcKRJ38vpli8lP3FgvCI2JX8jt+O1Dj6VtscZ6JFVBd+4wg
         f64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437368; x=1796042168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=EGyS88uWwr3QTUo1X+4xecXPbvYA0eMb9mvHMyBhBKBCFQc5EKtqa7lSlpTtrPK9xG
         HBW6A5PGmHLtgoIH2ug51c2Tjt51yk+sn++EsNiDXpUNlELJTAVigxZHWFqJUEauiZFf
         qgVW2czsW7YjRZclkCaRfMWRvBVlMdFiHcYxq6guEkm3ZnmfJqdEptg97fwOAbr3YSk0
         kXEArdVKkNuy1/C/r0UtfN6yVc64jBkFLQ1UezxESS5q6Gl+9WibIEhfDQuTjC5cDANX
         kPksgUArrPmRx+xnR3lGcUTLsqh255yJzWcby6kqLmA5AaDlZJK3bQWw8ZMfK03y4JlM
         2Iyw==
X-Forwarded-Encrypted: i=1; AL+hErGdGnHfJbrrwOI3pSIsFLWRGYK8rP8gQ537w9+RVeKVV5fP+VbB1+NRgizTJrEpAGdJ1ZKhMb5Kpo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HoQ1UAFsYxW1CV4owqgYoAUJn7vtZQoP8/P7Q0UGYktvQBIvR
	ZJ70f9X473rcTGgNkRPps9gm/Bxo7BaiTimwq0PZhg/cXX8DoN6M/7KM
X-Gm-Gg: AZFdTZd4/Kcd+yeuEpYMzGs+FB/LbHLShddWNPOXDX+ULiQrVRSsG4ezdU/nBOEQgoI
	PfQMF9I3TInApVsGtZRiyOaXXTNINNhvy6ZbZV1valgL2dNa4ZJxzmsEvOFm1MpcipMWkB97dVR
	Ws/nEHtzDHlEVdhaMhr1lVBgu/idC6m2rHcMsMQNm3zCsArWZ25EWS0jV9Fd1eFam2N+frjCyjO
	uXON/UoHv3JaTKYf/zpakFDjRwChsilHnd6LT0H+BoNfNUWxOTWu/lUE1PDlF2mtrS5Sk7/VDD6
	3VklHXZjv4WqdKj8M0t2Vf4tD3VIdK1Geky0wxApGlaKPWNpps8CeCiuLDfjdz9S08pnqrltHQr
	igIYN59ubNh/3yuyuhLPbezUbEwQz5ngGb57f1tlfRpNVt5NSp36rlv89B4r3OoiLX+WHGUpzXg
	UfWhO0u2wyKhEfwOcCLzvpmHfahi+E22XRYGp9v0W/VcINLgGfPSIpS0PflmL4BdzEwe1Ves8qA
	3P1iz9jKwKHohVUWpr+qrI+A/kfee5TO455IGbFGlTgzlYr0iCeDbHClHFO8lbdZxwy98/ZqnT0
	X4WHYWWj4XNDDLgvzufgn0Qm+8gohci/6LdTkI+xl6eo0w==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr13059014eec.12.1795437367601;
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 19:35:40 +0700
Message-ID: <20261123123546.152162-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

