Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426673;
	b=j6rqGReOHMnLGCrSakDjOi9IOupowk3Od5T2qyHwET+KmL9THbcMqZTflbzxmG7ld1PD
	 q0EgXVcGb3gSt6frIgoQqnjVwV+gzQ73WOH+D5siQrzHMaA3STD6n3Uj9NgjHMHb6awKt
	 8c8kHHfLUaA00bssgs7OSQkC/AeQ71DSj2E8JGvjEC6zhSh0gN1x2gA76EH0dxq1Ni1SX
	 iLpP06IO41ocIccWLWNNiSFqOLppyQZ970pd5AF9yWebqYgUeBn30XaHkcoNNyR9Q259x
	 p2/x/Iavpq4CBOYP1BnRn+C54+bCP2jS/7Rvnyg3VspZfxQQiGSlGqNhuAWjAcjHjqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
	b=j9r3z9IrqBb5UbH1CnIM1R9Xpk3PnO0A8yDfQghKhqIOMCPrMCcvHgECa/LS9wHqHsHc
	 sMdw7DOD8iKLyMT8xgwpCKsiAExKL1kpyDOgLVTIHih6N5CVmBZFuhEsb4HwxpcYzNVHP
	 ig+loZ94i0/r/E+5V5bquqjmnDnkk99LVDM67vYXx9R3Cl6DOpe/HtWBPjTCmXav5PAUG
	 11rRp1YNm6k8exMrpKJfp+8zdc1wz4shAxRg71nq547P2I4hg5Tqf55iji6EJoGmosJsW
	 tt5dlurA+RqMKFb6vBCdHMhdM19uLLSsl54R5jJhwWdZQM8BJhigw2lYu1pDeMEUUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=doGmmNKp;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8DA60A2610
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8DA60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=doGmmNKp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2417798eec.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426671; x=1793031471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
        b=doGmmNKpO+KfJJ5r3TqqgIGoAZlAoA5zWP58ZbmjTfmUxdXoID7DGxLinQE7EMeZ0O
         k9RkEadNnUmUZxuvIqmh6AfCOkYozgubS359fVQAqAp/H8yUyFsXOi0ITaqwnZhvkTS4
         agRblBsa7sJRq2n0ttcUqzGBTESAHWjnNm2wUE0yBVBVQUZtzpalG0IPZ1g2JZoRdD5g
         a2+YI5pbIQO5opBwzO38VgLgqvS0RqRpvUrV9BxZMNrJ3HUOi1avl5ogaNlhjnm86NMe
         lsbCdr7DF6tXxzK3Uwg6girjlbNJHcAc/TsDlZxiG91e7Ofl/9PbZ98DR99UNFwVphHb
         YCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426671; x=1793031471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
        b=qpSjMzk3FEbvQWPrkM3uPCGn/rW6YPuL8tNzq4ZeNQeZJPgeo729IyYDdfnIl11feU
         28Fert62OYGNjUAFU5vcX4uwSzN+zcX8sPpF4vcHZmrzlA3sfi+ociVMHbWi3Iw8/5RR
         Kv7DUiPs8ciJDM0Vq5gF4jrA29o2LxYOxK6oTLq14gFEu6cVepdo2oyeU+0XUNptD/UO
         UseSL15FQBIyJlIvzZRowfxUQwAy+5SgmBa4xR+mhSF4Jg2yAk5t0L5tlpemap5p5xM9
         ZqQX7bSkNvwIKVrwzo6TE9m/41ZaJJHnqyWKdgufkvWdOaHYCQh5pPI555CZewWWWfR7
         Oliw==
X-Forwarded-Encrypted: i=1; AKwUvBwI9eNELFMXRi3yq6+bMInOT3BcgeXbMgKCPslo14ejPvFUkgYVdmej57VPp6G7sPd6Ug2jGICO4Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKabQAnIBxPgkxxZ7PexTtokJ2fCf9nQQX19HUUMXDE2kn+adC8
	aBu8J7IGaBaSyJKGp+M/csCpZcmZn4gt/GKFGBgLVqu6qWVJMuiERtgA
X-Gm-Gg: AYBFou26BPveuBQVG0OFPGyBgNLfYdvMs3Tn2zTN9lyNhWYZVx30LynfB+IYi3wpwn0
	cJ8zkmE88YyQsR8AncZsyLyBlLmHF86uutQ1N7xIao/XAcBFCTZEP4K73lXNEnBp6VYM4ITBGUO
	0dTGMpc9onN1wzi1Qj5lhBjCN0vvQwMhw3fNykUaLLoIQ021BkeW1PkP+flUTPCyE6FfEKsfy3m
	o4TQn5UdHX4shHQhRzjSyXmcdGn0/Wekm19E1ii2F38LLaXyOavvYxCavgMSnTd3EcfMDbkHDj8
	iXxZQicZX/bkSXvMv6cLt8CYc/ULHxWOQOtobBQxD/WXLmn0lGPFJrI0Mg6SdviUuSph8FmiUxU
	HCGttSXaaPpXrrEMuXnopzqm9dSysIUdbn8k6OCf/tlSKYDkE9u9pweo1QOnK7U+aEq0VlgnQAG
	nMSaD0QlVI0lHo4oUNtN4+DjB286eh+qmivWJ++6WR6yRyvjm0rkq7QhMh+dC2UQ7v7KYr4HRoe
	x0DQh/IKsg=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-361a274b361mr11482466eec.40.1792426670942;
        Mon, 19 Oct 2026 09:17:50 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:50 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
Date: Mon, 19 Oct 2026 16:17:38 +0000
Message-ID: <20261019161740.2384-2-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019161740.2384-1-sushmit718@gmail.com>
References: <20261019161740.2384-1-sushmit718@gmail.com>
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

gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
takes this clock as its reference and rejects a 0 Hz rate as
unsupported, so USB doesn't probe.

Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.

Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index cdae5d9c8aec..56503a45b64e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1500,6 +1500,10 @@ static struct clk_branch gcc_eusb3_0_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eusb3_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.43.0

