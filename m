Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A44D352022
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245148; cv=none; b=QgC7ZwgxqiJG6U8DDRmLoRPL0+K5Pp8xGI63n+PHOlYF6btEIjj0zcMYQREZGETD6fvA/nmgzJWSnSjel5ToC6efUxyZjR9e6NGxjQ4r+x91Bwx9RCeWojLG4VoHXvKQK0cKMhRtfoi1rFVAGtx25LqoFpQG+lZhzr6LyzcNm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245148; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqEkokdmFqN0K57Iw8a0egJe0nv+ZnAlf6hV7qKL7RHbDnlP/OZhMYoI1ipjCDj6dxf8OyzlJHTsn36MH64NHJv951ydbrDSqZlNdL5++Bac9qpunhtHr4VkfrIDsx8mLfwlbeqe37XOqYQeYEQX56qDJ3FDdSDXQHM6K/YGnuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW7XGdJr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW7XGdJr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d58efc7356so52630475ad.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245146; x=1788849946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=YW7XGdJrWue0aP7YPlU3mC7+P0irtXgIMx8V5fuX+2/BFN+R3q84SZtD5xOF39xeYO
         2S/7SyhkJFwxTFiiax694wF8kfVtezk/ZpdMA9iAYzuAdW1J98vFpQ4/Nl8mDKf56WGS
         UV1y9/dsKGdReVNcoZUrPvhLdAxwN55/fvulQgOMNXzJH2wlLI2pg3hWsnwV0bqn4k1K
         wWsPzp5VW3NKdT+bqbD8KKnJCPQ4JC8rDQDsO8s3nK/od+Km5aqRptJVnTE/pJB1IaCc
         0B0yB8ZPPky1mVJkPhZFgxuty9FCGpEP5zAVd0FQi9uVoGTXZnY+dgR9JXlV46Esv2V6
         8sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245146; x=1788849946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=oX/40EnQX/zKZ5bUu39LX1pgN2qpoFj9GmO3q0HUm2m4KW8DNQTATCIykbh3ed8jZ1
         +mCk5t1vbp+soLKgZ1Is1xdSVB58nkxtD2BYB7DKGhuEaSZUPAVY01pJ6F0AhAYVw4bk
         Dg4v5sUAni3v+hQKLtxORqaDUr48Wbo+i2lPmyypfKhG4hB9s4/HXQkXCdZx7FbCBNAA
         30OH4RNLgGsmQjhpfm3JANZYPip3dvV4oQai17XCImzFHhwZLiy2ADE8/VIb302EY3Nw
         6xln/JQT38yh8fFQQOMj2M5XownnLlR1EDY8UyfQeWYer4ttGPsz43FYy+6+FnjL+NiS
         iw1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqA3ZYznr33uRjWWAHYvCn3jR06+3+OdLqYrd7M79LWzHAguRZaRQEv6PPgUeOagY0rfhDnlSjqnFE=@vger.kernel.org
X-Gm-Message-State: AFuF++nMVZqm7E0Mu5T9+d4l9CPCOfbWGiAuGKtKHX8F37G2d7gengcF
	gYrXxEsI7WheqotoO8Bt6j3mRjBod/7VpRBac7H64TC6asQ9h+osWiVS
X-Gm-Gg: AR+sD120zI/UHPRt0WimAZ4bLFEnLd+qwmAmYbEMegZWrgVkkv8j3MJ1fOxUpqWgHFZ
	rYnYu/wr7pWDT6Pb4cznWQxZHbhxOdgcCMKLZ7UL3Qto8PsDKAv9Y1v0Ryl+Mspf+YLG5HHbYys
	2h5a0FSzxlyMKMQSoRKSF7Tvsmo9jwwtfq8kcN9IKysfesI5Ab5278nca5lhOmYYgwwercctfZK
	dQB+CjO+nsUTUDJ+r8ub3Xie6QVZENDswhiq+1HmipGtKUozCiF3a1IrMrYsJpcM0grCkzM9GeJ
	D2Lrot6vO0plbuGXX1SQOhV9pskxvl4Bj/74wGVmfogM8GzXlq8WEIZllUInUh09ccvmsuF4F2p
	0EIEhzXJ0KSZZBvieWS4LIoN96ox/vf74eDGwiMe+/cMPEQTbWiV/pE/QLkED1PtvWustW1BVgW
	WiZZ3ucrLESf7zlLfhfHHTA7thIDnetKZ05gl++8yFUO0gaC4nzVHVrTGiIzGH6doP3B58Q8e/D
	SNiSnblXauy
X-Received: by 2002:a17:902:d545:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2d968b7c512mr7589595ad.3.1788245145721;
        Mon, 31 Aug 2026 23:45:45 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:44 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 06:43:53 +0000
Message-ID: <20260901064357.20055-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPMh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5..70d0ff5cc 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -490,6 +490,24 @@ static const struct rpmhpd_desc sm7150_desc = {
 	.num_pds = ARRAY_SIZE(sm7150_rpmhpds),
 };
 
+/* SM7250 RPMH powerdomains */
+static struct rpmhpd *sm7250_rpmhpds[] = {
+	[RPMHPD_CX] = &cx_w_mx_parent,
+	[RPMHPD_CX_AO] = &cx_ao_w_mx_parent,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sm7250_desc = {
+	.rpmhpds = sm7250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm7250_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 static struct rpmhpd *sm8150_rpmhpds[] = {
 	[SM8150_CX] = &cx_w_mx_parent,
@@ -910,6 +928,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0

