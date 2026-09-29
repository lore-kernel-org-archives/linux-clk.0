Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAA3D649C
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 02:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647890; cv=none; b=c0zbOFaeoVm5ar+rzhxs93mxVCZSXyDkXDQMYUQM2qF48JzQiFi8xnDwbuRJiVP4W/MSiZpbRbhqrDnZS23gopJH3NI8SQf6GPCHCH+Hy14QKc68FSj9YCNq6ZFZLh37tkElRyo/kHM6k5s/tXmua+f5EKZ1XSrG0D2jIX6pOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647890; c=relaxed/simple;
	bh=wR8JJ2pL5QeRqlJm3/ZAagrZ56dstDg3U9pOmu4dPTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=niQqd7svlCv1/8c9w22f+U6GFe5rteSmfuFnxxR0W8w5hkUaXwnJDCYehmY8GFlykfuUpGUg6HPN9ObAFmnP0VU0YVb3EIs+K76egJbxxdDalb6q1UFWbNjJPTmxZkmZn2XZkLxnJFrMSDegGpPftnJ4W58TKVOSJazjAbkdwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzuBYBQJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzuBYBQJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso7561785e9.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647884; x=1791252684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=yzuBYBQJoZ4PZzAaDWi+N4MfoyBA/53RkZRvqiRH0FO5Pt9e/ydnij8kx5/+ZtbKAD
         TMCKnB3X6OJhMGO2FNiCMuHXrhqiDTqwXrM3si017hiZpjPfuVhtWYB897hCg7Pk7DCB
         dPgi6M99M34Nq7RpRWi2S1VKyVmUx6XhpFEjaX0bcsrO7CInzz4d7VBI0duwI85t6nzG
         Z6bBGExprh7lCHOJYJ9r/IJEuUOC2uwDnY1XafxRQsTQYSx6y901WyT3CaPAVvhRz7rN
         4nWao+iz/jzjtxEROU41vyUjzPA9cOtcdJ511GRDMOxAd0bucY+OPpglizyeKdmdAFwf
         IXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647884; x=1791252684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=kJaQpf2ohaTTmQP1pygBk62JCiHMKVt4VSmtGyh8HBUU1B4rDocWhIuQx0jSFYONSO
         FhPujbVDRrPyZIHgmyE3Y9m4Pb/6dL59lus1xebSVtm3gmW+GncQ+j5UMRwYor2zOo1y
         GnA8ubr06tk9ivIw5/GNJZ+f1ZK0EE1XKfWk9NVhqN6HFKBUP6VlN3RwZqite+HCwMSu
         sODURcZ1bwTK0u7dqb4W9J19qZrF/Vnc/nmoWLLYOqHoHH48XHQE6Xv7JYnnJ7aVUvfk
         IZBN6sr4Z7Q2hBhvjzgH0A6UOcUOFS8L3Z9hrlq9jiR/OERbJpLjKG/8Moc8+f2DCbD2
         oBlg==
X-Forwarded-Encrypted: i=1; AKwUvByUUzqw5kbIcfpCD+jB306FoTyAWtBT+BwdXEiDG3t11wvB2M1z4ZB3LiR35lET8L587CC/ERIDikU=@vger.kernel.org
X-Gm-Message-State: AFuF++lUEWJH09Wudf35TqZgHwD91YQshwDjvc7ui5K/HrEFveZIErRH
	yh6P2UBpaxeUCCUWzL9C9BdrRaE47p9L2yVkjPLDIUA/uGcbqncMmpRMruyMzU0ai3Q=
X-Gm-Gg: AYBFou3zTvEHdwPAfttXyZYB156jb++JSnMAbULGIK1IqwIb9XHnZcZbrrFt/g5bIM1
	ID6R1NcoGIKH8ydfoWcRiWS4dzFaKnvSB2tkNxYKJu5YobR0wuTD5auf8z74uI4HCBcTfy0+WaE
	mWzxEBnSGH9OfqeHpcuOi3aeFWVvuMIXfYvvpZyZZ4sQj0Bs6QwENmI49XVN0QzD9Te0+Q94c0z
	rlWWeoaJlqOPSMVk4EcNcBiA/3GSc3vwK6j6cr3tqioxtPiI7/MRG99rxmqrIYeD5504+Qv6quG
	XlcdhpGVXZYAE36YJL2hQjiA1JOAyShi6KzOhv686nfjji2COUpS6dA3jtO4ttdTRSAqT/GWNJz
	TE/y9XOmdqLnpBlmkjQy2MpCHLIHyVyrwAr1wlSCfoFXFlXB4z0OfDGA+izye8PMqEpB2hp09u9
	UDsTwxYLhwbiIaSOnVeHpbzKloQK27R7Q/UCTBUjWUmr9+Wzp8EHQgdVDqXaaE7Zd8s9spuCzaK
	aHwrSbVcF310KPkkhG7duLxdrcuDpBnPWUU5M3SAZ6mObW2jzC3Jq1XU5vR7g==
X-Received: by 2002:a05:600c:4f45:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-49ffed0fe54mr129390335e9.1.1790647884336;
        Mon, 28 Sep 2026 19:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 03:11:17 +0100
Subject: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..5a16665e941b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -39,6 +39,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0

